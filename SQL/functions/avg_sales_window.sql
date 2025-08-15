/* Create avg_sales_window function */
CREATE OR REPLACE FUNCTION avg_sales_window(begin_date DATE, end_date DATE)
RETURNS numeric AS $sales_avg$
DECLARE sales_avg numeric;
BEGIN
SELECT AVG(sales_amount) INTO sales_avg FROM sales
WHERE sales_transaction_date > begin_date AND sales_transaction_date < end_date;
RETURN sales_avg;
END; $sales_avg$
LANGUAGE PLPGSQL;
SELECT avg_sales_window('2013-04-12', '2014-04-12');