

SELECT street, city
from sales_customers
WHERE customer_id = 12 
--KINDLY NOTE THAT THE QUERY ABOVE DIDNT WORK WHEN I USED 
--(SELECT street, city from sales_customers WHERE first_name = 'Robby')
-- AND THAT IS BECAUSE THE first_name COLUMN WAS NOT THE PRIMARY KEY BUT WHEN I USED 
--(SELECT street, city from sales_customers WHERE customer_id = 12) IT WORKED.


SELECT * 
FROM sales_staffs
LIMIT 5

CREATE VIEW MIN_MAX_ORDERS AS 
SELECT min(list_price), max(LIST_PRICE)
FROM sales_order_items
-- NOTE IT WOULD NOT RETURN ANY ERROR NOR RESULT AND THAT IS BECAUSE A NEW TABLE HAS BEEN CREATED(MIN_MAX_ORDERS) 
--CAUSE THATS WHAT THE VIEW DOES (IT WOULD TAKE ONLY THE RESULT IN THE SELECET STATMENT AND MOVE IT INTO THE VIEW TABLE.
--(RUN A SELECT * FROM THE 'VIEW TABLE CREATED' AND YOU WOULD GET IT.. SEE BELOW)
SELECT * FROM MIN_MAX_ORDERS

SELECT product_name, brand_id, category_id
FROM production_products
WHERE model_year BETWEEN 2016 AND 2017;


SELECT PS.product_id, PP.product_name, sum(PS.quantity) AS TOTAL_QUANTITY_PER_PRODUCT
FROM production_stocks PS 
JOIN production_products PP
ON PS.product_id = PP.product_id
GROUP BY PS.quantity
HAVING PS.store_id != 3
ORDER BY PS.quantity;
--NOTE:GROUP BY, HAVING, ORDER BY IN THIS PARTICULAR ORDER 


SELECT email, street
FROM sales_customers
WHERE email like 'LA%' AND street LIKE '%S'
--NOTE: NO CUSTOMER IN THE (sales_customers) MET THE WHERE CONDITIONS THAT IS WHY THE QUERY RETURNED NO RESULTS


SELECT avg(LIST_PRICE) AS AVERAGE_LIST_PRICE, count(discount) AS [COUNT OF DISCOUNT], item_id
FROM sales_order_items
GROUP BY item_id


SELECT min(customer_id), max(customer_id)
FROM sales_orders

--NOTE: DB BROWSER DONT SUPPORT CONCAT INSTEAD IT USES || OR USE || '' || WHICH IS A CONCATENATION OPERATOR TO SEPERATE THE COLUMNS YOU WANT TO CONCATENATE
SELECT SO.order_id, SC.first_name || '' || last_name AS CUSTOMERS_FULL_NAME, SC.email, SO.order_date, SC.state,
IIF(SC.state like '%NY%', 'LOCAL', 'OUT OF STATE') CUSTOMER_LOCATION
FROM sales_customers SC
JOIN
sales_orders SO
ON SC.customer_id = SO.order_id
WHERE SO.order_date BETWEEN '20160101' and '20161231'
ORDER BY CUSTOMER_LOCATION DESC;
--NOTE IIF STATEMENT INSTEAD OF CASE STATEMENT


--NOTE LEFT JOIN OR INNER JOIN OR JOIN WORKED FOR THIS
SELECT COUNT(A.Title), AR.ArtistId, AR.name
FROM albums A
JOIN
artists AR
ON A.ArtistId = AR.ArtistId
WHERE AR.ArtistId = 22;


SELECT min(Milliseconds)
FROM tracks
WHERE MediaTypeId = 1


SELECT SUM(T.UNITPRICE), A.AlbumId, T.name
FROM tracks T
JOIN
albums A
ON T.AlbumId = A.AlbumId
GROUP BY T.AlbumId
HAVING T.AlbumId IN (6,10);

SELECT Address
FROM customers
UNION  
SELECT Address
FROM employees;

--QUESTION 20

SELECT DISTINCT C.FirstName, C.LastName, C.Email, C.Country, I.InvoiceDate,
IIF (C.Country like 'FRANCE', 'LOCAL', 'INTERNATIONAL') CUSTOMER_CATEGORY
FROM customers C
JOIN
invoices I
ON 
C.CustomerId = I.InvoiceId
WHERE I.InvoiceDate BETWEEN '2009-01-01' AND '2020-12-31';


SELECT CustomerId, FirstName || '' || LastName AS 'FULL NAME'
FROM customers
WHERE Country = 'USA';


SELECT lower(NAME) AS 'TRACK NAMES',  upper(COMPOSER) AS 'COMPOSER', GenreId
FROM tracks
WHERE GenreId = 1
ORDER BY Composer DESC


SELECT CustomerId, DATE(InvoiceDate, '+2 YEAR') AS 'NEW INVOICE YEAR', DATE(InvoiceDate, '+3 MONTH') AS 'NEW INVOICE MONTH'
FROM invoices
WHERE CustomerId <=20
ORDER BY CustomerId;


-- SELECT CustomerId, InvoiceDate
-- FROM invoices

