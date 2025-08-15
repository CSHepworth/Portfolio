/* Create Fixed Value Function */
CREATE OR REPLACE FUNCTION fixed_val()
RETURNS integer AS $$
BEGIN
RETURN 1;
END; $$
LANGUAGE PLPGSQL;