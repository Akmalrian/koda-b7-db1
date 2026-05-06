-- SELECT count(*),genre_id FROM movies
-- GROUP BY genre_id

SELECT  d.first_name, d.last_name, count(m.genre_id) AS total_genres
FROM directors d 
JOIN movies m ON d.id = m.director_id
GROUP BY d.id, d.first_name, d.last_name;

SELECT a.first_name, a.last_name, count(ma.movie_id) AS total_roles
FROM actors a 
JOIN movies_actors ma ON a.id = ma.actor_id
GROUP BY a.id, a.first_name, a.last_name
HAVING count(ma.movie_id) > 5;

SELECT  d.first_name, d.last_name, count(d.id) AS total_movies
FROM directors d 
JOIN movies m ON d.id = m.director_id
GROUP BY d.id, d.first_name, d.last_name
ORDER BY total_movies DESC
LIMIT 1;

SELECT extract(YEAR FROM release_date) AS release_year, count(id) AS total_movies
FROM movies
GROUP BY release_year
ORDER BY total_movies DESC
LIMIT 1;

SELECT m.title, STRING_AGG(a.first_name || ' ' || a.last_name,', ') AS list_actors
FROM movies m
JOIN movies_actors ma ON m.id = ma.movie_id
JOIN actors a ON ma.actor_id = a.id
GROUP BY m.id, m.title;
