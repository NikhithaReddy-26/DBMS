use sakila;
show tables;
select * from  actor;

-- sql assignment 1
-- question1 rated comedy movies. 
select f.title from film_text f 
Inner join film_category fc
on f.film_id = fc.film_id
where fc.category_id = (select c.category_id from category c where name = "Comedy");

-- finding rented horror movies
select f.film_id,f.title,f.rental_duration*f.rental_rate as rent from film f 
Inner join film_category fc
on f.film_id = fc.film_id
where fc.category_id = (select c.category_id from category c where name = "Horror")
order by rent desc, film_id asc limit 3;

-- ist of customers from India who have rented sports movies.
select cl.ID, cl.name,fl.category,fl.title from customer_list cl
Inner join rental r 
Inner join inventory i
Inner join film_list fl
where cl.ID = r.customer_id
and cl.country = "India"
and r.inventory_id = i.inventory_id
and i.film_id = fl.FID
and fl.category = "Sports"
order by cl.ID asc;

-- list of customers from Canada who have rented “NICK WAHLBERG” movies.
select cl.ID, cl.name,fl.actors,fl.title from customer_list cl
Inner join rental r 
Inner join inventory i
Inner join film_list fl
where cl.ID = r.customer_id
and cl.country = "Canada"
and r.inventory_id = i.inventory_id
and i.film_id = fl.FID
and fl.actors like "%NICK WAHLBERG%"
order by cl.ID asc;

-- the number of movies in which “SEAN WILLIAMS” acted.
select count(*) as SEAN_WILLIAMS_MOVIES_COUNT from film_list 
where actors like "%SEAN WILLIAMS%";