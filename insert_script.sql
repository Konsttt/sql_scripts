ALTER SEQUENCE styles_id_seq RESTART WITH 1;  -- чтобы начать id с 1

DELETE FROM styles; 

INSERT INTO styles(style_name)
VALUES('rock');

INSERT INTO styles(style_name)
VALUES('pank rock');

INSERT INTO styles(style_name)
VALUES('folk');

INSERT INTO styles(style_name)
VALUES('rap');

INSERT INTO styles(style_name)
VALUES('heavy metal');

INSERT INTO styles(style_name)
VALUES('pop');

INSERT INTO styles(style_name)
VALUES('classical');

INSERT INTO author(author_name, nickname)
VALUES('Name1 Soname1', 'Rocker1');

INSERT INTO author(author_name, nickname)
VALUES('Name2 Soname2', 'Rocker2');


INSERT INTO author(author_name, nickname)
VALUES('Name3 Soname3', 'Rocker3');

INSERT INTO author(author_name, nickname)
VALUES('Name4 Soname4', 'Punk1');

INSERT INTO author(author_name, nickname)
VALUES('Name5 Soname5', 'Punk2');

INSERT INTO author(author_name, nickname)
VALUES('Name6 Soname6', 'Folker1');

INSERT INTO author(author_name, nickname)
VALUES('Name7 Soname7', 'Folker2');

INSERT INTO author(author_name, nickname)
VALUES('Name8 Soname8', 'Folker3');

INSERT INTO author(author_name, nickname)
VALUES('Name9 Soname9', 'Raper1');

INSERT INTO author(author_name, nickname)
VALUES('Name10 Soname10', 'Raper2');

INSERT INTO author(author_name, nickname)
VALUES('Name11 Soname11', 'Metallist1');

INSERT INTO author(author_name, nickname)
VALUES('Name12 Soname12', 'Metallist2');

INSERT INTO author(author_name, nickname)
VALUES('Name13 Soname13', 'Popular1');

INSERT INTO author(author_name, nickname)
VALUES('Name14 Soname14', 'Popular2');

INSERT INTO author(author_name, nickname)
VALUES('Name15 Soname15', 'Classic1');

INSERT INTO author(author_name, nickname)
VALUES('Name16 Soname16', 'Classic2');

UPDATE author
SET author_name = 'Name3'
WHERE id = 3;

UPDATE author
SET author_name = 'Name15'
WHERE id = 15;

INSERT INTO styleauthor
VALUES(1, 1);

INSERT INTO styleauthor
VALUES(1, 2);

INSERT INTO styleauthor
VALUES(1, 3);

INSERT INTO styleauthor
VALUES(2, 4);

INSERT INTO styleauthor
VALUES(2, 5);

INSERT INTO styleauthor
VALUES(3, 6);

INSERT INTO styleauthor
VALUES(3, 7);

INSERT INTO styleauthor
VALUES(3, 8);

INSERT INTO styleauthor
VALUES(4, 9);

INSERT INTO styleauthor
VALUES(4, 10);

INSERT INTO styleauthor
VALUES(5, 11);

INSERT INTO styleauthor
VALUES(5, 12);

INSERT INTO styleauthor
VALUES(6, 13);

INSERT INTO styleauthor
VALUES(6, 14);

INSERT INTO styleauthor
VALUES(7, 15);

INSERT INTO styleauthor
VALUES(7, 16);

INSERT INTO album
VALUES(1, 'Super_Rock', current_date);

INSERT INTO album
VALUES(2, 'Super_Rock_Rock', '2000-01-01');

INSERT INTO album
VALUES(3, 'New_Rock', '1999-12-12');

INSERT INTO album
VALUES(4, 'My Rock', '2010-10-10');

INSERT INTO album
VALUES(5, 'New_Rock', '1999-12-12');

INSERT INTO album
VALUES(6, 'Punks not dead', '2021-12-21');

INSERT INTO album
VALUES(7, 'Панки, хой!', '1999-12-12');

INSERT INTO album
VALUES(8, 'Collective farm punk', '1995-05-12');

INSERT INTO album
VALUES(9, 'Punk and rock', '2010-11-18');

INSERT INTO album
VALUES(10, 'My folk', '2018-11-11');

INSERT INTO album
VALUES(11, 'Folk, folk, folk', '2009-09-09');

INSERT INTO album
VALUES(12, 'Супер фолк', '2020-01-02');

INSERT INTO album
VALUES(13, 'Реп', '2015-10-15');

INSERT INTO album
VALUES(14, 'Rap', '2015-10-15');

INSERT INTO album
VALUES(15, 'Суровый рэп', '2005-10-15');

