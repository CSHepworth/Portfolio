/* Create max sale function */
CREATE OR REPLACE FUNCTION max_sale()
RETURNS integer AS $big_sale$
DECLARE big_sale integer;
BEGIN
SELECT MAX(sales_amount) INTO big_sale FROM sales;
RETURN big_sale;
END; $big_sale$
LANGUAGE PLPGSQL;
SELECT max_sale();