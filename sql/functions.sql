-- ! register a user
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
	
-- ! Login
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

-- ! get user password
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

-- ! User
DROP FUNCTION IF EXISTS get_users;
CREATE OR REPLACE FUNCTION get_users(_page INT, _limit INT)
RETURNS JSONB AS $$
DECLARE
	_users JSONB = ARRAY[]::JSONB[];
BEGIN
	_users = (
		SELECT JSON_AGG(u) 
		FROM (
			SELECT id, username, firstName, lastName, email, bio
			FROM users
			ORDER BY "createdAt" DESC
			LIMIT _limit
			OFFSET (_page - 1) * _limit
		) u
	)::JSONB;

	RETURN JSON_BUILD_OBJECT(
		'status', 'success',
		'users', _users
	);
END;
$$ LANGUAGE plpgsql;

-- ! Single user data
DROP FUNCTION IF EXISTS get_user;
CREATE OR REPLACE FUNCTION get_user(_id VARCHAR, filter JSONB)
RETURNS JSONB AS $$
DECLARE
	_user JSONB = NULL::JSONB;
	_tweets VARCHAR = COALESCE((filter->>'tweets')::VARCHAR, NULL);
	_retweets VARCHAR = COALESCE((filter->>'retweets')::VARCHAR, NULL);
	_comments VARCHAR = COALESCE((filter->>'comments')::VARCHAR, NULL);
BEGIN
	-- check if all required variables are available or not
	IF _id IS NULL THEN
		RETURN JSON_BUILD_OBJECT(
			'status', 'failed',
			'id', 'required'
		);
	END IF;
	
	_user = (
		SELECT 
		JSON_AGG(
			JSON_BUILD_OBJECT(
				'id', u.id,
				'username', u.username,
				'firstName', u.firstName,
				'lastName', u.lastName, 
				'email', u.email,
				'bio', u.bio,
				'tweets', CASE WHEN _tweets IS NOT NULL THEN (
					SELECT 
					JSON_AGG(
						JSON_BUILD_OBJECT(
							'id', t.id,
							'content', t.content,
							'createdAt', t."createdAt"
						)
					)
					AS tweets FROM tweets t WHERE t."userId" = _id::uuid
				) ELSE NULL
				END,
				'retweets', CASE WHEN _retweets IS NOT NULL THEN (
					SELECT 
					JSON_AGG(
						JSON_BUILD_OBJECT(
							'id', rt.id,
							'content', t.content,
							'createdAt', rt."createdAt"
						)
					)
					AS retweets FROM retweets rt
					INNER JOIN tweets t ON rt."tweetId" = t.id
					WHERE rt."userId" = _id::uuid
				) ELSE NULL
				END,
				'comments', CASE WHEN _comments IS NOT NULL THEN (
					SELECT 
					JSON_AGG(
						JSON_BUILD_OBJECT(
							'id', c.id,
							'content', c.content,
							'createdAt', c."createdAt"
						)
					)
					AS comments FROM comments c WHERE c."userId" = _id::uuid
				) ELSE NULL
				END
			)
		)
		FROM users u
		WHERE u.id = _id::uuid
	)::JSONB -> 0;
	
	RETURN JSON_BUILD_OBJECT(
		'status', CASE WHEN _user IS NULL THEN 'failed' ELSE 'success' END,
		'user', _user
	);
END;
$$ LANGUAGE plpgsql;

-- ! Specific user's followers
DROP FUNCTION IF EXISTS get_user_followers;
CREATE OR REPLACE FUNCTION get_user_followers(_id VARCHAR, _status BOOLEAN[] DEFAULT ARRAY[TRUE, FALSE])
RETURNS JSONB AS $$
DECLARE
	_follower JSONB = NULL::JSONB;
