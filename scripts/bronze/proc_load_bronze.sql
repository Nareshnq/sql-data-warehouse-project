/*
---================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
---================================================================================

Script Purpose:
This stored procedure loads data into the 'bronze' schema from external CSV files.
It performs the following actions:
- Truncates the bronze tables before loading data.
- Uses the `BULK INSERT' command to load data from csv Files to bronze tables.

======================================================================================
-- NOTE: The stored procedure below was created 
-- after performing Bulk Inserts on all required tables.
--
-- Once created, you can run this procedure in a 
-- separate query window to verify functionality:
--     EXEC bronze.load_bronze
--
-- The procedure can be located under:
--     Database > Programmability > Stored Procedures
-- (You should now see it saved as: bronze.load_bronze)
--
-- IMPORTANT:
-- - Ensure proper error handling is implemented.
-- - Maintain data integrity checks.
-- - Implement issue logging for easier debugging.
-- - TRY...CATCH blocks have been added for error handling.
====================================================================================== */

CREATE OR ALTER PROCEDURE bronze.load_bronze AS   
BEGIN
BEGIN TRY 
		PRINT'================================================';
		PRINT'Loading Bronze Layer';
		PRINT'================================================';

		PRINT'------------------------------------------------';
		PRINT'Loading CRM Tables';
		PRINT'------------------------------------------------';

---table1---
		PRINT'Inserting Data into Table bronze.crm_cust_info >> ';

BULK INSERT bronze.crm_cust_info
FROM 'C:\DRIVE_D\STUDY\UDEMY\SQL_BootCamp_Udemy\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH
(
	FIRSTROW = 2,         --because header is present on line 1
	FIELDTERMINATOR = ',',
	TABLOCK               --optional ---used to lock the table 
);
------------------------------------------------------------------------------------------------------------------------------------------
---table2---
		PRINT'Inserting Data into Table bronze.crm_prd_info >> ';

BULK INSERT bronze.crm_prd_info
FROM 'C:\DRIVE_D\STUDY\UDEMY\SQL_BootCamp_Udemy\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH
(
	FIRSTROW = 2,         --because header is present on line 1
	FIELDTERMINATOR = ',',
	TABLOCK               --optional ---used to lock the table 
);

------------------------------------------------------------------------------------------------------------------------------------------
----table3---
		PRINT'Inserting Data into Table bronze.crm_sales_details >> ';


BULK INSERT bronze.crm_sales_details
FROM 'C:\DRIVE_D\STUDY\UDEMY\SQL_BootCamp_Udemy\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH
(
	FIRSTROW = 2,         --because header is present on line 1
	FIELDTERMINATOR = ',',
	TABLOCK               --optional ---used to lock the table 
);

------------------------------------------------------------------------------------------------------------------------------------------
		PRINT'------------------------------------------------';
		PRINT'Loading ERP Tables';
		PRINT'------------------------------------------------';

--table4--
		PRINT'Inserting Data into Table bronze.erp_loc_a101 >> ';

BULK INSERT bronze.erp_loc_a101
FROM 'C:\DRIVE_D\STUDY\UDEMY\SQL_BootCamp_Udemy\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
WITH
(
	FIRSTROW = 2,         --because header is present on line 1
	FIELDTERMINATOR = ',',
	TABLOCK               --optional ---used to lock the table 
);
------------------------------------------------------------------------------------------------------------------------------------------
--table5--
		PRINT'Inserting Data into Table bronze.erp_cust_az12 >> ';

BULK INSERT bronze.erp_cust_az12
FROM 'C:\DRIVE_D\STUDY\UDEMY\SQL_BootCamp_Udemy\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
WITH
(
	FIRSTROW = 2,         --because header is present on line 1
	FIELDTERMINATOR = ',',
	TABLOCK               --optional ---used to lock the table 
);
------------------------------------------------------------------------------------------------------------------------------------------
--table6--
		PRINT'Inserting Data into Table bronze.erp_px_cat_g1v2 >> ';

BULK INSERT bronze.erp_px_cat_g1v2
FROM 'C:\DRIVE_D\STUDY\UDEMY\SQL_BootCamp_Udemy\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
WITH
(
	FIRSTROW = 2,         --because header is present on line 1
	FIELDTERMINATOR = ',',
	TABLOCK               --optional ---used to lock the table 
);
END TRY
BEGIN CATCH 
	PRINT '==================================================='
	PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
	PRINT 'Error Message' + ERROR_MESSAGE();
	PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
	PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
	PRINT '==================================================='
END CATCH
END

----now we can run>   EXEC bronze.load_bronze  in Seprate query and check  the message, you will see good explanation  
---NOTE --- Ensure Error Handeling, data integrity and issue logging for easier debugging , Add TRY...CATCH ,SQL runs the TRY block , and if it fails , it runs the CATCH block to handle the error .
*/

--Lets check the table1 --
SELECT * FROM  bronze.crm_cust_info ;
SELECT COUNT(*) FROM bronze.crm_cust_info ;
--Lets check the table2 --
SELECT * FROM  bronze.crm_prd_info ;
SELECT COUNT(*) FROM bronze.crm_prd_info ;
--Lets check the table3 --
SELECT * FROM  bronze.crm_sales_details ;
SELECT COUNT(*) FROM bronze.crm_sales_details ;
--Lets check the table4 --
SELECT * FROM  bronze.erp_loc_a101 ;
SELECT COUNT(*) FROM bronze.erp_loc_a101 ;
--Lets check the table5 --
SELECT * FROM  bronze.erp_cust_az12 ;
SELECT COUNT(*) FROM bronze.erp_cust_az12 ;
--Lets check the table6 --
SELECT * FROM  bronze.erp_px_cat_g1v2 ;
SELECT COUNT(*) FROM bronze.erp_px_cat_g1v2 ;

