-- Find all usernames of users who have logged in since 2024-01-01.
SELECT
    "username"
FROM
    "users"
WHERE
    "last_login_date" >= '2024-01-01';


-- Find when the message with ID 151 expires.
SELECT
    "expires_timestamp"
FROM
    "messages"
WHERE
    "id" = 151;


-- Find the user IDs of the top 3 users to whom
-- creativewisdom377 sends messages most frequently.
SELECT
    "to_user_id"
FROM
    "messages"
WHERE
    "from_user_id" = (
        SELECT "id" FROM "users"
        WHERE "username" = 'creativewisdom377'
    )
GROUP BY
    "to_user_id"
ORDER BY
    COUNT("picture") DESC
LIMIT 3;


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


-- Given two usernames, find the user IDs of their mutual friends.
SELECT "friend_id" FROM "friends"
WHERE "user_id" = (
    SELECT "id" FROM "users"
    WHERE "username" = 'lovelytrust487'
)
INTERSECT
SELECT "friend_id" FROM "friends"
WHERE "user_id" = (
    SELECT "id" FROM "users"
    WHERE "username" = 'exceptionalinspiration482'
);
