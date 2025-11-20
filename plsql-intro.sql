-- PL/SQL
-- Procedural Language extesion for SQL
-- MySQL, PostgreSQL -> T-SQL
-- PL/SQL dedicated for Oracle
-- Functions, Procedures, Triggers
-- SQL - Declartive
-- SELECT salary FROM employee;
-- loops, conditionals, variable declarations
-- assigment
-- PL/SQL structure
-- DECLARE (Optional)
-- Declaring / Initializing variables
-- BEGIN (Mandatory)
-- Holding the executable code
-- EXCEPTION (Optional)
-- Used to throw exception, if there are any
-- DBMS_OUTPUT.PUT_LINE() -> printf, cout, print()
-- Hello World on to the screen using PLSQL
SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World');
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello');
    DBMS_OUTPUT.PUT_LINE('I am Pavan');
    DBMS_OUTPUT.PUT_LINE('From Technical Hub');
END;
/

-- DECLARE Block
-- Used to declare / initialize variables
DECLARE
    -- variable declaration -> variable_name datatype
    a NUMBER;
    b NUMBER;
    c NUMBER;
BEGIN
    -- Assignment operator :=
    a := 10;
    b := 20;
    c := a + b;
    DBMS_OUTPUT.PUT_LINE('Sum is: ' || c);
END;
/

DECLARE
    -- variable declaration -> variable_name datatype
    a NUMBER;
    b NUMBER;
    c NUMBER;
BEGIN
    -- Assignment operator :=
    a := &val1;
    b := &val2;
    c := a + b;
    DBMS_OUTPUT.PUT_LINE('Sum is: ' || c);
END;
/

-- Area and Perimeter of a square using pl/sql
DECLARE
    side NUMBER;
    area NUMBER;
    perimeter NUMBER;
BEGIN
    side := 10;
    area := side * side;
    perimeter := 4 * side;
    DBMS_OUTPUT.PUT_LINE('Area is: ' || area);
    DBMS_OUTPUT.PUT_LINE('Perimeter is: ' || perimeter);
END;
/
-- Why there is no scanf() or cin equivalent
-- PL/SQL allows you interact with SQL seamlessly
SELECT * FROM employee;
drop TABLE employee;

-- For fetching data from table
-- into pl/sql
DECLARE
    sal1 NUMBER;
    sal2 NUMBER;
    sal_sum NUMBER;
BEGIN
    SELECT salary INTO sal1 FROM employee WHERE id = 1;
    SELECT salary INTO sal2 FROM employee WHERE id = 2;
    sal_sum := sal1 + sal2;
    DBMS_OUTPUT.PUT_LINE('Sum of salaries is: ' || sal_sum);
END;
/

DECLARE
    num NUMBER;
    name VARCHAR2(50);
    join_date DATE;
BEGIN
    num := 4348;
    name := 'Pavan';
    join_date := CURRENT_DATE;
    DBMS_OUTPUT.PUT_LINE('Number: ' || num);
    DBMS_OUTPUT.PUT_LINE('Name: ' || name);
    DBMS_OUTPUT.PUT_LINE('Join Date: ' || join_date);
    DBMS_OUTPUT.PUT_LINE('Join Year: ' || TO_CHAR(join_date, 'YYYY'));
END;
/


-- Finding from how many days
-- an employee is working in your org
DECLARE
    doj DATE;
    today_date DATE;
    days NUMBER;
    name VARCHAR2(50);
BEGIN
    SELECT date_of_joining INTO doj FROM employee WHERE id = 1;
    SELECT name INTO name FROM employee WHERE id = 1;
    today_date := CURRENT_DATE; -- Date function
    days := today_date - doj;
    DBMS_OUTPUT.PUT_LINE(name || ' is working from: ' || days);
END;
/

-- Conditionals in PL/SQL
-- IF, ELSE, ELSIF
-- IF condition THEN
-- IF END IF;


DECLARE
    age NUMBER;
BEGIN
    age := 20;
    IF age > 18 THEN
        DBMS_OUTPUT.PUT_LINE('You can vote');
    END IF;
END;
/

DECLARE
    age NUMBER;
BEGIN
    age := &val;
    IF age > 18 THEN
        DBMS_OUTPUT.PUT_LINE('You can vote');
    ELSE
        DBMS_OUTPUT.PUT_LINE('You cannot vote');
    END IF;
END;
/
-- Smallest of two numbers using PL/SQL
DECLARE
    a NUMBER;
    b NUMBER;
    sot NUMBER;
