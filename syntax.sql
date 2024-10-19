-- SQLite3 syntax
-- basic
.databases

CREATE TABLE classmates (
    id INTEGER PRIMARY KEY,
    name TEXT
);

.tables

.schema classmates

DROP TABLE classmates;

.tables

-- CRUD
CREATE TABLE classmates (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INT,
    address TEXT NOT NULL
);

.headers on
.mode column

-- CREATE
INSERT INTO classmates (id, name, age, address)
VALUES (1, 'change', 28, 'Gwangju');

INSERT INTO classmates (id, name, address)
VALUES (2, 'change', 'Gwangju');

INSERT INTO classmates VALUES (3, 'change', 30, 'Seoul');

INSERT INTO classmates
VALUES
(4, 'change', 30, 'Seoul'),
(5, 'change', 23, 'Daejeon'),
(6, 'change', 23, 'Gwangju'),
(7, 'change', 33, 'Gumi');

-- READ
SELECT * FROM classmates;

SELECT rowid, name FROM classmates;
SELECT rowid, name FROM classmates LIMIT 1;
SELECT rowid, name FROM classmates LIMIT 1 OFFSET 2;
SELECT rowid, name FROM classmates WHERE address='Seoul';

SELECT DISTINCT age FROM classmates;

-- UPDATE
UPDATE classmates
SET name='change', address='Jeju'
WHERE rowid=4;

SELECT rowid, * FROM classmates;

-- DELETE
DELETE FROM classmates WHERE rowid=4;

SELECT rowid, * FROM classmates;

DROP TABLE classmates;

-- function
.mode csv
.import database.csv users

.headers on
.mode column

.tables

SELECT * FROM users;

SELECT * FROM users WHERE age >= 30;
SELECT first_name FROM users WHERE age >= 30;
SELECT last_name, age FROM users WHERE age >= 30 AND last_name = '김';

-- count
SELECT COUNT(*) FROM users;
SELECT COUNT(*) FROM users WHERE age >= 30 AND last_name = '김';

-- check pattern
SELECT COUNT(*) FROM users WHERE age LIKE '2_';
SELECT COUNT(*) FROM users WHERE phone LIKE '02-%';
SELECT COUNT(*) FROM users WHERE first_name LIKE '%준';
SELECT COUNT(*) FROM users WHERE phone LIKE '%-5114-%';

--  math
SELECT AVG(age) FROM users WHERE age >= 30;
SELECT AVG(balance) FROM users WHERE age >= 30;
SELECT first_name, MAX(balance) FROM users;

-- sort
SELECT * FROM users ORDER BY age ASC LIMIT 10;
SELECT * FROM users ORDER BY age DESC LIMIT 10;
SELECT * FROM users ORDER BY age, last_name LIMIT 10;
SELECT last_name, first_name FROM users ORDER BY balance DESC LIMIT 10;

DROP TABLE users;

-- alter
CREATE TABLE articles (
    title TEXT NOT NULL,
    content TEXT NOT NULL
);

.headers on
.mode column

INSERT INTO articles VALUES ('hi', 'bye');

SELECT * FROM articles;

ALTER TABLE articles RENAME to news;
ALTER TABLE news ADD COLUMN subtitle TEXT NOT NULL DEFAULT 1;

SELECT * FROM news;

DROP TABLE news;
