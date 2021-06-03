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

--nested select
-- 1
SELECT name FROM world
  WHERE population >
      (SELECT population FROM world
        WHERE name='Russia');
-- 2
SELECT name FROM world
  WHERE continent = 'Europe' 
    AND gdp/population > 
      (SELECT gdp/population FROM world
        WHERE name = 'United Kingdom')
-- 3
SELECT name, continent FROM world
  WHERE continent IN
    (SELECT DISTINCT continent FROM world
      WHERE name IN ('Argentina', 'Australia'))
        ORDER BY name;
-- 4
SELECT name, population FROM world
  WHERE population > (SELECT population FROM world WHERE name = 'Canada')
    AND population < (SELECT population FROM world WHERE name = 'Poland');
-- 5
SELECT name, CONCAT(ROUND(100*population/(SELECT population FROM world WHERE name = 'Germany'), 0), '%') AS percentage FROM world WHERE continent = 'Europe';
-- 6
SELECT name FROM world
  WHERE gdp > ALL(SELECT gdp FROM world WHERE continent = 'Europe' AND gdp IS NOT NULL)
-- 7
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent = x.continent
          AND area IS NOT NULL);
-- 8
SELECT DISTINCT continent, name FROM world x
  WHERE name <= ALL (SELECT name FROM world y
                      WHERE x.continent = y.continent);
-- 9 
SELECT name, continent, population FROM world
  WHERE continent IN
    (SELECT DISTINCT continent FROM world x
      WHERE 25000000 >=
        ALL(SELECT population FROM world y
          WHERE x.continent = y.continent))
-- 10
SELECT name, continent FROM world x 
  WHERE x.population/3 >=
    ALL(SELECT population FROM world y
      WHERE y.continent = x.continent
        AND x.name != y.name) 

--nested select Quiz
-- 1
SELECT region, name, population FROM bbc x WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0)
-- 2
SELECT name,region,population FROM bbc x WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0)
-- 3
SELECT name, region FROM bbc x
 WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name)
-- 4
-- Table-D
France
Germany
Russia
Turkey
-- 5
SELECT name FROM bbc
 WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa')
-- 6
SELECT name FROM bbc
 WHERE population < (SELECT population FROM bbc WHERE name='Russia')
   AND population > (SELECT population FROM bbc WHERE name='Denmark')
-- 7
--Table-B
Bangladesh
India
Pakistan

--SUM and COUNT
-- 1
SELECT SUM(population)
FROM world
-- 2
SELECT DISTINCT continent FROM world
-- 3
SELECT SUM(gdp) FROM world WHERE continent = 'Africa'
-- 4
SELECT COUNT(name) FROM world WHERE area >= 1000000
-- 5
SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania')
-- 6
SELECT continent, COUNT(name) AS number_of_countries FROM world GROUP BY continent
-- 7
SELECT continent, COUNT(name) FROM world WHERE population >= 10000000 GROUP BY continent
-- 8
SELECT continent FROM world GROUP BY continent HAVING SUM(population) > 100000000
-- SUM and COUNT Quiz
-- 1
SELECT SUM(population) FROM bbc WHERE region = 'Europe'
-- 2
SELECT COUNT(name) FROM bbc WHERE population < 150000
-- 3
AVG(), COUNT(), MAX(), MIN(), SUM()
-- 4
No result due to invalid use of the WHERE function
-- 5
SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')
-- 6
SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region
-- 7
SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)
-- 8
--Table-D
Americas	732240
Middle East	13403102
South America	17740392
South Asia	9437710

--JOIN Operation 
-- 1
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'
-- 2
SELECT id, stadium, team1, team2 FROM game
  WHERE id = 1012
-- 3
SELECT goal.player, goal.teamid, game.stadium, game.mdate FROM game JOIN goal ON goal.teamid = 'GER' AND goal.matchid = game.id
-- 4
SELECT game.team1, game.team2, goal.player FROM game JOIN goal WHERE goal.matchid = game.id AND player LIKE 'Mario%'
-- 5
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON teamid = id AND gtime <= 10
-- 6
SELECT mdate, teamname FROM game JOIN eteam ON team1 = eteam.id AND coach = 'Fernando Santos'
-- 7
SELECT player FROM goal JOIN game ON matchid = id AND stadium = 'National Stadium, Warsaw'
-- 8
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE (teamid <> 'GER' AND (team1 = 'GER' OR team2 = 'GER'))
-- 9
SELECT teamname, COUNT(player) AS goals
  FROM eteam JOIN goal ON id=teamid
  GROUP BY teamname
-- 10
SELECT stadium, COUNT(player) AS goals_scored FROM game JOIN goal ON id = matchid GROUP BY stadium
-- 11
SELECT matchid, mdate AS date, COUNT(teamid) AS goals
  FROM game JOIN goal ON matchid = id WHERE team1 = 'POL' OR team2 = 'POL' GROUP BY matchid, date
-- 12
SELECT matchid, mdate, COUNT(teamid) AS goals
  FROM game JOIN goal ON matchid = id WHERE teamid = 'GER' GROUP BY matchid, mdate
-- 13
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game LEFT JOIN goal ON matchid = id
  GROUP BY mdate, matchid, team1, team2;