BEGIN
    a := &val1;
    b := &val;
    IF a < b THEN
        sot := a;
    ELSE
        sot := b;
    END IF;
    DBMS_OUTPUT.PUT_LINE('Smallest of ' || a || ' and ' || b || ' is: ' || sot);
END;
/
-- Even / Odd
DECLARE
    n NUMBER;
    ans VARCHAR2(50);
BEGIN
    n := 15;
    -- Single row function
    IF MOD(n, 2) = 0 THEN
        ans := 'Even';
    ELSE
        ans := 'Odd';
    END IF;
    DBMS_OUTPUT.PUT_LINE(n || ' is ' || ans);
END;
/
-- Using ELSIF -> Max of three numbers
DECLARE
    a NUMBER;
    b NUMBER;
    c NUMBER;
    max_of_three NUMBER;
BEGIN
    a := 10;
    b := 20;
    c := 30;
    IF a >= b AND a >= c THEN
        max_of_three := a;
    ELSIF b >= c AND b >= a THEN
        max_of_three := b;
    ELSE
        max_of_three := c;
    END IF;
    DBMS_OUTPUT.PUT_LINE(max_of_three);
END;
/

-- 1 Type of loop
-- Looping statements
-- WHILE (condition)
-- FOR
-- SIMPLE LOOP
-- Priting 1 to 10 using while in PL/SQL
-- WHILE condition LOOP
-- Every loop must end with END LOOP;

-- A simple PL/SQL program to print the numbers from
-- 1 to 10
-- using while loop
DECLARE
    i NUMBER;
BEGIN
    i := 1;
    WHILE i <= 10 LOOP
        DBMS_OUTPUT.PUT_LINE('Number: ' || i);
        i := i + 1;
    END LOOP;
END;
/

-- Using while loop to calculate the 
-- factors of a number N
DECLARE
    N NUMBER;
    i NUMBER;
BEGIN
    N := 20;
    i := 1;
    WHILE i <= N LOOP
        IF MOD(N, i) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(i || ' is a factor of ' || N);
        END IF;
        i := i + 1;
    END LOOP;
END;
/


DECLARE
    N NUMBER;
    t NUMBER;
    r NUMBER;
BEGIN
    N := 141;
    r := 0;
    t := 141;
    WHILE t > 0 LOOP
        r := r*10 + MOD(t,10);
        t := floor(t/10);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Pallendrome of ' || N || ' is ' || r);
END;
/

BEGIN
    FOR i in 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

BEGIN
    FOR i in REVERSE 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

BEGIN
    FOR i in 1..10 LOOP
        DBMS_OUTPUT.PUT(i || ' ');
    END LOOP;
    DBMS_OUTPUT.NEW_LINE();
END;
/

BEGIN
    FOR i in 1..10 LOOP
        FOR j in 1..i LOOP
            DBMS_OUTPUT.PUT(j || ' ');
        END LOOP;
        DBMS_OUTPUT.NEW_LINE();
    END LOOP;
    
END;
/


BEGIN
    FOR i IN REVERSE 20..1 LOOP
        FOR j IN 20..1 LOOP
            DBMS_OUTPUT.PUT('*' || ' ');
        END LOOP;
        DBMS_OUTPUT.NEW_LINE();
    END LOOP;
END;
/

DECLARE
    c NUMBER;
BEGIN
    FOR i in 1..1000 LOOP
        c:=0;
        FOR j in 1..i LOOP
            IF MOD(i,j)=0 THEN
                c := c+1;
            END IF;
        END LOOP;
        IF c=2 THEN
            DBMS_OUTPUT.PUT(i);
            IF i!=997 THEN
            DBMS_OUTPUT.PUT('&');
            END IF;
        END IF;
    END LOOP;
    DBMS_OUTPUT.NEW_LINE();
END;
/

Create FUNCTION add_two(a number,b number) RETURN NUMBER IS
    c NUMBER;
BEGIN
    c:=a+b;
    return c;
END;
/

Create or REPLACE FUNCTION wish(name VARCHAR2,gender VARCHAR2) RETURN VARCHAR2 IS
    res VARCHAR2(200);
BEGIN
    IF gender='Male' THEN
        res := 'Hi, Mr.' || name;
    ELSE
        res := 'Hi, Ms.' || name;
    END IF;
    return res;
END;
/


