CREATE DATABASE E_Learning_Purchase_Data;
USE E_Learning_Purchase_Data;
CREATE TABLE Learners(
    Learner_Id INT PRIMARY KEY,
    Full_Name VARCHAR (50) NOT NULL UNIQUE,
    Country VARCHAR (50)
);
INSERT INTO Learners (Learner_Id, Full_Name, Country) VALUES
(1, 'Rahul Sharma', 'India'),
(2, 'Priya Patel', 'India'),
(3, 'Aarav Singh', NULL),
(4, 'John Smith', 'USA'),
(5, 'Emma Johnson', 'USA'),
(6, 'Maria Garcia', 'Spain'),
(7, 'Liam Brown', NULL),
(8, 'Ahmed Khan', 'Pakistan'),
(9, 'Fatima Ali', 'Pakistan'),
(10, 'Chen Wei', 'China'),
(11, 'Sophie Laurent', 'France'),
(12, 'Hans Mueller', 'Germany'),
(13, 'Olivia Kim', 'South Korea'),
(14, 'Kwame Mensah', NULL),
(15, 'Carlos Silva', 'Brazil'),
(16, 'Anya Petrova', 'Russia'),
(17, 'Mohammed Hassan', 'Egypt'),
(18, 'Yuki Sato', NULL),
(19, 'Nguyen Van', 'Vietnam'),
(20, 'Aisha Diallo', 'Senegal');
DROP TABLE Learners;
CREATE TABLE Courses(
    Course_Id INT PRIMARY KEY,
    Course_Name VARCHAR (50) NOT NULL UNIQUE,
    Category VARCHAR (50) ,
    Unit_Price DECIMAL (10,2)
);
DROP TABLE Courses;
INSERT INTO Courses (Course_Id, Course_Name, Category, Unit_Price) VALUES
(101, 'Python for Data Science', 'Data Science', 799.00),
(102, 'Digital Marketing Mastery', 'Marketing', 599.00),
(103, 'Web Development Bootcamp', 'Web Development', NULL),           
(104, 'Financial Analysis Basics', 'Finance', 449.00),
(105, 'Graphic Design Fundamentals', NULL, 349.00),                  
(106, 'Machine Learning A-Z', 'Data Science', NULL),                 
(107, 'SEO and Content Marketing', 'Marketing', 499.00),
(108, 'React & Node.js Masterclass', NULL, 999.00),                 
(109, 'Stock Market Investing', 'Finance', NULL),                    
(110, 'UI/UX Design Masterclass', 'Design', 599.00),
(111, 'SQL for Data Analysis', 'Data Science', 649.00),
(112, 'Social Media Marketing', NULL, 399.00),                      
(113, 'Full Stack Development', 'Web Development', NULL),            
(114, 'Corporate Finance', 'Finance', 899.00),
(115, 'Advanced Photoshop', NULL, NULL),                            
(116, 'Deep Learning Specialization', 'Data Science', 1299.00),
(117, 'Email Marketing Mastery', 'Marketing', NULL),                
(118, 'Angular Development', NULL, 899.00),                          
(119, 'Personal Finance Management', 'Finance', 549.00),
(120, '3D Design with Blender', NULL, NULL);                         
CREATE TABLE Purchases(
    Purchase_Id INT PRIMARY KEY,
    Quantity INT,
    Purchase_Date DATE,
    Learner_Id INT,
    Course_Id INT,
    FOREIGN KEY (Learner_Id) REFERENCES Learners(Learner_Id),
    FOREIGN KEY (Course_Id) REFERENCES Courses(Course_ID)
);
DROP TABLE Purchases;
INSERT INTO Purchases (Purchase_Id, Quantity, Purchase_Date, Learner_Id, Course_Id) VALUES
(1, 1, '2025-12-01', 1, 101),
(2, 2, '2025-12-05', 1, 102),
(3, NULL, '2025-12-10', 2, 103),          
(4, 1, NULL, 3, 101),                       
(5, 1, '2025-12-15', 4, 104),
(6, NULL, '2025-12-18', 5, 106),            
(7, 3, '2025-12-20', 6, 105),
(8, 1, NULL, 7, 108),                       
(9, 2, '2025-12-25', 8, 102),
(10, NULL, '2025-12-28', 9, 107),           
(11, 1, '2025-12-30', 10, 111),
(12, 1, NULL, 11, 112),                     
(13, 2, '2026-01-02', 12, 113),
(14, NULL, '2026-01-05', 13, 114),         
(15, 1, '2026-01-08', 14, 115),
(16, 1, NULL, 15, 116),                     
(17, NULL, '2026-01-12', 16, 117),          
(18, 1, '2026-01-15', 17, 118),
(19, 2, NULL, 18, 119),                     
(20, 1, '2026-01-20', 19, 120);
SELECT 
    'Learners' AS `Table`, 
    COUNT(*) AS Total_Rows,
    COUNT(Country) AS Non_Null_Country,
    COUNT(*) - COUNT(Country) AS Null_Country_Count
