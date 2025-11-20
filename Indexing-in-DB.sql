-- We need a large table
-- A table will 1 million rows
CREATE TABLE employee_test
(
    emp_id NUMBER,
    name VARCHAR2(50),
    age NUMBER,
    address VARCHAR2(50),
    hire_date DATE
);
-- 100 * 1 millon bytes

-- RANDOM
select ROUND(DBMS_RANDOM.VALUE(20, 80)) from dual;
SELECT DBMS_RANDOM.STRING('A', 20) FROM dual;
SELECT CURRENT_DATE - RANDOM(1, 3650) FROM DUAL;

BEGIN
    FOR i IN 1..1000000 LOOP
        INSERT INTO employee_test VALUES
        (i,
        'Employee ' || i,
        ROUND(DBMS_RANDOM.VALUE(20, 80)),
        DBMS_RANDOM.STRING('A', 20),
        CURRENT_DATE - DBMS_RANDOM.VALUE(1, 3650)
        );
    END LOOP;
END;
/
SELECT * FROM employee_test
WHERE emp_id <= 10;

-- Search and find all the employees
-- whose age = 24
SELECT COUNT(*) FROM employee_test 
WHERE age = 24; -- 30 ms

-- Indexes are created on columns
-- Syntax:
-- CREATE INDEX idx_name
-- ON table_name(column_name)
CREATE INDEX idx_age ON 
employee_test(age); -- 1 ms -> 1 s



SELECT COUNT(*) FROM employee_test 
WHERE age = 24; -- 3 ms


-- How the table database
-- data gets internally stored
-- in the disk


CREATE TABLE employee_test2
(
    emp_id NUMBER,
    name VARCHAR2(50),
    age NUMBER
);
BEGIN
    FOR i IN 1..1000 LOOP
        INSERT INTO employee_test2 VALUES
        (i,
        'Employee ' || i,
        ROUND(DBMS_RANDOM.VALUE(20, 80))
        );
    END LOOP;
END;
/

SELECT * FROM employee_test2;

-- Every row created in a table contains
-- a unique id called rowid
SELECT 
    rowid
FROM employee_test2;



SELECT 
    COUNT(DISTINCT rowid)
FROM employee_test2;

-- PROVING THAT rows gets stored
-- internally on blocks/pages
-- each block or page can hold
-- up to 8kb / 16 kb
SELECT 
    rowid,
    DBMS_ROWID.ROWID_OBJECT(rowid) AS object,
    DBMS_ROWID.ROWID_BLOCK_NUMBER(rowid) AS blockorpage,
    DBMS_ROWID.ROWID_ROW_NUMBER(rowid) AS rownumber,
    name,
    age
FROM employee_test2;

-- No. of blocks created for a 1000 rows
-- table and number of rows per block / page
SELECT 
    DBMS_ROWID.ROWID_BLOCK_NUMBER(rowid) AS blockorpage,
    COUNT(rowid)
FROM employee_test2
GROUP BY blockorpage;


SELECT * FROM employee_test2
WHERE age = 24;

-- Explaining Query Execution Plan
-- DBMS_XPLAN
EXPLAIN PLAN FOR
SELECT * FROM employee_test2
WHERE age = 24;

-- tO DISPLAY THE QUERY EXECUTION PLAN
-- Uses entire table scan for lack of index presence
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- Query Execution Plan - Uses only Index Based Scan
SELECT COUNT(*) FROM employee_test
WHERE age = 24;

EXPLAIN PLAN FOR
SELECT COUNT(*) FROM employee_test
WHERE age = 24;

-- Uses Index Based Scan as there is an index present
-- on age
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

