-- ============================================================
-- NETFLIX ORIGINALS DATA ANALYSIS
-- SQL FINAL PROJECT
-- ============================================================


-- ------------------------------------------------------------
-- STEP 1: CREATE DATABASE
-- ------------------------------------------------------------

-- Create a database for the Netflix Originals project
CREATE DATABASE netflix_originals_db;

-- Select the database for use
USE netflix_originals_db;

-- Verify the currently selected database
SELECT DATABASE();


-- ------------------------------------------------------------
-- STEP 2: CREATE GENRE_DETAILS TABLE
-- ------------------------------------------------------------

-- Remove the previously created table if it exists
DROP TABLE IF EXISTS genre_details;

-- Create a table to store Netflix genre information
-- Genre IDs contain values such as G1, G2, G3, etc.
CREATE TABLE genre_details (
    genre_id VARCHAR(10) PRIMARY KEY,
    genre_name VARCHAR(100)
);

-- Verify the table structure
DESCRIBE genre_details;


-- ------------------------------------------------------------
-- STEP 3: CREATE NETFLIX_ORIGINALS TABLE
-- ------------------------------------------------------------

-- Remove the previously created table if it exists
DROP TABLE IF EXISTS netflix_originals;

-- Create a table to store Netflix Originals information
CREATE TABLE netflix_originals (
    title VARCHAR(255),
    genre_id VARCHAR(10),
    runtime INT,
    imdb_score DECIMAL(3,1),
    language VARCHAR(100),
    premiere_date DATE
);

-- Verify the table structure
DESCRIBE netflix_originals;


-- ------------------------------------------------------------
-- STEP 4: INSERT GENRE_DETAILS DATA
-- ------------------------------------------------------------

-- Insert genre information from Genre_Details CSV
INSERT INTO genre_details (genre_id, genre_name)
VALUES
    ('G1', 'Documentary'),
    ('G2', 'Thriller'),
    ('G3', 'Science Fiction'),
    ('G4', 'Mystery'),
    ('G5', 'Action'),
    ('G6', 'Comedy'),
    ('G7', 'Drama'),
    ('G8', 'Musical'),
    ('G9', 'Horror'),
    ('G10', 'Romance'),
    ('G11', 'Anime'),
    ('G12', 'Supernatural'),
    ('G13', 'Interviews'),
    ('G14', 'Historical'),
    ('G15', 'Biopic'),
    ('G16', 'Concert Film'),
    ('G17', 'Rom-Com'),
    ('G18', 'Variety Show'),
    ('G19', 'Satire');


-- ------------------------------------------------------------
-- STEP 5: VERIFY GENRE_DETAILS DATA
-- ------------------------------------------------------------

-- Display all genre records
SELECT *
FROM genre_details;

-- Count the total number of genres
SELECT COUNT(*) AS total_genres
FROM genre_details;


-- ------------------------------------------------------------
-- STEP 6: VERIFY NETFLIX_ORIGINALS TABLE
-- ------------------------------------------------------------

-- Verify the Netflix Originals table structure
DESCRIBE netflix_originals;


-- ------------------------------------------------------------
-- STEP 7: VERIFY NETFLIX_ORIGINALS DATA
-- ------------------------------------------------------------

-- Check the number of Netflix Originals records
SELECT COUNT(*) AS total_netflix_originals
FROM netflix_originals;

SELECT * from netflix_originals;

-- Display the first 10 Netflix Originals records
SELECT *
FROM netflix_originals
LIMIT 10;

-- ------------------------------------------------------------
-- STEP 8: QUESTION 1
-- ------------------------------------------------------------

-- Find the average IMDb score for each genre
SELECT
    gd.genre_name,
    ROUND(AVG(no.imdb_score), 2) AS average_imdb_score
FROM netflix_originals AS no
INNER JOIN genre_details AS gd
    ON no.genre_id = gd.genre_id
GROUP BY gd.genre_name
ORDER BY average_imdb_score DESC;

-- ------------------------------------------------------------
-- STEP 9: QUESTION 2
-- ------------------------------------------------------------

