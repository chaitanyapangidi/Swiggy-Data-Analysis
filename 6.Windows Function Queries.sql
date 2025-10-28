/*
6.Window Function.sql

Description:
This SQL script contains advanced queries using  Window functions on the Swiggy_Data table.

Key Concepts Covered:
   Window Functions – Perform calculations across a set of table rows related 
   to the current row, without collapsing rows. Useful for ranking, running totals,
   moving averages, and analytics.*/

--1.Ranking restaurants by rating (overall)
SELECT Restaurant, Avg_ratings,
       RANK() OVER (ORDER BY Avg_ratings DESC) AS Rating_Rank
FROM swiggy_data

--2.Ranking restaurants within each Area
SELECT Area, Restaurant, Avg_ratings,
       RANK() OVER (PARTITION BY Area ORDER BY Avg_ratings DESC) AS Rating_Rank
FROM swiggy_data

--3.Row number to remove duplicate restaurants
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY Restaurant ORDER BY ID) AS rn
    FROM swiggy_data
) x
WHERE rn = 1;

--4.Dense rank by Total Ratings per City
SELECT City, Restaurant, Total_ratings,
       DENSE_RANK() OVER (PARTITION BY City ORDER BY Total_ratings DESC) AS Rating_Position
FROM swiggy_data

--5.Running total of Price ordered by Delivery time
SELECT Restaurant, Price, Delivery_time,
       SUM(Price) OVER (ORDER BY Delivery_time) AS Running_Total_Price
FROM swiggy_data

--6.Average delivery time by Area (window aggregation)
SELECT Area, Restaurant, Delivery_time,
       AVG(Delivery_time) OVER (PARTITION BY Area) AS Avg_Delivery_By_Area
FROM swiggy_data

--7.Top 1 restaurant per Area based on ratings
SELECT Area, Restaurant, Avg_ratings
FROM (
    SELECT Area, Restaurant, Avg_ratings,
           ROW_NUMBER() OVER (PARTITION BY Area ORDER BY Avg_ratings DESC) AS rn
    FROM swiggy_data
) t
WHERE rn = 1;

--8.Percentage contribution of each restaurant (ratings count)
SELECT Restaurant, Total_ratings,
       ROUND(
           Total_ratings * 100.0 / SUM(Total_ratings) OVER (), 2
       ) AS Rating_Percentage
FROM swiggy_data

--9.Restaurants whose rating is above Area average
SELECT Area, Restaurant, Avg_ratings,
       AVG(Avg_ratings) OVER (PARTITION BY Area) AS Area_Avg
FROM swiggy_data
WHERE Avg_ratings >
      (AVG(Avg_ratings) OVER (PARTITION BY Area));

--10.Lag/Lead — compare current and previous delivery time
SELECT Restaurant, Delivery_time,
       LAG(Delivery_time) OVER (ORDER BY Delivery_time) AS Previous_Delivery,
       Delivery_time - LAG(Delivery_time) OVER (ORDER BY Delivery_time) AS Difference
FROM swiggy_data

--11.Find biggest price difference between consecutive restaurants within each area
SELECT Area, Restaurant, Price,
       Price - LAG(Price) OVER (PARTITION BY Area ORDER BY Price) AS Price_Diff
FROM swiggy_data
