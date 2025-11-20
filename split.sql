---------------------- Creating Branches Table -----------------------------------

CREATE table branches(branch VARCHAR2(10) NOT NULL,branch_code VARCHAR2(3) PRIMARY KEY, Hod_name VARCHAR2(50) NOT NULL,staff_count NUMBER NOT NULL);

TRUNCATE TABLE branches;

INSERT into BRANCHES VALUES('AIML','AI','Dr.Rohit',30);
INSERT into BRANCHES VALUES('CSE','CS','Dr.Sudha Rani',40);
INSERT into BRANCHES VALUES('DS','DS','Dr.Chkri',20);
INSERT into BRANCHES VALUES('IT','IT','Dr.Surendra',15);

---------------------- Creating Student Table ------------------------------------

CREATE TABLE Student(s_id NUMBER PRIMARY KEY, s_name VARCHAR2(50) NOT NULL, b_code VARCHAR2(3) REFERENCES branches(branch_code));

INSERT into STUDENT VALUES(31,'Suri','AI');
INSERT into STUDENT VALUES(84,'Rohit','DS');
INSERT into STUDENT VALUES(54,'Chakradhar','CS');
INSERT into STUDENT VALUES(1,'Test','IT');

SELECT * from STUDENT;
