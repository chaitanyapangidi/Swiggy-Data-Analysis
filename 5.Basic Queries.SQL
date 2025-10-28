/*==============================================================
    Script Name   : 5.Basic Queries.sql
    Purpose       : Demonstrates basic SQL operations on Swiggy_Data
    Description   : Contains simple SELECT, WHERE, ORDER BY queries
                    for retrieving and filtering restaurant data
    Created On    : 28-Oct-2025
    Created By    : Chaitanya Pangidi
==============================================================*/
--1. READ ALL ROWS AND COLUMNS ?
SELECT * FROM swiggy_data

--2. Get all restaurants in a specific city?
SELECT restaurant ,city FROM swiggy_data
where city = 'Hyderabad'

--3.Find all restaurants in a particular area?
SELECT restaurant ,area FROM swiggy_data
where area = 'Banjara Hills'

--4.List all restaurants serving a specific food type?
SELECT restaurant ,food_type FROM swiggy_data
where food_type = 'Desserts '

--5.Get the average price of food items by restaurant.
SELECT restaurant,avg(try_cast(price as float)) as avgprice FROM swiggy_data
group by restaurant

--6.Find restaurants with average ratings above 4.5.
SELECT restaurant ,avg_ratings from swiggy_data
where avg_ratings > 4.5

--7.Get top 5 restaurants with the highest total ratings.
SELECT TOP 5 restaurant ,total_ratings from swiggy_data
order by total_ratings desc

--8.Count number of restaurants in each city.
SELECT city, COUNT(distinct restaurant) AS noofrestaurants from swiggy_data
group by city

--9.List restaurants with price range between 100 and 300?
SELECT restaurant,price from swiggy_data
where price between 100 and 300

--10.Find restaurants serving more than one food type.
SELECT restaurant,count(food_type) as nooffooditems from swiggy_data
group by restaurant
having count(food_type) > 1
order by nooffooditems 

--11.Get all restaurants sorted by average rating (descending).
SELECT restaurant,avg_ratings from swiggy_data
order by avg_ratings desc

--12.Find the cheapest restaurant in each city.
SELECT city,restaurant,min(price) as cheapestrestaurant from swiggy_data
group by restaurant,city