FROM Learners
UNION ALL
SELECT 
    'Courses' AS `Table`, 
    COUNT(*) AS Total_Rows,
    COUNT(Category) AS Non_Null_Category,
    COUNT(Unit_Price) AS Non_Null_Price
FROM Courses
UNION ALL
SELECT 
    'Purchases' AS `Table`, 
    COUNT(*) AS Total_Rows,
    COUNT(Quantity) AS Non_Null_Quantity,
    COUNT(Purchase_Date) AS Non_Null_Date
FROM Purchases;
UPDATE Learners 
   SET Country = 'India' 
WHERE Learner_Id IN (3, 14);
UPDATE Learners 
   SET Country = 'USA' 
WHERE Learner_Id = 7;
UPDATE Learners 
   SET Country = 'Japan' 
WHERE Learner_Id = 18;
UPDATE Courses 
   SET Category = 'Design' 
WHERE Course_Id IN (105, 115, 120);
UPDATE Courses 
   SET Category = 'Web Devlopment' 
WHERE Course_Id IN (108, 118);
UPDATE Courses 
   SET Category = 'Marketng' 
WHERE Course_Id = 112;
UPDATE Courses 
   SET Unit_Price = 1299.00 
WHERE Course_Id =103;
UPDATE Courses 
   SET Unit_Price = 1499.00 
WHERE Course_Id = 106;
UPDATE Courses 
   SET Unit_Price = 699.00 
WHERE Course_Id = 109;
UPDATE Courses 
   SET Unit_Price = 1599.00 
WHERE Course_Id = 113;
UPDATE Courses 
   SET Unit_Price = 450.00 
WHERE Course_Id = 115;
UPDATE Courses 
   SET Unit_Price = 299.00 
WHERE Course_Id = 117;
UPDATE Courses 
   SET Unit_Price = 599.00 
WHERE Course_Id = 120;
UPDATE Purchases 
   SET Quantity = 1 
WHERE Quantity IS NULL;
UPDATE Purchases 
   SET Purchase_Date = '2025-12-25' 
WHERE Purchase_Date IS NULL;
SELECT * FROM Courses;
SELECT * FROM Learners;
SELECT * FROM Purchases;
SELECT 
    L.Full_Name AS Learner_Name,
    C.Course_Name AS Subject_Name,
    C.Category AS Department,
    P.Quantity AS Quantity_Purchased,
    ROUND(P.Quantity * C.Unit_Price, 2) AS Total_Revenue,
    P.Purchase_Date AS Order_Date
FROM Purchases p
INNER JOIN Learners l ON P.Learner_Id = L.Learner_Id
INNER JOIN Courses c ON P.Course_Id = C.Course_Id
ORDER BY Total_Revenue DESC;
SELECT 
    L.Full_Name AS Learner_Name,
    C.Course_Name AS Subject_Name,
    C.Category AS Department,
    P.Quantity AS Quantity_Purchased,
    ROUND(P.Quantity * C.Unit_Price, 2) AS Total_Revenue,
    p.Purchase_Date AS Order_Date
