-- Use this template for your se2222 term project
-- Before submission be sure that your file is named like [your_ID].sql
-- Name:Şinasi Ege Karataş
-- ID:18070006013
-- Short description of your scenario:...
-- (Minus 5 of total points if not included)

-- This system is a car dealership system that includes more than one car brand.This database system has AutoInfo, Model, Brand, AutoFeature,
-- Dealarship, DealarshipHasBrand,SalesRepresentative, SalesRepInfo, Customer and Sales tables.



-- 1. Create and use a schema for your project named SE2222_[your_ID]
CREATE SCHEMA SE2222_18070006013;
USE SE2222_18070006013;
-- 1. Definitions:
-- (15 points)
-- All table definitions of your project including any constraints
-- Before each table creation give a short explanation of the table

-- I created the AutoFeature table to keep the properties of the cars. I made the Serial No as the primary key to access these properties.
CREATE TABLE AUTOFEATURE (
SERIALNO INT NOT NULL,
VERSION VARCHAR(30),
FUEL VARCHAR(30),
GEAR VARCHAR(30),
CASE_SIZE VARCHAR(30),
ENGINE_POWER INT,
ENGINE_CAPACITY INT,
COLOR VARCHAR(30),
PRIMARY KEY(SERIALNO)
);

-- I created the Brand table to keep the brands of the cars. In this table, I took the primary key as auto-increment 
-- and used Unique as there will be one from each brand.
CREATE TABLE BRAND(
BRANDID INT NOT NULL AUTO_INCREMENT,
NAME VARCHAR(20),
PRIMARY KEY(BRANDID),
UNIQUE(NAME)
);

-- I created the Model table to keep the models of the cars. I took the ModelID as the primary key.
-- I used BrandID as a foreign key to access the brands of cars.
CREATE TABLE MODEL(
MODELID INT NOT NULL AUTO_INCREMENT,
BRANDID INT,
NAME VARCHAR(30),
PRIMARY KEY(MODELID),
FOREIGN KEY (BRANDID) REFERENCES BRAND (BRANDID) ON DELETE CASCADE
);

-- I created a table called AutoInfo to keep the vehicle information. I got the AutoID as the primary key.
-- I took the BrandID, ModelID and SerialNo as foreign key for the brand, model and serial number.
CREATE TABLE AUTOINFO(
AUTOID INT NOT NULL AUTO_INCREMENT,
BRANDID INT,
MODELID INT,
SERIALNO INT,
YEAR INT,
PRICE INT,
PRIMARY KEY(AUTOID),
FOREIGN KEY (BRANDID) REFERENCES BRAND (BRANDID) ON DELETE CASCADE,
FOREIGN KEY (MODELID) REFERENCES MODEL (MODELID) ON DELETE CASCADE,
FOREIGN KEY (SERIALNO) REFERENCES AUTOFEATURE (SERIALNO) ON DELETE CASCADE
);

-- I created a table called Dealarship for the dealer. 
-- I used it to see which model and how many. I used the ID as the primary key as auto-increment.
-- I got BrandID and ModelID as foreign keys.
CREATE TABLE DEALERSHIP(
ID INT NOT NULL AUTO_INCREMENT,
BRANDID INT,
MODELID INT,
NUMBER INT,
PRIMARY KEY(ID),
FOREIGN KEY (BRANDID) REFERENCES BRAND (BRANDID) ON DELETE CASCADE,
FOREIGN KEY (MODELID) REFERENCES MODEL (MODELID) ON DELETE CASCADE
);

-- I created the Sales Representative table for sales consultants' information.
CREATE TABLE SALESREPRESENTATIVE(
SALESREPID INT NOT NULL AUTO_INCREMENT,
NAME VARCHAR(20),
SURNAME VARCHAR (20),
PHONE VARCHAR(20),
BLOODGROUP VARCHAR(10),
BIRTHDATE VARCHAR(10),
ADDRESS VARCHAR(20),
SALARY INT,
PRIMARY KEY (SALESREPID),
UNIQUE(PHONE)
);

-- I created a Customer table to hold customer information.
CREATE TABLE CUSTOMER(
CUSTOMERID INT NOT NULL AUTO_INCREMENT,
NAME VARCHAR(20),
SURNAME VARCHAR(20),
PHONE VARCHAR(20),
ADDRESS VARCHAR(30),
PRIMARY KEY(CUSTOMERID),
UNIQUE(PHONE)
);

