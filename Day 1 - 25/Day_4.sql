--31
--Find all employees who work in either:
--
--Engineering (department_id = 2)
--Finance (department_id = 3)
--Sales (department_id = 5)
--
--Return:
--name | department_id | salary
--
--Sort by department_id ascending, then salary descending.

select
	e.name,
	e.department_id,
	e.salary 
from employees e 
where e.department_id in (2,3,5)
order by department_id asc, salary desc


--32
--Find all employees who do NOT belong to departments: 1, 4
--
--Return: name | department_id | salary
--
--Sort by salary highest → lowest.

select 
	name,
	department_id,
	salary
from employees e 
where e.department_id not in (1,4)
order by e.salary desc


--33
--Find all employees whose name contains the letter a, regardless of whether it is uppercase or lowercase.
--
--Return:
--
--name | salary
--
--Sort by name ascending.

select 
	name,
	salary
from employees
where name ilike'a%'
order by name asc

--34
--Find all employees whose name does NOT contain the letter a, regardless of case.
--
--Return:
--
--name | salary
--
--Sort by salary highest → lowest.

select
	name,
	salary
from employees e 
where name not ilike '%a%'
order by salary desc


--35
--Find all employees who do not have a manager.
--
--Return: name | manager_id

select 
	name,
	manager_id
from employees e 
where manager_id is null


--36
--Find all employees who have a manager.
--
--Return: name | manager_id
--
--Sort by manager_id ascending.

select 
	name,
	manager_id
from employees e 
where manager_id is not null
order by e.manager_id asc


--37
--Find all employees and display: name | manager_id | manager_status
--
--If manager_id is NULL, display: 'No Manager'
--
--Otherwise, display the actual manager_id.

select
	name,
	manager_id,
	coalesce(manager_id::text, 'No Manager') as manager_status
from employees


--38
--Find employees whose department_id is either 2 or 5, and whose salary is greater than 60,000.
--
--Return: name | department_id | salary
--
--Sort by salary highest → lowest.


select 
	name,
	department_id,
	salary
from employees
where department_id in (2,5) and salary > 60000
order by salary desc


--39
--Find employees who belong to either:
--
--Engineering
--Finance
--Sales
--
--Return: employee_name | department_name | salary

select 
	e.name as employee_name,
	d.department_name,
	e.salary
from employees e 
join departments d 
	on e.department_id  = d.id 
where d.department_name in ('Engineering', 'Finance', 'Sales')
order by e.salary desc



--40
--Find employees who are NOT in the following departments:
--
--Human Resources
--Marketing
--
--Return: employee_name | department_name | salary

select 
	e.name as employee_name,
	d.department_name,
	e.salary
from employees e 
join departments d
	on e.department_id = d.id 
where d.department_name not in ('Human Resources', 'Marketing')
order by salary desc
