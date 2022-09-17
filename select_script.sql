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

/* Домашнее задание «Select-запросы, выборки из одной таблицы» */
/* 1. название и год выхода альбомов, вышедших в 2018 году */
SELECT album_name, release_year 
FROM album
WHERE release_year >= '2018-01-01' AND release_year < '2019-01-01';

/* 2. название и продолжительность самого длительного трека */
SELECT track_name, length_track  
FROM track 
WHERE length_track IN (SELECT max(length_track) FROM track)
ORDER BY track_name;

/* 3. название треков, продолжительность которых не менее 3,5 минуты */
SELECT track_name 
FROM track
WHERE length_track >= '00:03:30';

/* 4. названия сборников, вышедших в период с 2018 по 2020 год включительно */
SELECT collection_name 
FROM collection
WHERE release_year BETWEEN '2018-01-01' AND '2020-12-31';

/* 5. исполнители, чье имя состоит из 1 слова */
SELECT author_name, nickname 
FROM author
WHERE author_name NOT LIKE '% %';

/* 6. название треков, которые содержат слово "мой"/"my" */
SELECT track_name
FROM track
WHERE track_name ILIKE 'Мой' OR track_name ILIKE 'Мой %' OR track_name ILIKE '% Мой %' OR track_name ILIKE '% Мой' 
OR track_name ILIKE '% Мой!' OR track_name ILIKE '% Мой.' OR track_name ILIKE '% Мой?'
--OR track_name LIKE 'мой' OR track_name LIKE 'мой %' OR track_name LIKE '% мой %' OR track_name LIKE '% мой' 
--OR track_name LIKE '% мой!' OR track_name LIKE '% мой.' OR track_name LIKE '% мой?'
OR track_name ILIKE 'My' OR track_name ILIKE 'My %' OR track_name ILIKE '% My %' OR track_name ILIKE '% My' 
OR track_name ILIKE '% My!' OR track_name ILIKE '% My.' OR track_name ILIKE '% My?'
--OR track_name LIKE 'my' OR track_name LIKE 'my %' OR track_name LIKE '% my %' OR track_name LIKE '% my' 
--OR track_name LIKE '% my!' OR track_name LIKE '% my.' OR track_name LIKE '% my?';

/* есть в тексте сочетание мой/my */
SELECT track_name 
FROM track
WHERE track_name LIKE '%мой%' OR track_name LIKE '%Мой%' OR track_name LIKE '%My%' OR track_name LIKE '%my%'; 


/* Домашнее задание к лекции «Продвинутая выборка данных» */
/* 1. количество исполнителей в каждом жанре */
SELECT style_name, count(*)  
FROM styles s
JOIN styleauthor sa ON s.id = sa.style_id 
GROUP BY style_name
ORDER BY count(*) DESC; 

/* 2. количество треков, вошедших в альбомы 2019-2020 годов (общее количество) */
SELECT count(t.id) 
FROM track t
JOIN album a ON t.album = a.id
WHERE a.release_year >= '2019-01-01' AND a.release_year <= '2020-12-31';
/* количество треков, вошедших в альбомы 2019-2020 годов (для каждого альбома) */
SELECT album_name, count(*) 
FROM album a
JOIN track t ON a.id = t.album
WHERE a.release_year >= '2019-01-01' AND a.release_year <= '2020-12-31'
GROUP BY album_name 
ORDER BY count(*) DESC; 

/* 3. средняя продолжительность треков по каждому альбому */
SELECT a.id, a.album_name, avg(t.length_track) 
FROM track t 
JOIN album a ON t.album = a.id
GROUP BY a.id   -- группирование по id, а не по albumm_name, т.к. есть альбомы с одинаковыми именами
ORDER BY avg(t.length_track) DESC;

/* 4. все исполнители, которые не выпустили альбомы в 2020 году */
SELECT id, author_name 
FROM author
WHERE id NOT IN (
	SELECT a2.id FROM authoralbum a
	JOIN album a3 ON a.album_id = a3.id
	JOIN author a2 ON a.author_id = a2.id
	WHERE a3.release_year BETWEEN '2020-01-01' AND '2020-12-31'
	GROUP BY a2.id
	)
ORDER BY id;
/* которые выпустили альбомы в 2020 году */
SELECT a2.id, author_name 
FROM authoralbum a
JOIN album a3 ON a.album_id = a3.id
JOIN author a2 ON a.author_id = a2.id
WHERE a3.release_year BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY a2.id
ORDER BY id;

/* 5. названия сборников, в которых присутствует конкретный исполнитель (выберите сами) */
SELECT c.id, c.collection_name  -- 3. находим по id треков, те сборники, где эти треки есть
FROM collectiontrack ct
JOIN collection c ON ct.collection_id = c.id 
JOIN track t ON ct.track_id = t.id
WHERE t.id IN (
	SELECT id FROM track t2  -- 2. находим id-треков из этих альбомов
	WHERE t2.album IN (
		SELECT a.id  -- 1. находим id-альбомов, где присутствует автор
		FROM authoralbum am
		JOIN album a ON am.album_id  = a.id  
		JOIN author a2 ON am.author_id = a2.id
		WHERE a2.author_name = 'Name1 Soname1'  -- Name2 Soname2, Рок Рокеров, Name10 Soname10
		)
	)
GROUP BY c.id  -- ? группировка действительно лишняя, т.к. нет агрегатных функций. Лучше DISTINCT.
ORDER BY c.id;
/* !!! второй способ решения. Объединить все нужные таблицы и сделать отбор по where */
SELECT DISTINCT c.id, c.collection_name
FROM collectiontrack ct
JOIN collection c ON ct.collection_id = c.id
JOIN track t ON ct.track_id = t.id
JOIN album a ON t.album = a.id
JOIN authoralbum a2 ON a.id = a2.album_id
JOIN author a3 ON a2.author_id = a3.id
WHERE a3.author_name = 'Name1 Soname1'
ORDER BY c.id;


