
-------------------------------------------------------------------Group Members--------------------------------------------------------------------
/*

       ------------------------------------------------------------------------------------------------------

       ------------------------------------------------------------------------------------------------------

	    //							         SECTION:-1                                                                   // 

        //																								                  //

		//			NUMBER				NAME                                 ID                                 Group     //

		//			  1.           Iman Nesredin                         ugr/30708/15                              2      //

		//			  2.           Fetya Yusuf                           ugr/30532/15                              1      //                      

		//			  3.           Beza Bekele                           ugr/30299/15                              1      //

		//			  4.           Siham Qasim                           ugr/25982/14                             Add     //

		//			  5.          Betelehm Haile                         ugr/30645/15                               1                              //

	      
		------------------------------------------------------------------------------------------------------

		------------------------------------------------------------------------------------------------------

																				Submmited To:- Instructor Getnet Yilma

																				Submmision Date:- september 20/2023



*/





---------------------------------------------------------------------------------------------------------------------------------------------------------------

Create database Online_Shopping_Platform 
Use Online_Shopping_Platform 

-- Create tables for entities
CREATE TABLE Online_Shopping(
    Online_ShoppingID INT PRIMARY  KEY, 
    Online_Shopping_name VARCHAR(50),
    Online_Shopping_Description VARCHAR(255)
);


CREATE TABLE Customers (
    CustomerID INT CONSTRAINT CI_pk PRIMARY KEY,
    FirstName VARCHAR(15),
    LastName VARCHAR(15),
    Email VARCHAR(50) UNIQUE,
    Address VARCHAR(50),
    PhoneNumber VARCHAR(10),
	BankAccountID INT ,
    FOREIGN KEY (BankAccountID) REFERENCES BankAccount(BankAccountID)
);


CREATE TABLE Sellers (
    SellerID INT CONSTRAINT SI_pk PRIMARY KEY,
    SellerName VARCHAR(50),
    SellerContact VARCHAR(50),
    SellerAddress VARCHAR(50),
    SellerBankAccountID INT,
    FOREIGN KEY (SellerBankAccountID) REFERENCES BankAccount(BankAccountID)
);
select * from Customers ;

CREATE TABLE BankAccount (
    BankAccountID INT CONSTRAINT BK_pk PRIMARY KEY,
    BankName VARCHAR(50),
    AccountNumber VARCHAR(20),
    AccountHolderName VARCHAR(50)
);


CREATE TABLE Product (
    ProductID INT CONSTRAINT PI_pk PRIMARY KEY, 
    SellerID INT CONSTRAINT SI_fk FOREIGN KEY (SellerID) REFERENCES Sellers(SellerID),
    ProductName VARCHAR(105),
    Description VARCHAR(255),
    Price INT ,
);

CREATE TABLE Payment (
    PaymentID INT CONSTRAINT Py_pk PRIMARY KEY,
    PaymentAmount DECIMAL(10,2),
    PaymentMethod VARCHAR(20),
    BankAccountID INT CONSTRAINT BK_fk  FOREIGN KEY (BankAccountID) REFERENCES BankAccount(BankAccountID)
);

CREATE TABLE Orders (
    OrderID INT CONSTRAINT OI_pk PRIMARY KEY,
    OrderStatus VARCHAR(50),
    CustomerID INT CONSTRAINT CI_fk FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    SellerID INT CONSTRAINT Se_fk FOREIGN KEY (SellerID) REFERENCES Sellers(SellerID),
    PaymentID INT CONSTRAINT Py_fk FOREIGN KEY (PaymentID) REFERENCES Payment (PaymentID)

    );


CREATE TABLE Order_Detail(
    OrderID INT CONSTRAINT OI_fk FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    OrderDate DATE,
    Quantity INT,
    TotalPrice INT, 
    );


CREATE TABLE Cart (
    CartID INT,
    CustomerID INT CONSTRAINT C_fk FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    ProductID INT CONSTRAINT P_fk FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    Quantity INT,
);

