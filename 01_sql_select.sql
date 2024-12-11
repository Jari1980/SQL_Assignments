/* 
SQL select query exercise

World database layout:
To use this database from a default MySQL install, type: use world;

Table: City
Columns: Id, Name, CountryCode, District, Population

Table: Country
Columns: Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, Capital

Table: CountryLanguage
Columns: CountryCode, Language, IsOfficial, Percentage
*/

USE world;

-- 0: Get a query to return "Hello World", 123
-- (Hint: 1 row, 2 columns)
SELECT "hello world" as message , 123 as id;

-- 1: Get everything from the city table
-- (Hint: Many many rows)
SELECT * FROM city;

-- 2: Get everything on the cities whose district is "aceh"
-- (Hint: 2 rows)
SELECT * FROM city
WHERE District = "aceh";

-- 3: Get only the name of the cities where the countrycode is "bfa"
SELECT * FROM city
WHERE countrycode = "bfa";

-- 4: Get both the name and district of the cities where the countrycode is "tto"
SELECT Name, District FROM city
WHERE countrycode = "tto";

-- 5: Get the name and district named as nm, dist from the cities where the countrycode is "arm"
SELECT name AS nm, district AS dist FROM city
WHERE countrycode = "arm"; 

-- 6: Get the cities with a name that starts with "bor"
SELECT * FROM city
WHERE name LIKE "Bor%";


-- 7: Get the cities with a name that contains the string "orto"
SELECT * FROM city
WHERE name LIKE "%orto%";


-- 8: Get the cities that have a population below 1000
SELECT * FROM city
WHERE population < 1000;


-- 9: Get the unique countrycodes from the cities that have a population below 1000
SELECT DISTINCT CountryCode FROM city
WHERE Population < 1000;


-- 10: Get the cities with the countrycode UKR that has more than 1000000 (one million) in population
SELECT * FROM city
WHERE countrycode = "UKR" AND
population > 1000000;


-- 11: Get the cities with a population of below 200 or above 9500000 (9.5 million)
SELECT * FROM city
WHERE population < 200 OR
population > 9500000;


-- 12: Get the cities with the countrycodes TJK, MRT, AND, PNG, SJM
SELECT * FROM city
WHERE countrycode IN ("TJK", "MRT", "AND", "PNG", "SJM");


-- 13: Get the cities with a population between 200 and 700 inclusive
SELECT * FROM city
WHERE population >= 200 AND -- population BETWEEN 200 AND 700
population <= 700; 


-- 14: Get the countries with a population between 8000 and 20000 inclusive
SELECT * FROM city
WHERE population BETWEEN 8000 AND 20000;



-- 15: Get the name of the countries with an independence year (indepyear) before year 0
SELECT Name FROM country
WHERE IndepYear < 0;


-- 16: Get the countries that have no recorded independence year and a population above 1000000
SELECT * FROM country
WHERE IndepYear IS NULL AND 
Population > 1000000;


-- 17: Get countries with a SurfaceArea below 10 and a defined LifeExpectancy
SELECT * FROM country
WHERE SurfaceArea < 10 AND
LifeExpectancy IS NOT NULL;

