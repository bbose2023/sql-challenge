-- DROP TABLE salaries;
-- DROP TABLE dept_emp;
-- DROP TABLE dept_manager;
-- DROP TABLE departments;
-- DROP TABLE employees;
-- DROP TABLE titles;
	

CREATE TABLE titles (
    title_id varchar(10) PRIMARY KEY,
    title varchar(40) NOT NULL 
);

CREATE TABLE employees (
    emp_no int,
    emp_title_id varchar(10),
    birth_date date NOT NULL,
    first_name varchar(25) NOT NULL,
    last_name varchar(25) NOT NULL,
    sex char(1) NOT NULL,
    hire_date date NOT NULL,
	CONSTRAINT pk_emp_no 
		PRIMARY KEY (emp_no),
	CONSTRAINT pk_emp_title 
		UNIQUE (emp_no,emp_title_id),
	CONSTRAINT fk_emp_title_id
      FOREIGN KEY(emp_title_id) 
        REFERENCES titles(title_id)
);

CREATE TABLE departments (
    dept_no varchar(10) PRIMARY KEY,
    dept_name varchar(40) NOT NULL
);

CREATE TABLE dept_emp (
    emp_no int,
    dept_no varchar(10),
	CONSTRAINT fk_dept_no
		FOREIGN KEY(dept_no) 
			REFERENCES departments(dept_no),
	CONSTRAINT fk_dept_emp_no
		FOREIGN KEY(emp_no) 
			REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager (
    dept_no varchar(10),
    emp_no int,
	CONSTRAINT fk_dept_man_no
		FOREIGN KEY(dept_no) 
			REFERENCES departments(dept_no),
	CONSTRAINT fk_dept_man_emp_id
		FOREIGN KEY(emp_no) 
			REFERENCES employees(emp_no)
);

CREATE TABLE salaries (
    emp_no int,
    salary int,
	CONSTRAINT fk_salary_emp_id
		FOREIGN KEY(emp_no) 
			REFERENCES employees(emp_no),
	UNIQUE (emp_no, salary)
);