CREATE TABLE Broker (
    BrokerID INT PRIMARY KEY,
    BrokerName VARCHAR(255),
    BrokerContact VARCHAR(255),
);
CREATE TABLE Broker_details (
     Price VARCHAR (15) PRIMARY KEY, 
     BrokerCommissionRate VARCHAR (15)
);
CREATE TABLE Government (
    GovernmentID INT PRIMARY KEY,
    GovernmentName VARCHAR(255),
    RegulationDetails VARCHAR(255)
);
CREATE TABLE Goverment_details (
     Product_Price VARCHAR  (15) PRIMARY KEY, 
     TaxRate VARCHAR (15)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    SellerID INT,
	FOREIGN KEY (SellerID) REFERENCES Sellers(SellerID),
    ProductID INT CONSTRAINT PI_fk FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    QuantityInStock INT,
    WarehouseLocation VARCHAR(100),
    InventoryDate DATE,
    
);

--Add foreign keys for relationships 

ALTER TABLE Product
ADD  BrokerID int,
FOREIGN KEY (BrokerID) REFERENCES Broker(BrokerID);

ALTER TABLE Sellers 
ADD BrokerID int,
FOREIGN KEY (BrokerID) REFERENCES Broker(BrokerID);

ALTER TABLE Product
ADD GovernmentID int, FOREIGN KEY (GovernmentID) REFERENCES Government(GovernmentID);
INSERT INTO Online_Shopping VALUES (525526, 'Online_Shopping  for Building Materials ', 'It consists of supply for constructions and building materials with best qualities ');

INSERT INTO Customers (CustomerID, Firstname, LastName, Email, Address , PhoneNumber , BankAccountID)
VALUES

--(001, 'Betelhem', 'Haile', 'casruch78@gmail.com',  'Mexico' , '0480874468', NULL),
(002, 'Iman ', 'Nesredin', 'cludon8@wikia.com', 'Abo', '0490874568' , NULL),
(003, 'Fetya ', 'Yusuf' , 'rands97@gmail.com ', 'kara', '0480004468' , NULL),
(004, 'Beza' ,'Bekele', 'ramich@yahoo.com ', 'ketema', '0489809489' , NULL),
(005, 'Betelhem', ' Abisa', 'yuio66@gmail.com ', 'Adama', '0780874468' , NULL),
(006, 'Siham ' ,'Kassim', 'casr56@census.gov',  'Kolfe', '0780874468' , NULL),
(007, 'Solomon' ,' Wondimu', 'dertg@github.io', 'sengatera' , '0478532356', NULL),  
(008, 'Birtukan', ' Habte','tyiij6@outlook.com' , 'dono' ,'0477888999', NULL),  
(009, 'Alemayehu',' Tadesse', 'etenesh32moges@ yahoo.com' ,' yuqi', '041222333', NULL),
(010, 'Etenesh',' Moges', 'etnh32moges@ yahoo.com', 'Saris', '044555666', NULL),
(011, 'Belaynesh', ' Bekele', 'tenesh32moges@ yahoo.com', 'Gurdishola', '0777888999',  NULL),
(012 ,'Dawit', ' Kassa', 'dave22kassa@github.io', 'Piassa', '0111222333',  NULL),
(013, 'Muluken', ' Tefera','muletefra@gmail.com', 'Bole', '0444555666', NULL),
(014, 'Meseret', ' Yohannes', 'yohannesmeseret@outlook.com', 'kera', '0743288999', NULL),
(015, 'Hirut', ' Alemu','etenh32moges@ yahoo.com', 'Nekemt', '0111222333',  NULL),
(016, 'Fikadu', ' Demissie', 'fikadudemissie@cencus.gov', 'Harer','0444555666',  NULL),
(017, 'Teshome', 'Tessema', 'teshome14tessema@yahoo.com', 'kela', '0777888999', NULL),
(018, 'Ephrem', 'Tilahun', 'ephremtile@cencus.gov', 'Sendafa', '0111222333',  NULL),
(019, 'Tsion', ' Mekonnen', 'etene32moges@ yahoo.com', 'Dilla', '0444555666', NULL),
(020, 'Mengistu', ' Abate', 'abate99menge@gmail.com', 'Dirredawa', '0887888999',  NULL);



