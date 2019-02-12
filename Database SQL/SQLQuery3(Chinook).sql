use Chinook

--1--

-- Showing all the titles and the names (titles will only shown ones) 
select [Title],[Name] from Album inner join Artist
on Album.ArtistId = Artist.ArtistId

-- showing all kind of media types 
select * from MediaType

--Showing all from Track table 

select * from Track

-- showing all the track names and the media types 
--2--

select Track.[Name],MediaType.[Name] from Track inner join MediaType
on Track.MediaTypeId = MediaType.MediaTypeId


--select * from Customer

-- showing First name, second name, billing country and the total of the customers (customers and their invoice) 
--3--

select Customer.FirstName, Customer.LastName, Invoice.Total,BillingCountry from Customer inner join Invoice
on Customer.CustomerId = Invoice.CustomerId 


--Showing Country and the total (invoice for the country kind of )
--4--

select Customer.Country, sum (Invoice.Total)as total from Invoice inner join Customer on
Invoice.BillingCountry = Customer.Country
group by Country

-- showign all the Employees 
select  * from Employee

-- Showing all the tracks and the genre type 
--5--
select Track.[Name],Genre.[Name] from Track left join Genre
on Track.GenreId = Genre.GenreId 

--showing how many are their of each type of (genre)

--select * from Genre
--select * from Track

--6
select  Genre.[Name] as Genre ,count (*) as Total_Songs from Track inner join Genre on 
Track.GenreId = Genre.GenreId  where Genre.Name in 
('Rock','Jazz','Metal','Alternative & Punk','Rock And Roll','Blues',
'Latin','Reggae','Pop','Soundtrack','Bossa Nova'
,'Easy Listening','Heavy Metal','R&B/Soul','Electronica/Dance','World'
,'Hip Hop/Rap','Science Fiction','TV Shows','Sci Fi & Fantasy','Drama',
'Comedy','Alternative','Classical','Opera')
group by  Genre.[Name]
