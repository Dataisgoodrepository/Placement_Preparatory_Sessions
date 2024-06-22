######################################### 1. Types of SQL Commands ##########################################

# FAQ in interview:

-- Q1. What are the different types of SQL commands?

-- Answer: 
-- SQL commands are divided into five categories:
1. Data Query Language (DQL)
2. Data Definition Language (DDL)
3. Data Manipulation Language (DML)
4. Data Control Language (DCL)
5. Transaction Control Language (TCL)



-- Q2. Classify the following commands as DDL, DML, DQL, TCL.
-- (CREATE, COMMIT, INSERT, UPDATE, TRUNCATE, SELECT, ALTER, DELETE, DROP, ROLLBACK)

-- Answer:
-- DQL: SELECT
-- DDL: CREATE, ALTER, DROP, TRUNCATE
-- DML: INSERT, DELETE, UPDATE
-- TCL : COMMMIT, ROLLBACK




############################################### DDL ##########################################################

# Step1 : Create database

CREATE DATABASE DB;
USE DB;

# Step 2 : Create 2 tables

Create table Bank_Inventory_pricing 
( Product CHAR(15), 
Quantity INT, 
Price  Real ,
purchase_cost Decimal(6,2), 
Estimated_sale_price  Float,
Month int) ;

Create table Bank_branch_PL
(Branch   varchar(15),
  Banker   Int,
  Product varchar(15) ,
  Cost  Int,
  revenue Int,
  Estimated_profit Int,   
  month  Int);
  
  
-- FAQ: What is the difference between CHAR and VARCHAR?

-- `CHAR` and `VARCHAR` are both used to store string data in SQL, but they differ in storage and usage.
-- `CHAR` is a fixed-length data type, meaning it always reserves the specified number of characters, padding with spaces if necessary.
--  `VARCHAR` is a variable-length data type, storing only the actual characters entered, up to the defined limit, without additional padding.
-- `CHAR` is more efficient for storing data of consistent length, while `VARCHAR` ismore space-efficient for data of varying lengths.


-- FAQ: What is the difference between DROP and TRUNCATE?

-- `DROP` deletes the table and its data irreversibly, while `TRUNCATE` removes only data, keeping the table's structure intact. 
-- `DROP` is drastic, suited for eliminating the table, while `TRUNCATE` is for quickly purging data, keeping the table for future use.


################################################ DML ###################################################################

# Step 3: Insert records using INSERT INTO

 Insert into Bank_Inventory_pricing values ( 'PayCard'   , 2 , 300.45, 8000.87, 9000.56, 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'PayCard'   , 2 , 800.45, 5000.80, 8700.56, 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'PayCard'   , 2 , 500.45, 6000.47, 7400.56, 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'PayPoints' , 4 , 390.87, 7000.67, 6700.56, 2)  ;
 Insert into Bank_Inventory_pricing values ( 'SmartPay' , 5  , 290.69, 5600.77, 3200.12 , 1)  ;
 Insert into Bank_Inventory_pricing values ( 'MaxGain',  3 , NULL, 4600.67, 3233.11 , 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'MaxGain',  6 , 220.39, 4690.67, NULL , 2 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 7 , 290.30, NULL, 3200.13 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 6 , 560.30, NULL, 4200.13 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 6 , NULL, 2600.77, 3200.13 ,2 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 9 , NULL, 5400.71, 9200.13 ,3 ) ;
 Insert into Bank_Inventory_pricing values ( 'SmartSav',   3 , 250.89, 5900.97, NULL ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SmartSav',   3 , 250.89, 5900.97, 8999.34 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SmartSav',   3 , 250.89, NULL , 5610.82 , 2 ) ;
 Insert into Bank_Inventory_pricing values ( 'EasyCash',   3 , 250.89, NULL, 5610.82 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'EasyCash',   3 , 250.89, NULL, 5610.82 , 2 ) ;
 Insert into Bank_Inventory_pricing values ( 'EasyCash',   3 , 250.89, NULL, 5610.82 , 3 ) ;
 Insert into Bank_Inventory_pricing values ( 'BusiCard'  ,  1, 3000.99 , NULL, 3500, 3) ; 
 Insert into Bank_Inventory_pricing values ( 'BusiCard'  ,  1, 4000.99 , NULL, 3500, 2) ; 
