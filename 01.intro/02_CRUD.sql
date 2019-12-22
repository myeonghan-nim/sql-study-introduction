-- CRUD
CREATE TABLE classmates (
    name TEXT,
    age INT,
    address TEXT
);

.headers on
.mode column


-- CREATE values
INSERT INTO classmates (name, age, address)
VALUES ('change', 28, 'Gwangju');

-- READ values
SELECT * FROM classmates;


-- CREATE without some values
INSERT INTO classmates (name, address)
VALUES ('change', 'Gwangju');

SELECT * FROM classmates;


-- CREATE without table fields
INSERT INTO classmates VALUES ('gildonghong', 30, 'Seoul');

-- READ partial column
SELECT rowid, * FROM classmates;

DROP TABLE classmates;


-- CREATE table
CREATE TABLE classmates (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INT NOT NULL,
    address TEXT NOT NULL
);

.tables

INSERT INTO classmates (id, name, age, address)
VALUES (1, 'JMH', 26, 'Gwangju');

SELECT * FROM classmates;

DROP TABLE classmates;


-- CREATE table without id field
CREATE TABLE classmates (
    name TEXT NOT NULL,
    age INT NOT NULL,
    address TEXT NOT NULL
);

.tables

INSERT INTO classmates
VALUES
('hgd', 30, 'Seoul'),
('kcs', 23, 'Daejeon'),
('pnr', 23, 'Gwangju'),
('lys', 33, 'Gumi');

SELECT rowid, * FROM classmates;


-- READ partial datas
SELECT rowid, name FROM classmates;
SELECT rowid, name FROM classmates LIMIT 1;  -- index searching
SELECT rowid, name FROM classmates LIMIT 1 OFFSET 2;  -- index searching with slicing
SELECT rowid, name FROM classmates WHERE address='Seoul';  -- find

-- non-duplicated READ
SELECT DISTINCT age FROM classmates;


-- DELETE
DELETE FROM classmates WHERE rowid=4;

INSERT INTO classmates VALUES ('klp', 28, 'Gwangju');

SELECT rowid, * FROM classmates;


-- UPDATE
UPDATE classmates
SET name='hdg', address='Jeju'
WHERE rowid=4;

SELECT rowid, * FROM classmates;

DROP TABLE classmates;