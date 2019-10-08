-- build scheme
CREATE TABLE classmates (
    id INTEGER PRIMARY KEY,
    name TEXT
);

-- search table
.tables

-- search scheme
.schema classmates

-- delete table
DROP TABLE classmates;
.tables

-- create sample table
CREATE TABLE classmates (
    id INTEGER PRIMARY KEY,
    name TEXT,
    age INT,
    address TEXT
);

.tables
.schema classmates

DROP TABLE classmates;