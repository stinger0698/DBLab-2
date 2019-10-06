USE AdventureWorks2012
GO

--Task1
SELECT HumanResources.Employee.BusinessEntityID, JobTitle, Rate, ROUND(Rate, 0) AS RoundRate
FROM HumanResources.Employee
INNER JOIN HumanResources.EmployeePayHistory  ON HumanResources.Employee.BusinessEntityID = HumanResources.EmployeePayHistory.BusinessEntityID

--Task2
SELECT HumanResources.Employee.BusinessEntityID, JobTitle, Rate,
RANK() OVER (PARTITION BY HumanResources.Employee.BusinessEntityID ORDER BY RateChangeDate) as ChangeNumber
FROM HumanResources.Employee
INNER JOIN HumanResources.EmployeePayHistory
ON HumanResources.Employee.BusinessEntityID = HumanResources.EmployeePayHistory.BusinessEntityID
ORDER BY BusinessEntityID;

--Task3
SELECT HumanResources.Department.Name, JobTitle, HireDate, BirthDate
FROM HumanResources.Department
INNER JOIN HumanResources.EmployeeDepartmentHistory ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
INNER JOIN HumanResources.Employee ON HumanResources.Employee.BusinessEntityID = HumanResources.EmployeeDepartmentHistory.BusinessEntityID
ORDER BY JobTitle, (CASE WHEN JobTitle NOT LIKE '%[ ]%' THEN HireDate
	ELSE BirthDate END) DESC