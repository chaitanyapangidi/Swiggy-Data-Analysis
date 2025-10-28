/*==============================================================
    Script Name   : 4.Insert Data.sql
    Purpose       : Bulk insert Swiggy dataset into Swiggy_Data table
    Description   : Loads 17,354 rows from swiggy.csv containing 
                    restaurant details for analysis
    Created On    : 28-Oct-2025
    Created By    : Chaitanya Pangidi
==============================================================*/
BULK INSERT Swiggy_Data
FROM 'C:\TEMP\swiggy2.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);