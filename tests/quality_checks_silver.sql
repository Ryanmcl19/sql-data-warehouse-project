/*
========================================================================================
Quality Checks
========================================================================================
Script Purpose:
	This script performs various quality checks for data consistency, accuracy, and
	standardization across the 'silver' schema. It includes checks for:
	- Null or duplicate primary keys.
	- Unwanted spaces in string fileds.
	- Data standardization and consistency
	- Invalid date ranges and orders.
	- Data consistency between related fields.

Usage Notes:
	- Run these checks after data loading Silver Layer.
	- Investigate and resolve any discrepancies found during the checks
	========================================================================================
*/



-- =========================================================================================
-- Checking silver.crm_cust_info
-- =========================================================================================

-- Check for NULLs or Duplicates in primary key
-- Expectation: No Result
SELECT
	cst_id,
	COUNT(*)
FROM bronze.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL


-- Check for invalid date orders
--The end date should be after the start date
SELECT * 
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt 


-- Check for unwanted spaces
-- Expectation: No Results
-- replace column name 'firstname' with whatever column you'd like to check
SELECT cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)


-- Data Standardization & Consistency
-- Check the columns with low-cardinality to make sure there aren't any unwanted values
SELECT DISTINCT cst_marital_status
FROM silver.crm_cust_info

SELECT DISTINCT prd_line
FROM silver.crm_prd_info



-- =========================================================================================
-- Checking silver.crm_prd_info
-- =========================================================================================

-- Check For Nulls or duplicates in Primary key
-- Expectation: No Result
SELECT
prd_id,
COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL

-- Check for unwanted spaces
-- Expectation: No Results
SELECT
prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)

-- Check for NULLS or Negative Numbers in prd_cost
-- Expectation: No Results
SELECT 
prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL

-- Data Standardization & Consistency
-- Check the columns with low-cardinality to make sure there aren't any unwanted values
SELECT DISTINCT cst_marital_status
FROM silver.crm_cust_info

SELECT DISTINCT prd_line
FROM silver.crm_prd_info
SELECT * FROM silver.crm_prd_info



-- =========================================================================================
-- Checking silver.crm_sales_details
-- =========================================================================================


-- Check for invalid dates
-- Expectation: No Results
-- Repeat for ship date and due date.
SELECT 
sls_order_dt,
sls_ship_dt,
sls_due_dt
FROM silver.crm_sales_details
WHERE LEN(sls_order_dt) != 10 OR sls_order_dt > '2050-01-01' OR sls_order_dt < '1900-01-01'


-- Check that order date is earlier than ship date and due date
-- Expectation: No Results
SELECT
*
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt or sls_order_dt > sls_due_dt


-- Check to see if the sales, sales quantity, and sales price are congruent with each other
-- Expectation: No Results
SELECT DISTINCT
sls_sales,
sls_quantity,
sls_price
FROM silver.crm_sales_details
WHERE sls_sales != (sls_quantity * sls_price)
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price


-- =========================================================================================
-- Checking silver.erp_cust_az12
-- =========================================================================================


-- Identify Out-of-Range Dates
SELECT DISTINCT
bdate
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' OR bdate > GETDATE()


-- Data standardization & consistency
SELECT DISTINCT gen,
CASE WHEN UPPER(TRIM(gen)) IN ('F', 'Female') THEN 'Female'
	 WHEN UPPER(TRIM(gen)) IN ('M', 'Male') THEN 'Male'
	 ELSE 'n/a'
END AS gen
FROM silver.erp_cust_az12



-- =========================================================================================
-- Checking silver.erp_loc_a101
-- =========================================================================================


-- get rid of the dashes in cid column so that it matches the cid column in crm_cust_info table 
SELECT
REPLACE(cid, '-', '') cid,
cntry
FROM silver.erp_loc_a101
WHERE REPLACE(cid, '-', '') NOT IN
(SELECT cst_key FROM silver.crm_cust_info)



-- Data Standardization & consistency

-- Check all the unique values in the low cardinality column 'cntry'
SELECT DISTINCT
cntry
FROM silver.erp_loc_a101

-- Look to see if there are any unwanted spaces in cntry column
SELECT
cntry
FROM silver.erp_loc_a101
WHERE TRIM(cntry) != cntry


-- Write out the full names of the countries and check to see that all the unique values are as they should be
SELECT DISTINCT
CASE WHEN cntry IN ('US', 'USA') THEN 'United States'
	 WHEN cntry = 'DE' THEN 'Germany'
	 WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'N/A'
	 ELSE cntry
END AS cntry
FROM silver.erp_loc_a101



-- =========================================================================================
-- Checking silver.erp_px_cat_g1v2
-- =========================================================================================

-- Check for unwanted spaces
SELECT 
* 
FROM silver.erp_px_cat_g1v2
WHERE cat != TRIM(cat) OR subcat != TRIM(subcat) OR maintenance != TRIM(maintenance)


-- Data standardization & consistency

-- Check for bad values in low cardinality columns (all of them)
SELECT DISTINCT
subcat
FROM silver.erp_px_cat_g1v2
