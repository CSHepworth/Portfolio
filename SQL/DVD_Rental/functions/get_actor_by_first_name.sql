-- get_actor_by_first_name(_first_name text)

DECLARE this_actor INT;
BEGIN
	SELECT actor_id INTO STRICT this_actor FROM actor WHERE first_name = 'Kevin' LIMIT 1;
	IF NOT FOUND THEN
		RAISE EXCEPTION 'actor % not found', first_name;
	END IF;
END;
