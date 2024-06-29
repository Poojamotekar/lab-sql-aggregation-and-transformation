-- Challenge 1
-- You need to use SQL built-in functions to gain insights relating to the duration of movies:
 -- 1.1 Determine the shortest and longest movie durations and name the values as max_duration and min_duration.
 USE sakila;
SELECT 
MAX(length) as max_duration,
MIN(length) as min_duration
from film;
 
-- 1.2. Express the average movie duration in hours and minutes. Don't use decimals.
-- Hint: Look for floor and round functions.
SELECT 
    FLOOR(AVG(length) / 60) AS avg_hours,
    FLOOR(AVG(length) % 60) AS avg_minutes
FROM
    film;
    
-- 2.1 Calculate the number of days that the company has been operating.
-- Hint: To do this, use the rental table, and the DATEDIFF() function to subtract the earliest date in the rental_date column from the latest date.
SELECT 
DATEDIFF(MAX(rental_date),MIN(rental_date))
FROM rental;

-- 2.2 Retrieve rental information and add two additional columns to show the month and weekday of the rental. Return 20 rows of results.
SELECT *,
month(rental_date) as month,
weekday(rental_date) as weekday_of_rental
from 
rental 
limit 10;

-- 2.3 Bonus: Retrieve rental information and add an additional column called DAY_TYPE with values 'weekend' or 'workday', depending on the day of the week.
-- Hint: use a conditional expression.

SELECT *,
    CASE
        WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend'
        ELSE 'workday'
    END AS DAY_TYPE
FROM 
    rental;
    
    
SELECT *, MONTH(rental_date) AS month_rental, DAYOFWEEK(rental_date) AS weekday_rental,
CASE
WHEN DAYOFWEEK(rental_date) BETWEEN 2 AND 6 THEN 'Workday' -- Sunday = 1 
WHEN DAYOFWEEK(rental_date) IN (1,7) THEN 'Weekend'
END AS day_type 
FROM rental
LIMIT 20;






