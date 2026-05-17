-- Kerri Kuhnke
-- Question 1: Check which users have access to the database

SELECT USER_ID,
       USERNAME,
       CREATED,
       PASSWORD_CHANGE_DATE
FROM USER_USERS;


-- Kerri Kuhnke
-- Question 2: Check what tables are present in the database

SELECT *
FROM USER_TABLES;


-- Kerri Kuhnke
-- Question 3A: Describe the ORDERS table

DESCRIBE ORDERS;


-- Kerri Kuhnke
-- Question 3B: Describe the PRODUCTLIST table

DESCRIBE PRODUCTLIST;


-- Kerri Kuhnke
-- Question 3C: Describe the REVIEWS table

DESCRIBE REVIEWS;


-- Kerri Kuhnke
-- Question 3D: Describe the STOREFRONT table

DESCRIBE STOREFRONT;


-- Kerri Kuhnke
-- Question 3E: Describe the USERBASE table

DESCRIBE USERBASE;


-- Kerri Kuhnke
-- Question 3F: Describe the USERLIBRARY table

DESCRIBE USERLIBRARY;


-- Kerri Kuhnke
-- Question 4A: Display everything in the ORDERS table

SELECT *
FROM ORDERS;


-- Kerri Kuhnke
-- Question 4B: Display everything in the PRODUCTLIST table

SELECT *
FROM PRODUCTLIST;


-- Kerri Kuhnke
-- Question 4C: Display everything in the REVIEWS table

SELECT *
FROM REVIEWS;


-- Kerri Kuhnke
-- Question 4D: Display everything in the STOREFRONT table

SELECT *
FROM STOREFRONT;


-- Kerri Kuhnke
-- Question 4E: Display everything in the USERBASE table

SELECT *
FROM USERBASE;


-- Kerri Kuhnke
-- Question 4F: Display everything in the USERLIBRARY table

SELECT *
FROM USERLIBRARY;


-- Kerri Kuhnke
-- Question 5: Check what constraints are present in the database

SELECT TABLE_NAME,
       CONSTRAINT_NAME,
       CONSTRAINT_TYPE,
       STATUS
FROM USER_CONSTRAINTS;


-- Kerri Kuhnke
-- Question 6: Check what views are present in the database

SELECT VIEW_NAME,
       TEXT
FROM USER_VIEWS;


-- Kerri Kuhnke
-- Question 7: Display every USERNAME in alphabetical order

SELECT USERNAME
FROM USERBASE
ORDER BY USERNAME ASC;


-- Kerri Kuhnke
-- Question 8: Display users with yahoo email addresses

SELECT FIRSTNAME,
       LASTNAME,
       USERNAME,
       PASSWORD,
       EMAIL
FROM USERBASE
WHERE EMAIL LIKE '%yahoo%';


-- Kerri Kuhnke
-- Question 9: Display users with less than $25 in wallet funds

SELECT USERNAME,
       BIRTHDAY,
       WALLETFUNDS
FROM USERBASE
WHERE WALLETFUNDS < 25;


-- Kerri Kuhnke
-- Question 10: Display users with more than 100 HOURSPLAYED

SELECT USERID,
       PRODUCTCODE
FROM USERLIBRARY
WHERE HOURSPLAYED > 100;


-- Kerri Kuhnke
-- Question 11: Display games with less than 10 HOURSPLAYED

SELECT PRODUCTCODE
FROM USERLIBRARY
WHERE HOURSPLAYED < 10;


-- Kerri Kuhnke
-- Question 12: Display every unique PUBLISHER

SELECT DISTINCT PUBLISHER
FROM PRODUCTLIST;


-- Kerri Kuhnke
-- Question 13: Display products sorted by GENRE

SELECT PRODUCTNAME,
       RELEASEDATE,
       PUBLISHER,
       GENRE
FROM PRODUCTLIST
ORDER BY GENRE ASC;


-- Kerri Kuhnke
-- Question 14: Display products in the Strategy genre

SELECT PRODUCTCODE,
       PUBLISHER
FROM PRODUCTLIST
WHERE GENRE = 'Strategy';


-- Kerri Kuhnke
-- Question 15: Display products costing more than $25

SELECT PRODUCTCODE,
       DESCRIPTION,
       PRICE
FROM STOREFRONT
WHERE PRICE > 25
ORDER BY PRICE DESC;


-- Kerri Kuhnke
-- Question 16: Display storefront inventory sorted by price

SELECT INVENTORYID,
       PRICE
FROM STOREFRONT
ORDER BY PRICE ASC;


-- Kerri Kuhnke
-- Question 17: Display products with a rating of 1

SELECT PRODUCTCODE,
       REVIEW
FROM REVIEWS
WHERE RATING = 1;


-- Kerri Kuhnke
-- Question 18: Display products with a rating of 4 or higher

SELECT PRODUCTCODE,
       REVIEW
FROM REVIEWS
WHERE RATING >= 4;


-- Kerri Kuhnke
-- Question 19: Display unique USERIDs from orders

SELECT DISTINCT USERID
FROM ORDERS;


-- Kerri Kuhnke
-- Question 20: Display all order data sorted by earliest purchase date

SELECT *
FROM ORDERS
ORDER BY PURCHASEDATE ASC;