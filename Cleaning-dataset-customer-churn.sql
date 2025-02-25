SELECT * FROM telcocustomer.customer_churn;

-- Check missing values
SELECT CONCAT(
    'SELECT "', COLUMN_NAME, '" AS column_name, COUNT(*) AS null_count FROM customer_churn WHERE ', COLUMN_NAME, ' IS NULL UNION ALL '
)
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'customer_churn';

-- Fix datatypes
ALTER TABLE customer_churn MODIFY COLUMN TotalCharges FLOAT;
UPDATE customer_churn SET TotalCharges = NULL WHERE TotalCharges = "";

-- Remove duplicates
CREATE TEMPORARY TABLE temp_churn AS
SELECT MIN(customerID) AS min_id FROM customer_churn GROUP BY customerID;

DELETE FROM customer_churn 
WHERE customerID NOT IN (SELECT min_id FROM temp_churn);

-- Bucket tenure into groups (For feature engineering)
ALTER TABLE customer_churn ADD COLUMN TenureCategory VARCHAR(20);
UPDATE customer_churn 
SET TenureCategory = CASE 
    WHEN tenure <= 12 THEN '0-1 year'
    WHEN tenure > 12 AND tenure <= 24 THEN '1-2 years'
    WHEN tenure > 24 AND tenure <= 48 THEN '2-4 years'
    WHEN tenure > 48 AND tenure <= 72 THEN '4-6 years'
    ELSE '6+ years' END;

-- export file
SELECT * FROM customer_churn INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_churn_data2.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SHOW VARIABLES LIKE 'secure_file_priv';