-- Find genres with an average IMDb score higher than 7.5
SELECT
    gd.genre_name,
    ROUND(AVG(no.imdb_score), 2) AS average_imdb_score
FROM netflix_originals AS no
INNER JOIN genre_details AS gd
    ON no.genre_id = gd.genre_id
GROUP BY gd.genre_name
HAVING AVG(no.imdb_score) > 7.5
ORDER BY average_imdb_score DESC;

-- ------------------------------------------------------------
-- STEP 10: QUESTION 3
-- ------------------------------------------------------------

-- List Netflix Original titles in descending order
-- of their IMDb scores
SELECT
    title,
    imdb_score
FROM netflix_originals
ORDER BY imdb_score DESC;

-- ------------------------------------------------------------
-- STEP 11: QUESTION 4
-- ------------------------------------------------------------

-- Retrieve the top 10 longest Netflix Originals
-- based on runtime
SELECT
    title,
    runtime
FROM netflix_originals
ORDER BY runtime DESC
LIMIT 10;

-- ------------------------------------------------------------
-- STEP 12: QUESTION 5
-- ------------------------------------------------------------

-- Retrieve Netflix Original titles along with their genres
SELECT
    no.title,
    gd.genre_name
FROM netflix_originals AS no
INNER JOIN genre_details AS gd
    ON no.genre_id = gd.genre_id
ORDER BY gd.genre_name, no.title;

-- ------------------------------------------------------------
-- STEP 13: QUESTION 6
-- ------------------------------------------------------------

-- Rank Netflix Originals based on IMDb score
-- within each genre
SELECT
    gd.genre_name,
    no.title,
    no.imdb_score,
    RANK() OVER (
        PARTITION BY no.genre_id
        ORDER BY no.imdb_score DESC
    ) AS imdb_rank
FROM netflix_originals AS no
INNER JOIN genre_details AS gd
    ON no.genre_id = gd.genre_id
ORDER BY gd.genre_name, imdb_rank;

-- ------------------------------------------------------------
-- STEP 14: QUESTION 7
-- ------------------------------------------------------------

-- Find Netflix Originals with an IMDb score higher
-- than the average IMDb score of all titles
SELECT
    title,
    imdb_score
FROM netflix_originals
WHERE imdb_score > (
    SELECT AVG(imdb_score)
    FROM netflix_originals
)
ORDER BY imdb_score DESC;

-- ------------------------------------------------------------
-- STEP 15: QUESTION 8
-- ------------------------------------------------------------

-- Count the number of Netflix Originals in each genre
SELECT
    gd.genre_name,
    COUNT(no.title) AS total_netflix_originals
FROM netflix_originals AS no
INNER JOIN genre_details AS gd
    ON no.genre_id = gd.genre_id
GROUP BY gd.genre_name
ORDER BY total_netflix_originals DESC;

-- ------------------------------------------------------------
-- STEP 16: QUESTION 9
-- ------------------------------------------------------------

-- Find genres that have more than 5 Netflix Originals
-- with an IMDb score higher than 8
SELECT
    gd.genre_name,
    COUNT(no.title) AS titles_above_8
FROM netflix_originals AS no
INNER JOIN genre_details AS gd
    ON no.genre_id = gd.genre_id
WHERE no.imdb_score > 8
GROUP BY gd.genre_name
HAVING COUNT(no.title) > 5
ORDER BY titles_above_8 DESC;

-- ------------------------------------------------------------
-- STEP 17: QUESTION 10
-- ------------------------------------------------------------

-- Find the top 3 genres with the highest average IMDb scores
-- and count the number of Netflix Originals in each genre
SELECT
    gd.genre_name,
    ROUND(AVG(no.imdb_score), 2) AS average_imdb_score,
    COUNT(no.title) AS total_netflix_originals
FROM netflix_originals AS no
INNER JOIN genre_details AS gd
    ON no.genre_id = gd.genre_id
GROUP BY gd.genre_name
ORDER BY average_imdb_score DESC
LIMIT 3;