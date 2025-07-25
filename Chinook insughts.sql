-- top artists
SELECT ar.Name AS ArtistName, SUM(il.UnitPrice * il.Quantity) AS TotalSales
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Album a ON t.AlbumId = a.AlbumId
JOIN Artist ar ON a.ArtistId = ar.ArtistId
GROUP BY ar.Name
ORDER BY TotalSales DESC

-- sales by country
SELECT c.Country, SUM(il.UnitPrice * il.Quantity) AS TotalSales
FROM InvoiceLine il
JOIN Invoice i ON i.InvoiceId = il.InvoiceId
JOIN Customer c ON c.CustomerId = i.CustomerId
GROUP BY c.Country
ORDER BY TotalSales DESC

-- sales by genre
SELECT g.Name AS Genre, SUM(il.UnitPrice * il.Quantity) AS TotalSales
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY TotalSales DESC

SELECT 
    c.CustomerId,
    c.FirstName,
    c.LastName,
    c.Country,
    c.Email,
    i.Total AS Sales,
    i.InvoiceDate,
    i.BillingCity,
    i.BillingState
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId;


SELECT * FROM Customer;
SELECT * FROM Invoice;
select* from Album

SELECT TOP 10 a.Name AS Artist, COUNT(t.TrackId) AS NumberOfTracks
FROM Artist a
JOIN Album al ON a.ArtistId = al.ArtistId
JOIN Track t ON al.AlbumId = t.AlbumId
GROUP BY a.Name
ORDER BY NumberOfTracks DESC

SELECT DATENAME(MONTH, InvoiceDate) AS MonthName,
       MONTH(InvoiceDate) AS MonthNum,
       SUM(Total) AS MonthlySales
FROM Invoice
GROUP BY DATENAME(MONTH, InvoiceDate), MONTH(InvoiceDate)
ORDER BY MonthNum

SELECT top 10 a.Name AS Artist, SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist a ON al.ArtistId = a.ArtistId
GROUP BY a.Name
ORDER BY Revenue DESC

SELECT TOP 10 
    t.Name AS Track, 
    SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
GROUP BY t.Name
ORDER BY Revenue DESC;