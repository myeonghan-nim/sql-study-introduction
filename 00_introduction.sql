-- CREATE DB
.databases

-- READ csv
.mode csv

.import 00_introduction.csv introduction
.headers on

.mode column

-- READ Table
SELECT * FROM introduction;