Insert into Bank_Inventory_pricing values ( 'BusiCard'  ,  0, 4000.99 , NULL, 3500, 2) ; 


Insert into Bank_branch_PL values ( 'Delhi', 99101, 'SuperSave', 30060070, 50060070,  20050070, 1 ) ;
Insert into Bank_branch_PL values ( 'Delhi', 99101, 'SmartSav',   45060070, 57060070, 30050070, 2) ;
Insert into Bank_branch_PL values ( 'Delhi', 99101, 'EasyCash',   66660070, 50090090, 10050077, 3) ;
Insert into Bank_branch_PL values ( 'Hyd', 99101, 'SmartSav',   66660070, 79090090, 10050077, 3) ;
Insert into Bank_branch_PL values ( 'Banglr', 77301, 'EasyCash',   55560070, 61090090, 9950077, 3) ;
Insert into Bank_branch_PL values ( 'Banglr', 77301, 'SmartSav',   54460090, 53090080, 19950077, 3) ;
Insert into Bank_branch_PL values ( 'Hyd', 77301, 'SmartSav',   53060090, 63090080, 29950077, 3) ;
Insert into Bank_branch_PL values ( 'Hyd', 88201, 'BusiCard',  	40030070, 60070080, 10050070,1) ;
Insert into Bank_branch_PL values ( 'Hyd', 88201, 'BusiCard',  	70030070, 60070080, 25060070,1) ;
Insert into Bank_branch_PL values ( 'Hyd', 88201, 'SmartSav', 	40054070, 60070080, 20050070, 2) ;
Insert into Bank_branch_PL values ( 'Banglr', 99101, 'SmartSav',   88660070, 79090090, 10050077, 3) ;


Select * from Bank_Inventory_pricing;
Select * from Bank_branch_PL;

# UPDATE command

-- Q. Update price of MaxGain product in bank_inventory_pricing as 300.

UPDATE bank_inventory_pricing BIP SET Price = 300 WHERE BIP.product = 'MaxGain' ;


# DELETE command

-- Q. Delete record from bank_inventory_pricing where quantity is zero.

DELETE FROM bank_inventory_pricing WHERE quantity = 0;

-- FAQ: What is the difference between DELETE and TRUNCATE?

-- `DELETE` removes specific rows from a table, while `TRUNCATE` removes all rows, but retains the table structure.


############################################ DQL ##################################################

### TYPES OF JOINS:

# 1. INNER JOIN

-- Returns rows with matching values in both tables.


SELECT BIP.Product, BIP.Quantity, BIP.Price, BIP.Month, BPL.Branch, BPL.Revenue
FROM Bank_Inventory_pricing BIP
INNER JOIN Bank_branch_PL BPL
ON BIP.Product = BPL.Product;

-- This query selects the `Product`, `Quantity`, `Price`, `Month` from `Bank_Inventory_pricing`,
-- and the `Branch`, `Revenue` from `Bank_branch_PL` where there is a match on the `Product`.


# 2. LEFT (OUTER) JOIN

-- Returns all rows from the left table, and the matched rows from the right table. NULL for non-matching rows.


SELECT BIP.Product, BIP.Quantity, BIP.Price, BIP.Month, BPL.Branch, BPL.Revenue
FROM Bank_Inventory_pricing BIP
LEFT JOIN Bank_branch_PL BPL
ON BIP.Product = BPL.Product;


-- This query selects all products from `Bank_Inventory_pricing` and any matching rows from `Bank_branch_PL`. 
-- If there's no match, it will show `NULL` for columns from `Bank_branch_PL`.




# 3. RIGHT (OUTER) JOIN

-- Returns all rows from the right table, and the matched rows from the left table. NULL for non-matching rows.

SELECT BIP.Product, BIP.Quantity, BIP.Price, BIP.Month, BPL.Branch, BPL.Revenue
FROM Bank_Inventory_pricing BIP
RIGHT JOIN Bank_branch_PL BPL
ON BIP.Product = BPL.Product;

