--41
--Using the employees table, calculate:
--
--name | salary | age | salary_per_age
--
--where:
--
--salary_per_age = salary / NULLIF(age, 0)
--
--Use the alias:
--
--salary_per_age
--
--Sort by salary_per_age highest → lowest.


select 
	name,
	salary,
	age,
	salary / nullif(age, 0) as salary_by_age
from employees
where salary > 60000
order by salary_by_age desc;



--42



select 
	name,
	salary,
	age,
	salary / nullif(age, 0) as salary_by_age
from employees
where salary > 60000 and age != 0
order by salary_by_age desc;



--43

--Display:
--
--name | manager_id | manager_name
--
--For employees who have a manager, display the manager's name.
--
--For employees who don't have a manager (manager_id IS NULL), display:
--
--'No Manager'


select 
	e.name, 
	e.manager_id, 
	COALESCE(e2.name, 'No Manager') AS manager_name
from employees e 
left join employees e2 
	on e.manager_id = e2.id  
	


--44
--Find all employees who have a manager and display:
--
--employee_name | manager_name
--
--For example:
--
--Priya Patel  | Rahul Sharma
--Rohan Mehta  | Rahul Sharma
	

select 
	e.name as eployee_name,
	m.name as manager_name
from employees e
join employees m
	on e.manager_id = m.id
where e.manager_id is not NULL


--45
--Find employees whose manager earns more than 70,000.
--
--Return:
--
--employee_name | employee_salary | manager_name | manager_salary
--
--Sort by manager_salary descending.

select 
	e.name as employee_name,
	e.salary as employee_salary,
	m.name  as manager_name,
	m.salary as manager_salary
from employees e
join employees m
	on e.manager_id = m.id 
where m.salary > 70000
order by manager_salary desc


--46
--Find all managers who have at least one employee reporting to them.
--
--Return:
--
--manager_name | employee_name
--
--For example:
--
--Rahul Sharma | Priya Patel
--Rahul Sharma | Rohan Mehta

select
	m.name as manager_name,
	e.name as employee_name
from employees m
join employees e
	on e.manager_id = m.id 
order by manager_name asc, employee_name asc



--47
--Find each manager and the number of employees directly reporting to them.
--
--Return:
--
--manager_name | employee_count
--
--Expected conceptually:
--
--Rahul Sharma | 4
--Vikram Singh | 3


select 
	m.name as manager_name,
	count (e.manager_id) as employee_count
from employees m
join employees e
	on m.id = e.manager_id 

group by m.id
order by employee_count desc


--48
--Find managers who have at least 2 employees directly reporting to them.
--
--Return:
--
--manager_name | employee_count
--
--Sort by employee_count descending.

select 
	m.name as manager_name,
	count(e.manager_id) as employee_count
from employees m
join employees e 
	on m.id = e.manager_id 
group by m.name
having count(e.manager_id) >= 2
order by employee_count desc



--49
--Find managers whose average salary of their direct reports is greater than 60,000.
--
--Return:
--
--manager_name | avg_employee_salary
--
--Sort by avg_employee_salary descending.

select
	m.name as manager_name,
	AVG(e.salary) as avg_employee_salary
from employees m
join employees e
	on m.id = e.manager_id 
group by manager_name 
having avg(e.salary) > 60000
order by avg_employee_salary desc



--50
--Find managers who:
--
--Have at least 2 direct reports
--Have an average employee salary greater than 60,000
--
--Return:
--
--manager_name | employee_count | avg_employee_salary
--
--Sort by avg_employee_salary descending.


select
	m.name as manager_name,
	count(e.id) as employee_count,
	avg(e.salary) as avg_employee_salary
from employees m
join employees e
	on m.id = e.manager_id 
group by manager_name 
having count (e.id) >= 2 
	and avg(e.salary) > 60000
order by avg_employee_salary desc
