CREATE table client(client_id NUMBER PRIMARY KEY, c_name VARCHAR2(30) NOT NULL,contact_no NUMBER NOT NULL );

insert into client values(777,'Microsoft',77777777);
insert into client values(888,'Meta',88888888);
insert into client values(999,'Google',99999999);

create table project(project_id NUMBER PRIMARY KEY, project_name VARCHAR2(20)  NOT NULL, dead_line date NOt NULL, manager VARCHAR2(30), c_id NUMBER REFERENCES client(client_id));

insert into project values(101,'Excel Clone','27-11-2025','XYZ',777);
insert into project values(102,'Facebook Clone','10-05-2028','ABC',888);
insert into project values(103,'Chrome Clone','15-01-2027','PQR',999);
insert into project values(104,'Word Clone','12-02-2026','MNO',777);

CREATE TABLE intern(intern_id NUMBER PRIMARY KEY, name VARCHAR2(30) NOT NULL, age NUMBER NOT NULL, email VARCHAR2(50) NOT NULL,p_id NUMBER REFERENCES project(project_id));

insert into intern values(1,'Alice',17,'alice@gmail.com',101);
insert into intern values(2,'Bob',18,'bob@gmail.com',102);
insert into intern values(3,'Charli',19,'charli@gmail.com',101);
insert into intern values(4,'David',21,'david@gmail.com',102);
insert into intern values(5,'Emmy',22,'emmy@gmail.com',103);

select i.INTERN_ID,i.NAME,p.PROJECT_NAME,p.DEAD_LINE,c.C_NAME,c.CONTACT_NO from intern i join PROJECT p on i.P_ID=p.PROJECT_ID join client c on p.C_ID = c.CLIENT_ID;

select c.C_NAME, count(*) from intern i join PROJECT p on i.P_ID=p.PROJECT_ID join client c on p.C_ID = c.CLIENT_ID group by c.C_NAME;
