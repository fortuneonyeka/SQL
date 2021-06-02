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

    --SELECT FROM world QUIZ
    --1
    SELECT name
  FROM world
 WHERE name LIKE 'U%'
--2
SELECT population
  FROM world
 WHERE name = 'United Kingdom'
--3
--Select the answer which shows the problem with this SQL code - the intended result should be the continent of France:
--Answer
'name' should be name
--4
--Select the result that would be obtained from the following code:
SELECT name, population / 10 
  FROM world 
 WHERE population < 10000
--Answer
Nauru	990
--5
SELECT name
  FROM world 
 WHERE continent IN ('Europe', 'Asia')
 --6
 SELECT name FROM world
 WHERE name IN ('Cuba', 'Togo')
 --7
 -- Select the result that would be obtained from this code:
 --Answer

Brazil
Colombia

--SELECT FROM nobel
--1
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950
 --2
 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'
--3
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'
--4
SELECT winner
FROM nobel
WHERE subject = 'Peace' AND yr >= 2000
--5
SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989
--6
SELECT * FROM nobel
 WHERE winner IN('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')
--7
SELECT winner
FROM nobel
WHERE winner LIKE 'John%'
--8
SELECT *
FROM nobel
WHERE yr = 1980 AND subject = 'Physics' OR yr = 1984 AND subject = 'Chemistry' 
--9
SELECT *
FROM nobel
WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine')
--10
SELECT *
FROM nobel
WHERE subject = 'Medicine' AND yr < 1910 OR subject = 'Literature' AND yr >= 2004
--11
SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG'
--12
--Find all details of the prize won by EUGENE O'NEILL

--Escaping single quotes
--Answer
SELECT *
FROM nobel
WHERE winner = 'EUGENE O''NEILL'
--13
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner
--14
SELECT winner, subject, subject IN ('Physics','Chemistry')
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('Physics','Chemistry'),subject,winner

--nobel Quiz
--1 Pick the code which shows the name of winner's names beginning with C and ending in n
--Answer
SELECT winner FROM nobel
 WHERE winner LIKE 'C%' AND winner LIKE '%n'
--2 Select the code that shows how many Chemistry awards were given between 1950 and 1960
--Answer
SELECT COUNT(subject) FROM nobel
 WHERE subject = 'Chemistry'
   AND yr BETWEEN 1950 and 1960
--3 Pick the code that shows the amount of years where no Medicine awards were given
--Answer
SELECT COUNT(DISTINCT yr) FROM nobel
 WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')
--4 
SELECT subject, winner FROM nobel WHERE winner LIKE 'Sir%' AND yr LIKE '196%'
--Answer

Medicine	Sir John Eccles
Medicine	Sir Frank Macfarlane Burnet
--5 Select the code which would show the year when neither a Physics or Chemistry award was given
--Answer
SELECT yr FROM nobel
 WHERE yr NOT IN(SELECT yr 
                   FROM nobel
                 WHERE subject IN ('Chemistry','Physics'))
--6 Select the code which shows the years when a Medicine award was given but no Peace or Literature award was
--Answer
SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')
--7
 SELECT subject, COUNT(subject) 
   FROM nobel 
  WHERE yr ='1960' 
  GROUP BY subject
--Answer
Chemistry	1
Literature	1
Medicine	2
Peace	1
Physics	1

