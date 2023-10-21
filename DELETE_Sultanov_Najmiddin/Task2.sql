-- Remove from the "actor" table
DELETE FROM actor WHERE actor_id = 1;

-- Remove from the "film_actor" table
DELETE FROM film_actor WHERE actor_id = 1;

-- Remove from the "film_category" table
DELETE FROM film_category WHERE film_id = 1000;

-- Remove from the "category" table
DELETE FROM category WHERE category_id = (SELECT category_id FROM film_category WHERE film_id = 1000);

-- Remove from the "payment" table
DELETE FROM payment WHERE customer_id = 1;

-- Remove from the "rental" table
DELETE FROM rental WHERE customer_id = 1;

-- Remove from the "staff" table
DELETE FROM staff WHERE staff_id = 1;

-- Remove from any other relevant tables

-- Finally, delete the customer record itself
DELETE FROM customer WHERE customer_id = 1;