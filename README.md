# sql-challenge - Employee DB

## Background
This is your first SQL-challenge assigment since two weeks you were hired as a new data engineer at Pewlett Hackard (a fictional company). 
Your first major task is to do a research project about people whom the company employed during the 1980s and 1990s. 
All that remains of the employee database from that period are six CSV files.

There's three steps to perform in this project
**1. Data Modeling**
**2. Data Engineering**
**3. Data Analysis**

## Notes
All files are inside the folder named `EmployeeSQL`. This folder contains:

* A `data` folder that contains the six CSV files.

* An `images` folder that contains the Entity-Relationship Diagram (ERD).

* An `employee_db_tbl_create.sql` file that contains the table creation script for the six tables.

* An `employee_db_queries.sql` file that contains the queries created to answer the questions under *Data Analysis* below.

## Data Engineering

The 6 CSV files inside the data folder were inspected and ERD was created which can found inside the images folder. 
The ERD is the first step to study the data, design the table schema and its relationship with other tables. 
![ERD.png](/EmployeeSQL/Images/ER-Employee_DB.png)

The file `employee_db_tbl_create.sql` contains the script from which tables were create in PostgreSQL and later each CSV file was imported into their respective tables to populate the data.

## Data Analysis

After creating the tables and populating it with the provided data in CSV files, the following queries were executed that's saved under `employee_db_queries.sql`.

#### List the employee number, last name, first name, sex, and salary of each employee.
```sql
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
```
#### List the first name, last name, and hire date for the employees who were hired in 1986.
```sql
SELECT 
	emp.first_name, 
	emp.last_name, 
	emp.hire_date
FROM employees as emp
WHERE 1986 = EXTRACT(year FROM emp.hire_date);

-- SELECT count(*) FROM dept_manager
-- SELECT * FROM departments
-- SELECT * FROM dept_emp
```
#### List the manager of each department along with their department number, department name, employee number, last name, and first name.
```sql
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
```
#### List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
```sql
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

```
#### List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
```sql
SELECT 
	emp.first_name, 
	emp.last_name, 
	emp.sex	
FROM employees as emp
WHERE emp.first_name = 'Hercules' AND
	emp.last_name LIKE 'B%'
```
#### List each employee in the Sales department, including their employee number, last name, and first name.
```sql
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
```
#### List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
```sql
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
```
#### List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
```sql
SELECT count(e.last_name) as count_last_name, e.last_name 
FROM employees as e
GROUP BY e.last_name
ORDER BY count_last_name DESC
```
