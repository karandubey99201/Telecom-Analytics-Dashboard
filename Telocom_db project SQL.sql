drop table if exists telicom_data;
CREATE TABLE telecom_data (
    customer_id VARCHAR(20),
    date DATE,
    month VARCHAR(10),
    quarter VARCHAR(5),
    year INT,
    country VARCHAR(50),
    operator VARCHAR(50),
    service VARCHAR(50),
    plan VARCHAR(50),
    device_type VARCHAR(50),
    network_type VARCHAR(10),
    age_group VARCHAR(10),
    gender VARCHAR(10),
    revenue FLOAT,
    arpu FLOAT,
    data_usage_gb FLOAT,
    call_minutes INT,
    sms_count INT,
    is_active BOOLEAN,
    is_churned BOOLEAN,
    churn_reason VARCHAR(50),
    activation_date DATE,
    tenure_months INT,
    payment_method VARCHAR(50),
    support_tickets INT,
    satisfaction_score FLOAT,
    satisfaction_level VARCHAR(30),
    nps_score INT,
    data_speed_mbps FLOAT,
    network_uptime_pct FLOAT,
    roaming_revenue FLOAT,
    international_calls_min INT,
    loyalty_points INT,
    promotions_used INT,
    referrals_made INT,
    monthly_recharge_count INT,
    avg_recharge_amount FLOAT,
    complaints INT,
    resolution_time_hrs FLOAT,
    first_call_resolution BOOLEAN,
    region VARCHAR(50),
    city_tier INT,
    is_postpaid BOOLEAN,
    credit_score INT,
    lifetime_value FLOAT,
    risk_score FLOAT
);

SELECT * FROM telecom_data;
SELECT COUNT(*) FROM telecom_data;

SELECT * FROM telecom_data LIMIT 10;


SELECT country,ROUND(SUM(revenue)::NUMERIC, 2) AS total_revenue,COUNT(customer_id) AS total_customers
FROM telecom_data
GROUP BY country
ORDER BY total_revenue DESC;

SELECT country,COUNT(*) AS total_customers,SUM(CASE WHEN is_churned = TRUE THEN 1 ELSE 0 END) AS churned,
ROUND(SUM(CASE WHEN is_churned = TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM telecom_data
GROUP BY country
ORDER BY churn_rate_pct DESC;

SELECT network_type,ROUND(AVG(arpu)::NUMERIC, 2) AS avg_arpu,COUNT(*) AS total_users
FROM telecom_data
GROUP BY network_type
ORDER BY avg_arpu DESC;

SELECT service,ROUND(SUM(revenue)::NUMERIC, 2) AS total_revenue,ROUND(AVG(revenue)::NUMERIC, 2) AS avg_revenue
FROM telecom_data
GROUP BY service
ORDER BY total_revenue DESC;

SELECT month,ROUND(SUM(revenue)::NUMERIC, 2) AS monthly_revenue,COUNT(*) AS activations
FROM telecom_data
GROUP BY month
ORDER BY month ASC;


SELECT table_name FROM information_schema.tables 
WHERE table_schema = 'public';