/* 6. название альбомов, в которых присутствуют исполнители более 1 жанра */
SELECT DISTINCT a.id, a.album_name  -- 2. по найденным id-исполнителям нашёл альбомы.
FROM authoralbum am
JOIN album a ON am.album_id = a.id 
JOIN author a2 ON am.author_id = a2.id
WHERE a2.id IN (
	SELECT s.author_id  -- 1. сначала нашёл id исполнителей, которые исполняют более чем в 1 жанре
	FROM styleauthor s 
	GROUP BY s.author_id
	HAVING count(*) > 1 
	)
--GROUP BY a.id  -- Это лишнее, использовал ошибочно вместо DISTINCT. DISTINCT лучше.
ORDER BY a.id;
/* Второй способ. */
/* Выглядит код легче, чем первый на взгляд. Но мне легче думать и представлять моим способом первым.*/
/*Здесь - объединяем всё что можно, и потом группируем по искомому полю. Затем Having по количеству стилей.*/
SELECT a3.id, a3.album_name 
FROM styles s
JOIN styleauthor s2 ON s.id = s2.style_id
JOIN author a ON s2.author_id = a.id
JOIN authoralbum a2 ON a.id = a2.author_id
JOIN album a3 ON a2.album_id = a3.id
GROUP BY a3.id
HAVING count(DISTINCT s.id) > 1 

/* выводит id автора и кол-во его жанров */
SELECT s.author_id, count(*) c_styles 
FROM styleauthor s 
GROUP BY s.author_id
ORDER BY s.author_id;

/* 7. наименование треков, которые не входят в сборники */
SELECT id, track_name  -- 2. А теперь среди всех треков ищем те, которые не входят в предыдущую выборку. 
FROM track t 
WHERE id NOT IN (
	SELECT DISTINCT track_id			-- 1. Нашли все id треков, которые упоминаются в сборниках 
	FROM collectiontrack c
	--GROUP BY track_id  -- DISTINCT, а не GROUP BY, чтобы не было повторений в выборке
);

/* Второй способ. Тоже хорош.*/
SELECT t.id, t.track_name, c.track_id
FROM track t
LEFT JOIN collectiontrack c ON t.id = c.track_id  -- Все записи track слева, справа collectiontrack и где нет соответствия - NULL справа
WHERE c.track_id IS NULL;

/* 8. исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько) */
SELECT a.id, a.author_name   -- 3. Ну и через связывающую таблицу по id альбомов находим авторов.
FROM authoralbum am
JOIN author a ON am.author_id = a.id
JOIN album a2 ON am.album_id = a2.id
WHERE a2.id IN (
	SELECT t.album   -- 2. Находим все альбомы, где время трека равно минимальному.
	FROM track t
	WHERE  t.length_track = (
		SELECT min(t2.length_track) FROM track t2  -- 1. Находим минимальное время трека.
		) 
	);
/*Второй способ решения задачи 8. Разбор от Олега Булыгина.*/
/*Т.е. связываем все таблицы. И берём только id треков с минимальным временем. Да изящнее.*/
/*Больше JOIN в общем делает всё лаконичнее.*/
SELECT a.id, a.author_name
FROM author a
JOIN authoralbum a2 ON a.id = a2.author_id
JOIN album a3 ON a2.album_id = a3.id
JOIN track t ON a3.id = t.album
WHERE t.length_track = (SELECT min(length_track) FROM track) 


/* дополнительно к 8 заданию. Объединил альбомы с минимальным временем трека в альбоме и исполнителей этих альбомов. */
SELECT a.id, a.author_name, t.album, a2.album_name, min(t.length_track)  
FROM authoralbum am
JOIN author a ON am.author_id = a.id
JOIN track t ON am.album_id = t.album
JOIN album a2 ON t.album = a2.id
GROUP BY t.album, a.id, a2.album_name 
ORDER BY min(t.length_track), a.id; 

/* 9. название альбомов, содержащих наименьшее количество треков */
SELECT a.id, a.album_name 					-- 4. берём id альбома и имя
FROM album a 
WHERE a.id IN ( 
	SELECT album_id 						   -- 3.2 находим все id альбомов с минимумом									
	FROM (
		SELECT t.album album_id, count(*) co   -- 3.1 такая же группировка по альбомам как и в 1.
		FROM track t
		GROUP BY t.album
		) album_count
	WHERE co = (
		SELECT min(co) -- 2. нашли минимум треков в альбоме
		FROM (
			SELECT t.album album_id, count(*) co -- 1. сгруппировали по альбомам
			FROM track t
			GROUP BY t.album
		) album_count
	)
);

/*Второй способ. Используем больше JOIN.*/
SELECT a.id, a.album_name FROM album a   -- 2. Опять также отсортировали по альбомам, только теперь берём уже альбомы с мин кол-вом треокв
JOIN track t ON a.id = t.album
GROUP BY a.id
HAVING count(*) = 
(
SELECT count(*)  FROM album a   -- 1. Вычислили min кол-во треков в альбоме
JOIN track t ON a.id = t.album
GROUP BY a.id
ORDER BY count(*) 
LIMIT 1
)
ORDER BY a.id;

/* Вывод - по возможности чаще вместо вложенных запросов используют JOIN.  https://teletype.in/@pythontalk/subquery_vs_join */



 


