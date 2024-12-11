/* 
SQL Join query exercise

World database layout:
To use this database from a default MySQL install, type: use world;

Table: City
Columns: Id, Name, CountryCode, District, Population

Table: Country
Columns: Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, Capital

Table: CountryLanguage
Columns: CountryCode, Language, IsOfficial, Percentage
*/

-- 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
SELECT * FROM city
WHERE name LIKE "ping%"
ORDER BY population;


-- 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
SELECT * FROM city
WHERE name LIKE "ran%"
ORDER BY population DESC;


-- 3: Count all cities
SELECT COUNT(*)  AS "Cities counted" FROM city;


-- 4: Get the average population of all cities
SELECT AVG(population) AS "AVG POP" FROM city;


-- 5: Get the biggest population found in any of the cities
SELECT MAX(population) AS "Max POP City" FROM city;


-- 6: Get the smallest population found in any of the cities
SELECT MIN(population) AS "Min POP City" FROM city;


-- 7: Sum the population of all cities with a population below 10000
SELECT SUM(population) AS "Total POP cities below 10000" FROM city
WHERE population < 10000;


-- 8: Count the cities with the country codes MOZ and VNM
SELECT COUNT(*) AS "Cities" FROM city
WHERE CountryCode IN ("MOZ", "VNM");


-- 9: Get individual count of cities for the country codes MOZ and VNM
SELECT CountryCode, COUNT(*) FROM city
WHERE CountryCode IN ("MOZ", "VNM")
GROUP BY CountryCode;


-- 10: Get average population of cities in MOZ and VNM
SELECT CountryCode, AVG(population) FROM city
WHERE CountryCode IN ("MOZ", "VNM")
GROUP BY CountryCode;

-- 11: Get the country codes with more than 200 cities
SELECT CountryCode FROM city
GROUP BY CountryCode
HAVING COUNT(*) > 200;


-- 12: Get the country codes with more than 200 cities ordered by city count
SELECT CountryCode, COUNT(*) AS CityCount FROM city
GROUP BY CountryCode
HAVING CityCount > 200
ORDER BY CityCount DESC;


-- 13: What language(s) is spoken in the city with a population between 400 and 500?
SELECT * FROM countrylanguage;
SELECT * FROM country;
SELECT * FROM city;

SELECT DISTINCT countrylanguage.language FROM city
JOIN countrylanguage
ON city.CountryCode = countrylanguage.CountryCode
WHERE city.Population BETWEEN 400 AND 500;


-- 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
SELECT city.name AS CityName, countrylanguage.Language FROM city
JOIN countrylanguage
ON city.CountryCode = countrylanguage.CountryCode
WHERE city.Population BETWEEN 500 AND 600;


-- 15: What names of the cities are in the same country as the city with a population of 122199 (including that city itself)
SELECT name FROM city
WHERE CountryCode = (SELECT CountryCode FROM city WHERE population = 122199);


-- 16: What names of the cities are in the same country as the city with a population of 122199 (excluding that city itself)
SELECT name FROM city
WHERE CountryCode = (SELECT CountryCode FROM city WHERE population = 122199)
AND population != 122199;



-- 17: What are the city names in the country where Luanda is the capital?
SELECT * FROM countrylanguage;
SELECT * FROM country;
SELECT * FROM city;

SELECT city.name AS Cities FROM city
JOIN country
ON city.CountryCode = country.Code
WHERE country.Capital = (SELECT Id FROM city WHERE name = "Luanda");

-- 18: What are the names of the capital cities in countries in the same region as the city named Yaren
SELECT * FROM countrylanguage;
SELECT * FROM country;
SELECT * FROM city;

SELECT city.name AS Capitals FROM city
JOIN country
ON city.id = country.Capital
WHERE country.Region = 
(SELECT Region FROM city JOIN country ON city.CountryCode = country.Code WHERE city.Name = "Yaren");


-- 19: What unique languages are spoken in the countries in the same region as the city named Riga
SELECT * FROM countrylanguage;
SELECT * FROM country;
SELECT * FROM city;

SELECT DISTINCT countrylanguage.Language FROM countrylanguage
JOIN country
ON countrylanguage.CountryCode = country.Code
WHERE country.Region = (
	SELECT Region FROM city 
    JOIN country 
    ON city.CountryCode = country.Code 
    WHERE city.Name = "Riga"
    );

-- 20: Get the name of the most populous city
SELECT name FROM city
WHERE population = (
	SELECT MAX(population) FROM city
    );


