-- select clause

SELECT 
 last_name ,
 first_name,
 points, 
 (points + 10) *  100 AS 'discount_factor'
from customers ;

select distinct state from customers;
-- exercise
SELECT * from products;
SELECT name from products;
SELECT unit_price from products;
SELECT
	name,
	unit_price,
	(unit_price * 1.1) AS new_unit_price
 from products;
 
 
 -- where clase
 -- operaters > , >=, <, <=,=,   (!=,<>) both are same not equal to operaer
 SELECT  * 
 from customers 
 WHERE points > 3000;
 
  SELECT  * 
 from customers 
 WHERE state <> 'VA' ;
 
  SELECT  * 
 from customers 
 WHERE birth_date > '1990-01-01';
 
-- exercise
-- Get the orders placed this years
SELECT * 
FROM
orders
WHERE order_date >= '2018-01-01';

-- the AND, OR, and NOT Operators
SELECT * 
FROM
customers
WHERE birth_date >= '1990-01-01' AND points > 1000;

SELECT * 
FROM
customers
WHERE birth_date >= '1990-01-01'
 OR points > 1000
 AND state = 'VA';
 
 -- order of arithmetic operators 
 -- */(multiplication is highest order then divion, add, sun)
 -- + -

SELECT * 
FROM
customers
WHERE NOT( birth_date > '1990-01-01'
 OR points > 1000);
 
 SELECT * 
FROM
customers
WHERE  birth_date <= '1990-01-01' AND  points <= 1000;

-- EXERCISE
SELECT * 
FROM order_items
WHERE order_id = 6 and unit_price * quantity > 30 ;

-- IN and NOT IN oprator
SELECT * 
FROM customers 
WHERE state  IN('VA','FL','GA');

SELECT * 
FROM customers 
WHERE state NOT IN ('VA','FL','GA');

-- EXERCISE
SELECT * 
FROM products
WHERE quantity_in_stock IN(49,38,72);

-- between operator
select * 
from customers
where points >= 1000 AND points <= 3000;

SeLECT * 
FROM customers
WHERE points BETWEEN 1000 and 3000;

-- exercise Ques) Return customers born between 1/1/1990 and 1/1/2000;

SELECT * 
FROM customers 
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

-- LIKE operator
SELECT *
FROM customers
WHERE last_name LIKE 'b%';

SELECT *
FROM customers
WHERE last_name LIKE 'brush%';

SELECT *
FROM customers
WHERE last_name LIKE '%b%';

SELECT *
FROM customers
WHERE last_name LIKE 'b____y';
-- %  represets any number of characters
-- _ represents single character

-- exercise Ques> Get the customers whose 
	-- address contain TRAIL or AVENUE
    -- phone number end with 9
    
SELECT * 
FROM customers
WHERE address LIKE '%TRAIL%' 
or address LIKE '%AVENUE%';

SELECT * 
FROM customers
WHERE  phone  LIKE '%9';

-- NOT LIKE operator
SELECT * 
FROM customers
WHERE  phone NOT LIKE '%9';

-- REGEXP operator

SELECT * 
FROM customers
WHERE  last_name  LIKE '%field%';

SELECT * 
FROM customers
WHERE  last_name  REGEXP 'field';

SELECT * 
FROM customers
WHERE  last_name  REGEXP 'field$';

SELECT * 
FROM customers
WHERE  last_name  REGEXP 'field|mac|rose';

SELECT * 
FROM customers
WHERE  last_name  REGEXP '^field|mac|rose';

SELECT * 
FROM customers
WHERE  last_name  REGEXP '[gim]e';

SELECT * 
FROM customers
WHERE  last_name  REGEXP '[a-h]e';

-- ^ beginning
-- $ end
-- | logical or
-- [abcd]
-- [a-f] range

-- Exercise
	-- get the customers whose 
		-- first name are ELKA or AMBUR
SELECT * from 
customers where first_name REGEXP 'elka|amber';

        -- last_name end with EY or ON
        SELECT * from 
        customers where last_name REGEXP 'ey$|on$';
        
        -- last name start with MY or contains select
        SELECT * from 
        customers where last_name REGEXP '^my';
        -- last name contains B followed by R or U
        SELECT * from 
        customers where first_name REGEXP '[b[ru]]';
        
        
-- IS NULL and IS NOT NULL operator
SELECT * 
from  customers where phone IS  NULL;        

SELECT * 
from  customers where phone IS NOT NULL;  


-- ORDER BY clause
SELECT *
FROM customers ORDER BY first_name DESC; 
SELECT *
FROM customers ORDER BY first_name ASC; 

SELECT *
FROM customers ORDER BY state DESC, first_name ASC ; 
-- exercise
SELECT *, quantity * unit_price as total_price
 from order_items where order_id = 2
order by quantity * unit_price DESC;


-- LIMIT clause
SELECT * 
FROM customers 
LIMIT  300;

-- page 1: 1-3
-- page 2: 4-6
-- page 3: 7-10

SELECT * 
FROM customers 
LIMIT  1,3;

-- Get the top three loyal customer
SELECT * 
FROM customers  
ORDER BY points DESC 
LIMIT 3;

-- INNER JOINS
SELECT od.order_id, 
od.customer_id,
cs.first_name ,
cs.last_name
FROM orders od
 JOIN customers cs 
 ON od.customer_id = cs.customer_id;
 
 
SELECT o.order_id,
p.product_id,
p.quantity_in_stock AS quantity,
p.unit_price,
o.unit_price
from order_items o 
join products p on o.product_id = p.product_id;


-- join one database table to another database table
SELECT * 
FROM sql_store.order_items oi
JOIN sql_inventory.products p
	ON oi.product_id = p.product_id;


use sql_hr;

-- It-self Join
SELECT 
	e.employee_id,
    e.first_name,
    m.first_name AS manager
From employees e
JOIN employees m
	ON e.reports_to = m.employee_id;