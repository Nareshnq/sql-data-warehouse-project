/*
===============================================================================================================
DDL Script: Create Bronze Tables
===============================================================================================================
Script Purpose:
This script creates tables in the 'bronze' schema, dropping existing tables
if they already exist.
Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================================================
*/
---Creating table keeping  the data source_rcm and source_erp folders in consideration ,
---there are two folders and 6 csv files 

--table1--
CREATE TABLE bronze.crm_cust_info
(
cst_id INT,
cst_key NVARCHAR(50),
cst_firstname NVARCHAR(50),
cst_lastname NVARCHAR(50),
cst_material_status NVARCHAR(50),
cst_gndr NVARCHAR(50),
cst_create_date DATE
);

---We will create SQL DDL scripts for all CSV files ----

--table2--
CREATE TABLE bronze.crm_prd_info(
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(50),
	prd_start_dt DATETIME,
	prd_end_dt DATETIME
);


--table3--
CREATE TABLE bronze.crm_sales_details (
sls_ord_num NVARCHAR(50),
sls_prd_key NVARCHAR(50),
sls_cust_id INT,
sls_order_dt INT,
sls_ship_dt INT,
sls_due_dt INT,
sls_sales INT,
sls_quantity INT,
sls_price INT
);

--table4--
CREATE TABLE bronze.erp_loc_a101 (
cid  NVARCHAR(50),
cntry NVARCHAR(50)
);

--table5--
CREATE TABLE bronze.erp_cust_az12 (
cid NVARCHAR(50),
bdate DATE,
gen NVARCHAR(50)
);

--table6--
CREATE TABLE bronze.erp_px_cat_g1v2 (
id  NVARCHAR(50),
cat NVARCHAR(50),
subcat NVARCHAR(50),
maintenance NVARCHAR(50)
);

---->>> Now we have all the tables from the two source systems inside our  database.But still we dont have the data 
