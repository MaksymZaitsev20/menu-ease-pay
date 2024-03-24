USE master;
GO

SET ANSI_NULLS ON;
SET ANSI_PADDING ON;
SET QUOTED_IDENTIFIER ON;
SET XACT_ABORT ON;

IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'MenuEasePay')
    BEGIN
        CREATE DATABASE MenuEasePay;
    END
GO

/* -- Rollback

USE master;
GO

IF EXISTS(SELECT * FROM sys.databases WHERE name = 'MenuEasePay')
BEGIN
    DROP DATABASE MenuEasePay;
END
GO

--*/