-- This query selects all branches from `Bank_branch_PL` and any matching products from `Bank_Inventory_pricing`. If there's no match, it will show `NULL` for columns from `Bank_Inventory_pricing`.



# 4. FULL (OUTER) JOIN

SELECT BIP.Product, BIP.Quantity, BIP.Price, BIP.Month, BPL.Branch, BPL.Revenue
FROM Bank_Inventory_pricing BIP
FULL JOIN Bank_branch_PL BPL
ON BIP.Product = BPL.Product;

-- (FULL join is not supported in MySQL. Hence the result can be achieved by UNION)

SELECT BIP.Product, BIP.Quantity, BIP.Price, BIP.Month, BPL.Branch, BPL.Revenue
FROM Bank_Inventory_pricing BIP
LEFT JOIN Bank_branch_PL BPL
ON BIP.Product = BPL.Product

UNION

SELECT BIP.Product, BIP.Quantity, BIP.Price, BIP.Month, BPL.Branch, BPL.Revenue
FROM Bank_Inventory_pricing BIP
RIGHT JOIN Bank_branch_PL BPL
ON BIP.Product = BPL.Product;



# 5. CROSS JOIN

-- Returns the Cartesian product of both tables.


SELECT BIP.Product, BIP.Quantity, BIP.Price, BPL.Branch, BPL.Revenue
FROM Bank_Inventory_pricing BIP
CROSS JOIN Bank_branch_PL BPL;

-- This query returns every possible combination of rows from `Bank_Inventory_pricing` and `Bank_branch_PL`.



# 6. SELF JOIN

-- Joins a table with itself.

SELECT A.Product, A.Quantity, B.Price, B.Month
FROM Bank_Inventory_pricing A, Bank_Inventory_pricing B
WHERE A.Product = B.Product AND A.Month = 1 AND B.Month = 2;

-- This query returns products that exist in both month 1 and month 2 within the `Bank_Inventory_pricing` table.



# 7. NATURAL JOIN

-- Automatically joins tables based on columns with the same name and datatype.

-- This type of join is not explicitly supported in all SQL databases and is generally avoided in favor of explicit joins.


SELECT BIP.*, BPL.*
FROM Bank_Inventory_pricing BIP
NATURAL JOIN Bank_branch_PL BPL;

-- This query joins `Bank_Inventory_pricing` and `Bank_branch_PL` on all columns with the same name. However, explicit join conditions are preferred for clarity.

---------------------------------------------------------------------

# FAQ: When we use self join?

-- When we want to compare the records with the value from the same table, self joins are used.


# FAQ: What is Equi join?

-- Equi join is a type of inner join where we have an equality (=) operator in the join condition.
-- Inner join can have equality (=) and other operators (like <,>,<>) in the join condition.

# FAQ: What is the difference between Equi join and natural join?

-- Joining key columns are explicitly specified in equi-join.
-- whereas, in case of natural join, we do not have to specify joining key columns. 


############################################ Aggregate functions ###########################################

-- COUNT(): Counts the number of rows.
-- SUM(): Sums up the values in a column.
-- AVG(): Calculates the average value.
-- MIN(): Finds the minimum value.
-- MAX(): Finds the maximum value.
-- GROUP BY: Groups rows sharing a property.
-- HAVING: Filters groups based on a condition.

# Q. Calculate the Total Revenue, Average Revenue, Minimum Revenue, and Maximum Revenue for Each Product using Bank_branch_PL table.

SELECT Product, 
       SUM(Revenue) AS Total_Revenue, 
       AVG(Revenue) AS Average_Revenue, 
       MIN(Revenue) AS Minimum_Revenue, 
       MAX(Revenue) AS Maximum_Revenue
FROM Bank_branch_PL
GROUP BY Product;

# Find Total Quantity and Average Price of Each Product from Bank_Inventory_pricing table.

SELECT Product, 
       SUM(Quantity) AS Total_Quantity, 
       AVG(Price) AS Average_Price
FROM Bank_Inventory_pricing
GROUP BY Product;

