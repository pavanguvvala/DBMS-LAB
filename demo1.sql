drop table student;

CREATE TABLE course(course_id PRIMARY KEY,c_Name VARCHAR2(50) NOT NULL, c_price NUMBER NOT NULL,duration NUMBER NOT NULL );

INSERT into COURSE values(101,"Java",8000);
INSERT into COURSE values(102,"Python",6000);
INSERT into COURSE values(103,"C++",4000);

CREATE TABLE student(s_id NUMBER PRIMARY KEY, s_Name VARCHAR2(50) NOT NULL, s_age NUMBER CHECK(s_age >=17) , c_id REFERENCES course(course_id));

INSERT into student values(1,"Rohit",17,102);
INSERT into student values(2,"Suredra",18,103);
INSERT into student values(3,"Chakri",18,101);

DROP TABLE student;
DROP TABLE course;
DROP TABLE enrolments;

CREATE TABLE enrolments(
    enrolment_id NUMBER PRIMARY KEY,
    s_id NUMBER REFERENCES student(student_id),
    c_id NUMBER REFERENCES course(course_id)
);


INSERT INTO enrolments(enrolment_id, s_id, c_id)
VALUES (111, 1, 102); 

INSERT INTO enrolments(enrolment_id, s_id, c_id)
VALUES (222, 2, 103);

INSERT INTO enrolments(enrolment_id, s_id, c_id)
VALUES (333, 3, 101);

-- Create Student table
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

-- Create Course table
CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT
);

-- Create Faculty table
CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

-- Create Enrolments table
CREATE TABLE Enrolments (
    enrolment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrol_date DATE,
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- Create Staff-Course Mapping table
CREATE TABLE Staff_Course_Mapping (
    mapping_id INT PRIMARY KEY,
    faculty_id INT,
    course_id INT,
    datetime DATETIME,
    feedback TEXT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);
