--21
--Find all employees along with the projects they are assigned to.

select 
	e.name as employee_name, 
	p.project_name 
from employees e 
join employee_project ep 
	on e.id = ep.employee_id 
join projects p 
	on ep.project_id = p.id 


--22
--Find all employees who are assigned to the "Mobile App" project.

--Return:- employee_name | project_name

select 
	e.name as employee_name, 
	p.project_name 
from employees e 
join employee_project ep 
	on e.id = ep.employee_id 
join projects p
	on ep.project_id = p.id
where p.project_name = 'Mobile App'


--23
--Find all projects and the number of employees assigned to each project.

--Return:- project_name | employee_count

SELECT
    p.project_name,
    count(ep.employee_id) as employee_count
FROM projects p
JOIN employee_project ep
    ON p.id = ep.project_id
group by p.project_name
ORDER BY employee_count DESC;


--24
--Find each department and the total budget of all its projects.

--Return: department_id | total_budget

select 
	d.id as department_id,
	sum(p.budget) as total_budget
from departments d
join projects p 
	on d.id = p.department_id 
group by d.id 
order by total_budget desc


--25
--Find departments where the total project budget is greater than ₹2,000,000.
--
--Return:
--department_id | total_budget

select 
	d.id as department_id,
	sum(p.budget) as total_budget
from departments d 
join projects p
	on d.id = p.department_id 
group by d.id 
having sum(p.budget) > 2000000
ORDER BY total_budget DESC;


--26
--Find the number of employees assigned to each project, but show only projects having at least 2 employees.
--
--Return:
--project_name | employee_count

select 
	p.project_name,
	count(ep.employee_id) as employee_count
from projects p 
join employee_project ep 
	on p.id = ep.project_id 
group by p.id 
having count(ep.employee_id) >= 2 
ORDER BY employee_count DESC;

--27 Find each employee and the total number of projects they are assigned to.

--Return:
--employee_name | project_count

select 
	e.name as employee_name,
	count(ep.project_id) as project_count
from employees e 
join employee_project ep 
	on e.id = ep.employee_id 
group by e.name
ORDER BY project_count DESC;

--28
--Find each department and the number of employees working in that department.
--
--Return:
--department_name | employee_count

select 
	d.department_name,
	count(e.id) as employee_count
from departments d
join employees e 
	on d.id = e.department_id 
group by d.id
order by employee_count desc


--29
--Find each department's average salary, but consider only employees whose salary is greater than 50,000.
--
--Return:
--department_name | avg_salary


select 
	d.department_name ,
	AVG(e.salary) as avg_salary
from departments d 
join employees e 
	on d.id = e.department_id 
where e.salary >50000
group by d.id 
order by avg_salary desc


--30
--Find departments where:
--
--Only employees with salary > 50,000 are considered.
--The department must have at least 2 such employees.
--Calculate their average salary.
--Return only departments whose average salary is greater than 65,000.
--
--Return:
--department_name | employee_count | avg_salary

select
	d.department_name,
	COUNT(e.id) as employee_count,
	AVG(e.salary) as avg_salary
from departments d
join employees e 
	on d.id = e.department_id 
where e.salary > 50000
group by d.id
having COUNT(e.id) >= 2 and
	AVG(e.salary) > 65000
order by avg_salary desc;
