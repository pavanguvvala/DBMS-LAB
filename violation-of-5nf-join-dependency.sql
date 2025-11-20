-- DROP TABLE suppliers CASCADE CONSTRAINTS;
CREATE TABLE suppliers (
    supplier_id VARCHAR(10) PRIMARY KEY,
    supplier_name VARCHAR(50),
    supplier_location VARCHAR(50)
);

INSERT INTO suppliers (supplier_id, supplier_name, supplier_location)
VALUES
('s1', 'CompanyX', 'Delhi'),
('s2', 'CompanyY', 'Mumbai');



-- DROP TABLE projects CASCADE CONSTRAINTS;
CREATE TABLE projects (
    project_id VARCHAR(10) PRIMARY KEY,
    project_name VARCHAR(100),
    dead_line DATE
);

INSERT INTO projects (project_id, project_name, dead_line)
VALUES
('j1', 'Houses for Poor', TO_DATE('2025-12-26', 'YYYY-MM-DD')),
('j2', 'Assembly Building', TO_DATE('2026-06-17', 'YYYY-MM-DD'));


-- DROP TABLE products CASCADE CONSTRAINTS;
CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(50)
);

INSERT INTO products (product_id, product_name)
VALUES
('p1', 'Cement'),
('p2', 'Bricks');


-- Mapping table
-- DROP TABLE supplier_product_project CASCADE CONSTRAINTS;
CREATE TABLE supplier_product_project (
    s_id VARCHAR(10),
    p_id VARCHAR(10),
    pro_id VARCHAR(10),
    PRIMARY KEY (s_id, p_id, pro_id),
    FOREIGN KEY (s_id) REFERENCES suppliers(supplier_id),
    FOREIGN KEY (p_id) REFERENCES products(product_id),
    
    FOREIGN KEY (pro_id) REFERENCES projects(project_id)
);

-- Insert data into supplier_product_project
INSERT INTO supplier_product_project (s_id, p_id, pro_id)
VALUES
('s1', 'p1', 'j2'),
('s1', 'p1', 'j1'),
('s1', 'p2', 'j1'),
('s2', 'p1', 'j1');

SELECT * FROM suppliers;
SELECT * FROM projects;
SELECT * FROM PRODUCTS;
SELECT * FROM supplier_product_project;

CREATE table supplier_product AS(
    select distinct s_id,p_id from SUPPLIER_PRODUCT_PROJECT
);

CREATE table supplier_project AS(
    select distinct s_id,pro_id from SUPPLIER_PRODUCT_PROJECT
);

CREATE table product_project AS(
    select distinct p_id,pro_id from SUPPLIER_PRODUCT_PROJECT
);

-- DROP TABLE supplier_product_project;

SELECT * from PRODUCT_PROJECT;


alter table product_project add CONSTRAINT fk_pp FOREIGN KEY(p_id) REFERENCES products(product_id);
alter table product_project add CONSTRAINT fk_pp2 FOREIGN KEY(pro_id) REFERENCES projects(project_ID);

alter table supplier_product add CONSTRAINT fk_sp FOREIGN KEY(s_id) REFERENCES suppliers(supplier_id);
alter table supplier_product add CONSTRAINT fk_sp2 FOREIGN KEY(p_id) REFERENCES products(product_id);

alter table supplier_project add CONSTRAINT fk_spro FOREIGN KEY(pro_id) REFERENCES projects(project_id);
alter table supplier_project add CONSTRAINT fk_spro2 FOREIGN KEY(s_id) REFERENCES suppliers(supplier_id);

show USER;

select table_name from user_tables;

CREATE TABLE xyz(id NUMBER, name VARCHAR2(20));

SELECT * from xyz;

insert into xyz VALUES(1,'Rohit');
insert into xyz VALUES(4,'Bob');
insert into xyz VALUES(3,'Alice');
insert into xyz VALUES(2,'Akhil');

commit;
alter table xyz add age number;
UPDATE xyz set age=30 where id=4;
rollback to after_update;
show con_name;
SAVEPOINT after_update;

DELETE xyz where id=3;
