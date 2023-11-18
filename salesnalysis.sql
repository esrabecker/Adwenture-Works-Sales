## Sales Query 
  
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

## Product Query
  
SELECT						
sod.SalesOrderID,						
product.SellEndDate,						
product.SellStartDate,						
product.ProductID,						
product.Name AS ProductName,						
productsubcategory.name AS subcategory,						
productcategory.Name AS Category,						
sod.OrderQty,						
sod.LineTotal						
FROM						
`adwentureworks_db.salesorderdetail` sod						
JOIN						
`adwentureworks_db.product` product						
ON						
sod.ProductID = product.ProductID						
JOIN						
`adwentureworks_db.productsubcategory` productsubcategory						
ON						
product.ProductSubcategoryID = productsubcategory.ProductSubcategoryID						
JOIN						
`adwentureworks_db.productcategory` productcategory						
ON						
productsubcategory.ProductCategoryID = productcategory.ProductCategoryID						
ORDER BY						
LineTotal DESC						
