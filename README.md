### Adventure-Works-Sales-and-Executive-Analysis

## Task

You work as a data analyst at “AdwentureWorks'' company. You are asked to provide 1 dashboard or spreadsheet which you will then use for 2 presentations for each of the departments. If you wish, you can have 2 slightly modified versions of 
the dashboard/spreadsheet to better suit each of the two presentations.

Please choose one task from the following combinations:

1.Executive Leadership and Finance

2.Executive Leadership and Sales

3.Executive Leadership and Operations

4.Executive Leadership and HR


Tableau Dashboard: https://public.tableau.com/app/profile/esra.becker/viz/AdventureWorksSalesExecutive/Dashboard2

Sales Department Presentation: https://docs.google.com/presentation/d/1WVibDRJl8nh0t9HcqKZ45_U67WlAp7gS/edit?pli=1#slide=id.p1

Executive Summary Presentation: https://docs.google.com/presentation/d/1I4u52XRpk9uC5zX4oyxk0TWirf7qel7z/edit#slide=id.p1

### SQL Codes

### Sales Query


SELECT										
soh.SalesOrderID,										
soh.Orderdate,										
soh.DueDate,										
soh.ShipDate,										
soh.CustomerID,										
CASE										
WHEN salesperson.SalesPersonID IS NULL THEN 'Online'										
ELSE										
Offline'										
END										
AS SalesChannel,										
soh.ContactID AS order_contactID,										
CONCAT(contact_order.FirstName, ' ', contact_order.MiddleName, ' ', contact_order.LastName) AS contact_name,										
salesperson.SalesPersonID,										
employee.EmployeeID,										
employee.ContactID AS salesperson_contactID,										
CONCAT(contact_salesperson.FirstName, ' ', contact_salesperson.MiddleName, ' ', contact_salesperson.LastName) AS salesperson_name,										
soh.TotalDue,										
salesterritory.Name AS Region,										
salesterritory.CountryRegionCode,										
countryregion.Name AS Country										
FROM										
`adwentureworks_db.salesorderheader` soh										
LEFT JOIN										
`adwentureworks_db.contact` contact_order --General contact for all customers and employees										
ON										
soh.ContactID = contact_order.ContactID										
LEFT JOIN										
`adwentureworks_db.salesperson` salesperson										
ON										
salesperson.SalesPersonID = soh.SalesPersonID										
LEFT JOIN										
`adwentureworks_db.employee` employee										
ON										
salesperson.SalesPersonID = employee.EmployeeId										
LEFT JOIN										
`adwentureworks_db.contact` contact_salesperson --Contacts for only employees										
ON										
contact_salesperson.ContactId = employee.ContactID										
JOIN										
`adwentureworks_db.salesterritory` salesterritory										
ON										
soh.TerritoryID = salesterritory.TerritoryID										
JOIN										
`adwentureworks_db.countryregion` countryregion										
ON										
salesterritory.CountryRegionCode = countryregion.CountryRegionCode										
