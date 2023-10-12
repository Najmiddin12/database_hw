WITH StoreMaxRevenue AS (
    SELECT
        s.store_id,
        s.staff_id,
        s.first_name,
        s.last_name,
        MAX(sales.revenue) AS max_revenue
    FROM
        staff s
    INNER JOIN sales ON s.staff_id = sales.staff_id
    WHERE
        sales.year = 2017
    GROUP BY
        s.store_id, s.staff_id, s.first_name, s.last_name
)
SELECT
    store_id,
    staff_id,
    first_name,
    last_name,
    max_revenue
FROM
    StoreMaxRevenue;