-- I created the Sales table for the sales made. 
-- I used the CustomerID, SalesRepID, AutoID and SerialNo as foreign keys to access customer, sales consultant, vehicle information
-- and features.
CREATE TABLE SALES(
SALESID INT NOT NULL AUTO_INCREMENT,
CUSTOMERID INT,
SALESREPID INT,
AUTOID INT,
SERIALNO INT,
DATE VARCHAR(30),
PRIMARY KEY(SALESID),
FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMER (CUSTOMERID) ON DELETE CASCADE,
FOREIGN KEY (SALESREPID) REFERENCES SALESREPRESENTATIVE (SALESREPID) ON DELETE CASCADE,
FOREIGN KEY (AUTOID) REFERENCES AUTOINFO (AUTOID) ON DELETE CASCADE,
FOREIGN KEY (SERIALNO) REFERENCES AUTOFEATURE (SERIALNO) ON DELETE CASCADE
);

-- 2. Insertions(Data manipulation):
-- (15 points)
-- For each table, add enough number of rows to make your queries in step three to produce meaningful result sets.

INSERT INTO AUTOFEATURE VALUES (1001,"Vision","Petrol","Manual","Sedan",125,1490,"White");
INSERT INTO AUTOFEATURE VALUES (1002,"Dream Multidrive S","Petrol","Automatic","Sedan",125,1490,"Grey");
INSERT INTO AUTOFEATURE VALUES (1003,"Flame","Petrol","Manual","Sedan",125,1490,"White");
INSERT INTO AUTOFEATURE VALUES (1004,"Elegance","Petrol","Automatic","Sedan",125,1597,"White");
INSERT INTO AUTOFEATURE VALUES (1005,"Executive+","Petrol","Automatic","Sedan",182,1498,"Dark Grey");
INSERT INTO AUTOFEATURE VALUES (1006,"Eco Elegance","Petrol","Automatic","Sedan",125,1597,"Grey");
INSERT INTO AUTOFEATURE VALUES (1007,"Essential","Petrol","Manual","Hatchback",75,1199,"Red");
INSERT INTO AUTOFEATURE VALUES (1008,"Edition","Diesel","Manual","Hatchback",102,1499,"Grey");
INSERT INTO AUTOFEATURE VALUES (1009,"Ultimate","Petrol","Automatic","Hatchback",130,1199,"Blue");

INSERT INTO BRAND (NAME) VALUES ("TOYOTA");
INSERT INTO BRAND (NAME) VALUES ("HONDA");
INSERT INTO BRAND (NAME) VALUES ("OPEL");

INSERT INTO MODEL (BRANDID,NAME) VALUES (1,"COROLLA");
INSERT INTO MODEL (BRANDID,NAME) VALUES (2,"CIVIC");
INSERT INTO MODEL (BRANDID,NAME) VALUES (3,"CORSA");


INSERT INTO AUTOINFO(BRANDID,MODELID,SERIALNO,YEAR,PRICE) VALUES (1,1,1001,2021,211700);
INSERT INTO AUTOINFO(BRANDID,MODELID,SERIALNO,YEAR,PRICE) VALUES (1,1,1002,2021,284600);
INSERT INTO AUTOINFO(BRANDID,MODELID,SERIALNO,YEAR,PRICE) VALUES (1,1,1003,2021,288200);
INSERT INTO AUTOINFO(BRANDID,MODELID,SERIALNO,YEAR,PRICE) VALUES (2,2,1004,2021,303400);
INSERT INTO AUTOINFO(BRANDID,MODELID,SERIALNO,YEAR,PRICE) VALUES (2,2,1005,2021,352800);
INSERT INTO AUTOINFO(BRANDID,MODELID,SERIALNO,YEAR,PRICE) VALUES (2,2,1006,2021,308700);
INSERT INTO AUTOINFO(BRANDID,MODELID,SERIALNO,YEAR,PRICE) VALUES (3,3,1007,2021,176900);
INSERT INTO AUTOINFO(BRANDID,MODELID,SERIALNO,YEAR,PRICE) VALUES (3,3,1008,2021,212600);
INSERT INTO AUTOINFO(BRANDID,MODELID,SERIALNO,YEAR,PRICE) VALUES (3,3,1009,2021,283900);

INSERT INTO DEALERSHIP(BRANDID,MODELID,NUMBER) VALUES(1,1,100);
INSERT INTO DEALERSHIP(BRANDID,MODELID,NUMBER) VALUES(2,2,200);
INSERT INTO DEALERSHIP(BRANDID,MODELID,NUMBER) VALUES(3,3,250);

