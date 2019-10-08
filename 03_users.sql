.mode csv
.import users.csv users

.headers on
.mode column

.tables
SELECT * FROM users;

-- select with if
SELECT * FROM users WHERE age >= 30;
SELECT first_name FROM users WHERE age >= 30;
SELECT last_name, age FROM users
WHERE age >= 30 AND last_name = '김';

-- count
SELECT COUNT(*) FROM users;
SELECT COUNT(*) FROM users
WHERE age >= 30 AND last_name = '김';

-- calculate (avg, sum, min, max)
SELECT AVG(age) FROM users WHERE age >= 30;
SELECT first_name, MAX(balance) FROM users;
SELECT AVG(balance) FROM users WHERE age >= 30;

-- check pattern (_ : at least one letter(?) ,% : there is more or less letter(*))
SELECT COUNT(*) FROM users WHERE age LIKE '2_';
SELECT COUNT(*) FROM users WHERE phone LIKE '02-%';
SELECT COUNT(*) FROM users WHERE first_name LIKE '%준';
SELECT COUNT(*) FROM users WHERE phone LIKE '%-5114-%';

-- order (like sort), ASC\DESC (sort, sort.reverse)
SELECT * FROM users ORDER BY age ASC LIMIT 10;
SELECT * FROM users ORDER BY age DESC LIMIT 10;
SELECT * FROM users ORDER BY age, last_name LIMIT 10;
SELECT last_name, first_name FROM users ORDER BY balance DESC LIMIT 10;

DROP TABLE users;