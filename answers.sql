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
