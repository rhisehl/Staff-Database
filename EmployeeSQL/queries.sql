--Employee Basic Information (emp_no,last_name,first_name,sex,salary)
SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees
LEFT JOIN salaries ON employees.emp_no = salaries.emp_no;

--Employees Hired in 1986 (first_name, last_name, hire_date)
SELECT first_name, last_name, hire_date
FROM employees
WHERE DATE_PART('YEAR',hire_date) = 1986;

--Department Managers (dept_no,dept_name,emp_no,last_name,first_name)
SELECT dept_manager.dept_no,
	dept_manager.emp_no,
	departments.dept_name,
	employees.last_name,
	employees.first_name
FROM dept_manager
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no ;

--Employee Departments (emp_no,last_name,first_name,dept_no,dept_name)
SELECT dept_emp.emp_no,
	   dept_emp.dept_no,
	   employees.last_name,
	   employees.first_name,
	   departments.dept_name
FROM dept_emp
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no;

--Hercules B. (first_name,last_name,sex)
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

--Sales Department (emp_no,last_name,first_name)
SELECT employees.emp_no,
	   employees.last_name,
	   employees.first_name,
	   dept_emp.dept_no,
	   departments.dept_name
FROM departments
INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON employees.emp_no = dept_emp.emp_no
WHERE departments.dept_name = 'Sales';

--Sales and Development Departments (emp_no,last_name,first_name,dept_name)
SELECT employees.emp_no,
	   employees.last_name,
	   employees.first_name,
	   dept_emp.dept_no,
	   departments.dept_name
FROM departments
INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON employees.emp_no = dept_emp.emp_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

--Frequency of Last Names
SELECT last_name, COUNT(last_name) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
