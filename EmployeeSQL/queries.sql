SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s ON
e.emp_no = s.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986/01/01' AND '1986/12/31';

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager as dm
INNER JOIN departments as d ON
dm.dept_no = d.dept_no
INNER JOIN employees as e ON
dm.emp_no = e.emp_no;

SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
INNER JOIN departments as d ON
de.dept_no = d.dept_no
INNER JOIN employees as e ON
de.emp_no = e.emp_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN
(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
		(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
		)
);

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
INNER JOIN departments as d ON
de.dept_no = d.dept_no
INNER JOIN employees as e ON
de.emp_no = e.emp_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

SELECT last_name, COUNT(last_name) AS "Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Frequency" DESC;