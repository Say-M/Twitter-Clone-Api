DROP FUNCTION IF EXISTS register;
CREATE OR REPLACE FUNCTION register(data JSONB)
RETURNS VARCHAR AS $$
DECLARE
	_user JSONB = NULL::JSONB;
	_username VARCHAR = coalesce((data->>'username')::varchar, NULL);
	_firstname VARCHAR = coalesce((data->>'firstname')::varchar, NULL);
	_lastname VARCHAR = coalesce((data->>'lastname')::varchar, NULL);
	_email VARCHAR = coalesce((data->>'email')::varchar, NULL);
	_password VARCHAR = coalesce((data->>'password')::varchar, NULL);
	_bio VARCHAR = coalesce((data->>'bio')::varchar, NULL);
BEGIN
	-- check if all required variables are available or not
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
    IF _username IS NULL OR _email IS NULL THEN
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

    -- Check if the provided username or email is null
    IF _username IS NULL OR _email IS NULL THEN
        result := jsonb_build_object('status', 'failed', 'message', 'Both username and email are required');
        RETURN result;
    END IF;

    SELECT password INTO _password
    FROM users
    WHERE username = _username AND email = _email;

    -- Check if the username and email combination exists in the users table
    IF _password IS NULL THEN
        result := jsonb_build_object('status', 'failed', 'message', 'Username and email combination not found');
        RETURN result;
    END IF;

    result := jsonb_build_object('status', 'success', 'password', _password);
    RETURN result;
END;
$$ LANGUAGE plpgsql;
