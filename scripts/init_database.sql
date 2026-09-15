/*=============================================================*
    Create Database and Schemas
=============================================================*

Script Purpose:
    This script creates a new database named 'DataWarehouse'.
    If the database already exists, it will be dropped and
    recreated. The script also creates three schemas:

        - bronze : Raw data
        - silver : Cleaned and transformed data
        - gold   : Business-ready data

WARNING:
    Running this script will permanently delete the existing
    'DataWarehouse' database and all of its data.
     Make sure you have appropriate backups before running
    this script.

NOTE:
    GO is a batch separator used by SQL Server tools such as
    SSMS. It separates batches of T-SQL statements.

=============================================================*/

/*-------------------------------------------------------------
    Drop and Recreate The 'DataWarehouse' Database
-------------------------------------------------------------*/

USE master;
GO

IF EXISTS ( SELECT 1
FROM sys.databases
    WHERE name = 'DataWarehouse'
)
BEGIN
    ALTER DATABASE DataWarehouse
    SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE;

    DROP DATABASE DataWarehouse;
END;
GO

/*-------------------------------------------------------------*
    Create The 'DataWarehouse' Database
-------------------------------------------------------------*/
CREATE DATABASE DataWarehouse;
GO


/*-------------------------------------------------------------*
    Select Database
-------------------------------------------------------------*/
USE DataWarehouse;
GO


/*-------------------------------------------------------------*
    Create Schemas
-------------------------------------------------------------*/

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
