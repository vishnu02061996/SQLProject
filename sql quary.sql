-- Q.1 Who is the most seniour employee based on job title ?

select * from employee
order by levels desc
limit 1
-- ans. madan mohan

-- Q.2 Which country have most invoice?

select count(*),billing_country as c
from invoice
group by billing_country
order by c desc

-- answer usa 

--Q3. What are top 3 values of total invoice

select total from invoice
order by total desc
limit 3
--Answer 23.75,19.8,19.8

-- Q4.which city has best customer? Write the Query which riturn one city have hieghest
-- total voice and both return city name and sume of voice

select sum(total) as invoice_total,billing_city
from invoice
group by billing_city
order by invoice_total desc

-- Ans prague - 273.24

-- Q5.who is the best customer? Write the Query which return customer who spent most
-- money
select customer.customer_id,customer.first_name,customer.last_name,sum(invoice.total)as total
from customer
join invoice on
customer.customer_id=invoice.customer_id
group by customer.customer_id
order by total desc

-- ans r madhav

-- Q6.write the Query to return first name, last name,email& genre of all rock music listner
-- ordered your list alphabeticaly by email starting by A
select distinct email,first_name,last_name
from customer
join invoice on invoice.customer_id=customer.customer_id
join invoice_line on invoice.invoice_id=invoice_line.invoice_id
 where track_id in(
     select track_id from track
     join genre on track.genre_id=genre.genre_id
     where genre.name like 'Rock'
 )
 order by email
 
-- Q7.write a artist who has written most music on rock music in our data set write
-- the Query to return artist name and total track  count of top 10 rock band

select artist.artist_id,artist.name,count(artist.artist_id) as number_song
from track
join album on album.artist_id=track.album_id
join artist on artist.artist_id=album.artist_id
join  genre  on genre.genre_id=track.genre_id
where genre.name like 'Rock'
group by artist.artist_id
order by number_song desc
limit 10;

-- Q8.return the  track name that have song lenght longer than avreg song lenght .
-- write the name and millisecond for each track order by lenght with the longest song
 
select name,milliseconds from track
where milliseconds>(select avg(milliseconds) from track )
order by milliseconds desc;
