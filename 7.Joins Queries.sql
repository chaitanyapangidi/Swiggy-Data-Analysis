/*==============================================================
    Script Name   : 7.Join Queries.sql
    Purpose       : Demonstrate JOIN queries using Swiggy dataset
    Description   : Joins Swiggy_Data with Swiggy_Offers table to show 
                    promotions for restaurants using different JOIN types.
    Created On    : 28-Oct-2025
    Created By    : Chaitanya Pangidi
==============================================================*/
--Show restaurant with its delivery partner
SELECT s.Restaurant, s.Area, d.PartnerName
FROM Swiggy_data s
INNER JOIN DeliveryPartner d
ON s.ID = d.ID;

--Show all restaurants even if partner not assigned
SELECT s.Restaurant, s.City, d.PartnerName
FROM swiggy_data s
LEFT JOIN DeliveryPartner d
ON s.ID = d.ID;

--Show all delivery partners even without mapped restaurant
SELECT d.PartnerName, s.Restaurant
FROM swiggy_data s
RIGHT JOIN DeliveryPartner d
ON s.ID = d.ID;

--Restaurants in same Area with same Partner
SELECT A.Restaurant AS R1, B.Restaurant AS R2, A.Area, d.PartnerName
FROM swiggy_data A
JOIN swiggy_data B ON A.Area = B.Area AND A.ID <> B.ID
JOIN DeliveryPartner d ON A.ID = d.ID;

--Count restaurants served by each partner
SELECT d.PartnerName, COUNT(s.ID) AS Total_Restaurants
FROM DeliveryPartner d
LEFT JOIN swiggy_data s ON s.ID = d.ID
GROUP BY d.PartnerName;

--Restaurants delivered by Active partner only
SELECT s.Restaurant, d.PartnerName, d.Status
FROM swiggy_data s
JOIN DeliveryPartner d ON s.ID = d.ID
WHERE d.Status = 'Active';

--Fastest delivering restaurants per partner
SELECT d.PartnerName, s.Restaurant, s.Delivery_time
FROM swiggy_data s
JOIN DeliveryPartner d ON s.ID = d.ID
ORDER BY d.PartnerName, s.Delivery_time;

--Rank restaurants by rating for each delivery partner
SELECT d.PartnerName, s.Restaurant, s.Avg_ratings,
       RANK() OVER (PARTITION BY d.PartnerName ORDER BY s.Avg_ratings DESC) AS RatingRank
FROM swiggy_data s
JOIN DeliveryPartner d ON s.ID = d.ID;

--Delivery performance category
SELECT s.Restaurant, d.PartnerName, s.Delivery_time,
CASE
    WHEN s.Delivery_time <= 50 THEN 'Fast'
    WHEN s.Delivery_time <= 60 THEN 'Moderate'
    ELSE 'Slow'
END AS Delivery_Category
FROM swiggy_data s
JOIN DeliveryPartner d ON s.ID = d.ID;
