WITH SubcategorySales AS (
    SELECT
        prod_subcategory,
        order_year,
        SUM(sales) AS total_sales,
        LAG(SUM(sales)) OVER (PARTITION BY prod_subcategory ORDER BY order_year) AS prev_year_sales
    FROM
        orders
    WHERE
        order_year BETWEEN 1998 AND 2001
    GROUP BY
        prod_subcategory, order_year
)
SELECT DISTINCT
    prod_subcategory
FROM
    SubcategorySales
WHERE
    total_sales > COALESCE(prev_year_sales, 0);