-----------------------------------------------------------------------

# FAQ: Explain order of execution of SQL.
-- 1. FROM
-- 2. JOIN
-- 3. WHERE
-- 4. GROUP BY
-- 5. HAVING
-- 6. SELECT
-- 7. DISTINCT
-- 8. ORDER BY
-- 9. LIMIT / OFFSET (if applicable)


# FAQ: Why is it advisable to use the WHERE clause before GROUP BY?

-- It becomes less computationally expensive if the records are already filtered based on primary business entities 
-- such as month, department, etc., before performing grouping operations.

# What is the difference between WHERE and HAVING?

-- WHERE filters individual rows based on conditions before grouping, applied to non-aggregated columns.
-- HAVING filters groups after the GROUP BY clause, used with aggregate functions.
-- WHERE is for row-level filtering, while HAVING is for group-level filtering.
-- For example,
-- WHERE can filter employees with a salary over 50,000, while HAVING can filter the DEPARTMENTS with more than 5 such employees.


########################################## IFNULL, NULLIF, COALESCE ########################################


### `NULLIF` Function

-- The `NULLIF` function returns `NULL` if the two expressions are equal. Otherwise, it returns the first expression.

-- NULLIF(expression1, expression2)

SELECT 
    Product, 
    Price, 
    NULLIF(Price, 300.45) AS Price_Not_300_45
FROM 
    Bank_Inventory_pricing;

-- This query returns `NULL` in the `Price_Not_300_45` column if `Price` is `300.45`, otherwise it returns the `Price`.



### `IFNULL` Function

-- The `IFNULL` function returns the first expression if it is not `NULL`; otherwise, it returns the second expression.

-- IFNULL(expression1, expression2)

SELECT 
    Product, 
    Price, 
    IFNULL(Price, 0) AS Price_With_Default
FROM 
    Bank_Inventory_pricing;
    
-- This query returns the `Price` if it is not `NULL`, otherwise it returns `0` in the `Price_With_Default` column.

### `COALESCE` Function

-- The `COALESCE` function returns the first non-`NULL` expression in the list.

-- COALESCE(expression1, expression2, ..., expressionN)

SELECT 
    Product, 
    Price, 
    purchase_cost,
    COALESCE(Price, purchase_cost, 0) AS Effective_Price
FROM 
    Bank_Inventory_pricing;

-- This query returns the `Price` if it is not `NULL`. If `Price` is `NULL`, it returns `purchase_cost`. 
-- If both are `NULL`, it returns `0` in the `Effective_Price` column.


############################################ CASE WHEN -- THEN #######################################################


-- The `CASE` statement allows us to perform conditional logic within a SQL query.
-- For example,
-- If the price is greater than or equal to 500, we categorize it as "High Price".
-- If the price is between 300 and 499.99, we categorize it as "Medium Price".
-- If the price is less than 300, we categorize it as "Low Price".

-- The result set will include the original columns (`Product`, `Quantity`, `Price`) along with the new `Price_Category` column, 
-- which indicates the price category for each product.


SELECT
    Product,
    Quantity,
    Price,
    CASE
        WHEN Price >= 500 THEN 'High Price'
        WHEN Price >= 300 AND Price < 500 THEN 'Medium Price'
        ELSE 'Low Price'
    END AS Price_Category
FROM
    Bank_Inventory_pricing;






############################################ Interview Practice Questions ############################################

-- Use the table bank_branch_pl and bank_inventory_pricing and answer the questions.

-- Q1. For each branch, calculate the total profit, excluding any losses. (Hint: Use CASE WHEN -- THEN)

SELECT
    BPL.Branch,
    SUM(CASE WHEN BPL.Revenue - BPL.Cost > 0 THEN BPL.Revenue - BPL.Cost ELSE 0 END) AS Total_Profit
FROM
    Bank_branch_PL BPL
GROUP BY
    BPL.Branch;


-- Q2. Determine the average estimated sale price for each product.

SELECT
    BIP.Product,
    AVG(BIP.Estimated_sale_price) AS Avg_Estimated_Sale_Price
FROM
    Bank_Inventory_pricing BIP
