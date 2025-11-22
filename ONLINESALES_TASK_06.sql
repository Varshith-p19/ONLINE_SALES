/****** Script for SelectTopNRows command from SSMS  ******/
USE SALESDB
SELECT TOP (1000) [order_id]
      ,[order_date]
      ,[amount]
      ,[product_id]
  FROM [SALESDB].[dbo].[ONLINE_SALES$]


  /*1.Use EXTRACT(MONTH FROM order_date) for month.*/
  SELECT 
    order_id,
    order_date,
    MONTH(order_date) AS month,
    amount,
    product_id
FROM [SALESDB].[dbo].[ONLINE_SALES$]

/* GROUP BY year/month.*/
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS total_sales
FROM [SALESDB].[dbo].[ONLINE_SALES$]
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;
 


 /* USE SUM FUNCTION FOR REVENUE */
 SELECT amount,sum(amount) as revenue
 from [SALESDB].[dbo].[ONLINE_SALES$]
 group by amount

 SELECT SUM(amount) AS revenue
FROM [SALESDB].[dbo].[ONLINE_SALES$];


/* COUNT(DISTINCT order_id) for volume */

select count(order_date) as volume
from [SALESDB].[dbo].[ONLINE_SALES$]


/*Use ORDER BY for sorting.*/


select *
from [SALESDB].[dbo].[ONLINE_SALES$]
order by amount asc


/*Limit results for specific time periods*/

SELECT *
FROM [SALESDB].[dbo].[ONLINE_SALES$]
WHERE YEAR(order_date) = 2024;