BEGIN
	-- check if all required variables are available or not
	IF _id IS NULL THEN
		RETURN JSON_BUILD_OBJECT(
			'status', 'failed',
			'id', 'required'
		);
	END IF;
	
	_follower = (
		SELECT
		JSON_AGG(
			JSON_BUILD_OBJECT(
				'id', u.id,
				'username', u.username,
				'firstName', u.firstName,
				'lastName', u.lastName, 
				'email', u.email,
				'bio', u.bio,
				'followers', (
					SELECT
					JSON_AGG(
						JSON_BUILD_OBJECT(
							'id', f.id,
							'status', f.status,
							'user', JSON_BUILD_OBJECT(
								'id', u.id,
								'firstName', u.firstName,
								'lastName', u.lastName,
								'email', u.email,
								'username', u.username
							)
						)
					)
					FROM followers f
					INNER JOIN users u ON f."receiverId" = u.id
					WHERE "senderId" = _id::uuid AND f.status = ANY(_status)
				)
			)
		)
		FROM users u
		WHERE u.id = _id::uuid
	)::JSONB -> 0;
	
	RETURN JSON_BUILD_OBJECT(
		'status', CASE WHEN _follower IS NULL THEN 'failed' ELSE 'success' END,
		'follower', _follower
	);
END;
$$ LANGUAGE plpgsql;
-- ! Example
SELECT get_user_followers('147f799e-f6e6-41a3-bd66-40cd1cde75b4', ARRAY[TRUE,FALSE]);

-- ! create a tweet
DROP FUNCTION IF EXISTS tweetCreate;
CREATE OR REPLACE FUNCTION tweetCreate(data JSONB)
RETURNS JSONB AS $$
DECLARE
	_tweet JSONB = NULL::JSONB;
	_user_id UUID = COALESCE((data->>'user_id')::UUID, NULL);
	_content VARCHAR = COALESCE((data->>'content')::VARCHAR, NULL);
BEGIN
	IF _content IS NULL THEN
		RETURN JSON_BUILD_OBJECT(
			'status', 'failed',
			'content', 'required'
		);
	END IF;
	IF _user_id IS NULL THEN 
		RETURN JSON_BUILD_OBJECT(
			'status', 'failed',
			'user_id', 'required'
		);
	END IF;
	INSERT INTO tweets ("userId", content) 
	VALUES (_user_id, _content)
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

-- ! update a tweet
DROP FUNCTION IF EXISTS tweet_update;
CREATE OR REPLACE FUNCTION tweet_update(_id UUID, data JSONB)
RETURNS JSONB AS $$
DECLARE
	_tweet JSONB = NULL::JSONB;
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
			'id', 'required'
		);
	END IF;
	UPDATE tweets
	SET
		content = COALESCE(_content, content)
	WHERE id = _id
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

-- ! create retweet
DROP FUNCTION IF EXISTS retweetCreate;
CREATE OR REPLACE FUNCTION retweetCreate(data JSONB)
RETURNS JSONB AS $$
DECLARE
	_retweet JSONB = NULL::JSONB;
	_user_id VARCHAR = COALESCE((data->>'user_id')::VARCHAR, NULL);
	_tweet_id VARCHAR = COALESCE((data->>'tweet_id')::VARCHAR, NULL);
BEGIN
	IF _user_id IS NULL THEN
		RETURN JSON_BUILD_OBJECT(
			'status', 'failed',
			'user_id', 'required'
		);
	END IF;
	IF _tweet_id IS NULL THEN
		RETURN JSON_BUILD_OBJECT(
			'status', 'failed',
			'tweet_id', 'required'
		);
	END IF;
	INSERT INTO retweets ("userId", "tweetId")
	VALUES (_user_id, _tweet_id)
	RETURNING JSON_BUILD_OBJECT(
		'id', id,
		'userId', "userId",
		'tweetId', "tweetId"
	)
	INTO _retweet;

	RETURN JSON_BUILD_OBJECT(
		'status', CASE WHEN _retweet IS NULL THEN 'failed' ELSE 'success' END,
		'retweet', _retweet
	);
END;
$$ LANGUAGE plpgsql;

-- ! delete a retweet
DROP FUNCTION IF EXISTS retweet_delete;
CREATE OR REPLACE FUNCTION retweet_delete(_id UUID)
RETURNS JSONB AS $$
DECLARE
	_retweet JSONB = NULL::JSONB;