INSERT INTO Sellers (SellerID, SellerName, SellerContact, SellerAddress, SellerBankAccountID , BrokerID )
VALUES
 (101, 'Esubalew Tilahun', 039888999, 'betel',  NULL, 39),
  (102, 'Hiwot Zewdu', 0111222333, 'Sengatere',  NULL,38),
  (103, 'Temesgen Lemma', 0444555666, 'Jemo',  NULL, 38),
  (104, 'Yodit Tadesse', 0777888999, 'Adama',  NULL, 39),
  (105, 'Biruk Asfaw', 0111272333, NULL,  NULL, 40),
  (106, 'Tsega Solomon', 0222555666, 'Bole', NULL, 41),
  (107, 'Birtukan Hailu', 0777866999, 'Merkato', NULL, 42),
  (108, 'Ermias Kebede', 0111232333, 'Asko',  NULL, 40),
  (109, 'Lemlem Tsegaye', 0444655686, 'Lebu',  NULL, 40),
  (110, 'Asefa Mulu', 0772828999, 'Harer',  NULL, 39);

INSERT INTO Bank_Account (BankAccountID, BankName, AccountNumber, AccountHolderName)
VALUES
(27689, ' Commercial Bank', 10008373, 'Mingstu Abate'),
--(69432, 'Bank of Abissinia',  98362018, 'Asefa Mulu'),
--(05431, 'Commercial Bank', 10005372, 'Lemlem Tsegaye'),
--(23336, 'Awash Bank', 753419, 'Esubalew Tilahun'),
--(90273, 'Birhan Bank', 6109373, 'Biruk Asfaw'),
--(20987, 'Oromia Bank', 342610, 'Birtukan Hailu'),
(10168, 'Bank of Abissinia',96220173, 'Alemayehu Tadesse'),
(26385, ' Commercial Bank', 100003125,'Tsion Mekonnen'),
(22042, 'Bank of Abissinia', 524271889, 'Hirut Alemu'),
(25736, ' Commercial Bank', 100056982, 'Ephrem Tilahun'),
(19987, 'Abay Bank', 9267362, 'Dawit Kassa'),
(79066, 'Zemen Bank', 0092872, 'Siham Kassim'),
(21345, ' Commercial Bank', 100021890, 'Meseret Yohannes'),
(68907, 'Nib Bank', 2251868, 'Betelhem Abisa'),
(18915, 'Amhara Bank', 42018519, 'Birtukan Habte'),
(10079, ' Commercial Bank', 1000709311, 'Solomon Wondimu'),
(28291,'Amhara bank ',09758788,'Betelehem Haile'),
(78002,'Amhara bank ',09751088,'Iman Nesredin'),
(18993,'Amhara bank ',097590088,'Fetiya Yusuf'),
(17569,'Amhara bank ',09758708,'Etenesh Moges'),
(17698,'Amhara bank ',09758738,'Belaynesh Bekele'),
(20475,'Amhara bank ',09758728,'Muluken Tefera'),
(24532,'Hijra bank ',09758733,'Teshome Tesema'),
(23634,'Hijra bank ',09758788,'Fikadu Demese');
--(56732, 'Hijra bank ',09758788,'Hiwot Zewdu'),
--(67932,'Hijra bank ',09758788,'Temsegen Lema'),
--(51431,'Hijra bank ',09758788,'Yodit Taddese'),
--(26390,'Hijra bank ',09758788,'Ermiyas Kebede');


INSERT INTO Product(ProductID, SellerID, ProductName,Description, Price, BrokerID, GovernmentID)
VALUES
(12, 101, 'MG Gypsum', 'For chack' ,300, 40 ,34688),
(13, 102, 'Dangote cement', 'for bonding stone', 1750, 38, 346868 ),
(14, 101, 'Nfasilk paint', 'for painting', 900, 40, 346868),
(15, 103, 'kokeb paint', 'for painting', 800, 38,346868 ),
(16, 102, 'key', 'for protection', 300, 38, 56732),
(17, 104, 'tin', 'for protection from sun and rain', 900, 39, 346868 ),
(18, 104, 'Nail', 'for bonding tin and wood', 200, 39, 346868 ),
(19, 105, 'Bulb', 'for light', 100, 40, 346868 ),
(20, 106, 'Sand','for cement' ,1000, 41,346868 ),
(21, 102, 'Muger cement','for building' ,1650, 38, 346868 ),
(22, 109, 'JR Gypsum','for me', 300, 40,346868 ),
(23, 109, 'Hammer','with nail', 300, 40, 346868 ),
(24, 107, 'Wood', 'for furniture',1000, 42, 346868 ),
(25, 108, 'Dril','for peircing' ,6500, 40, 346868 ),
(26, 108, 'Sprinkle','for paint' ,1000, 40,346868 ),
(27, 110, 'Stone','very strong' ,7000, 39,346868 ),
(28, 110, 'Ceramic','floor', 500, 39, 346868 ),
(29, 110, 'Granight', 'biuld',10000, 39,346868 ),
(30, 110, 'window', 'outside',5000, 39,346868 ),
(31, 105, 'colla','for attaching', 500, 40, 346868 ),
(33, 106, 'cleat','xxxy' ,5000, 41,346868 ),
(34, 106, 'Blocket', 'xyy',1000, 41, 346868 ),
(35, 104, 'Brush','yyy', 200,  39, 346868 ),
(36, 101, 'Hand saw','pppppp', 300, 40 ,346868),
(37, 103, 'Electric cable' ,'zzzz',3000, 38, 346868 );


