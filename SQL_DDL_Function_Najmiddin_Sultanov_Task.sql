CREATE VIEW sales_revenue_by_category_qtr AS
SELECT
    f.category,
    SUM(p.amount) AS total_sales_revenue
FROM
    film f
JOIN
    inventory i ON f.film_id = i.film_id
JOIN
    rental r ON i.inventory_id = r.inventory_id
JOIN
    payment p ON r.rental_id = p.rental_id
WHERE
    EXTRACT(QUARTER FROM r.rental_date) = EXTRACT(QUARTER FROM CURRENT_DATE)
GROUP BY
    f.category
HAVING
    SUM(p.amount) > 0;

CREATE OR REPLACE FUNCTION get_sales_revenue_by_category_qtr(current_quarter INT)
RETURNS TABLE(category VARCHAR, total_sales_revenue NUMERIC) AS $$
BEGIN
    RETURN QUERY
        SELECT
            f.category,
            SUM(p.amount) AS total_sales_revenue
        FROM
            film f
        JOIN
            inventory i ON f.film_id = i.film_id
        JOIN
            rental r ON i.inventory_id = r.inventory_id
        JOIN
            payment p ON r.rental_id = p.rental_id
        WHERE
            EXTRACT(QUARTER FROM r.rental_date) = current_quarter
        GROUP BY
            f.category
        HAVING
            SUM(p.amount) > 0;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION new_movie(movie_title VARCHAR)
RETURNS VOID AS $$
DECLARE
    new_film_id INT;
BEGIN
    SELECT COALESCE(MAX(film_id), 0) + 1 INTO new_film_id FROM film;

    INSERT INTO film (film_id, title, rental_rate, rental_duration, replacement_cost, release_year, language_id)
    VALUES (new_film_id, movie_title, 4.99, 3, 19.99, EXTRACT(YEAR FROM CURRENT_DATE), (SELECT language_id FROM language WHERE name = 'Klingon'));

END;
$$ LANGUAGE plpgsql;