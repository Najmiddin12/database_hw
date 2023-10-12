SELECT
    actor_id,
    first_name,
    last_name,
    MAX(DATEDIFF(CURRENT_DATE, last_acting_role_date)) AS longest_haitus_duration
FROM
    actors
GROUP BY
    actor_id, first_name, last_name
ORDER BY
    longest_haitus_duration DESC;