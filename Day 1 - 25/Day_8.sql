--71

--Display:
--
--name | salary | monthly_salary
--
--Calculate monthly salary by dividing annual salary by 12, and round the result to 2 decimal places.
--
--For this question, assume salary represents the annual salary.
--
--Requirements
--Use ROUND()
--Calculate salary / 12
--Round to 2 decimal places
--Alias the result as monthly_salary
--Sort by monthly_salary descending

select 
	name,
	salary,
	round(salary::numeric / 12, 2) as monthly_salary
from employees e 
order by monthly_salary desc


--72

--For each employee, calculate their salary divided by 12, but show both:
--
--name | salary | monthly_floor | monthly_ceil
--Requirements
--FLOOR() → round the monthly salary down
--CEIL() → round the monthly salary up
--Use salary / 12
--Alias as monthly_floor and monthly_ceil
--Sort by salary descending

select
	 name,
	 salary,
	 floor(salary::numeric/12) as monthly_floor,
	 ceil(salary::numeric/12) as monthly_ceil
from employees e 
order by salary desc


--73

--For each employee, calculate the difference between their salary and 65,000.
--
--Display:
--
--name | salary | salary_difference
--Requirements
--Use ABS()
--Calculate the absolute difference from 65000
--Alias it as salary_difference
--Sort by salary_difference descending

select 
	name,
	salary,
	abs(salary-65000) as salary_difference
from employees
order by salary_difference asc


--74

--Find employees whose salary is not evenly divisible by 5,000.
--
--Return:
--
--name | salary | remainder
--Requirements
--Use MOD()
--Calculate the remainder when salary is divided by 5000
--Alias it as remainder
--Filter only employees where the remainder is not 0
--Sort by remainder descending

select 
	name,
	salary,
	mod(salary, 5000) as remainder
from employees
where mod(salary, 5000) <> 0
order by remainder desc



--75

--For each employee, calculate how far their monthly salary is from 5,000.
--
--Display:
--
--name | monthly_salary | difference_from_5000
--
--Where:
--
--monthly_salary = salary / 12
--Requirements
--Use ROUND() to calculate monthly_salary to 2 decimal places
--Use ABS() to calculate the difference from 5000
--Alias the calculated columns as monthly_salary and difference_from_5000
--Sort by difference_from_5000 ascending
--
--💡 Be careful: you cannot reuse monthly_salary in another expression in the same SELECT list.


select
	name,
	round(salary::numeric / 12, 2) as monthly_salary,
	abs((salary::numeric / 12) - 5000) as difference_from_5000
from employees
order by difference_from_5000 asc


--76
--For each employee, calculate their monthly salary and classify it:
--
--Monthly salary < 5000 → 'Below Target'
--Monthly salary 5000–7000 → 'Target Range'
--Monthly salary > 7000 → 'Above Target'
--
--Return:
--
--name | monthly_salary | salary_status
--Requirements
--Monthly salary = salary / 12
--Use ROUND(..., 2)
--Use CASE
--Alias as monthly_salary and salary_status
--Sort by monthly_salary descending


select 
	name,
	round(salary::numeric/12, 2) as monthly_salary,
	case
		when round(salary::numeric/12) < 5000 
			then 'below target'
		when round(salary::numeric/12) between 5000 and 7000 
			then 'Target Range'
		else 'Above Target'
	end as salary_status
from employees
order by monthly_salary desc
	
	
--77

--For each employee, calculate the square of their age.
--
--Return:
--
--name | age | age_squared
--Requirements
--Use POWER()
--Calculate age²
--Alias as age_squared
--Sort by age_squared descending


select 
	name,
	age,
	power(age, 2) as age_squared
from employees e 
order by age_squared desc


--78

--For each employee, calculate the square root of their salary.
--
--Return:
--
--name | salary | salary_sqrt
--Requirements
--Use SQRT()
--Calculate the square root of salary
--Alias it as salary_sqrt
--Sort by salary_sqrt ascending

select
	name,
	salary,
	sqrt(salary) as salary_sqrt
from employees
order by salary_sqrt asc


--79

--For each employee, compare their age with 30.
--
--Return:
--
--name | age | greater_value | smaller_value
--Requirements
--Use GREATEST(age, 30) → returns the larger value
--Use LEAST(age, 30) → returns the smaller value
--Alias them as greater_value and smaller_value
--Sort by age ascending

select
	name,
	age,
	greatest(age, 30) as greater_value,
	least(age, 30) as smaller_value
from employees
order by age asc


--80 

--For each employee, calculate their annual salary and classify their annual salary:
--
--< 600000 → 'Low'
--600000–900000 → 'Medium'
--> 900000 → 'High'
--
--Return:
--
--name | annual_salary | salary_category
--Requirements
--Calculate annual_salary = salary * 12
--Use CASE
--Alias the calculated value as annual_salary
--Alias the CASE result as salary_category
--Sort by annual_salary descending


select 
	name,
	salary*12 as annual_salary,
	case 
		when salary * 12 < 600000 then 'Low'
		when salary * 12 between 600000 and 900000 then 'Medium'
		else 'High'
	end as salary_category
from employees
order by annual_salary desc
