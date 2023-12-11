DROP FUNCTION IF EXISTS register;
CREATE OR REPLACE FUNCTION register(data JSONB)
RETURNS JSONB AS $$
DECLARE
	_user JSONB = NULL::JSONB;
	_username VARCHAR = coalesce((data->>'username')::varchar, NULL);
	_firstname VARCHAR = coalesce((data->>'firstname')::varchar, NULL);
	_lastname VARCHAR = coalesce((data->>'lastname')::varchar, NULL);
	_email VARCHAR = coalesce((data->>'email')::varchar, NULL);
	_password VARCHAR = coalesce((data->>'password')::varchar, NULL);
	_bio VARCHAR = coalesce((data->>'bio')::varchar, NULL);
BEGIN
	IF _username IS NULL THEN
		RETURN JSON_BUILD_OBJECT(
			'status', 'failed',
			'username', 'required'
		);
	END IF;
	IF _firstname IS NULL THEN
		RETURN JSON_BUILD_OBJECT(
			'status', 'failed',
			'firstname', 'required'
		);
	END IF;
	IF _lastname IS NULL THEN
		RETURN JSON_BUILD_OBJECT(
			'status', 'failed',
			'lastname', 'required'
		);
	END IF;
	IF _email IS NULL THEN
		RETURN JSON_BUILD_OBJECT(
			'status', 'failed',
			'email', 'required'
		);
	END IF;
	IF _password IS NULL THEN
		RETURN JSON_BUILD_OBJECT(
			'status', 'failed',
			'password', 'required'
		);
	END IF;
	
	INSERT INTO users (username, firstname, lastname, email, password, bio)
	VALUES (_username, _firstname, _lastname, _email, _password, _bio)
	RETURNING JSON_BUILD_OBJECT(
		'id', id,
		'username', username,
		'firstname', firstname,
		'lastname', lastname,
		'email', email,
		'bio', bio
	) INTO _user;
	
	RETURN JSON_BUILD_OBJECT(
		'status', CASE WHEN _user IS NULL THEN 'failed' ELSE 'success' END,
		'user', _user
	);
END;
$$ LANGUAGE plpgsql;
	
CREATE OR REPLACE FUNCTION login(data JSONB)
RETURNS JSONB AS $$
DECLARE
    _user JSONB;
    _username VARCHAR = coalesce((data->>'username')::VARCHAR, NULL);
    _email VARCHAR = coalesce((data->>'email')::VARCHAR, NULL);
BEGIN
    IF _username IS NULL AND _email IS NULL THEN
        RETURN JSON_BUILD_OBJECT(
            'status', 'failed',
            CASE WHEN _username IS NULL THEN 'username' ELSE 'email' END, 'required'
        );
    END IF;

    SELECT jsonb_object_agg(key, value) INTO _user
    FROM (
        SELECT key, value
        FROM jsonb_each(
            (SELECT to_jsonb(u) FROM users u WHERE u.username = _username OR u.email = _email)
        )
        WHERE key <> 'password'
    ) user_data;

    IF _user IS NULL THEN
        RETURN JSON_BUILD_OBJECT(
            'status', 'failed',
            'message', 'User not found'
        );
    ELSE
        RETURN JSON_BUILD_OBJECT(
            'status', 'success',
            'user', _user
        );
    END IF;
END;
$$ LANGUAGE plpgsql;


DROP FUNCTION IF EXISTS get_password;  
CREATE OR REPLACE FUNCTION get_password(data JSONB)
RETURNS JSONB AS $$
DECLARE
    _password VARCHAR;
    _username VARCHAR;
    _email VARCHAR;
    result JSONB;
BEGIN
    _username := data->>'username';
    _email := data->>'email';

    IF _username IS NULL OR _email IS NULL THEN
        result := jsonb_build_object('status', 'failed', 'message', 'Both username and email are required');
        RETURN result;
    END IF;

    SELECT password INTO _password
    FROM users
    WHERE username = _username AND email = _email;

    IF _password IS NULL THEN
        result := jsonb_build_object('status', 'failed', 'message', 'Username and email combination not found');
        RETURN result;
    END IF;

    result := jsonb_build_object('status', 'success', 'password', _password);
    RETURN result;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS tweetcreate;
CREATE OR REPLACE FUNCTION tweetcreate(data JSONB)
RETURNS JSONB AS $$
DECLARE
	_tweet JSONB = NULL::JSONB;
	_id VARCHAR = COALESCE((data->>'id')::VARCHAR, NULL);
	_content VARCHAR = COALESCE((data->>'content')::VARCHAR, NULL);
BEGIN
	IF _content IS NULL THEN
		RETURN JSON_BUILD_OBJECT(
			'status', 'failed',
			'content', 'required'
		);
	END IF;
	IF _id IS NULL THEN 
		RETURN JSON_BUILD_OBJECT(
			'status', 'failed',
			'userid', 'required'
		);
	END IF;
	INSERT INTO tweets ("userId", content) 
	VALUES (_id, _content)
	RETURNING JSON_BUILD_OBJECT(
		'id', id,
		'userId', "userId",
		'content', content
	)
	INTO _tweet;

	RETURN JSON_BUILD_OBJECT(
		'status', CASE WHEN _tweet IS NULL THEN 'failed' ELSE 'success' END,
		'tweet', _tweet
	);
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS userProfile;
CREATE OR REPLACE FUNCTION userProfile(userId VARCHAR)
RETURNS JSONB AS $$
DECLARE 
	_userInfo JSONB = NULL::JSONB;
	_userRecord RECORD;
BEGIN
	SELECT * INTO _userRecord FROM users WHERE users.id = userId::uuid;

	IF _userRecord IS NULL THEN
		RETURN JSON_BUILD_OBJECT(
			'status', 'failed',
			'message', 'User not found'
		);
	ELSE
		_userInfo := to_jsonb(_userRecord);
		RETURN JSON_BUILD_OBJECT(
			'status', 'success',
			'user', _userInfo
		);
	END IF;
END;
$$ LANGUAGE plpgsql
CREATE OR REPLACE FUNCTION all_tweets()
RETURNS JSONB AS $$
DECLARE 
	_allTweets JSONB[] := ARRAY[]::JSONB[];
	_tweetsRecord RECORD;
BEGIN
	FOR _tweetsRecord IN SELECT * FROM tweets LOOP
		_allTweets := array_append(_allTweets, to_jsonb(_tweetsRecord));
	END LOOP;
	RETURN JSON_BUILD_OBJECT('tweets', _allTweets);
END;
$$ LANGUAGE plpgsql;