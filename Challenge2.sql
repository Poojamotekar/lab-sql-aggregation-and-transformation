-- you need to analyze the films in the collection to gain some more insights. Using the film table, determine:
-- 1.1 The total number of films that have been released.
SELECT 
    COUNT(*) AS total_released_films
FROM 
    film
WHERE 
    RELEASE_YEAR IS NOT NULL;


-- 1.2 The number of films for each rating.
SELECT 
    RATING, 
    COUNT(*) AS number_of_films
FROM 
    film
GROUP BY 
    RATING;
    
-- 1.3 The number of films for each rating, sorting the results in descending order of the number of films. 
-- This will help you to better understand the popularity of different film ratings and adjust purchasing decisions accordingly.
SELECT 
    RATING, 
    COUNT(*) AS number_of_films
FROM 
    film
GROUP BY 
    RATING 
ORDER BY number_of_films DESC;

-- 2) Using the film table, determine:
-- 2.1 The mean film duration for each rating, and sort the results in descending 
-- order of the mean duration. Round off the average lengths to two decimal places. 
-- This will help identify popular movie lengths for each category.
SELECT RATING,
 round(avg(length),2) as avg_length
 FROM
 film
 GROUP BY
 RATING
 ORDER BY  avg_length desc;
 
-- 2.2 Identify which ratings have a mean duration of over two hours 
-- in order to help select films for customers who prefer longer movies.
SELECT rating, ROUND(AVG(length),2) AS average_length
FROM film
GROUP BY rating
HAVING average_length > 120
ORDER BY average_length DESC;

-- Bonus: determine which last names are not repeated in the table actor.

SELECT last_name, COUNT(last_name) AS count_last_name
FROM actor
GROUP BY last_name
HAVING count_last_name = 1;
