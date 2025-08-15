-- get_film_total_rentals(f_id, integer)

DECLARE
    total_rentals INTEGER;
BEGIN
    SELECT COALESCE(COUNT(*), 0) INTO total_rentals FROM rental AS r
        LEFT OUTER JOIN inventory AS i ON i.inventory_id = r.inventory_id
        LEFT OUTER JOIN film AS f ON f.film_id = i.film_id
    WHERE f.film_id = f_id;
    RETURN total_rentals;
END; 