drop table employee;

create table employee(
    e_id NUMBER PRIMARY KEY,
    e_name VARCHAR2(50) NOT NULL,
    age NUMBER CHECK(age >= 17)
);

INSERT into employee values(1,'Chakri',18);
INSERT into employee values(2,'Surendra',18);
INSERT into employee values(3,'Rohit',17);


create TABLE dependent(
    d_id NUMBER,
    d_name VARCHAR2(50) NOT NULL,
    d_age NUMBER,
    emp_id REFERENCES employee(e_id),
    PRIMARY KEY(emp_id,d_id)
);
TRUNCATE TABLE dependent;
INSERT INTO DEPENDENT VALUES(1,'Ramu',50,1);
INSERT INTO DEPENDENT VALUES(1,'Dharma',45,2);
INSERT INTO DEPENDENT VALUES(1,'Vinod',55,3);


SELECT * from EMPLOYEE e join DEPENDENT d on e.E_ID = d.EMP_ID;
