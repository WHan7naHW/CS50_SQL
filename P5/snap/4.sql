-- Find the username of the most popular user
SELECT
    "username"
FROM
    "users"
WHERE "id" = (
    SELECT
        "to_user_id"
    FROM
        "messages"
    GROUP BY
        "to_user_id"
    ORDER BY
        COUNT("picture") DESC
    LIMIT 1
);