FROM Purchases p
LEFT JOIN Learners l ON P.Learner_Id = L.Learner_Id
INNER JOIN Courses c ON P.Course_Id = C.Course_Id
ORDER BY Total_Revenue DESC;
SELECT 
    L.Full_Name AS Learner_Name,
    C.Course_Name AS Subject_Name,
    C.Category AS Department,
    P.Quantity AS Quantity_Purchased,
    ROUND(P.Quantity * C.Unit_Price, 2) AS Total_Revenue,
    p.Purchase_Date AS Order_Date
FROM Purchases p
RIGHT JOIN Courses c ON P.Course_Id = C.Course_Id
LEFT JOIN Learners l ON P.Learner_Id = L.Learner_Id
ORDER BY Total_Revenue DESC;
SELECT 
    L.Full_Name AS Learner_Name,
    C.Course_Name AS Subject_Name,
    C.Category AS Department,
    ROUND(C.Unit_Price, 2) AS Unit_Price
FROM Learners l
CROSS JOIN Courses c
ORDER BY L.Full_Name, C.Course_Name
LIMIT 50;
SELECT 
    L1.Full_Name AS Learner_1,
    L2.Full_Name AS Learner_2,
    L1.Country AS Country
FROM Learners L1
INNER JOIN Learners L2 ON L1.Country = L2.Country
WHERE L1.Learner_Id < L2.Learner_Id
ORDER BY L1.Country, L1.Full_Name;

#Q1. Display each learner’s total spending with their country.

SELECT 
    l.Learner_Id,
    l.Full_Name AS Learner_Name,
    l.Country,
    SUM(p.Quantity * c.Unit_Price) AS Total_Revenue
FROM Learners l
LEFT JOIN Purchases p ON l.Learner_Id = p.Learner_Id
LEFT JOIN Courses c ON p.Course_Id = c.Course_Id
GROUP BY 
    l.Learner_Id, 
    l.Full_Name, 
    l.Country
ORDER BY Total_Revenue DESC;

#Q2. Find the top 3 most purchased courses by quantity.

SELECT 
    C.Course_Id,
    C.Course_Name,
    C.Category,
    SUM(P.Quantity) AS Total_Quantity_Purchased
FROM Courses c
LEFT JOIN Purchases p ON C.Course_Id = P.Course_Id
GROUP BY 
    C.Course_Id, 
    C.Course_Name, 
    C.Category
ORDER BY Total_Quantity_Purchased DESC
LIMIT 3;

#Q3. Show each category’s: 
##● Total revenue 

SELECT 
    C.Category,
    ROUND(SUM(P.Quantity * C.Unit_Price), 2) AS Total_Revenue,
    COUNT(DISTINCT P.Purchase_Id) AS Number_of_Purchases,
    COUNT(DISTINCT L.Learner_Id) AS Unique_Learners
FROM Courses c
LEFT JOIN Purchases p ON C.Course_Id = P.Course_Id
LEFT JOIN Learners l ON P.Learner_Id = L.Learner_Id
GROUP BY C.Category
ORDER BY Total_Revenue DESC;

##● Number of unique learners

SELECT 
    C.Category,
    ROUND(SUM(P.Quantity * C.Unit_Price), 2) AS Total_Revenue,
    COUNT(DISTINCT L.Learner_Id) AS Unique_Learners,
    COUNT(DISTINCT P.Purchase_Id) AS Total_Purchases
FROM Courses c
LEFT JOIN Purchases p ON C.Course_Id = P.Course_Id
LEFT JOIN Learners l ON P.Learner_Id = L.Learner_Id
GROUP BY C.Category
ORDER BY Total_Revenue DESC;

#Q4. List learners who purchased from more than one category.

SELECT 
    l.Learner_Id,
    l.Full_Name AS Learner_Name,
    l.Country,
    COUNT(DISTINCT c.Category) AS Number_of_Categories,
    GROUP_CONCAT(DISTINCT c.Category) AS Categories_Purchased
