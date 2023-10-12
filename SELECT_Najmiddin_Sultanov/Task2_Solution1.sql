WITH TopRentedMovies AS (
    SELECT
        m.film_id,
        m.title,
        COUNT(r.rental_id) AS rental_count
    FROM
        movies m
    INNER JOIN rentals r ON m.film_id = r.film_id
    GROUP BY
        m.film_id, m.title
    ORDER BY
        rental_count DESC
    LIMIT 5
)
SELECT
    trm.title,
    AVG(cast(EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM c.birth_date) AS DECIMAL)) AS expected_age
FROM
    TopRentedMovies trm
INNER JOIN rentals r ON trm.film_id = r.film_id
INNER JOIN customers c ON r.customer_id = c.customer_id
GROUP BY
    trm.title
ORDER BY
    expected_age;