--51
--We want to categorize employees based on their salary.
--
--Return:
--
--name | salary | salary_category
--
--Rules:
--
--Salary	   Category
-->= 80000	    High
-->= 60000	    Medium
--< 60000	    Low


select 
	name,
	salary,
	case 
		when salary >= 80000 then 'high'
		when salary >= 60000 then 'medium'
		else 'low'
	end as salary_category
from employees 
order by salary desc
	

--52
--You need to categorize employees based on their age.
--
--Rules
--Age < 25 → Young
--Age 25–30 → Mid
--Age > 30 → Senior
--
--Return:
--
--name | age | age_category

select 
	name,
	age,
	case
		when age < 25 then 'young'
		when age <= 30 then 'mid'
		else 'senior'
	end as age_category
from employees
order by age desc
	

--53

--Find all employees and classify their salary:
--
--< 50000 → Low
--50000–70000 → Medium
--> 70000 → High
--
--Return:
--
--name | salary | salary_level
--
--Sort by salary descending.


select 
	name,
	salary,
	case
		when salary < 50000 then 'low'
		when salary <= 70000 then 'medium'
		else 'high'
	end as salary_level
from employees
order by salary desc
	

--54

--Display:
--
--employee_name | department_name | department_type
--
--Rules:
--
--Engineering or Finance → Technical
--Human Resources or Marketing → Business
--Sales → Revenue

select
	e.name as employee_name,
	d.department_name as department_name,
	case
		WHEN d.department_name IN ('Engineering', 'Finance') 
			THEN 'Technical'
		when d.department_name  in ('Human Resources', 'Marketing') 
			then 'Business'
		else 'Revenue'
	end as department_type
from employees e
join departments d 
	on e.department_id = d.id 
order by department_name desc


--55

--Find all employees and display:
--
--name | manager_id | manager_status
--
--Rules:
--
--If manager_id IS NULL → 'Top Level'
--Otherwise → 'Has Manager'
--
--Sort employees by manager_status ascending.

select 
	name,
	manager_id,
	case
		when manager_id is null
			then 'Top Level'
		else 'Has Manager'
	end as manager_status
from employees
order by manager_status desc



--56

--Calculate an employee's annual salary (salary * 12) and classify their annual salary:
--
--< 600000 → 'Low'
--600000–900000 → 'Medium'
--> 900000 → 'High'
--
--Return:
--
--name | salary | annual_salary | salary_category

select 
	name,
	salary,
	salary * 12 as annual_salary,
	case
		when salary * 12 < 600000
			then 'low'
		when salary * 12 < 900000
		 	then 'medium'
		else 'high'
	end as salary_category
from employees
order by annual_salary desc


--57

--For each department, count how many employees belong to each salary category:
--
--Salary < 60000 → Low
--Salary 60000–80000 → Medium
--Salary > 80000 → High
--
--Return:
--
--department_name | salary_category | employee_count

select
	d.department_name,
	case
		when e.salary < 60000 then 'low'
		when e.salary < 80000 then 'medium'
		else 'high'
	end as salary_category,
	count (e.id) as employee_count
from employees e
join departments d
	on e.department_id = d.id
group by 
	d.department_name,
	case
		when e.salary < 60000 then 'low'
		when e.salary < 80000 then 'medium'
		else 'high'
	end
order by d.department_name asc



--58

--For each department, calculate the total salary of High-paid employees only.
--
--A High-paid employee is someone with:
--
--salary > 80000
--
--Return:
--
--department_name | high_salary_total
--
--For departments with no High-paid employees, the result should be 0.

select 
	d.department_name,
	COALESCE(
        SUM(
            CASE
                WHEN e.salary > 80000 THEN e.salary
                ELSE 0
            END
        ),
        0
    ) AS high_salary_total
from employees e
join departments d 
	on e.department_id = d.id 
group by d.department_name 


--internal sql execution Query
--FROM
-- ↓
--JOIN
-- ↓
--WHERE
-- ↓
--GROUP BY
-- ↓
--CASE → sum -> coalesce
-- ↓
--SUM
-- ↓
--HAVING
-- ↓
--SELECT
-- ↓
--ORDER BY
-- ↓
--LIMIT

--59

--For each department, count how many employees have a salary greater than 70,000.
--
--Return:
--
--department_name | high_earner_count

select
	d.department_name,
	count(
		case 
			when e.salary > 70000 then e.id
		end
	) as high_earner_count
from employees e
join departments d
	on e.department_id = d.id 
group by d.department_name 
order by high_earner_count desc

--60

--For each department, calculate the average salary of employees earning more than 60,000.
--
--Return:
--
--department_name | avg_high_salary

select 
	d.department_name,
	avg(
		case
			when e.salary > 60000 then e.salary 
		end
	) as avg_high_salary
from employees e
join departments d 
	on e.department_id = d.id 
group by d.department_name 
