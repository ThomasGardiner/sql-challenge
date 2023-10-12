--List the employee number, last name, first name, sex, and salary of each employee (2 points)

SELECT emp_no, last_name, first_name, sex, salary FROM employees NATURAL JOIN salaries;

--List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)

SELECT first_name, last_name, hire_date FROM employees WHERE EXTRACT(year FROM hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)

SELECT title, dept_no, dept_name, emp_no, last_name, first_name 
FROM dept_manager 
    NATURAL JOIN (employees INNER JOIN titles ON employees.emp_title_id = titles.title_id) 
    NATURAL JOIN departments
ORDER BY dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)

SELECT dept_no, emp_no, last_name, first_name, dept_name FROM departments NATURAL JOIN dept_emp NATURAL JOIN employees; 

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)

SELECT first_name, last_name, sex FROM employees WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name (2 points)

SELECT emp_no, last_name, first_name 
FROM departments NATURAL JOIN dept_emp NATURAL JOIN employees
WHERE dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name,
-- first name, and department name (4 points)

SELECT emp_no, last_name, first_name, dept_name 
FROM departments NATURAL JOIN dept_emp NATURAL JOIN employees
WHERE dept_name = 'Sales' OR dept_name = 'Development'; 

--List the frequency counts, in descending order, of all the employee last names (that is, 
--how many employees share each last name) (4 points)

SELECT last_name, COUNT (*) AS frequency FROM employees GROUP BY last_name ORDER BY frequency DESC;

