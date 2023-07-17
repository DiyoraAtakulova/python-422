-- Создание таблицы
-- CREATE TABLE celebs (
-- 	id INTEGER,
-- 	name TEXT,
-- 	age INTEGER
-- );

-- 
-- INSERT INTO celebs(id, name, age)
-- VALUES (1, 'Justin Bieber', 22);
-- 
-- INSERT INTO celebs(id, name, age)
-- VALUES (2, 'John Wick', 50);

-- INSERT INTO celebs(id, name)
-- VALUES (3, 'hehehe');

-- добавляет столбец с размером
-- ALTER TABLE celebs
-- ADD COLUMN twitter_handle varchar(50);

-- UPDATE celebs
-- SET twitter_handle = '@taylorswift3'
-- WHERE id = 2;

-- SELECT * FROM celebs;

-- удаляет где значение ноль
-- DELETE FROM celebs
-- WHERE age IS NULL;



-- CREATE TABLE celebs (
-- 	id INTEGER PRIMARY KEY,
-- 	name TEXT UNIQUE,
-- 	date_of_birth TEXT NOT NULL,
-- 	date_of_death TEXT DEFAULT 'Not Applicable'
-- );

-- INSERT INTO celebs(id, name, date_of_birth)
-- VALUES (1, 'Justin Bieber', '2022-12-12');

-- INSERT INTO celebs(id, name, date_of_birth)
-- VALUES (2, 'Justin', '2022-12-12');

-- SELECT * FROM celebs;







-- CREATE TABLE friends(
-- 	id INTEGER PRIMARY KEY,
-- 	name TEXT UNIQUE,
-- 	birthday date TEXT NOT NULL
-- );

-- INSERT INTO friends(id, name, birthday)
-- VALUES (1,'James Monro', '5/30/1940');

-- SELECT * FROM friends;

-- 
-- INSERT INTO friends(id, name, birthday)
-- VALUES (2,'Lily', '6/20/1950');
-- 
-- INSERT INTO friends(id, name, birthday)
-- VALUES (3,'Pop', '7/10/1910');

-- ALTER TABLE friends
-- DROP COLUMN email;

-- ALTER TABLE friends
-- ADD COLUMN email varchar(50);

-- UPDATE friends
-- SET name = 'Flash'
-- WHERE id = 1;

-- DELETE FROM friends
-- WHERE id == 1;

SELECT * FROM friends;