INSERT INTO SALESREPRESENTATIVE(NAME,SURNAME,PHONE,BLOODGROUP,BIRTHDATE,ADDRESS,SALARY) VALUES("Ali","Yıldız","0533-562-9865","A+","10/01/1985","Izmır",5000);
INSERT INTO SALESREPRESENTATIVE(NAME,SURNAME,PHONE,BLOODGROUP,BIRTHDATE,ADDRESS,SALARY) VALUES("Ece","Kiraz","0545-789-1546","B+","02/05/1996","Istanbul",4500);
INSERT INTO SALESREPRESENTATIVE(NAME,SURNAME,PHONE,BLOODGROUP,BIRTHDATE,ADDRESS,SALARY) VALUES("Veysel","Konar","0537-123-4569","0+","12/12/1992","Denizli",6400);

INSERT INTO CUSTOMER(NAME,SURNAME,PHONE,ADDRESS) VALUES ("Ege","Karatas","0537-456-9652","Izmir");
INSERT INTO CUSTOMER(NAME,SURNAME,PHONE,ADDRESS) VALUES ("Irmak","Cinar","0541-213-5623","Konya");
INSERT INTO CUSTOMER(NAME,SURNAME,PHONE,ADDRESS) VALUES ("Hamit","Kanak","0532-452-6341","Ankara");

INSERT INTO SALES(CUSTOMERID,SALESREPID,AUTOID,SERIALNO,DATE) VALUES(1,2,5,1005,"15/05/2021");
INSERT INTO SALES(CUSTOMERID,SALESREPID,AUTOID,SERIALNO,DATE) VALUES(2,1,7,1007,"21/06/2021");
INSERT INTO SALES(CUSTOMERID,SALESREPID,AUTOID,SERIALNO,DATE) VALUES(3,3,8,1008,"31/07/2021");
-- 3. Queries:
-- (15 points)
-- Write 5 queries with explanations 
-- Write 5 queries. Your queries should do a task that is meaningful in your selected context (project topic). 
-- At least one that joins two or more tables+
-- At least one that include group functions +
-- At least one with one or more sub-query(es) +
-- At least one update +
-- At least one delete +
-- At least one include arithmetic functions +
-- At least one uses alias +

-- 1- To find out how many model cars from which brand there are in the dealership:
SELECT COUNT(AUTOID) AS "Number of Auto",BRAND.NAME AS "Brand Name" FROM AUTOINFO INNER JOIN BRAND 
ON AUTOINFO.BRANDID = BRAND.BRANDID  GROUP BY BRAND.NAME;

-- 2- To find the brand, model, price and version information of the cars above the average prices of the cars at the dealership:
SELECT BRAND.NAME,MODEL.NAME,PRICE,A.VERSION FROM AUTOINFO,BRAND,MODEL,AUTOFEATURE A 
WHERE  AUTOINFO.BRANDID = BRAND.BRANDID AND AUTOINFO.MODELID =MODEL.MODELID 
AND AUTOINFO.SERIALNO=A.SERIALNO AND PRICE > (SELECT AVG(PRICE) FROM AUTOINFO);

-- 3- To increase the price of cars with brand number 1 by 20000:
UPDATE AUTOINFO SET PRICE = PRICE+20000 WHERE BRANDID=1;

-- 4- To remove the car with serial number 1009 from the system:
DELETE FROM AUTOINFO WHERE AUTOINFO.SERIALNO =1009;

-- 5- To display the sales information (customer name and surname, sales consultant's name and surname, vehicle ID,
-- serial number, delivery date, brand, model, version, fuel, gear, body type, engine power, engine capacity and color):
SELECT C.NAME,C.SURNAME,REP.NAME,REP.SURNAME,A.AUTOID,A.SERIALNO,S.DATE,B.NAME,M.NAME,FE.VERSION,FE.FUEL,
FE.GEAR,FE.CASE_SIZE,FE.ENGINE_POWER,FE.ENGINE_CAPACITY,FE.COLOR
FROM SALES S,CUSTOMER C,AUTOINFO A,SALESREPRESENTATIVE REP,BRAND B,MODEL M,AUTOFEATURE FE 
WHERE S.CUSTOMERID=C.CUSTOMERID AND S.SALESREPID = REP.SALESREPID AND S.AUTOID =A.AUTOID
AND S.SERIALNO = A.SERIALNO AND A.BRANDID=B.BRANDID AND A.MODELID = M.MODELID AND A.SERIALNO =FE.SERIALNO;