Create or REPLACE FUNCTION square(n NUMBER) return NUMBER IS
BEGIN
    return n*n;
END;
/

Create or REPLACE FUNCTION FACTOR_CHECK(a NUMBER,b NUMBER) return BOOLEAN IS
    r BOOLEAN;
BEGIN
    IF MOD(a,b)=0 THEN
        r:=true;
    else
        r:=false;
    end if;
        return r; 
END;
/



create or REPLACE FUNCTION MAX_NUM(a NUMBER,b NUMBER,c NUMBER) return NUMBER IS
    r NUMBER;
BEGIN
    if a>b then
        if a>c THEN
            r:=a;
        ELSE
            r:=c;
        END IF;
    ELSE
        if b>c THEN
            r:=b;
        ELSE
            r:=c;
        END IF;
    END IF;
    return r;
END;
/


select square(10) from dual;

create or REPLACE FUNCTION gender_indicate(name VARCHAR2,gender VARCHAR2) return VARCHAR2 IS
    r VARCHAR2(200);
BEGIN 
    IF gender='Male' THEN
        r:= name || ' (M)';
    ELSE
        r:= name || ' (F)';
    END IF;
END;
/


create table customers(c_id number PRIMARY KEY,c_name varchar2(50));

insert into CUSTOMERS values(1,'Alice');
insert into CUSTOMERS values(2,'Bob');
insert into CUSTOMERS values(3,'Charlie');

select * from CUSTOMERS;


create table products(p_id number PRIMARY KEY,p_name varchar2(50),price number);

insert into products values(101,'Laptop',56000);
insert into products values(102,'Table',8000);
insert into products values(103,'Mouse',500);

select * from products;

drop table orders;

create table orders(ord_id varchar2(50) PRIMARY KEY, customer_id number REFERENCES CUSTOMERS(c_id), product_id number REFERENCES products(p_id),Order_date date DEFAULT CURRENT_DATE);

select * from orders;

create SEQUENCE order_id_gen Start with 1 INCREMENT by 1;
Alter SEQUENCE order_id_gen restart start with 1;

select 'ORD-' || LPAD(order_id_gen.NEXTVAL , 5,0) from dual;

Create or Replace FUNCTION gen_order_id 
return VARCHAR2 IS
BEGIN
    RETURN 'ORD-' || LPAD(order_id_gen.NEXTVAL,5,0);
END;
/

INSERT INTO ORDERS(ord_id,CUSTOMER_ID,PRODUCT_ID) 
VALUES
(gen_order_id(),1,102),
(gen_order_id(),2,103),
(gen_order_id(),3,101);

create or replace procedure first_pro(a IN number)
IS
BEGIN
    FOR i in 1..a LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

create or replace procedure squares(a in number,b out number)
is
BEGIN
    b:=a*a;
END;
/

DECLARE
    input number;
    output number;
BEGIN
    input :=5;
    squares(input,output);
    DBMS_OUTPUT.PUT_LINE(output);
END;
/

create or replace PROCEDURE updSalary(e_id number,s number) 
IS
BEGIN
    update employee set salary=s where id = e_id;
END;
/

select * from employee;

create or replace procedure del_emp(d_id in number)
is
begin 
    delete from employee where id = d_id;
end;
/
EXEC updSalary(1,70000);
EXEC del_emp(3);

create or replace PROCEDURE getMinMaxSalarydepart(dept in VARCHAR2)
IS
    min_sal number;
    max_sal number;
BEGIN
    select min(salary),max(salary) into min_sal,max_sal from employee where department=dept;
    DBMS_OUTPUT.PUT_LINE('Higest Salary: '|| max_sal);
    DBMS_OUTPUT.PUT_LINE('Lowest Salary: '|| min_sal);
END;
/

EXEC GETMINMAXSALARYDEPART('HR');

drop procedure get_factor_count;

create or replace function get_factor_count(n number) return number IS
    c number;
BEGIN
    c:=0;
    FOR i in 1..n loop
        IF mod(n,i)=0 THEN
            c:=c+1;
        END IF;
    END LOOP;
    return c;
END;
/
create or replace procedure factor_count(a in number,b in number)
IS
    c number;
BEGIN
    FOR i in a..b LOOP
        c:=get_factor_count(i);
        DBMS_OUTPUT.PUT_LINE(i|| ' : ' || c);
    END LOOP;
END;
/

exec factor_count(5,10);

create or replace function is_prime(a number) return BOOLEAN IS
    b number;
