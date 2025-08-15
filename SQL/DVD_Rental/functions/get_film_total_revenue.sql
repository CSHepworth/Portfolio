-- get_film_total_revenue(f_id, integer)

DECLARE
    total_revenue NUMERIC (5, 2);
BEGIN
    SELECT COALESCE(SUM(p.amount), 0.00) INTO total_revenue FROM payment AS p
        LEFT JOIN rental AS r ON r.rental_id = p.rental_id
        LEFT JOIN inventory AS i ON i.inventory_id = r.inventory_id
        LEFT JOIN film AS f ON f.film_id = i.film_id
    WHERE f.film_id = f_id;
    RETURN total_revenue;
END; 