BEGIN
	IF _id IS NULL THEN
		RETURN JSON_BUILD_OBJECT(
			'status', 'failed',
			'id', 'required'
		);
	END IF;
	DELETE FROM retweets
	WHERE id = _id
	RETURNING JSON_BUILD_OBJECT(
		'id', id,
		'userId', "userId",
		'tweetId', "tweetId"
	)
	INTO _retweet;

	RETURN JSON_BUILD_OBJECT(
		'status', CASE WHEN _retweet IS NULL THEN 'failed' ELSE 'success' END,
		'retweet', _retweet
	);
END;
$$ LANGUAGE plpgsql;

-- ! get all tweets
DROP FUNCTION IF EXISTS get_tweets;
CREATE OR REPLACE FUNCTION get_tweets(_page INT, _limit INT)
RETURNS JSONB AS $$
DECLARE
	_tweets JSONB = ARRAY[]::JSONB[];
BEGIN
	_tweets = (
		WITH tweetLikes AS (
			SELECT "tweetId", COUNT(*) AS likes
			FROM likes
			GROUP BY "tweetId"
		),
		tweetComments AS (
			SELECT "tweetId", COUNT(*) AS comments
			FROM comments
			GROUP BY "tweetId"
		)
		SELECT JSON_AGG(
			JSON_BUILD_OBJECT(
				'id', t.id,
				'content', t.content,
				'likes', COALESCE(tl.likes, 0),
				'comments', COALESCE(tc.comments, 0),
				'user', JSON_BUILD_OBJECT(
					'id', u.id,
					'username', u.username,
					'firstName', u.firstName,
					'lastName', u.lastName,
					'email', u.email,
					'bio', u.bio
				),
				'createdAt', t."createdAt",
				'updatedAt', t."updatedAt"
			)
			ORDER BY t."createdAt"
		)
		FROM tweets t
		LEFT JOIN tweetLikes tl ON t.id = tl."tweetId"
		LEFT JOIN tweetComments tc ON t.id = tc."tweetId"
		LEFT JOIN users u ON t."userId" = u.id
		LIMIT _limit
		OFFSET (_page - 1) * _limit
	)::JSONB;

	RETURN JSON_BUILD_OBJECT(
		'status', 'success',
		'tweets', _tweets
	);
END;
$$ LANGUAGE plpgsql;

-- ! get all retweets
DROP FUNCTION IF EXISTS get_retweets;
CREATE OR REPLACE FUNCTION get_retweets(_page INT, _limit INT)
RETURNS JSONB AS $$
DECLARE
	_retweets JSONB = ARRAY[]::JSONB[];
BEGIN
	_retweets = (
		WITH retweetLikes AS (
			SELECT "retweetId", COUNT(*) AS likes
			FROM likes
			GROUP BY "retweetId"
		),
		retweetComments AS (
			SELECT "retweetId", COUNT(*) AS comments
			FROM comments
			GROUP BY "retweetId"
		)
		SELECT JSON_AGG(
			JSON_BUILD_OBJECT(
				'id', t.id,
				'content', t.content,
				'likes', COALESCE(rtl.likes, 0),
				'comments', COALESCE(rtc.comments, 0),
				'user', JSON_BUILD_OBJECT(
					'id', u.id,
					'username', u.username,
					'firstName', u.firstName,
					'lastName', u.lastName,
					'email', u.email,
					'bio', u.bio
				),
				'createdAt', t."createdAt",
				'updatedAt', t."updatedAt"
			)
			ORDER BY t."createdAt"
		)
		FROM tweets t
		LEFT JOIN retweetLikes rtl ON t.id = rtl."retweetId"
		LEFT JOIN retweetComments rtc ON t.id = rtc."retweetId"
		LEFT JOIN users u ON t."userId" = u.id
		LIMIT _limit
		OFFSET (_page - 1) * _limit
	)::JSONB;

	RETURN JSON_BUILD_OBJECT(
		'status', 'success',
		'retweets', _retweets
	);
END;
$$ LANGUAGE plpgsql;

SELECT get_retweets(1, 10);

-- ! user profile
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