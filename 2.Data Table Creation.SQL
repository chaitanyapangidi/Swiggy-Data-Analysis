/*==============================================================
    Script Name   : 2.Table Creation.sql
    Table Name    : Swiggy_Data
    Purpose       : To store Swiggy restaurant dataset for analysis
    Description   : Contains details such as restaurant name, 
                    location, price, ratings, food type, and delivery time
    Created On    : 28-Oct-2025
    Created By    : Chaitanya Pangidi
==============================================================*/
CREATE TABLE swiggy_data (
    id INT PRIMARY KEY,
    area VARCHAR(100),
    city VARCHAR(100),
    restaurant VARCHAR(200),
    price DECIMAL(10,2),
    avg_ratings DECIMAL(2,1),
    total_ratings INT,
    food_type VARCHAR(100),
    address VARCHAR(300),
    delivery_time VARCHAR(50)
);

ALTER TABLE swiggy_data
ALTER COLUMN food_type VARCHAR(255);

ALTER TABLE swiggy_data
DROP CONSTRAINT PK__swiggy_d__3213E83F3BADF964;


