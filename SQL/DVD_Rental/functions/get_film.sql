-- get_film(p_pattern character varying)

BEGIN
    RETURN QUERY SELECT
        title,
        cast(release_year AS INTEGER)
    FROM film
    WHERE title ILIKE p_pattern;
END; 