DROP TABLE IF EXISTS dept_emp, dept_manager, salaries, employees, titles, departments;

CREATE TABLE departments (
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name TEXT NOT NULL
);

CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY,
    title TEXT NOT NULL
);

CREATE TABLE employees ( 
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(5) NOT NULL REFERENCES titles,
    birth_date DATE NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);


CREATE TABLE salaries (
    emp_no INT PRIMARY KEY REFERENCES employees,
    salary INT NOT NULL
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL REFERENCES departments,
    emp_no INT PRIMARY KEY REFERENCES employees
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL REFERENCES employees,
    dept_no VARCHAR(4) NOT NULL REFERENCES departments,
    PRIMARY KEY (emp_no,dept_no)
);
