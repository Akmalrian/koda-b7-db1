SELECT m.id, m.title, m.release_date, m.rating, d.first_name AS director_first_name, 
d.last_name AS director_last_name, g.name AS genre_name
FROM movies m
JOIN directors d ON m.director_id = d.id
JOIN genres g ON m.genre_id = g.id 
LIMIT 50;

SELECT 
    m.title AS movie_title, 
    a.first_name AS actor_first_name, 
    a.last_name AS actor_last_name, 
    ma.role
FROM movies_actors ma
JOIN movies m ON ma.movie_id = m.id
JOIN actors a ON ma.actor_id = a.id;
