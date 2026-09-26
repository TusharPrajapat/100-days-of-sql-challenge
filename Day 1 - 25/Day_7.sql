--61

--Find all employees and display:
--
--name | uppercase_name | name_length
--
--Requirements
--	Convert name to uppercase using UPPER()
--	Calculate the number of characters using LENGTH()
--	Alias them as uppercase_name and name_length
--	Sort by name_length descending


select 
	name,
	UPPER(name) as uppercase_name,
	length(name) as name_length
from employees
order by name_length asc


--62

--Display:
--
--name | lowercase_name | name_length
--Requirements
--Convert name to lowercase using LOWER()
--Calculate name length using LENGTH()
--Alias them as lowercase_name and name_length
--Show only employees whose name length is greater than 10
--Sort by name_length ascending

select 
	name,
	lower(name) as lowercase_name,
	length(name) as name_length
from employees
where length(name) > 10
order by  name_length asc


--63
--Display:
--
--name | first_5_chars
--
--Extract the first 5 characters of each employee's name.
--
--Requirements
--Use SUBSTRING()
--Alias the result as first_5_chars
--Sort by first_5_chars ascending

select 
	name,
	substring(name from 1 for 5) as first_5_chars
from employees
order by first_5_chars asc


--64

--Display:
--
--employee_info
--
--The output should look like:
--
--Rahul Sharma - 28
--Priya Patel - 26
--Amit Verma - 32
--Requirements
--Use CONCAT()
--Combine name, ' - ', and age
--Alias the result as employee_info
--Sort by age descending

select
	concat(name, '-', age) as employee_info
from employees
order by age desc


--65

--Display:
--
--name | cleaned_name
--
--For each employee:
--
--Remove leading/trailing spaces from name using TRIM()
--Convert the result to uppercase using UPPER()
--
--Alias the result as cleaned_name.
--
--Sort by cleaned_name ascending.
	

select 
	name,
	upper(trim(name)) as cleaned_name
from employees


--66

--Display:
--
--name | modified_name
--
--Replace every space ' ' in the employee's name with an underscore '_'.
--
--Example:
--
--Rahul Sharma → Rahul_Sharma
--Priya Patel  → Priya_Patel
--Requirements
--Use REPLACE()
--Alias the result as modified_name
--Sort by modified_name ascending

select
	name,
	replace(name, ' ', '_') as modified_name
from employees
order by modified_name asc


--67
Display:
--
--name | first_3 | last_3
--
--For each employee:
--
--Get the first 3 characters of their name using LEFT()
--Get the last 3 characters using RIGHT()
--Alias them as first_3 and last_3
--Sort by name ascending

select
	name,
	left(name, 3) as first_3,
	right(name, 3) as last_3
from employees
order by name asc


--68

--Now let's learn another useful string function.
--
--Display:
--
--name | a_position
--
--Find the position of the first occurrence of the letter 'a' in each employee's name.
--
--Requirements
--Use POSITION()
--Alias the result as a_position
--Sort by a_position ascending

select
	name,
	position('a' in name) as a_position
from employees
order by a_position asc



--69

--Display:
--
--name | username
--
--Create a username from the employee's name using these rules:
--
--Convert the name to lowercase.
--Replace the space with an underscore.


select
	name,
	lower(replace(name, ' ', '_')) as username
from employees
order by username asc



--70

--Find employees whose names contain the letter a, ignoring case.
--
--Return:
--
--name | username
--
--Where username is generated as:
--
--lowercase name + spaces replaced by underscores
--Requirements
--Use ILIKE to filter names containing a
--Use LOWER()
--Use REPLACE()
--Alias the generated value as username
--Sort by username ascending


select
	name,
	lower(replace(name, ' ', '_')) as username
from employees e 
where name ilike '%a%'
order by username asc
