CREATE TABLE articles (
    title TEXT NOT NULL,
    content TEXT NOT NULL
);

.headers on
.mode column

INSERT INTO articles VALUES ('hi', 'bye');

SELECT * FROM articles;

-- ALTER
ALTER TABLE articles RENAME to news;
ALTER TABLE news ADD COLUMN subtitle TEXT NOT NULL DEFAULT 1;

SELECT * FROM news;

DROP TABLE news;
