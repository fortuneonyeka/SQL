--SELECT basics
--1.
SELECT population FROM world
  WHERE name = 'Germany'
--2.
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');
--3.
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

--QUIZ 1
--1.
 SELECT name, population
  FROM world
 WHERE population BETWEEN 1000000 AND 1250000
 --2
 SELECT name, population
      FROM world
      WHERE name LIKE 'Al%'
      --Answer
 Table-E
 Albania	3200000
 Algeria	32900000
--3
 SELECT name FROM world
     WHERE name LIKE '%a' OR name LIKE '%l'
 --4
 SELECT name,length(name)
    FROM world
     WHERE length(name)=5 and continent='Europe'
--Answer
    name	length(name)
     Italy	5
     Malta	5
     Spain	5
--5
 SELECT name, area*2 FROM world WHERE population = 64000
--Answer
    Andorra	936
--6 Select the code that would show the countries with an area larger than 50000 and a population smaller than 10000000
--Answer
  SELECT name, area, population
     FROM world
     WHERE area > 50000 AND population < 10000000
--7 Select the code that shows the population density of China, Australia, Nigeria and France
--Answer
  SELECT name, population/area
     FROM world
    WHERE name IN ('China', 'Nigeria', 'France', 'Australia')

--SELECT FROM world
--1
   SELECT name, continent, population FROM world
--2
  SELECT name
     FROM world
     WHERE population > 200000000
--3 Give the name and the per capita GDP for those countries with a population of at least 200 million.

--HELP:How to calculate per capita GDP
--per capita GDP is the GDP divided by the population GDP/population
--Answer
  SELECT name,GDP/population
    FROM world
    WHERE population > 200000000
--4
  SELECT name, population/1000000
    FROM world
    WHERE continent = 'South America'
--5
  SELECT name, population
    FROM world
    WHERE name IN ('France', 'Germany', 'Italy')
--6 Show the countries which have a name that includes the word 'United'
--Answer
  SELECT name
    FROM world
    WHERE name LIKE '%United%'
--7
  SELECT name, population, area
    FROM world
    WHERE area > '3000000 sq km'  OR population > 250000000
--8 Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
--Answer
  SELECT name, population, area
    FROM world
    WHERE area > '3000000 sq km' XOR population > 250000000
--9 For South America show population in millions and GDP in billions both to 2 decimal places.
--Answer
  SELECT name, ROUND(population/1000000,2), ROUND(GDP/1000000000,2)
    FROM world
    WHERE continent =  'South America'
--10 Show per-capita GDP for the trillion dollar countries to the nearest $1000.
--Answer
  SELECT name, ROUND(GDP/population, -3)
    FROM world
    WHERE GDP > 1000000000000
--11 Show the name and capital where the name and the capital have the same number of characters.
--Answer
  SELECT name,capital
    FROM world
    WHERE LENGTH(name) = LENGTH(capital)
--12 Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
--Answer
  SELECT name, capital
    FROM world
    WHERE LEFT (name,1) = LEFT (capital,1) AND name <> capital
--13 Find the country that has all the vowels and no spaces in its name.
--Answer
  SELECT name
    FROM world
    WHERE name LIKE '%a%'
    AND name LIKE '%e%'
    AND name LIKE '%i%'
    AND name LIKE '%o%'
    AND name LIKE '%u%'
    AND name NOT LIKE '% %'