INSERT INTO Orders (OrderID, OrderStatus, CustomerID, SellerID, PaymentID)
VALUES
(12,  'Pending', 009, 6789),
(13,  'Pending', 007, 8889),
(14,  'Processed', 008, 6229),
(15, 'Processed', 010, 6744),
(16, 'processed', 011, 6300),
(17, 'Shiping', 001, 2903),
(18,  'Shiping', 002, 7649),
(19,  'Pending', 003, 7302),
(20,  'Shiping', 004, 2163),
(21,  'Pending', 005, 8879),
(22, 'Processed', 006, 0243),
(23,  'Completed', 012, 9235),
(24, 'Completed', 013, 1326),
(25, 'Completed', 014, 7234),
(26, 'Shiping', 015, 0026);

INSERT INTO Order_Detail(OrderID ,OrderDate, Quantity, TotalPrice )
VALUES
(13,02-05-2024, 5, 899),
(14,01-01-2024, 50, 209),
(12,02-05-2024, 100, 400),
(15,01-07-2024,  7, 300),
(16,22-05-2024,  45, 199),
(17, 11-04-2024, 30, 900),
(18, 11-04-2024, 15, 200),
(19, 11-04-2024, 20, 350),
(20, 11-04-2024, 35, 399),
(21, 11-04-2024, 33, 259),
(22, 11-04-2024, 25, 199),
(23, 11-04-2024, 5, 599),
(24, 11-04-2024, 40, 399),
(25, 11-04-2024, 19, 399),
(26, 11-04-2024, 8,299);



INSERT INTO Broker (BrokerID, BrokerName, BrokerContact)
VALUES
  (38, 'Sara Haile', 111222333),
  (39, 'Hana Birhanu', 444555666),
  (40, 'Tewodros Negash', 777888999),
  (41, 'Meron Alemayehu', 111222333),
  (42, 'Yohannes Mekuriya', 444555666);

INSERT INTO Government Values (346868 ,' Commerce and Tax Minister' , 'Just regulationsthat apply for maintaining constant e-commerce');

INSERT INTO Inventory (InventoryID, SellerID, ProductID, QuantityInStock, WarehouseLocation, InventoryDate)
VALUES
(1, 109, 23, 100, 'Lebu', '08-03-2021'),
(2, 109, 22, 200, 'Lebu', '09-07-2024'),
(3, 109, 22, 300, 'Lebu', '10-03-2022'),
(4, 106,  20, 300, 'Bole', '09-03-2020'),
(5, 106, 20, 200, 'Bole', '09-11-2023'),
(6, 108, 25, 100, 'Asko', '02-04-2024'),
(7, 108, 26, 200, 'Asko', '20-02-2024'),
(8, 108, 12, 25, 'Asko', '09-01-2023'),
(9, 107, 24 ,377, 'Merkato', '08-04-2023'),
(10, 107, 24, 122,'Merkato', '09-05-2024'),
(10, 107, 24, 233,'Merkato', '07-04-2024'),
(11, 106, 20, 200, 'Bole', '09-05-2022'),
(12, 110, 27, 300, 'Harer', '10-12-2023'),
(13, 110, 28, 200, 'Harer', '10-12-2024'),
(14, 110, 29, 100, 'Harer', '10-12-2022'),
(15, 110, 30, 200, 'Harer', '10-12-2022'),
(16, 102, 16, 100, 'Sengatera','21-09-2022'),
(17, 102, 13, 500, 'Sengatera', '12-05-24'),
(18, 102, 21, 300, 'Sengatera', '19-11-22'),
(19, 103, 15, 1000, 'Jemo', '11-05-2024'),
(20, 103, 15, 500, 'Jemo', '18-06-2024'),
(21, 103, 15, 2000, 'Jemo', '01-09-2024'),
(22, 101, 12, 1000, 'YYYY', '01-09-2024'),
(23, 101, 14, 50, 'OOOO', '01-12-2023'),
(24, 101, 12, 2000, 'JJJJ', '05-09-2024'),
(25, 104, 17, 1000, 'Adama','03-10-2022'),
(26, 104, 18, 2000, 'Adama', '07-11-2023'),
(27, 104, 18, 3000, 'Adama', '09-03-2024'),
(28, 105,19, 1000, 'III', '01-12-2023'),
(29, 105,19, 2000, 'KKKK', '05-01-2024'),
(30, 105,19, 500, 'OOOI', '03-03-2024');