FROM Learners l
JOIN Purchases p ON l.Learner_Id = p.Learner_Id
JOIN Courses c ON p.Course_Id = c.Course_Id
GROUP BY 
    l.Learner_Id, 
    l.Full_Name, 
    l.Country
HAVING COUNT(DISTINCT c.Category) > 1

#Q5. Identify courses never purchased. 

SELECT 
    C.Course_Id,
    C.Course_Name,
    C.Category,
    C.Unit_Price
FROM Courses c
LEFT JOIN Purchases p
ON C.Course_Id = P.Course_Id
WHERE P.Course_Id IS NULL;

#Q6. Find learners whose total spending is above the average learner spending. 

SELECT 
    L.Learner_Id,
    L.Full_Name as Learner_Name,
    SUM(p.Quantity * c.Unit_Price) AS Total_Spending
FROM Learners l
JOIN Purchases p
    ON L.Learner_Id = P.Learner_Id
JOIN Courses c
    ON P.Course_Id = C.Course_Id
GROUP BY L.Learner_Id, L.Full_Name
HAVING SUM(P.Quantity * C.Unit_Price) >
(
    SELECT AVG(Total_Spending)
    FROM
    (
        SELECT SUM(P2.Quantity * C2.Unit_Price) AS Total_Spending
        FROM Purchases P2
        JOIN Courses C2
            ON P2.Course_Id = C2.Course_Id
        GROUP BY P2.Learner_Id
    ) AS Avg_Spending
);

#Q7. Display courses whose price is higher than any course in the ‘Beginner’ category.

SELECT 
    C1.Course_Id,
    C1.Course_Name,
    C1.Category,
    C1.Unit_Price
FROM Courses C1
WHERE C1.Unit_Price > ALL (
    SELECT C2.Unit_Price 
    FROM Courses C2 
    WHERE C2.Category = 'Beginner'
)
ORDER BY C1.Unit_Price DESC;

#Q8 . Find learners who spent more than the average spending in their country. 

SELECT
    L.Learner_Id,
    L.Full_Name,
    L.Country,
    SUM(P.Quantity * C.Unit_Price) AS Total_Spending
FROM Learners L
JOIN Purchases P
    ON L.Learner_Id = P.Learner_Id
JOIN Courses c
    ON P.Course_Id = C.Course_Id
GROUP BY L.Learner_Id, L.Full_Name, L.Country
HAVING SUM(P.Quantity * C.Unit_Price) >
(
    SELECT AVG(Country_Spending)
    FROM
    (
        SELECT
            SUM(P2.Quantity * C2.Unit_Price) AS Country_Spending
        FROM Learners L2
        JOIN Purchases P2
            ON L2.Learner_Id = P2.Learner_Id
        JOIN Courses C2
            ON P2.Course_Id = C2.Course_Id
        WHERE L2.Country = L.Country
        GROUP BY L2.Learner_Id
    ) AS AvgCountrySpending
);

#Q9. Use a CTE to calculate total spending per learner, then: Display learners with spending above 10,000.

 WITH Learner_Spending AS (
    SELECT 
        L.Learner_Id,
        L.Full_Name AS Learner_Name,
        L.Country,
        ROUND(SUM(P.Quantity * C.Unit_Price), 2) AS Total_Spending
    FROM Learners L
    JOIN Purchases P ON L.Learner_Id = P.Learner_Id
    JOIN Courses C ON P.Course_Id = C.Course_Id
    GROUP BY L.Learner_Id, L.Full_Name, L.Country
)
SELECT 
    Learner_Id,
    Learner_Name,
    Country,
    Total_Spending
FROM Learner_Spending
WHERE Total_Spending > 10000
ORDER BY Total_Spending DESC;

#Q10. CASE Expression Classify learners based on spending: 
##● Above 15,000 → “High Value”, 
##● 8,000–15,000 → “Medium Value”, 
##● Below 8,000 → “Low Value”. 

