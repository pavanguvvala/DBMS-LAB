CREATE TABLE users(id NUMBER, name VARCHAR2(50) NOT NULL, email VARCHAR2(50) UNIQUE);
DROP TABLE users;
insert into users values(1,'Chakri','Chakri@gmail.com');
insert into users values(2,'Surendra','Surendra@gmail.com');
insert into users values(3,'Rohit','Rohit@gmail.com');

SELECT * from USERS;  
