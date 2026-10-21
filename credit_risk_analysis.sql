-- Data Quality Check: Total Records and Duplicate IDs 
SELECT COUNT() AS Total_Records, COUNT(DISTINCT ID) AS Unique_Customers, COUNT() - COUNT(DISTINCT ID) AS Duplicate_IDs FROM Credit_Risk_Data;

-- Data Quality Check: Missing Values
SELECT
    SUM(CASE WHEN AGE IS NULL THEN 1 ELSE 0 END) AS Missing_Age,
    SUM(CASE WHEN LIMIT_BAL IS NULL THEN 1 ELSE 0 END) AS Missing_Credit_Limit,
    SUM(CASE WHEN EDUCATION IS NULL THEN 1 ELSE 0 END) AS Missing_Education,
    SUM(CASE WHEN "default payment next month" IS NULL THEN 1 ELSE 0 END) AS Missing_Default
FROM Credit_Risk_Data;

SELECT
    MIN(AGE) AS Min_Age,
    MAX(AGE) AS Max_Age,
    MIN(LIMIT_BAL) AS Min_Credit_Limit,
    MAX(LIMIT_BAL) AS Max_Credit_Limit
FROM Credit_Risk_Data;

-- Credit Risk Analysis: Default Rate
SELECT COUNT(*) AS Total_Customers, SUM("default payment next month") AS Defaulted_Customers, ROUND( 100.0 * SUM("default payment next month") / COUNT(), 2 ) AS Default_Rate FROM Credit_Risk_Data;

-- Credit Risk Analysis: Default Rate by Age Group
SELECT CASE WHEN AGE < 30 THEN '20-29' WHEN AGE < 40 THEN '30-39' WHEN AGE < 50 THEN '40-49' WHEN AGE < 60 THEN '50-59' ELSE '60+' END AS Age_Group,
COUNT(*) AS Total_Customers,

SUM("default payment next month") AS Defaulted_Customers,

ROUND(
    100.0 * SUM("default payment next month") / COUNT(*),
    2
) AS Default_Rate
FROM Credit_Risk_Data
GROUP BY Age_Group ORDER BY Age_Group;

-- Default Rate by Credit Limit
SELECT CASE WHEN LIMIT_BAL <= 50000 THEN '1. 50K or less' WHEN LIMIT_BAL <= 100000 THEN '2. 50K-100K' WHEN LIMIT_BAL <= 200000 THEN '3. 100K-200K' WHEN LIMIT_BAL <= 500000 THEN '4. 200K-500K' ELSE '5. Above 500K' END AS Credit_Limit_Group,
COUNT(*) AS Total_Customers,

SUM("default payment next month") AS Defaulted_Customers,

ROUND(
    100.0 * SUM("default payment next month") / COUNT(*),
    2
) AS Default_Rate
FROM Credit_Risk_Data
GROUP BY Credit_Limit_Group ORDER BY Credit_Limit_Group;

-- Default Rate by Repayment Status
SELECT PAY_0 AS Repayment_Status,
COUNT(*) AS Total_Customers,

SUM("default payment next month") AS Defaulted_Customers,

ROUND(
    100.0 * SUM("default payment next month") / COUNT(*),
    2
) AS Default_Rate
FROM Credit_Risk_Data
GROUP BY PAY_0 ORDER BY PAY_0;

-- Check Education Categories

SELECT
    EDUCATION,
    COUNT(*) AS Total_Customers
FROM Credit_Risk_Data
GROUP BY EDUCATION
ORDER BY EDUCATION;

-- Default Rate by Education Level
SELECT CASE WHEN EDUCATION = 1 THEN 'Graduate School' WHEN EDUCATION = 2 THEN 'University' WHEN EDUCATION = 3 THEN 'High School' ELSE 'Other / Unknown' END AS Education_Level,
COUNT(*) AS Total_Customers,

SUM("default payment next month") AS Defaulted_Customers,

ROUND(
    100.0 * SUM("default payment next month") / COUNT(*),
    2
) AS Default_Rate
FROM Credit_Risk_Data
GROUP BY Education_Level ORDER BY Default_Rate DESC;

-- Default Rate by Gender
SELECT CASE WHEN SEX = 1 THEN 'Male' WHEN SEX = 2 THEN 'Female' ELSE 'Unknown' END AS Gender,
COUNT(*) AS Total_Customers,

SUM("default payment next month") AS Defaulted_Customers,

ROUND(
    100.0 * SUM("default payment next month") / COUNT(*),
    2
) AS Default_Rate
FROM Credit_Risk_Data
GROUP BY Gender ORDER BY Default_Rate DESC;

-- Bill Amount Analysis

SELECT
    MIN(BILL_AMT1) AS Min_Bill,
    MAX(BILL_AMT1) AS Max_Bill,
    ROUND(AVG(BILL_AMT1), 2) AS Avg_Bill
FROM Credit_Risk_Data;

-- Default Rate by Bill Amount
SELECT CASE WHEN BILL_AMT1 <= 0 THEN '1. Zero or Negative' WHEN BILL_AMT1 <= 10000 THEN '2. 1-10K' WHEN BILL_AMT1 <= 50000 THEN '3. 10K-50K' WHEN BILL_AMT1 <= 100000 THEN '4. 50K-100K' ELSE '5. Above 100K' END AS Bill_Group,
COUNT(*) AS Total_Customers,

SUM("default payment next month") AS Defaulted_Customers,

ROUND(
    100.0 * SUM("default payment next month") / COUNT(*),
    2
) AS Default_Rate
FROM Credit_Risk_Data
GROUP BY Bill_Group ORDER BY Bill_Group;

-- Default Rate by Credit Utilization 
SELECT CASE WHEN 100.0 * BILL_AMT1 / LIMIT_BAL <= 0 THEN '1. Zero or Negative' WHEN 100.0 * BILL_AMT1 / LIMIT_BAL <= 30 THEN '2. Up to 30%' WHEN 100.0 * BILL_AMT1 / LIMIT_BAL <= 60 THEN '3. 30%-60%' WHEN 100.0 * BILL_AMT1 / LIMIT_BAL <= 90 THEN '4. 60%-90%' ELSE '5. Above 90%' END AS Utilization_Group, COUNT() AS Total_Customers, SUM("default payment next month") AS Defaulted_Customers, ROUND( 100.0 * SUM("default payment next month") / COUNT(), 2 ) AS Default_Rate FROM Credit_Risk_Data WHERE LIMIT_BAL > 0 GROUP BY Utilization_Group ORDER BY Utilization_Group;
