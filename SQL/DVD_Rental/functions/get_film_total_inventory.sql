-- get_film_total_inventory(f_id, integer)

DECLARE
    total_inventory INTEGER;
BEGIN
    SELECT COALESCE(COUNT(*), 0) INTO total_inventory FROM inventory AS i
        LEFT JOIN film AS f ON f.film_id = i.film_id
    WHERE f.film_id = f_id;
    RETURN total_inventory;
END; 