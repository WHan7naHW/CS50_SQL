-- Find the players who played their final game in the MLB in 2022

SELECT "first_name", "last_name"
FROM "players"
WHERE SUBSTR("final_game", 1, 4) = '2022'
ORDER BY "first_name", "last_name";
