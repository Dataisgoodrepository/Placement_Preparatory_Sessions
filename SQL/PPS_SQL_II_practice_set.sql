
############# SQL II: CTE and Window Functions ###################

-- Create a database

CREATE DATABASE db2;
USE db2;

-- Create a table

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- Insert sample data

INSERT INTO employees (employee_id, name, department, salary) VALUES
(1, 'John Doe', 'Sales', 60000.00),
(2, 'Jane Smith', 'Sales', 58000.00),
(3, 'Alice Johnson', 'HR', 62000.00),
(4, 'Chris Evans', 'HR', 60000.00),
(5, 'Anne Brown', 'IT', 72000.00),
(6, 'Tim Cook', 'IT', 70000.00),
(7, 'Sara Davis', 'Finance', 65000.00),
(8, 'Mike Wilson', 'Finance', 63000.00),
(9, 'Nancy Thomas', 'Sales', 64000.00),
(10, 'Robert Brown', 'Sales', 63000.00),
(11, 'Rachel Green', 'HR', 59000.00),
(12, 'Monica Bing', 'HR', 57000.00),
(13, 'Phoebe Buffay', 'IT', 71000.00),
(14, 'Chandler Bing', 'IT', 68000.00),
(15, 'Ross Geller', 'Finance', 67000.00),
(16, 'Joey Tribbiani', 'Finance', 66000.00),
(17, 'Janice Litman', 'Sales', 62000.00),
(18, 'Gunther Centralperk', 'Sales', 61000.00),
(19, 'Ursula Buffay', 'HR', 56000.00),
(20, 'David Schwimmer', 'HR', 55000.00),
(21, 'Ben Wyatt', 'Sales', 64000.00),
(22, 'Leslie Knope', 'Sales', 62000.00),
(23, 'Ron Swanson', 'HR', 72000.00),
(24, 'April Ludgate', 'HR', 70000.00),
(25, 'Andy Dwyer', 'IT', 71000.00),
(26, 'Tom Haverford', 'IT', 68000.00),
(27, 'Jerry Gergich', 'Finance', 67000.00),
(28, 'Donna Meagle', 'Finance', 66000.00),
(29, 'Ann Perkins', 'Sales', 61000.00),
(30, 'Chris Traeger', 'Sales', 60000.00),
(31, 'Jake Peralta', 'HR', 59000.00),
(32, 'Amy Santiago', 'HR', 57000.00),
(33, 'Terry Jeffords', 'IT', 71000.00),
(34, 'Rosa Diaz', 'IT', 68000.00),
(35, 'Charles Boyle', 'Finance', 67000.00),
(36, 'Gina Linetti', 'Finance', 66000.00),
(37, 'Holt', 'Sales', 64000.00),
(38, 'Scully', 'Sales', 62000.00),
(39, 'Hitchcock', 'HR', 72000.00),
(40, 'Kevin Cozner', 'HR', 70000.00),
(41, 'Adrian Pimento', 'IT', 71000.00),
(42, 'Norm Scully', 'IT', 68000.00),
(43, 'Michael Scott', 'Finance', 67000.00),
(44, 'Dwight Schrute', 'Finance', 66000.00),
(45, 'Jim Halpert', 'Sales', 61000.00),
(46, 'Pam Beesly', 'Sales', 60000.00),
(47, 'Stanley Hudson', 'HR', 59000.00),
(48, 'Phyllis Vance', 'HR', 57000.00),
(49, 'Ryan Howard', 'IT', 71000.00),
(50, 'Kelly Kapoor', 'IT', 68000.00),
(51, 'Creed Bratton', 'Finance', 67000.00),
(52, 'Meredith Palmer', 'Finance', 66000.00),
(53, 'Oscar Martinez', 'Sales', 64000.00),
(54, 'Toby Flenderson', 'Sales', 62000.00),
(55, 'Darryl Philbin', 'HR', 72000.00),
(56, 'Andy Bernard', 'HR', 70000.00),
(57, 'Erin Hannon', 'IT', 71000.00),
(58, 'Angela Martin', 'IT', 68000.00),
(59, 'David Wallace', 'Finance', 67000.00),
(60, 'Robert California', 'Finance', 66000.00),
(61, 'Jan Levinson', 'Sales', 61000.00),
(62, 'Holly Flax', 'Sales', 60000.00),
(63, 'Kevin Malone', 'HR', 59000.00),
(64, 'Clark Green', 'HR', 57000.00),
(65, 'Pete Miller', 'IT', 71000.00),
(66, 'Nellie Bertram', 'IT', 68000.00),
(67, 'Todd Packer', 'Finance', 67000.00),
(68, 'Clark Duke', 'Finance', 66000.00),
(69, 'Ravi Desai', 'Sales', 64000.00),
(70, 'Athlead Reps', 'Sales', 62000.00),
(71, 'Harvey Specter', 'HR', 72000.00),
(72, 'Mike Ross', 'HR', 70000.00),
(73, 'Rachel Zane', 'IT', 71000.00),
(74, 'Louis Litt', 'IT', 68000.00),
(75, 'Donna Paulsen', 'Finance', 67000.00),
(76, 'Jessica Pearson', 'Finance', 66000.00),
(77, 'Alex Williams', 'Sales', 61000.00),
(78, 'Samantha Wheeler', 'Sales', 60000.00),
(79, 'Katrina Bennett', 'HR', 59000.00),
(80, 'Stanley Gordon', 'HR', 57000.00),
(81, 'Susan Reynolds', 'IT', 71000.00),
(82, 'John Silver', 'IT', 68000.00),
(83, 'Greg Thompson', 'Finance', 67000.00),
(84, 'Olivia Brown', 'Finance', 66000.00),
(85, 'Liam Wilson', 'Sales', 64000.00),
(86, 'Emma Johnson', 'Sales', 62000.00),
(87, 'Noah Williams', 'HR', 72000.00),
(88, 'Mason Jones', 'HR', 70000.00),
(89, 'Ava Miller', 'IT', 71000.00),
(90, 'Isabella Smith', 'IT', 68000.00),
(91, 'Sophia Johnson', 'Finance', 67000.00),
(92, 'James Brown', 'Finance', 66000.00),
(93, 'Ethan White', 'Sales', 61000.00),
(94, 'Ella Harris', 'Sales', 60000.00),
(95, 'Lily Martinez', 'HR', 59000.00),
(96, 'Lucas Clark', 'HR', 57000.00),
(97, 'Amelia Lewis', 'IT', 71000.00),
(98, 'Benjamin Walker', 'IT', 68000.00),
(99, 'Charlotte Young', 'Finance', 67000.00),
(100, 'Mia Scott', 'Finance', 66000.00);

