--11 Find departments where the average salary is greater than 65,000.

select department_id, avg(salary) as avg_salary
from employees
group by department_id 
having avg(salary) > 65000
order by avg_salary desc


--12
--Find departments where:
--
--Only employees with salary > 50,000 should be considered.
--After filtering those employees, calculate the average salary for each department.
--Only show departments whose resulting average salary is greater than 65,000.
--Sort by average salary highest → lowest.

-------------------------------HERE COMES THE LOGIC OF SQL QUERY EXECUTION SEQUENCE

select department_id, AVG(salary) as avg_salary
from employees
where salary > 50000
group by department_id 
having AVG(salary) > 65000
order by avg_salary desc

--13
--Find each department's:
--
--department_id
--employee_count
--total_salary
--
--But consider only employees whose salary > 50,000.
--
--Only include departments having at least 3 such employees.
--
--Sort by employee_count DESC.

select department_id, 
	COUNT (id) as employee_count, 
	SUM(salary) as total_salary
from employees
where salary > 50000
group by department_id 
having COUNT(id) >= 3
order by employee_count desc


--14
--Find departments where:
--
--The maximum salary is greater than 80,000
--Return:
--department_id
--max_salary
--min_salary
--Sort by max_salary highest → lowest.

select department_id, 
	MAX(salary) as max_salary, 
	MIN(salary) as min_salary
from employees
group by department_id 
having MAX(salary) > 80000
order by max_salary desc


--15
--Write a query to display: employee_name | department_name | salary
--for every employee. You will need to use a JOIN.

--Hint:- The relationship is: employees.department_id = departments.id
--Don't use GROUP BY here.

select 
	e.name as employee_name,
	d.department_name,
	e.salary
from 
	employees e
join 
	departments d
on 
	e.department_id = d.id 


--16
--Find all employees whose salary is greater than 60,000.
--
--Return:
--	employee_name
--	department_name
--	salary
--
--You must get department_name from the departments table.

select 
	e.name,
	d.department_name,
	e.salary
from
	employees e 
join
	departments d
on 
	e.department_id = d.id 
where 
	e.salary > 60000
ORDER BY e.salary DESC;


--17
--Find all employees working in the Engineering department.
--
--Return:
--employee_name
--salary
--department_name
--
--Requirements:
--INNER JOIN
--Use aliases e and d
--Filter using department_name, not department_id
--Sort salary highest → lowest

select 
	e.name,
	e.salary,
	d.department_name
from
	employees e 
join 
	departments d
on 
	e.department_id = d.id 
where 
	d.department_name = 'Engineering'
order by salary desc


--18
--Task
--
--Find the number of employees in each department, 
--but this time display the department name instead of department ID.
--
--Expected output: department_name | employee_count

select 
	d.department_name,
	count(e.id) as employee_count
from employees e
join departments d
	on e.department_id  = d.id 

group by d.department_name
order by employee_count desc



--19
--Find the total salary paid by each department.
--
--Return: department_name | total_salary

select 
	d.department_name,
	SUM(e.salary) as total_salary
from employees e 
join departments d
	on e.department_id  = d.id 
group by d.department_name 



--20
--Find departments whose total salary is greater than 250,000.
--
--Return: department_name | total_salary

select 
	d.department_name,
	sum(e.salary) as total_salary
from employees e 
join departments d 
	on e.department_id  = d.id 
group by d.department_name 
having sum(e.salary) > 250000
