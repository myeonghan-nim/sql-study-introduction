-- CREATE scheme
CREATE TABLE classmates (
    id INTEGER PRIMARY KEY,
    name TEXT
);

-- READ table
.tables

-- READ scheme
.schema classmates

-- DELETE table
DROP TABLE classmates;

.tables


CREATE TABLE classmates (
    id INTEGER PRIMARY KEY,
    name TEXT,
    age INT,
    address TEXT
);

.tables

.schema classmates

DROP TABLE classmates;
