-- 1. We need a list of all staff members, including their first name and last name, email address and store identification number wherre they work.
select * from staff;
select first_name,
last_name,
email,
store_id from staff;

-- 2. We will need seperate count of inventory items held at each of your two store.
select * from inventory;
select store_id, count(inventory_id) as count from inventory
group by store_id;

-- 3. We will need count of active customer for each of your store seperatly please.
select * from customer;
select store_id, count(active) as count from customer
where active = 1
group by store_id;

-- 4. Inprder to access the liability of data	 breach, we will need you to provide a count of all customer email address stored in the database
select * from customer;
select distinct count(email) as total_emails from customer;

-- 5. we are interested in how diverse your film offering is as a means of understanding how likely you are to keep customers engaged in the future.
-- Please provide count of unique film titles you have in inventory at each store and then provide count of the unique categories of films you provide
select * from inventory;
select * from film;
select distinct count(title) from film;
select store_id , count(title) as film_title_count from film
inner join inventory
on film.film_id = inventory.film_id
group by store_id;
-- 2nd method  
select store_id, -- [aggregator]
count(film_id) -- [aggregated value]
from inventory
group by store_id
order by count(film_id);

select * from category;
select distinct count(category_id) as unique_category from category;

-- 6. We would like to understand the replacement cost of your films. Please provide the replacement cost for the film that is least expensive
-- to replace, the most expensive to replace, and the average of all films you carry.
select * from film;
select film_id, 
min(replacement_cost),
max(replacement_cost),
avg(replacement_cost) from film;

-- 7. We are interested in having you put payment monitoring systems and maximum payment processing restrictions in place in order to minimize the
-- future risk of fraud by your staff. Please provide the average payment you process, as well as the maximum payment you have processed.
select * from payment;
select avg(amount) as avg_amount, max(amount) as max_amount from payment;

-- 8. We would like to better undemand what your customer base looks like. Please provide a list of all customer identification values,
-- with a count of rentals they have made all-time, with your highest volume customers at the top of the list.
select * from rental;
select customer_id, count(rental_id) as count from rental
group by customer_id
order by count desc;