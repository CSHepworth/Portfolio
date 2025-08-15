-- get_film_category(f_id integer)

DECLARE
    film_cat VARCHAR;
BEGIN
    SELECT c.name INTO film_cat FROM category AS c
        LEFT JOIN film_category AS fc ON fc.category_id = c.category_id
        LEFT JOIN film AS f ON f.film_id = fc.film_id
    WHERE f.film_id = f_id;
    RETURN film_cat;
END; 