################################## COMMON TABLE EXPRESSION (CTE) #########################################

-- A CTE is a named temporary result set that can be used within a SELECT, INSERT, UPDATE, or DELETE statement. 
-- It improves query readability and can simplify complex queries.

-- A CTE is a named temporary result set that can be used within a SELECT, INSERT, UPDATE, or DELETE statement. 
-- It improves query readability and can simplify complex queries.

# Example: Find Employees with Salaries Above Department Average.


WITH DeptAvgSalary AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT e.employee_id, e.name, e.department, e.salary
FROM employees e
JOIN DeptAvgSalary d ON e.department = d.department
WHERE e.salary > d.avg_salary;

################### CTE PRACTICE QUESTIONS ###################

# Question 1:
 -- Find the employee IDs and names of those whose salaries are above the average salary of their respective departments.

# Question 2:
-- List employees who have the same salary as the employee with the highest salary in their respective department.



############## Windows Functions #################

# Key Components of Window Functions

-- 1. Function: The specific calculation (e.g., SUM(), RANK(), LAG()).

-- 2. OVER Clause: Defines the scope of the window function:

-- Partitioning (PARTITION BY): Divides rows into groups.
-- Ordering (ORDER BY): Sorts rows within each partition.
-- Framing (ROWS or RANGE): Limits the subset of rows to consider.

-- For example,

SUM(salary) OVER (PARTITION BY department_id ORDER BY salary ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)

-------------------------
1. ROW_NUMBER()
   - Assigns a unique sequential integer to rows within a partition of a result set,
   - starting at 1 for the first row in each partition.

SELECT employee_id, name, department, salary,
       ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS row_num
