-- CREATE DB
.databases

-- READ csv
.mode csv
.import HelloDB.csv examples

-- READ csv
.headers on
.mode column

-- READ table
SELECT * FROM examples;