--JOIN Quiz
-- 1
game  JOIN goal ON (id=matchid)
-- 2
matchid, teamid, player, gtime, id, teamname, coach
-- 3
SELECT player, teamid, COUNT(*)
  FROM game JOIN goal ON matchid = id
 WHERE (team1 = "GRE" OR team2 = "GRE")
   AND teamid != 'GRE'
 GROUP BY player, teamid
-- 4
DEN	9 June 2012
GER	9 June 2012
-- 5
  SELECT DISTINCT player, teamid 
   FROM game JOIN goal ON matchid = id 
  WHERE stadium = 'National Stadium, Warsaw' 
 AND (team1 = 'POL' OR team2 = 'POL')
   AND teamid != 'POL'
-- 6
SELECT DISTINCT player, teamid, gtime
  FROM game JOIN goal ON matchid = id
 WHERE stadium = 'Stadion Miejski (Wroclaw)'
   AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'))
-- 7
Netherlands	2
Poland	2
Republic of Ireland	1
Ukraine	2

-- MORE JOIN
-- 1
SELECT id, title
 FROM movie
 WHERE yr=1962
-- 2 
SELECT yr FROM movie WHERE title = 'Citizen Kane'
-- 3
SELECT id, title, yr FROM movie WHERE title LIKE '%Star Trek%' ORDER BY yr
-- 4
SELECT id FROM actor WHERE name = 'Glenn Close'
-- 5
SELECT id FROM movie WHERE title = 'Casablanca'
-- 6
SELECT name FROM actor JOIN casting ON id=actorid WHERE movieid=11768
-- 7
SELECT name FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actorid = actor.id WHERE title = 'Alien'
-- 8
SELECT title FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actorid = actor.id WHERE name = 'Harrison Ford'
-- 9
SELECT title FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actorid = actor.id WHERE name = 'Harrison Ford' AND ord > 1
-- 10
SELECT title, name FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actorid = actor.id WHERE yr = 1962 AND ord = 1
-- 11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
-- 12
SELECT title, name FROM
  movie JOIN casting ON movie.id = movieid
        JOIN actor   ON actorid=actor.id
          WHERE movie.id IN (SELECT movieid FROM casting
                              WHERE actorid IN (
                                SELECT id FROM actor
                                WHERE name='Julie Andrews')) 
                AND ord = 1
-- 13
SELECT name FROM casting JOIN actor ON (actorid = actor.id AND ord = 1) GROUP BY name HAVING COUNT(*) >= 15
-- 14
SELECT title, COUNT(actorid) FROM movie JOIN casting ON movieid = movie.id WHERE yr = 1978 GROUP BY title ORDER BY COUNT(actorid) DESC, title
-- 15
SELECT name FROM casting JOIN actor ON actorid = actor.id WHERE name != 'Art Garfunkel' AND movieid IN (SELECT movieid FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actorid = actor.id WHERE name = 'Art Garfunkel')

-- More JOIN Quiz 
-- 1
SELECT name
  FROM actor INNER JOIN movie ON actor.id = director
 WHERE gross < budget
-- 2
SELECT *
  FROM actor JOIN casting ON actor.id = actorid
  JOIN movie ON movie.id = movieid
-- 3
SELECT name, COUNT(movieid)
  FROM casting JOIN actor ON actorid=actor.id
 WHERE name LIKE 'John %'
 GROUP BY name ORDER BY 2 DESC

-- 4
--Table-B
"Crocodile" Dundee
Crocodile Dundee in Los Angeles
Flipper
Lightning Jack

-- 5
SELECT name
  FROM movie JOIN casting ON movie.id = movieid
  JOIN actor ON actor.id = actorid
WHERE ord = 1 AND director = 351
-- 6
- link the director column in movies with the primary key in actor
- connect the primary keys of movie and actor via the casting table
-- 7
-- Table-B
A Bronx Tale	1993
Bang the Drum Slowly	1973
Limitless	2011

-- Nulls
-- 1
SELECT name FROM teacher WHERE dept IS NULL
-- 2
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)
-- 3
SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)
-- 4
SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)
-- 5
SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher
-- 6
SELECT teacher.name, COALESCE(dept.name, 'None') FROM teacher LEFT JOIN dept ON teacher.dept = dept.id
-- 7
SELECT COUNT(name), COUNT(mobile) FROM teacher
-- 8
SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON teacher.dept = dept.id GROUP BY dept.name
-- 9
SELECT name, CASE WHEN dept IN (1, 2) THEN 'Sci' ELSE 'Art' END AS name FROM teacher
-- 10
SELECT name, 
        CASE 
          WHEN dept IN (1, 2) THEN 'Sci'
          WHEN dept = 3 THEN 'Art'
        ELSE 'None'
        END AS name 
          FROM teacher

-- NULL Quiz 6
-- 1
SELECT teacher.name, dept.name FROM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id)
-- 2
SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower'
-- 3
SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name
-- 4
display 0 in result column for all teachers without department
-- 5
'four' for Throd
-- 6
-- Table-A
Shrivell	Computing
Throd	Computing
Splint	Computing
Spiregrain	Other
Cutflower	Other
Deadyawn	Other