FROM employees;
-------------------------


 -------------------------
2.  RANK()
   - Assigns a rank to each row within a partition of a result set, with gaps in the ranking if there are ties. 
 
SELECT employee_id, name, department, salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS employee_rank
FROM employees;
--------------------------


-------------------------
3. DENSE_RANK()
   - Similar to RANK(), but without gaps in the ranking sequence. Useful for continuous ranking without gaps.

SELECT employee_id, name, department, salary,
       DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_rank_1
FROM employees;
-------------------------


-------------------------
4. NTILE(n)
   - Distributes the rows in an ordered partition into a specified number of approximately equal groups. 
   - Useful for dividing rows into quantiles.  
   
   SELECT employee_id, name, department, salary,
       NTILE(4) OVER (ORDER BY salary) AS quartile
FROM employees;
-------------------------


-------------------------
5. LAG()
   - Provides access to a value in a prior row within the same result set. 
   - Useful for comparing values of consecutive rows.
   
   For example,
   Order the employees by salary within each department.
   For each employee, find the previous employees salary in the same department.
   
SELECT employee_id, name, department, salary,
       LAG(salary, 1) OVER (PARTITION BY department ORDER BY salary) AS previous_salary
FROM employees;
-------------------------


-------------------------
6. LEAD()
   - Provides access to a value in a subsequent row within the same result set. 
   - Useful for comparing values of consecutive rows.

For example,
For each employee, retrieve the salary of the following employee in the same department based on the order of salaries. 

SELECT employee_id, name, department, salary,
       LEAD(salary, 1) OVER (PARTITION BY department ORDER BY salary) AS next_salary
FROM employees;
-------------------------


-------------------------
7. FIRST_VALUE()
   - Returns the first value in an ordered set of values. 
   - Useful for retrieving the first record in a partition.
 
 SELECT employee_id, name, department, salary,
       FIRST_VALUE(salary) OVER (PARTITION BY department ORDER BY salary) AS first_salary
FROM employees;
-------------------------


-------------------------
8. LAST_VALUE()
   - Returns the last value in an ordered set of values. 
   - Useful for retrieving the last record in a partition.
   
   SELECT employee_id, name, department, salary,
       LAST_VALUE(salary) OVER (PARTITION BY department ORDER BY salary ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_salary
FROM employees;
-------------------------


-------------------------   
9. NTH_VALUE()
   - Returns the nth value in an ordered set of values. 
   - Useful for retrieving the nth record in a partition.
   
SELECT employee_id, name, department, salary,
       NTH_VALUE(salary, 3) OVER (PARTITION BY department ORDER BY salary) AS third_salary
FROM employees;
-------------------------


-------------------------
10. CUME_DIST()
    - Calculates the cumulative distribution of a value in a set of values. 
    - Useful for calculating percentiles.

SELECT employee_id, name, department, salary,
       CUME_DIST() OVER (PARTITION BY department ORDER BY salary) AS cume_dist_1
FROM employees;
-------------------------


-------------------------
11. PERCENT_RANK()
    - Calculates the relative rank of a row within a partition. 
    - Similar to CUME_DIST but ranks are divided by (number of rows - 1).

SELECT employee_id, name, department, salary,
       PERCENT_RANK() OVER (PARTITION BY department ORDER BY salary) AS percent_rank_1
FROM employees;
-------------------------

##################################### PRACTICE QUESTIONS ######################################

-----------------------------------------------------------------
# Import csv file students.csv
-- --------------------------------------------------------------


# Q1. Rank the students on the basis of their marks subjectwise.

# Q2. Provide the new roll numbers to the students on the basis of their names alphabetically.

# Q3. Use the aggregate window functions to display the sum of marks in each row within its partition (Subject).

# Q4. Find the dense rank of the students on the basis of their marks subjectwise.

-----------------------------------------------------------------
# Dataset Used: website_stats.csv and web.csv
-----------------------------------------------------------------

# Q5. Display the difference in ad_clicks between the current day and the next day for the website 'Olympus' with website_id as 1.
 
# Q6. Write a query that displays the statistics for website_id = 3 such that for each row, show the day, the number of users and the smallest number of users ever.

