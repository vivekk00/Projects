
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Marketing');

-- Create the Employees table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10, 2),
    join_date DATE,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Insert data into Employees table
INSERT INTO Employees (emp_id, emp_name, dept_id, salary, join_date) VALUES
(101, 'John', 1, 50000, '2020-01-15'),
(102, 'Sarah', 2, 60000, '2019-07-01'),
(103, 'Mike', 1, 55000, '2021-05-20'),
(104, 'Amy', 3, 48000, '2021-11-23'),
(105, 'James', 2, 70000, '2018-06-12');

-- 1 Select all records from the Employees table.
select * from employees;

-- 2. Find the names and salaries of employees who earn more than 55000.
select emp_name,salary
from employees
where salary>55000;

-- 3. Display the employee name, department name, and salary of each employee using a JOIN.
select e.emp_name,d.dept_name,e.salary
from employees e
join departments d
on e.dept_id=d.dept_id;

-- 4. Find the total salary of all employees in the HR department.
SELECT SUM(e.salary) AS total_salary
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
WHERE d.dept_name = 'HR';

-- 5. List all employees who joined after January 1, 2020.
select * 
from employees
where join_date >'2020-01-1';

-- 6. Find the average salary of employees in each department.
select d.dept_name,avg(e.salary) as average_salary
from departments d 
join employees e 
on e.dept_id=d.dept_id
group by d.dept_name;

-- 7. Find the employee with the highest salary.
select * 
from employees
order by salary desc;

-- 8. Update the salary of 'John' by increasing it by 10%.
update employees 
set salary = salary*1.10
where emp_name = 'john';

-- 9. Delete the employee with emp_id 104.
delete from employees 
where emp_id = 104;

select * from employees; 
