create table emp(id number, name varchar2(50), sal number(7,2), doj date);
insert into emp values(1,'john',56000.50,'10-jun-25');
insert into emp values (2,'bob',45000.12,to_date('10-06-2025','DD-MM-YYYY'));
select value 
from nls_session_parameters
where parameter='nls_date_format';
create table users(u_id number, u_name VARCHAR2(50),email VARCHAR2(100),usersince date);
insert into users(u_id,u_name) values(1,'john');
insert into users(u_id,u_name) values(2,'bob');
SELECT * from users;
UPDATE users set email='john@gmail.com'where U_ID=1;
UPDATE users set email='bob@gmail.com'where u_id=2;
alter table users add gender VARCHAR2(10);
UPDATE users set gender='M' where u_id=1;
UPDATE users set gender='M' where u_id=2;
UPDATE users set USERSINCE=TO_DATE('12-12-2012','DD-MM-YYYY') where u_id=1;
UPDATE users set USERSINCE=TO_DATE('09-09-2009','DD-MM-YYYY') where u_id=2;
alter TABLE users rename COLUMN u_name to u_first_name;
alter TABLE users add u_last_name VARCHAR2(50);
alter TABLE name add;
