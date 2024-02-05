SELECT DISTINCT ON (emp_no)emp_no, 
first_name, 
last_name, 
title
--INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = ('9999-01-01')
ORDER BY emp_no, to_date DESC;

SELECT * from  unique_titles

-- retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;

SELECT * from  retiring_titles

-- Deliverable 2
SELECT DISTINCT ON (e.emp_no)e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibilty
FROM employees as e
LEFT JOIN deptemployee as de
	ON (e.emp_no = de.emp_no)
LEFT JOIN titles as t
	ON (e.emp_no = t.emp_no)
WHERE de.to_date = '9999-01-01'	
	AND (e.birth_date BETWEEN '1965-1-1' AND '1965-12-31')

SELECT * from  mentorship_eligibilty