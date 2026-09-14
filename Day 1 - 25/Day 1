--1 Write a query to find all employees whose salary is greater than 70,000.
select (name, age, salary) from employees

--2 Find the names and salaries of employees who belong to department 2 AND have a salary greater than 60,000.
select name , salary 
from employees
where department_id = 2 and salary > 60000

--3 Find all employees whose salary is greater than 50,000, and display, The results should be ordered by salary from highest to lowest.
select name, salary
from employees
where salary > 50000
order by salary desc;

--4 Find employees who: belong to department 2 OR department 5 AND have a salary greater than 60,000,    Sort the result by salary from highest to lowest.
select name, department_id, salary
from employees
where (department_id = 2 or department_id = 5 ) and salary > 60000
order by salary desc;

--5 Write a query to find all the different department IDs present in the employees table.
select distinct(department_id) 
from employees
order by department_id asc

--6 Find all different salary values of employees whose salary is greater than 50,000.
select distinct salary 
from employees
where salary > 50000
order by salary asc

--7 Write a query to find how many employees are present in each department.
select department_id, count(*)
from employees 
group by department_id
order by department_id asc

--8 Write a query to find the average salary for each department.
select department_id, avg(salary) as avg_salary
from employees
group by department_id 
order by department_id desc

--9 Find the total salary paid by each department.
select department_id, sum(salary) as total_salary
from employees
group by department_id 
order by total_salary desc

-- having useage
--10 Write a query to find departments where the total salary is greater than 200,000.
select department_id, sum(salary) as total_salary
from employees
group by department_id
having sum(salary) > 200000
order by total_salary asc
