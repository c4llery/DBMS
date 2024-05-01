--1.1
--SELECT SUM(UnitPrice) 
--FROM sales JOIN sales_items ON sales.SalesId = sales_items.SalesId
--WHERE ShipCountry = 'USA' AND (SalesDate LIKE '%2012-01%' OR SalesDate LIKE '%2012-02%' OR SalesDate LIKE '%2012-03%')

--1.2
--SELECT SUM(UnitPrice)
--FROM sales_items
--WHERE SalesId IN (SELECT SalesId FROM sales WHERE ShipCountry = 'USA' AND (SalesDate LIKE '%2012-01%' OR SalesDate LIKE '%2012-02%' OR SalesDate LIKE '%2012-03%'))

--2.1
--SELECT customers.FirstName
--FROM customers LEFT JOIN employees ON customers.FirstName NOT IN (SELECT FirstName FROM employees)
--GROUP BY customers.FirstName

--2.2
--SELECT customers.FirstName
--FROM customers
--WHERE customers.FirstName NOT IN (SELECT FirstName from employees)
--GROUP BY customers.FirstName

--2.3
--SELECT FirstName FROM customers
--EXCEPT  
--SELECT FirstName FROM employees


--3
--Нет, они вернут разный результат. 
--Первый запрос вернёт меньше строк, так как он накладывает WHERE на строки из t1. 
--Во втором запросе мы всегда получаем все строки из t1

--4.1
--SELECT Title, COUNT(TrackId) 
--FROM tracks JOIN albums
--ON tracks.AlbumId  = albums.AlbumId 
--GROUP BY tracks.AlbumId

--4.2
--SELECT (SELECT Title FROM albums WHERE tracks.AlbumId = albums.AlbumId), COUNT(TrackID)
--FROM tracks
--GROUP BY tracks.AlbumId 

--5.
--SELECT customers.FirstName, customers.LastName 
--FROM customers JOIN sales ON customers.CustomerId = sales.CustomerId
--WHERE customers.Country = "Germany" AND sales.ShipCity = "Berlin" AND DATE(sales.SalesDate) BETWEEN DATE ('2009-01-01') AND DATE ('2009-12-31')

--6.1.
--SELECT customers.LastName 
--FROM customers JOIN sales JOIN sales_items ON customers.CustomerId = sales.CustomerId AND sales.SalesId = sales_items.SalesId
--GROUP BY customers.CustomerId 
--HAVING SUM(sales_items.Quantity) > 30

--6.2.
--SELECT LastName
--FROM customers, sales, sales_items
--WHERE customers.CustomerId = sales.CustomerId AND sales.SalesId = sales_items.SalesId
--GROUP BY customers.CustomerId
--HAVING sum(sales_items.Quantity) > 30


--7.
--SELECT genres.Name, AVG(tracks.UnitPrice)
--FROM tracks JOIN genres ON tracks.GenreID = genres.GenreID
--GROUP BY genres.Name 

--8.
--SELECT * FROM (SELECT genres.Name, AVG(tracks.UnitPrice) AS avg FROM tracks JOIN genres ON genres.GenreId = tracks.GenreId
--GROUP BY genres.GenreId) 
--WHERE (avg > 1)

