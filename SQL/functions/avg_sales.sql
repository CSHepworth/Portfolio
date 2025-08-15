/* Create average sales function */
CREATE OR REPLACE FUNCTION avg_sales(channel_type TEXT) 
RETURNS numeric AS $channel_avg$
DECLARE channel_avg numeric;
BEGIN
SELECT AVG(sales_amount) INTO channel_avg FROM sales
WHERE channel=channel_type;
RETURN channel_avg;
END; $channel_avg$
LANGUAGE PLPGSQL;
SELECT avg_sales('internet');