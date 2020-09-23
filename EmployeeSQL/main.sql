DROP TABLE department;
DROP TABLE dept_emp;
DROP TABLE employee;
DROP TABLE manager;
DROP TABLE salary;
DROP TABLE title;

CREATE TABLE department (
	id CHAR(4),
	name VARCHAR
);

CREATE TABLE dept_emp (
	emp_id int,
	dept_id CHAR(4)
);

CREATE TABLE manager (
	dept_id CHAR(4),
	emp_id int
);

CREATE TABLE employee (
	emp_id int,
	title_id CHAR(5),
	birthday date,
	first_name VARCHAR,
	last_name VARCHAR,
	sex CHAR(1),
	hire_date date
);

CREATE TABLE salary (
	emp_id int,
	salary int
);

CREATE TABLE title (
	title_id CHAR(5),
	name VARCHAR
);

ALTER TABLE department
	ADD PRIMARY KEY(id);
ALTER TABLE dept_emp
	ADD PRIMARY KEY(emp_id,dept_id);
ALTER TABLE employee
	ADD PRIMARY KEY(emp_id);
ALTER TABLE manager
	ADD PRIMARY KEY(dept_id,emp_id);
ALTER TABLE salary
	ADD PRIMARY KEY(emp_id);
	
ALTER TABLE dept_emp
	ADD FOREIGN KEY(emp_id) REFERENCES employee(emp_id);
ALTER TABLE dept_emp
	ADD FOREIGN KEY(dept_id) REFERENCES department(id);
ALTER TABLE manager
	ADD FOREIGN KEY(dept_id) REFERENCES department(id);
ALTER TABLE salary
	ADD FOREIGN KEY(emp_id) REFERENCES employee(emp_id);
ALTER TABLE employee
	ADD FOREIGN KEY(title_id) REFERENCES title(title_id);
	



SELECT e.emp_id, e.last_name, e.first_name, e.sex, s.salary 
FROM employee e INNER JOIN salary s ON (e.emp_id = s.emp_id);

SELECT emp_id, last_name, hire_date FROM employee
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


SELECT d.id, d.name, e.emp_id, e.last_name, e.first_name
FROM manager m 
INNER JOIN employee e ON (m.emp_id = e.emp_id)
INNER JOIN dept_emp de ON (e.emp_id = de.emp_id)
INNER JOIN department d ON (de.dept_id = d.id);


SELECT e.emp_id, e.last_name, e.first_name, d.name
FROM employee e 
INNER JOIN dept_emp de ON (e.emp_id = de.emp_id)
INNER JOIN department d ON (de.dept_id = d.id);


SELECT first_name, last_name, sex
FROM employee
WHERE first_name = 'Hercules' AND last_name like 'B%';


SELECT e.emp_id, e.last_name, e.first_name, d.name
FROM employee e 
INNER JOIN dept_emp de ON (e.emp_id = de.emp_id)
INNER JOIN department d ON (de.dept_id = d.id)
WHERE d.name = 'Sales';


SELECT e.emp_id, e.last_name, e.first_name, d.name
FROM employee e 
INNER JOIN dept_emp de ON (e.emp_id = de.emp_id)
INNER JOIN department d ON (de.dept_id = d.id)
WHERE d.name = 'Sales' OR d.name = 'Development';


SELECT last_name, COUNT(last_name)
FROM employee
GROUP BY last_name 
ORDER BY COUNT(last_name) DESC;