/* 
select with a WHERE clause
	 selecting specific unit which is unique and updating or doing anything to it.
*/

SELECT * FROM Customers WHERE CustomerID = 006;
SELECT * FROM Product WHERE ProductID = 18;
SELECT * FROM Sellers WHERE SellerName = 'Chaltu Kebede ';

--select with aggregate function:
--It is used for aggregating the functions calls one on top of the other one 

SELECT SellerID, SUM(Price) AS Total_Item_Sales FROM Product GROUP BY SellerID; 
 /* well this adds everything inside the Product Price and give us the total sum as total_itme_Sales that one seller can get fom its product
*/

--And this return the number of Products the avg ,max, min and the total price for each SellerID 
SELECT SellerID, COUNT(*) AS Num_of_Products ,
ROUND (AVG(Price) , 0) AS avg_price,
MIN(Price) AS min_price,
MAX(Price) AS max_price,
SUM(Price) AS total_price 
FROM Product GROUP BY SellerID
ORDER BY Num_of_Products DESC;

/*
one of complex joins 
 selecting tables using INNER JOIN
        the inner join is just a filter which insures only the matching sets from both the customer and order gets to pass and the where filters it further more
		here we use I as an alias(providing temporary alternative name)for the Inventory table, and S is an alias for the Sellers table naming convention 

*/

SELECT S.SellerID, S.SellerName , I.WareHouseLocation FROM Sellers S  INNER JOIN Inventory I ON I.SellerID = S.SellerID ;/*this will take all Sellers and Inventory with macthing id */
	
	/*If we want to join the Sellers table (S) with the Inventory table (I) using the common column SellerID. This means that the query will match rows from both tables where the SellerID values are the same
.*/

SELECT C.CustomerID C.CustomerName, O.OrderID FROM Customers C LEFT JOIN Order O ON C.CustomerID = O.CustomerID;/*this will take all customers which matches with the order specific id based on the id*/

		/*the LEFT JOIN retrieves all rows from the Customers table and the matching rows from the Order table based on the CustomerID column. If a customer does not have any orders, the OrderID column will be NULL.
		*/
/*
one of complex joins 
 joining using Subquery 
 */

 SELECT A.OrderID, A.ProductName, A.UnitPrice, O.OrderStatus FROM Cart_Item  A INNER JOIN Order O ON  A.OrderID =O.OrderID 
 WHERE A.UnitPrice > (SELECT AVG(UnitPrice) FROM Cart_Item);
/*so the sub query filters  the average price from the Cart_Item that is going to be joined with the order table 
*/
            
/*our group has decided to focus on specific part of the transaction process which we will list below 
	1. Placing an Order:-  done by the customer 
..we decided to make the customer named customer 1 lets say customer 001 orders certain product of item quntity 2 then that means that product is to be placed on customers cart so at the same time this updates the data in the cart and order ..this being the cart having  product and the order incremented or updated
*/
begin TRANSACTION Placing_an_Order;
	DECLARE @CustomerID INT = 006; 
	DECLARE @OrderID INT = 43; /*this help us in code reusabilty but we could have just inserted the values with out declaring them*/
             	DECLARE @newOrderID INT;