begin 
    IF a=1 or a=0 THEN
        return false;
    END IF;
    b:= floor(a/2);
    FOR i in 2..b LOOP
        IF mod(a,i)=0 THEN
            return false;
            exit;
        END IF;
    END LOOP;
    return true;
end;
/

create or replace procedure prime_num(a in number,b in number) 
IS
BEGIN
    FOR i in a..b LOOP
        IF is_prime(i) then
            DBMS_OUTPUT.PUT(i||' ');
        END IF;
    END LOOP;
    DBMS_OUTPUT.NEW_LINE();
END;
/

exec prime_num(1,5);


create or replace trigger first_trigger after update on employee 
for each row
begin 
    DBMS_OUTPUT.PUT_LINE('table update');
end;
/

update employee set email='Dummy@gmail.com' where email is null;

create table salary_change_log
(
    log_id number GENERATED always as identity PRIMARY key,
    emp_id number REFERENCES employee(id),
    old_salary number not null,
    new_salary number not null,
    updated_on date default CURRENT_DATE
);

create or replace TRIGGER salary_change_trigger after UPDATE of salary on employee
for each ROW
begin 
    insert into SALARY_CHANGE_LOG(emp_id,old_salary,new_salary) values(:new.id,:old.salary,:new.salary);
end;
/

select * from SALARY_CHANGE_LOG;
drop table orders;
truncate table salary_change_log;

update EMPLOYEE set salary =60000 where id=1;

create TABLE customers(c_id number PRIMARY key,c_name Varchar2(50) not null,email varchar2(100) not null);

insert into CUSTOMERS values(1,'Alice','alice@gmail.com');
insert into CUSTOMERS values(2,'Bob','bob@gmail.com');
insert into CUSTOMERS values(3,'Charlie','charlie@gmail.com');
insert into CUSTOMERS values(4,'Diana','diana@gmail.com');

create table products(p_id number primary key,p_name varchar2(30) not null,price number not null);

insert into products values(1,'Laptop',60000);
insert into products values(2,'Table',8000);
insert into products values(3,'Mouse',1000);
insert into products values(4,'Keybord',3000);
insert into products values(5,'Tablet',36000);

create table orders(ord_id number primary key,customer_id number REFERENCES customers(c_id),product_id number references products(p_id),quantity number not null);

create table invoices(inv_id VARCHAR2(50) primary key ,order_id number references orders(ord_id),invoice_date date default current_date,total_amount number not null);

create SEQUENCE invoice_id_gen Start with 1 INCREMENT by 1;

Create or Replace FUNCTION gen_invoice_id 
return VARCHAR2 IS
BEGIN
    RETURN 'INV-' || LPAD(invoice_id_gen.NEXTVAL,5,0);
END;
/

create or replace TRIGGER invoice_insert_trigger after insert on orders
for each ROW
DECLARE
    r number;
begin
    -- DBMS_OUTPUT.PUT_LINE(:new.product_id);
    select price* :new.quantity into r from products where p_id=:new.product_id;
    insert into INVOICES(inv_id,order_id,total_amount) values(gen_invoice_id(),:new.ord_id,r);
end;
/

drop trigger invoice_insert_trigger;
Alter SEQUENCE invoice_id_gen restart start with 1;
select gen_invoice_id() from dual;
truncate table orders;
truncate table invoices;

Insert into orders values(101,1,3,10);
Insert into orders values(104,1,1,500);
Insert into orders values(102,4,1,5);
Insert into orders values(103,3,4,100);

select * from orders;
select * from invoices;     


create or replace view employee_salary_rank_wise
as
with cte as
(
    select id,name,salary,department,
    rank() over(partition by department order by salary desc) as rank 
    from employee
    where salary is not null
) select * from cte;

select * from EMPLOYEE_SALARY_RANK_WISE;

create or replace view customers_orders_count
as
select c.c_name,p.p_name,count(*) as No_of_orders from customers c join orders o on c.c_id=o.customer_id join products p on o.product_id=p.p_id group by c.c_name,p.p_name order by No_of_orders desc;

select * from CUSTOMERS_ORDERs_COUNT;

create materialized view dept_employee_count AS
select department,count(*) as cnt from employee group by department;

select * from DEPT_EMPLOYEE_COUNT;

begin
    DBMS_MVIEW.REFRESH('DEPT_EMPLOYEE_COUNT');
end;
/
select * from employee;
delete from EMPLOYEE where id=1;
