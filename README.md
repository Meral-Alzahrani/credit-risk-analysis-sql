Credit Risk Analysis Using SQL
Project Overview
This project analyzes credit card data from 30,000 customers to explore factors associated with payment default.
The analysis uses SQL to examine customer characteristics, credit limits, repayment history, and billing information. The goal is to identify patterns that may help financial institutions better understand credit risk.
Project Objectives
Assess data quality and completeness.
Calculate the overall payment default rate.
Analyze default rates across customer groups.
Explore the relationship between repayment history, credit limits, and payment default.
Provide data-driven insights and recommendations.
Dataset
Source: UCI Machine Learning Repository – Default of Credit Card Clients
The dataset contains information on 30,000 credit card clients in Taiwan, including demographic characteristics, credit limits, repayment history, and billing amounts.
The target variable indicates whether a customer defaulted on payment in the following month.
Tools and Skills
SQLite
DB Browser for SQLite
SQL Queries
Data Quality Checks
Data Aggregation
CASE WHEN
GROUP BY
COUNT, SUM, MIN, MAX
Credit Risk Analysis
Data Quality
The dataset contains 30,000 records with 30,000 unique customer IDs.
No duplicate customer IDs were found, and no missing values were identified in the four checked fields: age, credit limit, education, and payment default.
Key Findings
1. Overall Default Rate
6,636 out of 30,000 customers defaulted on payment, representing an overall default rate of 22.12%.
2. Repayment History
Customers with previous payment delays showed substantially higher default rates, suggesting that repayment history is an important indicator of credit risk.
3. Credit Limits
Customers with lower credit limits generally had higher default rates.
Credit limits up to 50,000: 31.79%
Credit limits above 200,000 and up to 500,000: 14.80%
4. Credit Utilization Proxy
Statement balances were compared with credit limits to estimate relative credit usage.
Positive balances up to 30% of the credit limit: 16.93% default rate
Balances between 60% and 90%: 27.59% default rate
Balances above 90%: 26.29% default rate
These results suggest an association between relative statement balances and payment default, although the relationship is not strictly linear.
5. Customer Demographics
Default rates also varied by age, gender, and education level. These findings describe differences between groups and do not establish causation.
Recommendations
Consider repayment history when assessing credit risk.
Monitor customers with repeated payment delays.
Examine credit limits and relative statement balances alongside other risk indicators.
Avoid relying on a single variable when evaluating customer risk.
Limitations
The dataset reflects historical credit card data from Taiwan in 2005.
The analysis identifies associations, not causal relationships.
Statement balance divided by credit limit is a proxy and may not represent actual credit utilization.
This project is an exploratory SQL analysis, not a predictive credit scoring model.
SQL Analysis
The SQL queries are available in the credit_risk_analysis.sql file.
Dataset Reference
UCI Machine Learning Repository:
https://archive.ics.uci.edu/dataset/350/default+of+credit+card+clients
Author
Meral Alzahrani
Statistics Graduate | Data Analytics & Business Intelligence
