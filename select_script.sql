SELECT * FROM styles;

SELECT * FROM author;

SELECT * FROM styleauthor;

SELECT * FROM album;

SELECT * FROM authoralbum;

SELECT * FROM track
ORDER BY id;

SELECT * FROM collection;

-- 1. название и год выхода альбомов, вышедших в 2018 году
SELECT album_name, release_year FROM album
WHERE release_year >= '2018-01-01' AND release_year < '2019-01-01';

-- 2. название и продолжительность самого длительного трека
SELECT track_name, length_track  FROM track WHERE length_track IN (SELECT max(length_track) FROM track)
ORDER BY track_name;

-- 3. название треков, продолжительность которых не менее 3,5 минуты
SELECT track_name FROM track
WHERE length_track >= '00:03:30';

-- 4. названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT collection_name FROM collection
WHERE release_year >= '2018-01-01' AND release_year <= '2020-12-31';

-- 5. исполнители, чье имя состоит из 1 слова
SELECT author_name, nickname FROM author
WHERE author_name NOT LIKE '% %';

-- 6. название треков, которые содержат слово "мой"/"my"
SELECT track_name FROM track
WHERE track_name LIKE 'Мой' OR track_name LIKE 'Мой %' OR track_name LIKE '% Мой %' OR track_name LIKE '% Мой' OR track_name LIKE '% Мой!' OR track_name LIKE '% Мой.' OR track_name LIKE '% Мой?'
OR track_name LIKE 'мой' OR track_name LIKE 'мой %' OR track_name LIKE '% мой %' OR track_name LIKE '% мой' OR track_name LIKE '% мой!' OR track_name LIKE '% мой.' OR track_name LIKE '% мой?'
OR track_name LIKE 'My' OR track_name LIKE 'My %' OR track_name LIKE '% My %' OR track_name LIKE '% My' OR track_name LIKE '% My!' OR track_name LIKE '% My.' OR track_name LIKE '% My?'
OR track_name LIKE 'my' OR track_name LIKE 'my %' OR track_name LIKE '% my %' OR track_name LIKE '% my' OR track_name LIKE '% my!' OR track_name LIKE '% my.' OR track_name LIKE '% my?';

-- есть в тексте сочетание мой/my
SELECT track_name FROM track
WHERE track_name LIKE '%мой%' OR track_name LIKE '%Мой%' OR track_name LIKE '%My%' OR track_name LIKE '%my%'; 

