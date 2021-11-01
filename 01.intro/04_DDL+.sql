CREATE TABLE articles (
    title TEXT NOT NULL,
    content TEXT NOT NULL
);

.headers on
.mode column

-- add value and check table
INSERT INTO articles VALUES ('hi', 'bye');
SELECT * FROM articles;

-- change table name with alter
ALTER TABLE articles RENAME to news;

-- add column to table
ALTER TABLE news
ADD COLUMN subtitle TEXT NOT NULL DEFAULT 1;

SELECT * FROM news;

DROP TABLE news;
