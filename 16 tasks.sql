--1. 
-- 
--select FirstName, LastName
--from customers
--WHERE City = 'Prague'

--2. 
--select FirstName, LastName 
--from customers
--WHERE FirstName like "M%"

--2.
--select FirstName, LastName 
--from customers
--WHERE FirstName like "%ch%"

--3.
--select Name, Bytes / 1024 / 1024 
--from tracks

--4.
--select FirstName, LastName, HireDate
--from employees
--where City = "Calgary" and HireDate like "%2002%"

--5.
--select FirstName, LastName, HireDate - BirthDate
--from employees 
--where HireDate - BirthDate >= 40

--6.
--select FirstName, LastName, Fax
--from customers
--where Country = "USA" and Fax IS NULL

--7.
--select ShipCity, SalesDate
--from sales
--where ShipCountry = "Canada" and (SalesDate like "%-09-%" or SalesDate like "%-08-%")

--8.
--select Email 
--from customers
--where Email like "%gmail.com%"

--9.
--select FirstName, LastName, HireDate
--from employees
--where HireDate <= "2006.18.04"

--10.
--select Title
--from employees 
--ORDER BY Title

--11.
--select FirstName, LastName, 2024 - Age
--from customers
--ORDER BY FirstName, LastName, 2024 - Age

--12.
--select MIN(Milliseconds / 1000)
--from tracks

--13.
--select MIN(Milliseconds / 1000), Name, Composer
--from tracks

--14.
--select Country, AVG(Age)
--from customers
--GROUP BY Country 

--15.
--select LastName, HireDate
--from employees
--WHERE HireDate like "%-10-%"

--16.
--select LastName, HireDate
--from employees
--ORDER BY HireDate
--LIMIT 1




