CREATE DATABASE company_training;
USE company_training;
CREATE TABLE departments (
department_id INT NOT NULL,
dept_name VARCHAR(80) NOT NULL,
city VARCHAR(60)
);
CREATE TABLE employees (
employee_id INT NOT NULL,
employee_name VARCHAR(100) NOT NULL,
email VARCHAR(120),
department_id INT NOT NULL,
salary DECIMAL(10,2),
status VARCHAR(20)
);
-- 1
ALTER TABLE departments ADD PRIMARY KEY (department_id);
-- 2
ALTER TABLE employees ADD PRIMARY KEY (employee_id);
-- 3
ALTER TABLE departments ADD COLUMN location VARCHAR(100);
-- 4
ALTER TABLE departments RENAME COLUMN dept_name to department_name;
-- 5
ALTER TABLE employees MODIFY COLUMN salary DECIMAL(12,2) NOT NULL;
-- 6
ALTER TABLE employees MODIFY COLUMN status VARCHAR(20) DEFAULT 'Active';
-- 7
ALTER TABLE employees ADD  UNIQUE (email);
-- 8
RENAME TABLE employees to staff;
-- 9
ALTER TABLE staff ADD CONSTRAINT fk_department foreign key (department_id) references departments (department_id);
-- 10
ALTER TABLE staff DROP INDEX unique_email;
-- 11
ALTER TABLE staff DROP foreign key fk_department;
-- 12
ALTER TABLE staff DROP PRIMARY KEY;
-- 13
ALTER TABLE staff ADD PRIMARY KEY (employee_id);
-- 14
ALTER TABLE departments DROP COLUMN location;
-- 15
CREATE DATABASE company_management;
RENAME TABLE company_training.departments to company_management.departments;
RENAME TABLE company_training.staff to company_management.staff;