GROUP BY
    BIP.Product;


### Question 3: Calculate the total quantity of each product for each month.

SELECT
    BIP.Month,
    BIP.Product,
    SUM(BIP.Quantity) AS Total_Quantity
FROM
    Bank_Inventory_pricing BIP
GROUP BY
    BIP.Month, BIP.Product;


-- Q4. Identify the maximum profit (Estimated_sale_price - purchase_cost) for each product, ensuring losses are not displayed.

SELECT
    BIP.Product,
    MAX(BIP.Estimated_sale_price - BIP.purchase_cost) AS Max_Profit
FROM
    Bank_Inventory_pricing BIP
WHERE
    BIP.Estimated_sale_price - BIP.purchase_cost > 0
GROUP BY
    BIP.Product;


-- Q5. Find the minimum revenue for each banker when the estimated profit exceeds 20,000,000.

SELECT
    BPL.Banker,
    MIN(BPL.Revenue) AS Min_Revenue
FROM
    Bank_branch_PL BPL
WHERE
    BPL.Estimated_profit > 20000000
GROUP BY
    BPL.Banker;



-- Q6. List the products and the months where the total quantity in the bank inventory exceeded 6.

SELECT
    BIP.Product,
    BIP.Month
FROM
    Bank_Inventory_pricing BIP
GROUP BY
    BIP.Product, BIP.Month
HAVING
    SUM(BIP.Quantity) > 6;


-- Q7. If real profit is calculated as: Real Profit = revenue - cost, 
-- find the branches where the real profit exceeds the estimated profit.

SELECT
    BPL.Branch
FROM
    Bank_branch_PL BPL
WHERE
    BPL.Revenue - BPL.Cost > BPL.Estimated_profit;


-- Q8. If real profit is calculated as: Real Profit = revenue - cost, 
-- display the branch names along with their total estimated profit and real profit, excluding losses.

SELECT
    BPL.Branch,
    SUM(BPL.Estimated_profit) AS Total_Estimated_Profit,
    SUM(CASE WHEN BPL.Revenue - BPL.Cost > 0 THEN BPL.Revenue - BPL.Cost ELSE 0 END) AS Total_Real_Profit
FROM
    Bank_branch_PL BPL
GROUP BY
    BPL.Branch;

-- Q9. Display the product names, bankers, and branches that have incurred a loss. 
-- Note: A loss is when revenue - cost is negative.

SELECT
    BIP.Product,
    BPL.Banker,
    BPL.Branch
FROM
    Bank_Inventory_pricing BIP
JOIN
    Bank_branch_PL BPL ON BIP.Product = BPL.Product
WHERE
    BPL.Revenue - BPL.Cost < 0;


-- Q10. Display the branch and product names that have earned the least profit.

SELECT
    BPL.Branch,
    BIP.Product
FROM
    Bank_branch_PL BPL
JOIN
    Bank_Inventory_pricing BIP ON BPL.Product = BIP.Product
GROUP BY
    BPL.Branch, BIP.Product
ORDER BY
    SUM(BPL.Revenue - BPL.Cost) ASC
LIMIT 1;


############################################### Try by yourself ##################################################

-- Q11. Calculate the total profit for each branch and product where the calculated profit exceeds the estimated profit, excluding losses.

SELECT
    Branch,
    Product,
    SUM(Profit) AS Total_Profit
FROM (
    SELECT
        Branch,
        Product,
        revenue - Cost AS Profit,
        Estimated_profit
    FROM
        Bank_branch_PL
    WHERE
        revenue - Cost > Estimated_profit
        AND revenue - Cost > 0
) AS Profits
GROUP BY
    Branch,
    Product;


-- Q12. Display the branch and product names where the calculated profit exceeds the estimated profit, even if the product cost is reduced by 30%.

SELECT DISTINCT
    Branch,
    Product
FROM (
    SELECT
        Branch,
        Product,
        revenue - (Cost * 0.70) AS Adjusted_Profit,
        Estimated_profit
    FROM
        Bank_branch_PL
) AS Adjusted_Profits
WHERE
    Adjusted_Profit > Estimated_profit;
