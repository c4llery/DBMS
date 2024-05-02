--1.1
--SELECT SUM(UnitPrice)
--FROM sales JOIN sales_items ON sales.SalesId = sales_items.SalesId
--WHERE ShipCountry = 'USA' AND DATE(SalesDate) BETWEEN DATE('2012-01-01') AND DATE('2012-03-31')

--1.2
--SELECT SUM(UnitPrice)
--FROM sales_items
--WHERE SalesId IN (SELECT SalesId FROM sales WHERE ShipCountry = 'USA' AND DATE(SalesDate) BETWEEN DATE('2012-01-01') AND DATE('2012-03-31'))

--2.1
--SELECT customers.FirstName
--FROM customers JOIN employees ON customers.FirstName NOT IN (SELECT FirstName FROM employees)
--GROUP BY customers.FirstName

--2.2
--SELECT customers.FirstName 
--FROM customers
--WHERE customers.FirstName NOT IN (SELECT FirstName FROM employees)
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
--SELECT Title, COUNT(*) AS AmountOfTracks
--FROM tracks JOIN albums
--ON tracks.AlbumId  = albums.AlbumId 
--GROUP BY tracks.AlbumId

--4.2
--SELECT albums.Title, (SELECT COUNT(*) FROM tracks where tracks.AlbumId = albums.AlbumId) as AmountOfTracks
--FROM albums


--5.
--SELECT customers.FirstName, customers.LastName 
--FROM customers JOIN sales ON customers.CustomerId = sales.CustomerId
--WHERE customers.Country = 'Germany' AND sales.ShipCity = 'Berlin' AND DATE(sales.SalesDate) BETWEEN DATE ('2009-01-01') AND DATE ('2009-12-31')


--6.1
--SELECT customers.LastName
--FROM customers JOIN sales JOIN sales_items ON customers.CustomerId = sales.CustomerId AND sales.SalesId = sales_items.SalesId
--GROUP BY customers.CustomerId 
--HAVING(COUNT(*) > 30)
--ORDER BY customers.LastName

--6.2
--SELECT(SELECT(SELECT LastName FROM customers WHERE customers.CustomerId = sales.CustomerId)
--FROM sales WHERE sales.SalesId = sales_items.SalesId) 
--AS LastName FROM sales_items
--GROUP BY LastName
--HAVING(COUNT(*) > 30


--7.
--SELECT genres.Name, AVG(tracks.UnitPrice)
--FROM tracks JOIN genres ON tracks.GenreID = genres.GenreID
--GROUP BY genres.Name 



--8.
--SELECT genres.Name, AVG(tracks.UnitPrice) 
--FROM genres JOIN tracks ON tracks.GenreId = genres.GenreId
--GROUP BY genres.GenreId
--HAVING (AVG(tracks.UnitPrice) > 1)