SELECT 
    L.Learner_Id,
    L.Full_Name AS Learner_Name,
    L.Country,
    ROUND(SUM(P.Quantity * C.Unit_Price), 2) AS Total_Spending,
    CASE 
        WHEN SUM(P.Quantity * C.Unit_Price) > 15000 THEN 'High Value'
        WHEN SUM(P.Quantity * C.Unit_Price) BETWEEN 8000 AND 15000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Spending_Category
FROM Learners L
LEFT JOIN Purchases P ON L.Learner_Id = P.Learner_Id
LEFT JOIN Courses C ON P.Course_Id = C.Course_Id
GROUP BY L.Learner_Id, L.Full_Name, L.Country
ORDER BY Total_Spending DESC;

#Q11.NULL Handling 
##● Display all courses and replace NULL purchase counts with 0 using: IFNULL() or COALESCE()

SELECT 
    C.Course_Id,
    C.Course_Name,
    C.Category,
    C.Unit_Price,
    COALESCE(SUM(P.Quantity), 0) AS Total_Quantity_Purchased,
    COALESCE(COUNT(P.Purchase_Id), 0) AS Number_of_Purchases,
    COALESCE(ROUND(SUM(P.Quantity * C.Unit_Price), 2), 0) AS Total_Revenue
FROM Courses C
LEFT JOIN Purchases p ON C.Course_Id = P.Course_Id
GROUP BY 
    C.Course_Id, 
    C.Course_Name, 
    C.Category, 
    C.Unit_Price
ORDER BY Total_Revenue DESC;

#Q12.View 
##● Create a view: category_performance_view

CREATE VIEW Category_Performance_View AS
SELECT
    C.Category,
    COUNT(DISTINCT C.Course_Id) AS Total_Courses,
    COUNT(p.Purchase_Id) AS Total_Purchases,
    SUM(IFNULL(P.Quantity, 0)) AS Total_Quantity_Sold,
    SUM(IFNULL(P.Quantity, 0) * IFNULL(C.Unit_Price, 0)) AS Total_Revenue,
    ROUND(AVG(IFNULL(C.Unit_Price, 0)), 2) AS Average_Course_Price
FROM Courses C
LEFT JOIN Purchases P
ON C.Course_Id = P.Course_Id
GROUP BY C.Category;
SELECT * FROM category_performance_view;

##● Showing: ● Category ● Total revenue ● Number of purchases ● Average revenue per purchase 

CREATE OR REPLACE VIEW category_performance_view AS
SELECT 
    C.Category,
    ROUND(SUM(P.Quantity * C.Unit_Price), 2) AS Total_Revenue,
    COUNT(P.Purchase_Id) AS Number_of_Purchases,
    ROUND(AVG(P.Quantity * C.Unit_Price), 2) AS Avg_Revenue_Per_Purchase
FROM Courses C
LEFT JOIN Purchases P ON C.Course_Id = P.Course_Id
GROUP BY C.Category
ORDER BY Total_Revenue DESC;
SELECT * FROM category_performance_view;



#----------------------------------------------------------------------------------------------------------------------------------------
## OBSERVATION REPORT:
#< Successfully designed and implemented a relational database E_Learning_Purchase_Data with three interconnected 
tables (Learners, Courses, and Purchases) using proper Primary Keys, Foreign Keys, and constraints.
#<Performed comprehensive data cleaning by identifying and handling NULL values across multiple columns through 
strategic UPDATE statements and default value assignments.
#<Developed strong proficiency in SQL Joins (INNER, LEFT, RIGHT, CROSS, SELF), Subqueries, CTEs, CASE expressions,and
 Views to generate meaningful business insights.
#<Created interactive analytical reports covering total spending per learner, category-wise revenue, top purchased
 courses, and learner classification based on spending patterns.
#<Overcame real-world challenges such as missing data and inconsistent records, reinforcing the importance of thorough
 data preparation before analysis and reporting.