/* Create num_samples function */
CREATE OR REPLACE FUNCTION num_samples()
RETURNS integer AS $total$
DECLARE total integer;
BEGIN
SELECT COUNT(*) INTO total FROM sales;
RETURN total;
END; $total$
LANGUAGE PLPGSQL;
SELECT num_samples();