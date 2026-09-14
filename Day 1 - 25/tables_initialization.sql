CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    department_id INT,
    salary INT,
    manager_id INT,
    joining_date DATE
);

-------------------------------

create table departments(
	id SERIAL primary key,
	department_name VARCHAR(50)
)

---------------------------------

create table projects(
	id SERIAL primary key,
	project_name VARCHAR(100),
	department_id INT,
	budget INT
)

---------------------------------

create table employee_project(
	employee_id INT,
	project_id INT
)

---------------------------------

create table orders(
	id SERIAL primary key,
	employee_id INT,
	amount INT,
	order_date DATE
)


--------------------------------

INSERT INTO departments 
(department_name) 
VALUES
('Human Resources'),
('Engineering'),
('Finance'),
('Marketing'),
('Sales');


----------------------------------

INSERT INTO employees
(name, age, gender, department_id, salary, manager_id, joining_date)
VALUES
('Rahul Sharma', 28, 'Male', 2, 60000, NULL, '2022-01-15');

insert into employees
(name, age, gender, department_id, salary, manager_id, joining_date)
values
('Priya Patel', 26, 'Female', 2, 55000, 1, '2022-03-10'),
('Amit Verma', 32, 'Male', 3, 70000, NULL, '2021-07-21'),
('Sneha Gupta', 29, 'Female', 1, 50000, NULL, '2023-02-05'),
('Vikram Singh', 35, 'Male', 5, 90000, NULL, '2020-11-18'),
('Neha Joshi', 24, 'Female', 4, 48000, NULL, '2023-06-25'),
('Rohan Mehta', 30, 'Male', 2, 65000, 1, '2021-09-12'),
('Anjali Kapoor', 27, 'Female', 4, 53000, 6, '2022-12-01'),
('Karan Malhotra', 31, 'Male', 5, 72000, 5, '2021-05-14'),
('Pooja Sharma', 25, 'Female', 1, 45000, 4, '2024-01-20'),
('Suresh Kumar', 40, 'Male', 3, 100000, NULL, '2019-04-01'),
('Meera Iyer', 33, 'Female', 2, 85000, 1, '2020-08-15'),
('Arjun Nair', 29, 'Male', 2, 62000, 1, '2022-10-11'),
('Divya Shah', 27, 'Female', 5, 58000, 5, '2023-03-19'),
('Rakesh Jain', 38, 'Male', 4, 78000, NULL, '2018-06-30'),
('Kavita Rao', 34, 'Female', 3, 82000, 11, '2020-01-12'),
('Mohit Arora', 26, 'Male', 2, 51000, 1, '2024-04-15'),
('Nisha Yadav', 28, 'Female', 1, 47000, 4, '2023-07-09'),
('Deepak Mishra', 37, 'Male', 5, 88000, 5, '2019-09-17'),
('Simran Kaur', 30, 'Female', 4, 61000, 15, '2021-11-23');


-------------------------------------------------------------
insert into projects
(project_name, department_id, budget)
values
('HR Management System',1,500000),
('E-Commerce Platform',2,2500000),
('Payroll Automation',3,800000),
('Digital Marketing Campaign',4,600000),
('CRM Development',5,1500000),
('Inventory Management',2,1200000),
('Banking Portal',3,3000000),
('Mobile App',2,1800000),
('Brand Promotion',4,700000),
('Sales Dashboard',5,950000);


-------------------------------------------------------------

insert into employee_project
(employee_id, project_id)
values
(1,2),
(2,2),
(3,3),
(4,1),
(5,5),
(6,4),
(7,6),
(8,4),
(9,10),
(10,1),
(11,7),
(12,8),
(13,6),
(14,10),
(15,9),
(16,7),
(17,8),
(18,1),
(19,5),
(20,9),
(1,8),
(7,2),
(12,6),
(5,10),
(11,3);


------------------------------------------------------

insert into orders
(employee_id, amount, order_date)
values 
(5,12000,'2024-01-10'),
(5,18000,'2024-01-15'),
(9,9000,'2024-02-01'),
(19,22000,'2024-02-08'),
(14,7500,'2024-02-15'),
(5,19500,'2024-03-01'),
(19,14000,'2024-03-05'),
(9,13000,'2024-03-08'),
(14,8500,'2024-03-12'),
(5,17000,'2024-03-20'),
(19,25000,'2024-04-01'),
(9,11500,'2024-04-10'),
(14,9800,'2024-04-15'),
(5,21000,'2024-04-20'),
(19,19500,'2024-05-02'),
(9,8900,'2024-05-07'),
(5,12500,'2024-05-11'),
(14,14300,'2024-05-20'),
(19,23200,'2024-06-01'),
(5,18100,'2024-06-12'),
(9,10200,'2024-06-18'),
(14,8800,'2024-06-22'),
(19,27500,'2024-07-01'),
(5,15400,'2024-07-05'),
(9,11900,'2024-07-12'),
(14,7600,'2024-07-19'),
(5,21000,'2024-08-01'),
(19,28900,'2024-08-10'),
(9,12500,'2024-08-18'),
(14,9500,'2024-08-25');