INSERT INTO album
VALUES(16, 'Metall metallica', '2017-10-15');

INSERT INTO album
VALUES(17, 'My metall', '2018-10-15');

INSERT INTO album
VALUES(18, 'My music is very popular', '2019-10-25');

INSERT INTO album
VALUES(19, 'Popular of the popular', '2019-07-25');

INSERT INTO album
VALUES(20, 'My popular music', '2021-10-25');

INSERT INTO album
VALUES(21, 'Classic album', '1900-01-01');

INSERT INTO album
VALUES(22, 'Classic album 2', '2019-01-01');

INSERT INTO authoralbum 
VALUES(1, 1);

INSERT INTO authoralbum 
VALUES(1, 2);

INSERT INTO authoralbum 
VALUES(2, 3);

INSERT INTO authoralbum 
VALUES(3, 4);

INSERT INTO authoralbum 
VALUES(3, 5);

INSERT INTO authoralbum 
VALUES(4, 6);

INSERT INTO authoralbum 
VALUES(5, 6);

INSERT INTO authoralbum 
VALUES(5, 8);

INSERT INTO authoralbum
VALUES(5, 9);

INSERT INTO authoralbum 
VALUES(6, 10);

INSERT INTO authoralbum 
VALUES(7, 11);

INSERT INTO authoralbum 
VALUES(8, 12);


INSERT INTO authoralbum 
VALUES(9, 13);

INSERT INTO authoralbum 
VALUES(10, 14);

INSERT INTO authoralbum 
VALUES(9, 15);

INSERT INTO authoralbum 
VALUES(10, 15);

INSERT INTO authoralbum 
VALUES(11, 16);

INSERT INTO authoralbum 
VALUES(12, 17);

INSERT INTO authoralbum 
VALUES(13, 19);

INSERT INTO authoralbum 
VALUES(14, 20);

INSERT INTO authoralbum 
VALUES(15, 21);

INSERT INTO authoralbum 
VALUES(16, 22);

INSERT INTO track
VALUES(1, 'track1_rock.mp3', 1, '00:03:30', '2022-08-09');

INSERT INTO track
VALUES(2, 'track2_rock.mp3', 1, '00:02:30', '2022-08-09');

INSERT INTO track
VALUES(3, 'track3_rock.mp3', 1, '00:04:30', '2022-08-09');

INSERT INTO track
VALUES(4, 'track1_rock2.mp3', 2, '00:03:30', '2000-01-01');

INSERT INTO track
VALUES(5, 'track2_rock2.mp3', 2, '00:03:20', '1999-12-10');

INSERT INTO track
VALUES(6, 'track3_rock2.mp3', 2, '00:03:20', '1999-12-10');

INSERT INTO track
VALUES(7, 'track1_rock3.mp3', 3, '00:03:20', '1999-12-12');

INSERT INTO track
VALUES(8, 'track2_rock3.mp3', 3, '00:03:20', '1999-12-10');

INSERT INTO track
VALUES(9, 'track_rock4.mp3', 4, '00:03:20', '2010-10-10');

INSERT INTO track
VALUES(10, 'track2_rock4.mp3', 4, '00:03:20', '2010-09-10');

INSERT INTO track
VALUES(11, 'punk1.mp3', 5, '00:03:20', '2021-12-21');

INSERT INTO track
VALUES(12, 'punk2.mp3', 5, '00:03:20', '2010-09-10');

INSERT INTO track
VALUES(13, 'punk1.mp3', 6, '00:03:20', '1995-05-12');

INSERT INTO track
VALUES(14, 'punk2.mp3', 6, '00:03:10', '2010-09-10');

INSERT INTO track
VALUES(15, 'punk1.mp3', 8, '00:03:20', '1995-05-12');

INSERT INTO track
VALUES(16, 'punk2.mp3', 9, '00:03:10', '2010-09-10');

INSERT INTO track
VALUES(17, 'punk1.mp3', 9, '00:03:20', '2010-11-18');

INSERT INTO track
VALUES(18, 'punk2.mp3', 9, '00:03:10', '2010-10-10');

INSERT INTO track
VALUES(19, 'folk1-1.mp3', 10, '00:03:10', '2018-11-11');

INSERT INTO track
VALUES(20, 'folk2-1.mp3', 10, '00:03:20', '2018-11-11');

INSERT INTO track
VALUES(21, 'folk1-2.mp3', 11, '00:03:20', '2009-09-09');

INSERT INTO track
VALUES(22, 'folk2-2.mp3', 11, '00:03:20', '2009-09-09');

INSERT INTO track
VALUES(23, 'folk1-3.mp3', 12, '00:03:30', '2020-01-02');

