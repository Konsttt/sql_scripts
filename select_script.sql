SELECT * FROM styles;

SELECT * FROM author
ORDER BY id;

SELECT * FROM styleauthor;

SELECT * FROM album
ORDER BY id;

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

-- Домашнее задание к лекции «Продвинутая выборка данных»
-- 1. количество исполнителей в каждом жанре
SELECT style_name, count(*)  FROM styles s
JOIN styleauthor sa ON s.id = sa.style_id 
GROUP BY style_name
ORDER BY count(*) DESC; 

-- 2. количество треков, вошедших в альбомы 2019-2020 годов (общее количество)
SELECT count(t.id) FROM track t
JOIN album a  ON t.album = a.id
WHERE a.release_year >= '2019-01-01' AND a.release_year <= '2020-12-31';
-- количество треков, вошедших в альбомы 2019-2020 годов (для каждого альбома)
SELECT album_name, count(*) FROM album a
JOIN track t ON a.id = t.album
WHERE a.release_year >= '2019-01-01' AND a.release_year <= '2020-12-31'
GROUP BY album_name 
ORDER BY count(*) DESC; 

-- 3. средняя продолжительность треков по каждому альбому
SELECT a.id, a.album_name, avg(t.length_track) FROM track t 
JOIN album a ON t.album = a.id
GROUP BY a.id   -- группирование по id, а не по albumm_name, т.к. есть альбомы с одинаковыми именами
ORDER BY avg(t.length_track) DESC;

-- 4. все исполнители, которые не выпустили альбомы в 2020 году
SELECT id, author_name FROM author
WHERE id NOT IN (
SELECT a2.id FROM authoralbum a
JOIN album a3 ON a.album_id = a3.id
JOIN author a2 ON a.author_id = a2.id
WHERE a3.release_year BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY a2.id)
ORDER BY id;
-- которые выпустили альбомы в 2020 году
SELECT a2.id, author_name FROM authoralbum a
JOIN album a3 ON a.album_id = a3.id
JOIN author a2 ON a.author_id = a2.id
WHERE a3.release_year BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY a2.id
ORDER BY id;

-- 5. названия сборников, в которых присутствует конкретный исполнитель (выберите сами)
SELECT c.id, c.collection_name  FROM collectiontrack ct
JOIN collection c ON ct.collection_id = c.id 
JOIN track t ON ct.track_id = t.id
WHERE t.id IN 
(
SELECT id FROM track t2
WHERE t2.album IN 
(
SELECT a.id FROM authoralbum am
JOIN album a ON am.album_id  = a.id  
JOIN author a2 ON am.author_id = a2.id
WHERE a2.author_name = 'Name1 Soname1'  -- Name2 Soname2, Рок Рокеров, Name10 Soname10
)
)
GROUP BY c.id
ORDER BY c.id;

-- 6. название альбомов, в которых присутствуют исполнители более 1 жанра
SELECT a.id, a.album_name FROM authoralbum am
JOIN album a ON am.album_id = a.id 
JOIN author a2 ON am.author_id = a2.id
WHERE a2.id IN 
(
SELECT s.author_id FROM styleauthor s 
GROUP BY s.author_id
HAVING count(*) > 1 
)
GROUP BY a.id
ORDER BY a.id;

-- выводит id автора и кол-во его жанров
SELECT s.author_id, count(*) c_styles FROM styleauthor s 
GROUP BY s.author_id
ORDER BY s.author_id;

-- 7. наименование треков, которые не входят в сборники
SELECT id, track_name FROM track t 
WHERE id NOT IN 
(
SELECT track_id FROM collectiontrack c
GROUP BY track_id
);

-- 8. исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько)
SELECT a.id, a.author_name FROM authoralbum am
JOIN author a ON am.author_id = a.id
JOIN album a2 ON am.album_id = a2.id
WHERE a2.id IN
(
SELECT t.album FROM track t
WHERE  t.length_track = 
(
SELECT min(t2.length_track) FROM track t2
) 
);

-- дополнительно к 8 заданию. Объединил альбомы с минимальным временем трека в альбоме и исполнителей этих альбомов.
SELECT a.id, a.author_name, t.album, a2.album_name, min(t.length_track)  FROM authoralbum am
JOIN author a ON am.author_id = a.id
JOIN track t ON am.album_id = t.album
JOIN album a2 ON t.album = a2.id
GROUP BY t.album, a.id, a2.album_name 
ORDER BY min(t.length_track), a.id; 

-- 9. название альбомов, содержащих наименьшее количество треков
SELECT a.id, a.album_name FROM album a 
WHERE a.id IN ( SELECT album_id FROM
(
SELECT t.album album_id, count(*) co FROM track t
GROUP BY t.album
) album_count
WHERE co = 
(
SELECT min(co) FROM
(
SELECT t.album album_id, count(*) co FROM track t
GROUP BY t.album
) album_count
)
);
 


