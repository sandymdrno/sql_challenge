--QUESTION 1
--List the following details of each employee: employee number, last name, first name, sex, and salary.

--SELECT [*,COLUMNS_NAMES, AGG]
--FROM TABLE_NAME
--WHERE CONDITION BASED ON COLUMNS
--GROUP BY 
--HAVING CONDITIONAL BASED ON AGGREGATION 
--OFFSET
--LIMIT

SELECT * FROM employees;
SELECT * FROM salaries;

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
    FROM employees
	INNER JOIN salaries ON
	employees.emp_no = salaries.emp_no

--QUESTION 2
--List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
    FROM employees
	WHERE date_part('year', hire_date) = 1986
	
--QUESTION 3
--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
    FROM employees
	INNER JOIN dept_manager ON dept_manager.emp_no = employees.emp_no
	INNER JOIN departments ON departments.dept_no = dept_manager.dept_no

--QUESTION 4
--List the department of each employee with the following information:
--employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
    FROM employees
	INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
	INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
	
--QUESTION 5
--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT e.first_name, e.last_name, e.sex
FROM employees e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

--QUESTION 6
--List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.

SELECT * FROM departments; 

SELECT em.emp_no, em.last_name, em.first_name, dept_name
	FROM employees em
	INNER JOIN dept_emp ON dept_emp.emp_no = em.emp_no
	INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
	WHERE dept_name = 'Sales'

--QUESTION 7
--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT * FROM departments; 

SELECT em.emp_no, em.last_name, em.first_name, dept_name
	FROM employees em
	INNER JOIN dept_emp ON dept_emp.emp_no = em.emp_no
	INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
	WHERE dept_name IN ('Sales','Development') 
	
--QUESTION 8
--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT last_name, count(*) FROM employees
	GROUP BY last_name
	ORDER BY COUNT(*) DESC;

SELECT *
FROM pg_settings
where name like 'list%'