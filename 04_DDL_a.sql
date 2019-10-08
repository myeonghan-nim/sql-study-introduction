CREATE TABLE articles (
    title TEXT NOT NULL,
    content TEXT NOT NULL
);

.headers on
.mode column

INSERT INTO articles VALUES ('hi', 'bye');
SELECT * FROM articles;

-- alter table name
ALTER TABLE articles RENAME to news;

-- add column
ALTER TABLE news
ADD COLUMN subtitle TEXT NOT NULL DEFAULT 1;

SELECT * FROM news;

DROP TABLE news;