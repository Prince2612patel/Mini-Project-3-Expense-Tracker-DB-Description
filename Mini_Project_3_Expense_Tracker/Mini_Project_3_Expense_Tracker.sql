CREATE DATABASE MiniProject3DB;
USE MiniProject3DB;


-- Task 1: Create playlists table

CREATE TABLE playlists
(
    playlist_id INT PRIMARY KEY,
    user_id INT,
    name VARCHAR(100),
    created_at DATETIME
);


-- Task 2: Insert 3 playlists

INSERT INTO playlists
VALUES
(1, 101, 'Workout Mix', '2026-09-01 10:00:00'),
(2, 102, 'Chill Vibes', '2026-09-05 18:30:00'),
(3, 103, 'Top Hits', '2026-09-10 20:00:00');


-- Task 3: Rename Chill Vibes

UPDATE playlists
SET name = 'Evening Chill'
WHERE name = 'Chill Vibes'
AND user_id = 102;


-- Task 4: Delete Workout Mix

DELETE FROM playlists
WHERE name = 'Workout Mix'
AND user_id = 101;


-- Task 5: Count user's playlists in a month

DELIMITER //

CREATE PROCEDURE GetMonthlyPlaylistCount
(
    IN user_id_input INT,
    IN month_input INT
)
BEGIN
    SELECT COUNT(*) AS total_playlists
    FROM playlists
    WHERE user_id = user_id_input
    AND MONTH(created_at) = month_input;
END //

DELIMITER ;


-- Run procedure

CALL GetMonthlyPlaylistCount(102, 9);