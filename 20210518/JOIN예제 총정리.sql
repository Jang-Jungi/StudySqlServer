--295행
SELECT pd.Name AS product_Name, pd.Color
	 , pd.ProductNumber,pd.StandardCost
	 , pd.ListPrice, pd.Size,pd.Weight
	 --, pc.ProductCategoryID
	 , pc.Name AS Category_Name
  FROM SalesLT.Product AS pd
 INNER JOIN SalesLT.ProductCategory AS pc
	ON pd.ProductCategoryID=pc.ProductCategoryID

-- product category를 기준으로 OUTER JOIN하면 299행 NULL-4행
SELECT pd.Name AS product_Name, pd.Color
	 , pd.ProductNumber,pd.StandardCost
	 , pd.ListPrice, pd.Size,pd.Weight
	 --, pc.ProductCategoryID
	 , pc.Name AS Category_Name
  FROM SalesLT.Product AS pd
 RIGHT OUTER JOIN SalesLT.ProductCategory AS pc
	ON pd.ProductCategoryID=pc.ProductCategoryID

--3중 INNER JOIN 예제
--CUSTOMER 847건
SELECT c.CustomerID
	 , CONCAT(Title,' ',c.FirstName,' ',c.MiddleName,' ',c.LastName )AS FullName
	 , c.CompanyName, c.EmailAddress, c.Phone
  FROM SalesLT.Customer AS c

--ADDRESS 450건
SELECT ad.AddressID
	 , ad.PostalCode
	 , CONCAT(ad.AddressLine1,' ', ad.AddressLine2, ' ', ad.City, ' ', ad.StateProvince)
	   AS FullAddress
	 , ad.CountryRegion
  FROM SalesLT.Address AS ad

--CUSTOMER ADDRESS 417건
SELECT ca.CustomerID
	 , ca.AddressID
	 , ca.AddressType
  FROM SalesLT.CustomerAddress AS ca

--INNER JOIN 417건
SELECT c.CustomerID
	 , CONCAT(Title,' ',c.FirstName,' ',c.MiddleName,' ',c.LastName )AS FullName
	 , c.CompanyName, c.EmailAddress, c.Phone
	 , ca.AddressID, ca.AddressType
	 , ad.PostalCode
	 , CONCAT(ad.AddressLine1,' ', ad.AddressLine2, ' ', ad.City, ' ', ad.StateProvince)
	   AS FullAddress
	 , ad.CountryRegion
  FROM SalesLT.Customer AS c				 
 INNER JOIN SalesLT.CustomerAddress AS ca	 
    ON ca.CustomerID=c.CustomerID
 INNER JOIN SalesLT.Address AS ad
	ON ad.AddressID = ca.AddressID;

--유령고객까지 보는 방법 857건
SELECT c.CustomerID
	 , CONCAT(Title,' ',c.FirstName,' ',c.MiddleName,' ',c.LastName )AS FullName
	 , c.CompanyName, c.EmailAddress, c.Phone
	 , ca.AddressID, ca.AddressType
	 , ad.PostalCode
	 , CONCAT(ad.AddressLine1,' ', ad.AddressLine2, ' ', ad.City, ' ', ad.StateProvince)
	   AS FullAddress
	 , ad.CountryRegion
  FROM SalesLT.Customer AS c				 
  LEFT JOIN SalesLT.CustomerAddress AS ca	 
    ON ca.CustomerID=c.CustomerID
  LEFT JOIN SalesLT.Address AS ad
	ON ad.AddressID = ca.AddressID;