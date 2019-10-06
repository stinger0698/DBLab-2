-- Задание а)

CREATE TABLE [dbo].[Employee](								
	[BusinessEntityID] [int] NOT NULL,
	[NationalIDNumber] [nvarchar](15) NOT NULL,
	[LoginID] [nvarchar](256) NOT NULL,
	[JobTitle] [nvarchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[MaritalStatus] [nchar] NOT NULL,
	[Gender] [nchar] NOT NULL,
	[HireDate] [date] NOT NULL,
	[VacationHours] [smallint] NOT NULL,
	[SickLeaveHours] [smallint] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL)

-- Задание б)

ALTER TABLE [dbo].[Employee] ADD [ID] [BIGINT] IDENTITY(0,2) PRIMARY KEY; 


-- Задание с)

ALTER TABLE [dbo].[Employee] ADD CONSTRAINT birth_date_limit CHECK (BirthDate >= '1900-01-01' AND BirthDate <= GetDate())

-- Задание d)

ALTER TABLE [dbo].[Employee] ADD CONSTRAINT default_type DEFAULT GETDATE() FOR [HireDate];

-- Задание е)

INSERT INTO [dbo].[Employee]
           ([BusinessEntityID]
           ,[NationalIDNumber]
           ,[LoginID]
           ,[JobTitle]
		   ,[BirthDate]
		   ,[MaritalStatus]
		   ,[Gender]
		   ,[VacationHours]
		   ,[SickLeaveHours]
		   ,[ModifiedDate])
SELECT [HumanResources].[Employee].[BusinessEntityID]
      ,[NationalIDNumber]
      ,[LoginID]
      ,[JobTitle]
	  ,[BirthDate]
	  ,[MaritalStatus]
	  ,[Gender]
	  ,[VacationHours]
	  ,[SickLeaveHours]
	  ,[HumanResources].[Employee].[ModifiedDate]
FROM [HumanResources].[Employee]
INNER JOIN Person.Person ON HumanResources.Employee.BusinessEntityID = Person.Person.BusinessEntityID
WHERE EmailPromotion = '0';

SELECT *
FROM dbo.Employee

-- Задание f)
ALTER TABLE [dbo].[Employee] ALTER COLUMN [MaritalStatus] [NVARCHAR](1) NULL; 