DROP FUNCTION register;
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
	
DROP FUNCTION login;
CREATE OR REPLACE FUNCTION login(data JSONB)
RETURNS JSONB AS $$
DECLARE
	_user JSONB = NULL::JSONB;
	_username VARCHAR = coalesce((data->>'username')::varchar, NULL);
	_password VARCHAR = coalesce((data->>'password')::varchar, NULL);
BEGIN
	-- check if all required variables are available or not
	IF _username IS NULL THEN
		RETURN JSON_BUILD_OBJECT(
			'status', 'failed',
			'username', 'required'
		);
	END IF;
	IF _password IS NULL THEN
		RETURN JSON_BUILD_OBJECT(
			'status', 'failed',
			'password', 'required'
		);
	END IF;
	
	SELECT username, email INTO _user
	FROM users
	WHERE username = _username AND password = _password;
	
	RETURN JSON_BUILD_OBJECT(
		'status', CASE WHEN _user IS NULL THEN 'failed' ELSE 'success' END,
		'user', _user
	);
END;
$$ LANGUAGE plpgsql;