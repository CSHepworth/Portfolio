-- get_film_total_categories(f_id integer)

DECLARE
    total_categories INTEGER;
BEGIN
    SELECT COALESCE(COUNT(*), 0) INTO total_categories FROM film_category AS fc
        LEFT JOIN film AS f ON f.film_id = fc.film_id
    WHERE f.film_id = f_id;
    RETURN total_categories;
END; 