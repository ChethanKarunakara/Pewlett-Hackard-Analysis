-- Creating tables for PH-EmployeeDB
CREATE TABLE departments(
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(40) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);

--Creating table for Employees
CREATE TABLE employees(
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NUll,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

--Creating table for managers
CREATE TABLE dept_manager(
dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

--Creating table for salaries
CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

--Creating table for dept_employee
CREATE TABLE deptemployee(
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

--Create table for title
CREATE TABLE title(
	emp_no INT NOT NULL,
	title varchar(20) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);
select * from title;
SELECT * FROM departments;

-- Determine Retirement Eligibility, find out people who are born  January 1, 1952, and December 31, 1955
--SELECT COUNT(first_name)
SELECT first_name, last_name
FROM Employees
WHERE birth_date Between '1952-01-01' AND '1955-12-31';

-- Determine employees were born in 1952
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Determine employees were born in 1953
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

-- Determine employees were born in 1954
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

-- Determine employees were born in 1955
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Narrow the search for retirement eligibility
-- employees born between 1952 and 1955, who were also hired between 1985 and 1988
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Count the Queries
-- Number of employees retiring, we need only one column to get output(first_name)
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Create New Table (retirement_info)
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- See Table
SELECT * FROM retirement_info;

-- Drop retirement info table because we dont have emp_no column in it
DROP TABLE retirement_info;

-- Create new table for retiring employees to get emp_no column
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT ri.emp_no,
    ri.first_name,
	ri.last_name,
    de.to_date
FROM retirement_info as ri
LEFT JOIN deptemployee as de
ON ri.emp_no = de.emp_no;

-- To find out who is still working with PH, need to join ri and de table
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
	de.to_date
INTO current_employee
FROM retirement_info as ri
LEFT JOIN deptemployee as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

SELECT * FROM current_employee

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
INTO retirement_count
FROM current_employee as ce
LEFT JOIN deptemployee as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- Create additional Lists
-- List 1 Employee Information
SELECT * FROM salaries
ORDER BY to_date DESC;

-- We are considering all the columns from employees table except gender
SELECT emp_no, first_name, last_name
INTO retirement_info
from employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info

-- Select gender colun from empoyee table and save all data in emp_info table
SELECT emp_no,first_name, last_name,gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- we need to join salaries & emp_info to add to_date and salary columns
SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary, de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN deptemployee as de
ON(e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	   AND (de.to_date = '9999-01-01');
	   
	   
-- List 2 Management
SELECT e.emp_no 
FROM employees


SELECT dm.dept_no, 
		dm.emp_no, 
		dm.from_date, 
		dm.to_date,
		d.dept_name,
		ce.first_name,
		ce.last_name
INTO manager_info
FROM dept_manager as dm
	INNER JOIN departments as d
		ON (dm.dept_no = d.dept_no)
	INNER JOIN current_employee as ce
		ON (dm.emp_no = ce.emp_no);

SELECT * from manager_info

-- List 3 Department Retirees
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
-- INTO dept_info
FROM current_employee as ce
INNER JOIN deptemployee AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

-- Create a Tailored List - return only the information relevant to the Sales team.
SELECT 	d.dept_name,
	ri.emp_no,
	ri.first_name,
	ri.last_name
	
INTO sales_info
FROM retirement_info as ri

LEFT JOIN deptemployee as de
ON (de.emp_no = ri.emp_no)
LEFT JOIN departments as d
ON (d.dept_no = 'd007')
WHERE de.dept_no = 'd007';

-- Create a Tailored List - return only the information relevant to the Sales team and development team.
SELECT 	d.dept_name,
	ri.emp_no,
	ri.first_name,
	ri.last_name
	
INTO salesdevelopment_info
FROM retirement_info as ri

LEFT JOIN deptemployee as de
ON (de.emp_no = ri.emp_no)
--WHERE (de.dept_no = 'd005' OR de.dept_no = 'd007') ;
RIGHT JOIN departments as d
ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development');
