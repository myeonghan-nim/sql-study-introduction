-- create DB
.databases

-- read .csv
.mode csv
.import HelloDB.csv examples

-- view beatiful
.headers on
.mode column

-- search table
SELECT * FROM examples;