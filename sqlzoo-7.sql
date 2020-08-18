-- SQL Zoo Exercise Set #7 More Joins
-- 1.
SELECT id, title
 FROM movie
 WHERE yr=1962

-- 2. 
SELECT yr
  FROM movie
  WHERE title = 'Citizen Kane'

-- 3.
SELECT id, title, yr
  FROM movie
  WHERE title LIKE '%Star Trek%'
  ORDER BY yr

-- 4.
SELECT id
  FROM actor
  WHERE name = 'Glenn Close'

-- 5.
SELECT id
  FROM movie
  WHERE title = 'Casablanca'

-- 6.
SELECT name
  FROM casting JOIN actor on id=actorid
  WHERE movieid=11768

-- 7.
SELECT name
  FROM casting JOIN actor ON actor.id=casting.actorid JOIN movie ON movie.id=casting.movieid
  WHERE title='Alien'

-- 8.
SELECT title
  FROM casting JOIN actor ON actor.id=casting.actorid JOIN movie ON movie.id=casting.movieid
  WHERE name='Harrison Ford'

-- 9.
SELECT title
  FROM casting JOIN actor ON actor.id=casting.actorid JOIN movie ON movie.id=casting.movieid
  WHERE name='Harrison Ford' AND ord != 1

-- 10.
SELECT title, name
 FROM casting JOIN actor ON actor.id=casting.actorid JOIN movie ON movie.id=casting.movieid
 WHERE yr=1962 AND ord=1

-- 11.
SELECT yr, COUNT(*) AS total_movies
  FROM casting JOIN actor ON actor.id=casting.actorid JOIN movie ON movie.id=casting.movieid
  WHERE name='Rock Hudson' 
  GROUP BY yr
  HAVING total_movies > 2

-- 12.
SELECT title, name
FROM movie JOIN casting ON (movieid=movie.id AND ord=1)
           JOIN actor ON (casting.actorid=actor.id)
WHERE movie.id IN (
   SELECT movieid FROM casting
     WHERE actorid IN (
       SELECT id FROM actor
         WHERE name='Julie Andrews'))


-- 13.
SELECT name
FROM casting JOIN actor ON actor.id=casting.actorid
WHERE ord = 1
GROUP BY name
HAVING SUM(ord) >= 15
ORDER BY name 

-- 14.
SELECT title, COUNT(*) AS total_actors
 FROM casting JOIN actor ON actor.id=casting.actorid JOIN movie ON movie.id=casting.movieid
 WHERE yr=1978
GROUP BY title 
ORDER BY total_actors DESC, title

-- 15.
SELECT name
FROM movie JOIN casting ON (movieid=movie.id)
           JOIN actor ON (casting.actorid=actor.id)
WHERE movie.id IN (
   SELECT movieid FROM casting
     WHERE actorid IN (
       SELECT id FROM actor
         WHERE name='Art Garfunkel')) AND name != 'Art Garfunkel'