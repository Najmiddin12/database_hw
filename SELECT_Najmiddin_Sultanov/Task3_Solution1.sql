SELECT
    actor_id,
    first_name,
    last_name,
    DATEDIFF(CURRENT_DATE, last_acting_role_date) AS hiatus_duration
FROM
    actors
ORDER BY
    hiatus_duration DESC;