-- Disable foreign key constraints
ALTER TABLE Cart NOCHECK CONSTRAINT C_fk;
ALTER TABLE Cart NOCHECK CONSTRAINT P_fk;

ALTER TABLE Orders NOCHECK CONSTRAINT CI_fk;

		
INSERT INTO Orders (OrderID, OrderStatus ,CustomerID, PaymentID) VALUES (@OrderID, 'Pending',  @CustomerID, null );/*inserting it into the order*/

INSERT INTO Cart (CartID, CustomerID, ProductID, Quantity) VALUES (1412, @CustomerID, 39, 3);

	-- Re-enable foreign key constraints

ALTER TABLE Cart CHECK CONSTRAINT P_fk;
ALTER TABLE Orders CHECK CONSTRAINT CI_fk;


COMMIT TRANSACTION Placing_an_Order;
 select * from Orders;
 --or we could select the exact coloumn or attribute we have updated individually
 select * from Orders  where OrderID=43;
/*
	2.Order Completion
Once the an item is ordered, the product is added to the customer's cart and the customer is ready to pay, and this take us to the 3rd step which is 


	3.Payment
The payment is prepared based on the order details and presented to the customer
The Payment table is updated with the payment information
*/
begin TRANSACTION Payments 
	DECLARE @BankAccountID INT = 1; 
	--DECLARE @OrderID INT = 101; 
	DECLARE @TotalPrice INT= 500;
    DECLARE @PaymentID  INT =70;
	DECLARE @PaymentMethod VARCHAR(50) ='Commercial Bank'; 
       -- Disable foreign key constraints
ALTER TABLE Order_Detail NOCHECK CONSTRAINT OI_fk;
ALTER TABLE Payment NOCHECK CONSTRAINT BK_fk;

      -- Calculate the total price including tax
DECLARE @PaymentAmount DECIMAL(10, 2); 
SET @PaymentAmount = @TotalPrice * 1.1; -- Assuming 10% tax rate

              -- Insert the Order_Detail information

INSERT INTO Order_Detail (OrderID, OrderDate, Quantity, TotalPrice) VALUES (43, '12-12-2023', 10, @TotalPrice);

	-- Insert the bill details

INSERT INTO Payment (PaymentID,  PaymentAmount,  PaymentMethod,  BankAccountID) VALUES (@PaymentID, @PaymentAmount, @PaymentMethod, @BankAccountID);

	-- Re-enable foreign key constraints
ALTER TABLE Order_Detail CHECK CONSTRAINT OI_fk;
ALTER TABLE Payment CHECK CONSTRAINT BK_fk;
COMMIT TRANSACTION Payments;

SELECT *FROM Payment;
/* 4. Paying tax for government and commission for the broker
For every product government acts on it and collect taxes ,so the government detail table is updated. Similarly it goes to Broker
*/
begin TRANSACTION;
	DECLARE @ProductID INT= 21; 
    DECLARE @SellerID INT= 119; 
    DECLARE @BrokerID INT=41; 
	DECLARE @Price INT = 150;


	-- Disable foreign key constraints
ALTER TABLE ProductID NOCHECK CONSTRAINT PI_fk;
ALTER TABLE BrokerID NOCHECK CONSTRAINT FK_Product_Broker;
ALTER TABLE GovernmentID NOCHECK CONSTRAINT  FK_Product_Government;
ALTER TABLE SellerID NOCHECK CONSTRAINT SI_fk;

	-- Calculate the government TaxRate 
DECLARE @taxrate DECIMAL(10, 2); 
SET @taxrate = @Price * 0.15; -- Assuming 15% tax rate

DECLARE @commissionrate DECIMAL(10, 2); 
SET @commissionrate = @Price * 0.05; -- Assuming 5% commission rate

	-- Insert the Product information
INSERT INTO Product (ProductID, SellerID, ProductName,Description, Price, BrokerID,GovernmentID)  VALUES (@ProductID, @SellerID, 'Glue',  'sticky for wood fixing' , @Price,  @BrokerID,  346868 );

	-- Insert the Government_Details

INSERT INTO Goverment_details (Product_Price, TaxRate) VALUES ( CONVERT(VARCHAR(10), @taxrate)+ 'birr', '15%');
--concinate birr with a converted string of length 10 price no and then in place of taxrate we add the literal 15% 

