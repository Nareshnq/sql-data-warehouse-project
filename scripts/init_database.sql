/*

================================================================================
 Script:      Create Database and Schemas
 Purpose:     
   - Creates a new database named [DataWarehouse].
   - If the database already exists, it will be dropped and recreated.
   - Sets up three schemas within the database: [bronze], [silver], [gold].

 Schemas:     
   - [bronze] → Raw / staging layer (ingestion-level data).
   - [silver] → Cleaned and transformed layer.
   - [gold]   → Curated, business-ready layer.

 WARNING ⚠️:
   - Running this script will DROP the entire [DataWarehouse] database if it exists.
   - All existing data will be permanently DELETED.
   - Ensure proper backups are taken before executing this script in production.

*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;  -- Reminder: Use GO to separate batches when working with multiple SQL statements
GO

CREATE SCHEMA gold;
GO
