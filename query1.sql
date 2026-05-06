CREATE TABLE directors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100)
);

CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE actors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100)
);

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  release_date TIMESTAMP,
  rating INT,
  director_id INT,
  genre_id INT,
  CONSTRAINT fk_director FOREIGN KEY (director_id) REFERENCES directors (id),
  CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres (id)
);

CREATE TABLE movies_actors (
  movie_id INT,
  actor_id INT,
  role VARCHAR(100),
  CONSTRAINT fk_movie FOREIGN KEY (movie_id) REFERENCES movies (id),
  CONSTRAINT fk_actor FOREIGN KEY (actor_id) REFERENCES actors (id)
);

INSERT INTO directors (first_name, last_name) VALUES 
('Ryan', 'Coogler'), ('Jake', 'Schreier'), ('Bong', 'Joon-ho'), 
('Takashi', 'Yamazaki'), ('Bong', 'Joon-ho'), ('Christopher', 'Nolan'), 
('Denis', 'Villeneuve'), ('Elizabeth', 'Banks'), ('Jon', 'Watts'), ('Guillermo', 'del Toro');

INSERT INTO genres (name) VALUES 
('Horror'), ('Action'), ('Sci-Fi'), ('Drama'), ('Thriller'), 
('Biography'), ('Adventure'), ('Comedy'), ('Fantasy'), ('Mystery');

INSERT INTO movies (title, release_date, rating, director_id, genre_id) VALUES 
('Sinners','2025-12-21',9,1,1),
('Thunderbolts','2025-10-11',8,2,2),
('Mickey 17','2008-07-02',6,3,3),
('Godzilla Minus One','2023-12-21',5,4,4),
('Parasite','2019-05-23',7,5,5),
('Oppenheimer','2011-03-12',10,6,6),
('Dune: Part Two','2025-11-20',8,7,7),
('The Ballad of Wallis Island','2005-10-02',6,8,8),
('Spider-Man: No Way Home','2020-12-21',8,9,9),
('Frankenstein','2008-11-30',4,10,10);

INSERT INTO actors (first_name, last_name) VALUES 
('Michaels','Jordan'),
('Florence','Pugh'),
('Robert','Pattinson'),
('Ryunosuke','Kamiki'),
('Song','Kang-ho'),
('Cillian','Murphy'),
('Timothée','Chalamet'),
('Carey','Mulligan'),
('Tom','Holland'),
('Jacob','Elcordi');

INSERT INTO movies_actors (movie_id, actor_id, role) VALUES 
(1, 1, 'Protagonist'), (2, 2, 'Yelena Belova'), (3, 3, 'Mickey Barnes'),
(4, 4, 'Koichi Shikishima'), (5, 5, 'Kim Ki-taek'), (6, 6, 'J. Robert Oppenheimer'),
(7, 7, 'Paul Atreides'), (8, 8, 'Lead Actress'), (9, 9, 'Peter Parker'),
(10, 10, 'The Monster');

SELECT id, title, release_date, rating, director_id, genre_id
FROM movies
WHERE extract(YEAR FROM release_date) = 2020;

SELECT id, first_name, last_name
FROM actors
WHERE lower(first_name) LIKE '%s';

SELECT id, title, rating, release_date
FROM movies
WHERE extract(YEAR FROM release_date) >= 2004 AND EXTRACT(YEAR FROM release_date) <= 2010 AND rating >=4 AND rating <=8;