INSERT INTO Broker_Details(Price, BrokerCommissionRate) VALUES ( CONVERT(VARCHAR(10), @commissionrate)+ 'birr', '5%');
--concinate birr with a converted string of length 10 price no and then in place of taxrate we add the literal 5% 

	-- Re-enable foreign key constraints
--ALTER TABLE ProductID CHECK CONSTRAINT PI_fk;
ALTER TABLE BrokerID CHECK CONSTRAINT FK_Product_Broker;
ALTER TABLE GovernmentID CHECK CONSTRAINT  FK_Product_Government;
ALTER TABLE SellerID CHECK CONSTRAINT SI_fk;
COMMIT TRANSACTION;
SELECT @taxrate AS TaxRate;
SELECT @commissionrate AS BrokerCommissionRate:
/* 5. Quantity in stocks 
Meaning the overall process happening in the Online_Shopping which is after the customer finishes his payments the Inventory reduces the stock quantity of products used in order and product quantity in Cart_Item is updated 
*/

begin TRANSACTION;
	--DECLARE @OrderID INT = 31; 
	DECLARE @quantityUsed INT = 20; 
--If our customer  has ordered cart  item of quantity  20 so those will be decreased from the Online_Shopping stock
UPDATE Cart_Item SET Quantity = Quantity - @quantityUsed WHERE OrderID = @OrderID;
COMMIT TRANSACTION;

/* Creating view 
for this we need to create the batch first to separate them from the other views and procidures, and we use GO statement to the new batch.
*/
	--customer Information

GO
CREATE VIEW CustomerInformationView AS SELECT c.customerID, c.FirstName, c.Address,  b.BankName FROM Customers c 
JOIN BankAccount b ON c.BankAccountID= b.BankAccountID; 
		
                --customer order information view

GO
CREATE VIEW CustomerOrderView AS SELECT C.CustomerID ,C.FirstName, O.OrderID FROM Customers C LEFT JOIN Orders O ON C.CustomerID = O.CustomerID;
    
         --Product  information 

GO
CREATE VIEW ProductInformationView AS SELECT p.ProductName , p.Description, p.Price,  I.QuantityInStock FROM Product p JOIN Inventory I ON I.ProductID= p.ProductID;


--using the same method by starting the batch and then creating the view we can make a view of all possible outcomes
         
/*
	b) Create a Parameterized Procedure to 
*/
GO
	-- Get Customer Orders
CREATE PROCEDURE GetCustomerOrders @customerID INT AS
BEGIN
    SELECT c.CustomerID, c.FirstName,  c.LastName, c.PhoneNumber, o.OrderID, o.OrderStatus 
    FROM Customers c
    JOIN Orders o ON o.CustomerID =c.CustomerID 

   -- JOIN Cart_Item A  ON A.OrderID = o.OrderID 
    WHERE c.CustomerID = @customerID;
END;
	--to execute this procedure 
EXEC GetCustomerOrders @customerID = 113;

	--  Update Stock Quantity

GO
CREATE PROCEDURE UpdateStockQuantity @InventoryID INT, @quantity INT AS
BEGIN
    UPDATE Inventory SET QuantityInStock = QuantityInStock - @quantity WHERE InventoryID= @InventoryID;
END;

	--to execute this procedure 

EXEC UpdateStockQuantity @InventoryID= 35, @quantity = 55;

/*


To  create a trigger for audit Information a table is needed to show our audit info and that is to be created first ,so we first need to ensure that the AUDIT_LOG table is created before creating the trigger. 

*/

-- Create a new batch

GO
-- Create the AUDIT_LOG table

CREATE TABLE AUDIT_LOG (

    LogID INT IDENTITY(1,1) PRIMARY KEY,
    Event VARCHAR(255),
    Timestamp DATETIME DEFAULT GETDATE()
);
--then here we can create the trigger information
GO
-- Create the trigger for Audit information
CREATE TRIGGER AuditTrigger ON Customers AFTER INSERT AS
	BEGIN
		INSERT INTO AUDIT_LOG (Event) SELECT 'New customer added: ' + FirstName FROM inserted;
	END;
