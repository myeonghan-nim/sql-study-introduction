-- CREATE & READ 01
CREATE TABLE classmates (
    name TEXT,
    age INT,
    address TEXT
);

.headers on
.mode column

-- CREATE
INSERT INTO classmates (name, age, address)
VALUES ('change', 28, 'Gwangju');

INSERT INTO classmates (name, address)
VALUES ('change', 'Gwangju');

INSERT INTO classmates VALUES ('change', 30, 'Seoul');

-- READ
SELECT * FROM classmates;

SELECT rowid, * FROM classmates;

DROP TABLE classmates;

-- CREATE & READ 02
CREATE TABLE classmates (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INT NOT NULL,
    address TEXT NOT NULL
);

INSERT INTO classmates (id, name, age, address)
VALUES (1, 'change', 26, 'Gwangju');

SELECT * FROM classmates;

DROP TABLE classmates;

-- CREATE & READ 03
CREATE TABLE classmates (
    name TEXT NOT NULL,
    age INT NOT NULL,
    address TEXT NOT NULL
);

INSERT INTO classmates
VALUES
('change', 30, 'Seoul'),
('change', 23, 'Daejeon'),
('change', 23, 'Gwangju'),
('change', 33, 'Gumi');

SELECT rowid, * FROM classmates;
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

INSERT INTO classmates VALUES ('change', 28, 'Gwangju');

SELECT rowid, * FROM classmates;

DROP TABLE classmates;
