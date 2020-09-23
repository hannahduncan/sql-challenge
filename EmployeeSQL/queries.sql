--List employee number, last name, first name, sex, and salary
SELECT e.emp_id, e.last_name, e.first_name, e.sex, s.salary 
FROM employee e INNER JOIN salary s ON (e.emp_id = s.emp_id);

--List first name, last name, and hire date for employees who were hired in 1986
SELECT emp_id, last_name, hire_date FROM employee
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date;

--List managers' department number, department name, employee number, last name, first name
SELECT d.id, d.name, e.emp_id, e.last_name, e.first_name
FROM manager m 
INNER JOIN employee e ON (m.emp_id = e.emp_id)
INNER JOIN dept_emp de ON (e.emp_id = de.emp_id)
INNER JOIN department d ON (de.dept_id = d.id);

--List employee number, last name, first name, and department name for all employees
SELECT e.emp_id, e.last_name, e.first_name, d.name
FROM employee e 
INNER JOIN dept_emp de ON (e.emp_id = de.emp_id)
INNER JOIN department d ON (de.dept_id = d.id);

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B"
SELECT first_name, last_name, sex
FROM employee
WHERE first_name = 'Hercules' AND last_name like 'B%';

--List employee number, last name, first name, and department name for all 'Sales' employees
SELECT e.emp_id, e.last_name, e.first_name, d.name
FROM employee e 
INNER JOIN dept_emp de ON (e.emp_id = de.emp_id)
INNER JOIN department d ON (de.dept_id = d.id)
WHERE d.name = 'Sales';

--List employee number, last name, first name, and department name for all 'Sales' and 'Development' employees
SELECT e.emp_id, e.last_name, e.first_name, d.name
FROM employee e 
INNER JOIN dept_emp de ON (e.emp_id = de.emp_id)
INNER JOIN department d ON (de.dept_id = d.id)
WHERE d.name = 'Sales' OR d.name = 'Development';

-- Frequency count of employees with same last name
SELECT last_name, COUNT(last_name) as Frequency
FROM employee
GROUP BY last_name 
ORDER BY COUNT(last_name) DESC;

