DROP TABLE department;
DROP TABLE dept_emp;
DROP TABLE employee;
DROP TABLE manager;
DROP TABLE salary;
DROP TABLE title;

CREATE TABLE department (
	id CHAR(4) NOT NULL,
	name VARCHAR
);

CREATE TABLE dept_emp (
	emp_id int NOT NULL,
	dept_id CHAR(4) NOT NULL
);

CREATE TABLE manager (
	dept_id CHAR(4),
	emp_id int NOT NULL
);

CREATE TABLE employee (
	emp_id int NOT NULL,
	title_id CHAR(5),
	birthday date,
	first_name VARCHAR,
	last_name VARCHAR,
	sex CHAR(1),
	hire_date date
);

CREATE TABLE salary (
	emp_id int NOT NULL,
	salary int NOT NULL
);

CREATE TABLE title (
	title_id CHAR(5) NOT NULL,
	name VARCHAR
);

ALTER TABLE department
	ADD PRIMARY KEY(id);
ALTER TABLE dept_emp
	ADD PRIMARY KEY(emp_id,dept_id);
ALTER TABLE employee
	ADD PRIMARY KEY(emp_id);
ALTER TABLE manager
	ADD PRIMARY KEY(emp_id);
ALTER TABLE salary
	ADD PRIMARY KEY(emp_id);
	
ALTER TABLE dept_emp
	ADD FOREIGN KEY(emp_id) REFERENCES employee(emp_id);
ALTER TABLE dept_emp
	ADD FOREIGN KEY(dept_id) REFERENCES department(id);
ALTER TABLE manager
	ADD FOREIGN KEY(dept_id) REFERENCES department(id);
ALTER TABLE manager
	ADD FOREIGN KEY(emp_id) REFERENCES employee(emp_id);
ALTER TABLE salary
	ADD FOREIGN KEY(emp_id) REFERENCES employee(emp_id);
ALTER TABLE employee
	ADD FOREIGN KEY(title_id) REFERENCES title(title_id);