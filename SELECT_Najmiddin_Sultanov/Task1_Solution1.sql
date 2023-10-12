WITH StoreMaxRevenue AS (
    SELECT
        s.store_id,
        MAX(sales.revenue) AS max_revenue
    FROM
        sales
    WHERE
        sales.year = 2017
    GROUP BY
        s.store_id
)
SELECT
    s.store_id,
    s.staff_id,
    s.first_name,
    s.last_name,
    smr.max_revenue
FROM
    staff s
INNER JOIN StoreMaxRevenue smr ON s.store_id = smr.store_id
INNER JOIN sales ON s.staff_id = sales.staff_id
WHERE
    sales.year = 2017
    AND sales.revenue = smr.max_revenue