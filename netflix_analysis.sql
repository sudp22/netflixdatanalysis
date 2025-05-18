--Drop the existing netflix_titles table if exists to avoid errors
DROP TABLE IF EXISTS netflix_titles;

--Creating the netflix_titles table to store Netflix show data
CREATE TABLE netflix_titles(
show_id VARCHAR(5),
type VARCHAR(10),
title VARCHAR(150),
director VARCHAR(255),
casts VARCHAR(1000),
country VARCHAR(125),
date_added VARCHAR(25),
release_year INT,
rating VARCHAR(25),
duration VARCHAR(25),
listed_in VARCHAR (100),
description VARCHAR(255)
);

--What are the types of shows on Netflix and their percentage distribution?
SELECT 
  type AS "Type of show",
  COUNT(*) AS "Total shows",
  ROUND(COUNT(*)*100/SUM(COUNT(*))OVER(),2) AS "Percentage"
FROM netflix_titles 
GROUP BY type 
ORDER BY "Total shows";

--Range of release years of all the shows
SELECT 
  MIN(release_year) AS "Start Year",
  MAX(release_year) AS "End Year"
FROM netflix_titles;

--Total shows released each year(Ordered by total shows descending)
SELECT 
  release_year,
  COUNT(*) AS "Total shows"
FROM netflix_titles
GROUP BY release_year 
ORDER BY "Total shows" DESC;

--Top 10 countries with most Netflix content
SELECT 
  country,
  COUNT(*) AS "Total shows"
FROM netflix_titles 
WHERE country !='Unknown'
GROUP BY country 
ORDER BY "Total shows" DESC LIMIT 10;

-- Show rating distribution across different countries
SELECT 
  rating,
  country,
  COUNT(*) AS "Total shows"
FROM netflix_titles 
WHERE country !='Unknown'
GROUP BY rating,country 
ORDER BY "Total shows" DESC;

--Top 10 genres on Netflix (handle multiple genres per title)
WITH genres AS (
  SELECT 
    TRIM(UNNEST(STRING_TO_ARRAY(listed_in, ','))) AS genre
  FROM netflix_titles
)
SELECT 
  genre,
  COUNT(*) AS "Total shows"
FROM genres
GROUP BY genre
ORDER BY "Total shows" DESC
LIMIT 10;

--Top 10 directors with most shows on Netflix 
SELECT 
  director,
  COUNT(*) AS "Total shows"
FROM netflix_titles 
WHERE director!='Unknown' 
GROUP BY director 
ORDER BY "Total shows" DESC,director ASC
LIMIT 10;

--Top 10 actors with most shows on Netflix 
WITH actors AS (
    SELECT TRIM(UNNEST(STRING_TO_ARRAY(casts, ','))) AS actor
    FROM netflix_titles
)
SELECT 
  actor, 
  COUNT(*) 
FROM actors 
WHERE TRIM(actor) != 'Unknown'
GROUP BY actor 
ORDER BY COUNT(*) DESC 
LIMIT 10;

--Top 5 TV Shows with the highest number of seasons
SELECT 
  title,
  duration,
  CASE 
    WHEN type = 'TV Show' THEN CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER)
    ELSE NULL
  END AS num_seasons
FROM netflix_titles
WHERE type = 'TV Show'
ORDER BY num_seasons DESC, title ASC LIMIT 5;

--Total shows released between the years 2000 and 2021
SELECT 
  release_year,
  COUNT(type) AS "Total shows"
FROM netflix_titles 
WHERE release_year BETWEEN 2000 AND 2021  
GROUP BY release_year  
ORDER BY release_year;

--Netflix show with the longest title
SELECT 
  title,
  LENGTH((title)) 
FROM netflix_titles 
GROUP BY title 
ORDER BY LENGTH(title) DESC LIMIT 1;

-- Analyzing years taken to add shows to Netflix after release
-- considering all shows from 1925 to 2021 to capture vintage content
SELECT 
  title,
  TRIM(SPLIT_PART(date_added,',',2))::INT AS year_added,release_year,
  TRIM(SPLIT_PART(date_added,',',2))::INT-release_year AS  "Years taken to add shows to Netflix" 
FROM netflix_titles 
GROUP BY title,date_added,year_added,release_year
ORDER BY "Years taken to add shows to Netflix" DESC;