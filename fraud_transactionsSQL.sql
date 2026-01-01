--Q1. What percentage of total transactions are fraudulent?

SELECT 
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS fraud_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS fraud_rate_percent
FROM financial_fraud;

--Q2. Which transaction types have the highest fraud rate?

SELECT 
    transaction_type,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(100.0 * SUM(is_fraud)::numeric / COUNT(*), 2) AS fraud_rate_percent
FROM financial_fraud
GROUP BY transaction_type
ORDER BY fraud_rate_percent DESC;

--Q3. Which merchant categories are most risky?

SELECT 
    merchant_category,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(100.0 * SUM(is_fraud)::numeric / COUNT(*), 2) AS fraud_rate_percent
FROM financial_fraud
GROUP BY merchant_category
HAVING COUNT(*) > 50   -- optional filter to avoid tiny groups
ORDER BY fraud_rate_percent DESC;

--Q4. Which countries report the highest fraud rate?

SELECT 
    country,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(100.0 * SUM(is_fraud)::numeric / COUNT(*), 2) AS fraud_rate_percent
FROM financial_fraud
GROUP BY country
ORDER BY fraud_rate_percent DESC;

--Q5. Does fraud happen more during a specific time-period?

SELECT 
    time_period,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(100.0 * SUM(is_fraud)::numeric / COUNT(*), 2) AS fraud_rate_percent
FROM financial_fraud
GROUP BY time_period
ORDER BY fraud_rate_percent DESC;

--Q6. What is the fraud rate across transaction amount ranges?

SELECT 
    amount_range,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(100.0 * SUM(is_fraud)::numeric / COUNT(*), 2) AS fraud_rate_percent
FROM financial_fraud
GROUP BY amount_range
ORDER BY fraud_rate_percent DESC;

--Q7. Do high IP risk scores correlate with more fraud?

SELECT 
    ROUND(ip_risk_score)::int AS ip_risk_bucket,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(100.0 * SUM(is_fraud)::numeric / COUNT(*), 2) AS fraud_rate_percent
FROM financial_fraud
GROUP BY ROUND(ip_risk_score)
ORDER BY ip_risk_bucket;

--Q8. Do high device-risk scores correlate with fraud?

SELECT 
    ROUND(device_risk_score)::int AS device_risk_bucket,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(100.0 * SUM(is_fraud)::numeric / COUNT(*), 2) AS fraud_rate_percent
FROM financial_fraud
GROUP BY ROUND(device_risk_score)
ORDER BY device_risk_bucket;

--Q9. Who are the users with the highest number of fraud transactions?

SELECT 
    user_id,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions
FROM financial_fraud
GROUP BY user_id
HAVING SUM(is_fraud) > 0
ORDER BY fraud_transactions DESC
LIMIT 10;

--Q10. What is the average transaction amount for fraud vs non-fraud?

SELECT 
    is_fraud,
    ROUND(AVG(amount)::numeric, 2) AS avg_amount
FROM financial_fraud
GROUP BY is_fraud;



