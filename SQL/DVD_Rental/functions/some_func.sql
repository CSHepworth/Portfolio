-- some_func(integer)

DECLARE
	quantity ALIAS FOR $1;
BEGIN
	RAISE NOTICE 'Quantity here is %', quantity;
	RETURN quantity;
END;
