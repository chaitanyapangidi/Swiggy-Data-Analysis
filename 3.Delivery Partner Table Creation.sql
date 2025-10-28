/*==============================================================
    Table Name   : DeliveryPartner
    Purpose      : Connection Between The Overall Data to Delivery partner
    Description  : Each record links a restaurant to a current offer.
                   Designed to be joined with the Swiggy_Data table 
                   using the Restaurant column to combine general 
                   restaurant details.
    Created On   : 28-Oct-2025
    Created By   : Chaitanya Pangidi
==============================================================*/
CREATE TABLE DeliveryPartner (
    PartnerID INT,
    ID INT, -- References Swiggy(ID)
    PartnerName VARCHAR(50),
    Contact VARCHAR(20),
    Status VARCHAR(20)
);

INSERT INTO DeliveryPartner VALUES
(1, 211,'Swiggy Genie','9990001111','Active'),
(2, 221,'Swiggy Delivery','9990002222','Inactive'),
(3, 246,'Zomato','9990003333','Active'),
(4, 248,'Swiggy Delivery','9990004444','Active'),
(5, 249,'Own Fleet','9990005555','Active');

