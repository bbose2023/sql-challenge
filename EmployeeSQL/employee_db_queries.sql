-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT COUNT(*) FROM employees;
SELECT COUNT(*) FROM salaries;
	
SELECT 
	emp.emp_no, 
	emp.last_name, 
	emp.first_name, 
	emp.sex, 
	sal.salary
FROM employees as emp 
	JOIN salaries as sal 
		ON	emp.emp_no = sal.emp_no

-- List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT 
	emp.first_name, 
	emp.last_name, 
	emp.hire_date
FROM employees as emp
WHERE 1986 = EXTRACT(year FROM emp.hire_date);

-- SELECT count(*) FROM dept_manager
-- SELECT * FROM departments
-- SELECT * FROM dept_emp

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
	dm.dept_no, 
	d.dept_name, 
	e.emp_no, 
	e.last_name, 
	e.first_name
FROM dept_manager as dm
	JOIN departments as d 
		ON d.dept_no = dm.dept_no
	JOIN employees as e
		ON dm.emp_no = e.emp_no
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
	de.emp_no, 
	e.last_name, 
	e.first_name,
	d.dept_name
FROM dept_emp as de
	JOIN departments as d 
		ON d.dept_no = de.dept_no
	JOIN employees as e
		ON de.emp_no = e.emp_no


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT 
	emp.first_name, 
	emp.last_name, 
	emp.sex	
FROM employees as emp
WHERE emp.first_name = 'Hercules' AND
	emp.last_name LIKE 'B%'

-- List each employee in the Sales department, including their employee number, last name, and first name.

SELECT 
	d.dept_name,
	de.emp_no, 
	e.last_name, 
	e.first_name	
FROM dept_emp as de
	JOIN departments as d 
		ON d.dept_no = de.dept_no
	JOIN employees as e
		ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales'

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
	d.dept_name,
	de.emp_no, 
	e.last_name, 
	e.first_name	
FROM dept_emp as de
	JOIN departments as d 
		ON d.dept_no = de.dept_no
	JOIN employees as e
		ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales' OR  d.dept_name = 'Development'

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT count(e.last_name) as count_last_name, e.last_name 
FROM employees as e
GROUP BY e.last_name
ORDER BY count_last_name DESC