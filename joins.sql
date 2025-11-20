--------------------------------- Creating Course Table ---------------------------------------------

create TABLE course(c_id NUMBER PRIMARY KEY,c_name VARCHAR2(50) NOT NULL,price NUMBER NOT NULL,duration NUMBER NOT NULL);
DROP TABLE course;
insert INTO course values(101,'C Programming',6000,180); 
insert INTO course values(102,'Java',7000,220); 
insert INTO course values(103,'Python',8000,200); 

SELECT * from COURSE;

--------------------------------- Creating Student Table ---------------------------------------------

CREATE TABLE Student(
    s_id NUMBER PRIMARY KEY,
    s_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    age NUMBER CHECK(age >=17 and age <=100),
    --- Foreign Key
    course_id NUMBER REFERENCES course(c_id)
);

--- Constraint type in Student

SELECT constraint_name ,CONSTRAINT_type from USER_CONSTRAINTS where TABLE_NAME='STUDENT';

INSERT INTO STUDENT VALUES(1,'Chakri','chakri@gmail.com',17,103);
INSERT INTO STUDENT VALUES(2,'Surendra','surendra@gmail.com',18,102);
INSERT INTO STUDENT VALUES(3,'Rohit','rohit@gmail.com',17,103);

SELECT * from STUDENT;