/*
to specify user roles which means to protect our users interest we need to apply a theory 
commonly known as autherization which basicaly means that some people are authorizaed to 
see things and others are not this keeps confidentiality and security in check 
with the front end attached to this it could have been an amazing thing to see but since we are 
only learning the database managment system here and the class is data base we will try our 
best to show  the backend side of it for this 
        1st) we need to create the roles with a name or variable 
         2nd) we need to grant a permision to that variable specific user we might grant this 
permission based on
a)specific table which our group will show in a few lines below 
b)based on a view just like we tried to show you on the above code
c)based on procedure 
d)we can even allow a user to alter the whole databse (but this isnt done on the backend its 
shown in the user friendly access which is the front end but our group is not going to show that 
here since sql is a backend server database)
...but remember we can always take that role away by using method revoke
    which we will show after a few lines  
	3rd)we need to assign that specific varible in which we named our role 
an actual user name 

*/
--Create the role
CREATE ROLE Seller; -- 1st step
CREATE ROLE OnlineShoppingManager;
CREATE ROLE CustomerUser;

-- Create logins for the users
--this is how you create a login so that you can create users with it later

CREATE LOGIN Iman WITH PASSWORD = '123';
CREATE LOGIN Fetya WITH PASSWORD = '123';
CREATE LOGIN Betelhem WITH PASSWORD = '123';
CREATE LOGIN Siham WITH PASSWORD = '123';
CREATE LOGIN Beza WITH PASSWORD = '123';
CREATE LOGIN Sumeya WITH PASSWORD = '123';

-- Create users
CREATE USER Iman;
CREATE USER Fetya;
--this guys creates the login and then alter on the below part actually adds them to role
CREATE USER Beza;
CREATE USER Siham;
CREATE USER Betelhem;


	-- Grant necessary permissions to the table restaurant
/*but this is granting it on the table only*/

GRANT INSERT ON Product TO Seller; --2nd step
-- we could also do this on for table customer specifying who is able to access it

GRANT SELECT ON Customers TO CustomerUser;
GRANT SELECT,INSERT, UPDATE, DELETE ON Customers TO OnlineShoppingManager;
--so that the manager have full access to the Online_Shopping_Platform 

           -- Grant necessary permissions to the View ProductInformationView 
/*but this is granting it on the View only no where else*/

GRANT SELECT ON ProductInformationView TO OnlineShoppingManager;

          -- Grant necessary permissions to the View CustomerInformationView

GRANT SELECT ON CustomerInformationView TO CustomerUser;

            -- Grant necessary permissions to the View CustomerOrderView

GRANT SELECT ON CustomerOrderView TO Seller;	--so that the Seller knows everything about the Customers order

         -- Grant necessary permissions to the Procedures
/*but this is granting it while the Procedures are occuring only no where else*/
           -- Grant necessary permissions to the Procedures GetCustomerOrders
GRANT EXECUTE ON GetCustomerOrders TO Seller;
 --so that the Seller gets the orders while this ordering procedure is happening

           -- Grant necessary permissions to the Procedures UpdateStockQuantity

GRANT EXECUTE ON UpdateStockQuantity TO OnlineShoppingManager;
 --this way the manager has full access to all query during the procedure

               -- Grant necessary permissions to the Database as whole 
/*this granting permission or authorization through the whole database meaning everywhere*/
--this authorization is recommended only to the admin which in our groups case the resturant
-- manager or a trusted person only to keep confidentiality 
GRANT CREATE TABLE, CREATE VIEW, CREATE PROCEDURE TO OnlineShoppingManager;
 --this is declaring there is nothing that the manager couldnt do
/*
but as a programers its usual to make a mistake so if we make a mistake or a person is not 
worthy of that authorization anymore based on our  users interest we can revoke that user from 
there permission or position and we can do that using the below
*/
--	REVOKE INSERT, UPDATE, DELETE ON CUSTOMER FROM OnlineShoppingManager ;
--is the manager doesnt need that permission anymore
	-- Assign a user to the role 
-- Assign existing logins to roles
ALTER ROLE Seller ADD MEMBER Siham;--3rd step
ALTER ROLE CustomerUser ADD MEMBER Iman;
ALTER ROLE CustomerUser ADD MEMBER Fetya;
--ATER ROLE OnlineShoppingManager ADD MEMBER Betelhem;
-- this will cause an error because its permission is revoked its just here as a sample
ALTER ROLE CustomerUser ADD MEMBER Beza;

SELECT * FROM sys.tables;
--to see all the tables in the database 
