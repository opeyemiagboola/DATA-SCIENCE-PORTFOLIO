
-- use database
use sakila;

-- Q1
select film_id, title, rental_duration, release_year
from film
where rental_duration = 3
limit 10;

-- Q2
select customer_id, store_id, first_name, last_name, email
from customer
where store_id = 1
order by first_name asc;

-- Q3
select *
from film
where rental_duration < 3 or rental_duration > 5;

-- Q4

-- find the id of South Korea
select country_id, country
from country
where country like "South Korea"; -- 86

-- find all city in South Korea
select city_id, city, country_id
from city
where country_id = 86;

-- return all address in south korea
select address_id, address, district, city_id
from address
where city_id in (113, 268, 357, 539, 553);


-- using join
select co.country_id, co.country, c.city, c.city_id, a.address, a.district
from country as co
inner join city as c on co.country_id = c.country_id
inner join address as a on c.city_id = a.city_id
where country = "South Korea";


select co.country_id, co.country, c.city, c.city_id, a.address, a.district
from city as c
inner join address as a on c.city_id = a.city_id
inner join country as co on co.country_id = c.country_id
where country = "South Korea";

-- Q5
select distinct rental_duration
from film
order by rental_duration;

-- Q6
select count(*)
from actor;

select count(distinct replacement_cost)
from film;

-- Q7
select min(replacement_cost) as "MIN", 
       max(replacement_cost) as "MAX",
       avg(replacement_cost) as "AVG"
from film;

select min(rental_duration) as "MIN", 
       max(rental_duration) as "MAX",
       avg(rental_duration) as "AVG"
from film;

select replacement_cost
from film;

-- Q8
select p.amount, count(i.film_id) as "number of movies"
from payment as p
inner join rental as r on p.rental_id = r.rental_id
inner join inventory as i on r.inventory_id = i.inventory_id
group by p.amount
order by p.amount desc
limit 3;

-- CONDITIONAL STATEMENT: CASE, WHEN, THEN, ELSE, END

-- Q9
select customer_id, 
	count(rental_id) as "No of Rent", 
    sum(amount) as "Total Amount",
    case
		when sum(amount) >= 150 then 0.05
		when sum(amount) >= 100 then 0.02
        when sum(amount) >= 50 then 0.01
        else 0
	end as "Discount"
from payment
group by customer_id;

















