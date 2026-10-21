# Credit Risk Analysis Using SQL

## Project Overview

This project analyzes credit card data from 30,000 customers to explore factors associated with payment default.

Using SQL, the analysis examines customer demographics, credit limits, repayment history, and billing information to identify patterns related to credit risk.

The goal is to provide data-driven insights that may support financial institutions in understanding payment default risk.

## Project Objectives

- Assess data quality and completeness.
- Calculate the overall payment default rate.
- Analyze default rates across different customer groups.
- Explore relationships between repayment history, credit limits, and payment default.
- Present key findings and practical recommendations.

## Dataset

*Dataset:* Default of Credit Card Clients

*Source:* UCI Machine Learning Repository

*Dataset Link:* https://archive.ics.uci.edu/dataset/350/default+of+credit+card+clients

The dataset contains 30,000 credit card customers in Taiwan, with historical information from 2005.

It includes:

- Customer demographics
- Credit limits
- Repayment status
- Billing amounts
- Payment default information

The target variable indicates whether a customer defaulted on payment in the following month.

## Tools and Skills

- SQLite
- DB Browser for SQLite
- SQL Data Analysis
- Data Quality Checks
- Data Aggregation
- CASE WHEN
- GROUP BY
- COUNT, SUM, MIN, MAX
- Credit Risk Analysis

## Data Quality

The following checks were performed:

- *Total Records:* 30,000
- *Unique Customer IDs:* 30,000
- *Duplicate Customer IDs:* 0
- *Missing Values:* 0 in the four checked fields: AGE, LIMIT_BAL, EDUCATION, and payment default.

These checks helped verify the quality of the selected fields before analysis.

## Key Findings

### 1. Overall Default Rate

Out of 30,000 customers, 6,636 defaulted on their credit card payments in the following month.

*Overall Default Rate: 22.12%*

### 2. Repayment History

Customers with previous payment delays showed substantially higher default rates.

This suggests that repayment history is an important indicator associated with credit risk.

### 3. Credit Limits

Customers with lower credit limits generally had higher default rates.

- Credit limits up to 50,000: *31.79%*
- Credit limits above 50,000 and up to 100,000: *25.80%*
- Credit limits above 100,000 and up to 200,000: *19.48%*
- Credit limits above 200,000 and up to 500,000: *14.80%*
- Credit limits above 500,000: *11.17%*

### 4. Credit Utilization Proxy

Statement balances were compared with credit limits to estimate relative credit usage.

- Zero or negative statement balance: *24.75%*
- Positive balance up to 30% of credit limit: *16.93%*
- Above 30% to 60%: *23.20%*
- Above 60% to 90%: *27.59%*
- Above 90%: *26.29%*

Customers with statement balances between 60% and 90% of their credit limits showed a higher default rate than customers with positive balances up to 30%.

However, the relationship was not strictly linear.

### 5. Age Groups

Default rates varied across age groups.

- Ages 20–29: *22.84%*
- Ages 30–39: *20.25%*
- Ages 40–49: *22.97%*
- Ages 50–59: *24.86%*
- Ages 60 and above: *28.32%*

The oldest age group had a relatively small sample size, so its results should be interpreted carefully.

### 6. Gender

- Male customers: *24.17%* default rate
- Female customers: *20.78%* default rate

Male customers showed a higher default rate in this dataset.

### 7. Education

Default rates also differed across education groups.

- Graduate school: *19.23%*
- University: *23.73%*
- High school: *25.16%*

These differences describe associations and do not establish causation.

## Recommendations

Based on the exploratory analysis:

1. Consider repayment history as an important factor when assessing credit risk.
2. Monitor patterns of repeated payment delays.
3. Examine credit limits and relative statement balances alongside repayment history.
4. Use multiple indicators rather than relying on a single customer characteristic.
5. Conduct further analysis before using these findings in credit decisions.

## Project Limitations

- The dataset represents historical credit card information from Taiwan in 2005.
- The findings show statistical associations, not causal relationships.
- Statement balance divided by credit limit is only a proxy for credit utilization.
- This project focuses on exploratory SQL analysis rather than predictive modeling.
- Results should not be directly generalized to other populations or current banking conditions.

## SQL Analysis

The SQL queries used in this project are available in:

credit_risk_analysis.sql

## Author

*Meral Alzahrani*

Statistics Graduate | Data Analytics & Business Intelligence
