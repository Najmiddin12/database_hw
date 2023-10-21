INSERT INTO film_actor (film_id, actor_id)
VALUES (1000, (SELECT actor_id FROM actor WHERE first_name = 'Tim' AND last_name = 'Robbins')),
       (1000, (SELECT actor_id FROM actor WHERE first_name = 'Morgan' AND last_name = 'Freeman')),
       (1000, (SELECT actor_id FROM actor WHERE first_name = 'Bob' AND last_name = 'Gunton'));