INSERT INTO track
VALUES(24, 'folk2-3.mp3', 12, '00:03:25', '2020-01-02');

INSERT INTO track
VALUES(25, 'rap.mp3', 13, '00:03:20', '2015-10-15');

INSERT INTO track
VALUES(26, 'rap2.mp3', 13, '00:03:30', '2015-10-15');

INSERT INTO track
VALUES(27, 'rap.mp3', 14, '00:03:20', '2015-10-15');

INSERT INTO track
VALUES(28, 'rap2.mp3', 15, '00:03:30', '2015-10-15');

INSERT INTO track
VALUES(29, 'рэп.mp3', 15, '00:03:20', '2015-10-15');

INSERT INTO track
VALUES(30, 'rap2.mp3', 15, '00:03:30', '2015-10-15');

INSERT INTO track
VALUES(31, 'metall.mp3', 16, '00:03:20', '2017-10-15');

INSERT INTO track
VALUES(32, 'metall2.mp3', 16, '00:03:30', '2017-10-15');

INSERT INTO track
VALUES(33, 'металл.mp3', 17, '00:03:20', '2018-10-15');

INSERT INTO track
VALUES(34, 'металл2.mp3', 17, '00:03:30', '2018-10-15');

INSERT INTO track
VALUES(35, 'track_pop1.mp3', 19, '00:03:20', '2019-06-15');

INSERT INTO track
VALUES(36, 'track _pop2.mp3', 19, '00:03:30', '2019-05-15');

INSERT INTO track
VALUES(37, 'хит.mp3', 20, '00:03:20', '2021-10-10');

INSERT INTO track
VALUES(38, 'хит2.mp3', 20, '00:03:30', '2021-10-10');

INSERT INTO track
VALUES(39, 'classic.mp3', 21, '00:03:20', '1900-01-01');

INSERT INTO track
VALUES(41, 'классика.mp3', 22, '00:03:20', '2019-01-01');

INSERT INTO track
VALUES(42, 'классик2.mp3', 22, '00:03:30', '2019-01-01');

INSERT INTO track
VALUES(43, 'классик3.mp3', 22, '00:10:30', '2019-01-01');

INSERT INTO track
VALUES(44, 'folk77.mp3', 10, '00:10:30', '2022-01-01');

UPDATE track
SET track_name = 'Мой рок-н-ролл'
WHERE id = 10;

UPDATE track
SET track_name = 'My cool rap'
WHERE id = 27;

UPDATE track
SET track_name = 'Or my punk'
WHERE id = 15;

UPDATE track
SET track_name = 'Мойдодыр'
WHERE id = 14;

UPDATE track
SET track_name = 'It''s my!'
WHERE id = 13;

UPDATE track
SET track_name = 'Помой-ка!'
WHERE id = 16;

UPDATE track
SET track_name = 'мой'
WHERE id = 17;

INSERT INTO collection
values(1, 'Рок коллекция', '2022-01-01')

INSERT INTO collection
values(2, 'Панк коллекция', '2022-01-01')

INSERT INTO collection
values(3, 'Панк рок коллекция', '2022-01-01')

INSERT INTO collection 
values(4, 'All hits', '2022-01-01')

INSERT INTO collection
values(5, 'Best folks', '2020-10-10')

INSERT INTO collection
values(7, 'Best rap collection', '2019-10-10')

INSERT INTO collection
values(8, 'Best classic', '2010-10-10')

INSERT INTO collectiontrack 
values(1, 1)

INSERT INTO collectiontrack 
values(2, 1)

INSERT INTO collectiontrack 
values(5, 1)

INSERT INTO collectiontrack 
values(11, 2)

INSERT INTO collectiontrack 
values(12, 2)

INSERT INTO collectiontrack 
values(17, 2)

INSERT INTO collectiontrack 
values(1, 3)

INSERT INTO collectiontrack 
values(7, 3)

INSERT INTO collectiontrack 
values(18, 3)

INSERT INTO collectiontrack 
values(10, 4)

INSERT INTO collectiontrack 
values(20, 4)

INSERT INTO collectiontrack 
values(30, 4)

INSERT INTO collectiontrack 
values(40, 4)

INSERT INTO collectiontrack
values(20, 5)

INSERT INTO collectiontrack
values(22, 5)

INSERT INTO collectiontrack
values(24, 5)

INSERT INTO collectiontrack
values(31, 6)

INSERT INTO collectiontrack
values(33, 6)

INSERT INTO collectiontrack
values(25, 7)

INSERT INTO collectiontrack
values(29, 7)

INSERT INTO collectiontrack
values(39, 8)

INSERT INTO collectiontrack
values(42, 8)