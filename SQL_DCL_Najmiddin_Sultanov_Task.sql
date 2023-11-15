CREATE USER rentaluser WITH PASSWORD 'rentalpassword';

GRANT CONNECT ON DATABASE my_database TO rentaluser;

GRANT SELECT ON TABLE customer TO rentaluser;

SELECT * FROM customer;

CREATE GROUP rental;
ALTER GROUP rental ADD USER rentaluser;

GRANT INSERT, UPDATE ON TABLE rental TO rental;

INSERT INTO rental(rental_date, customer_id, return_date) VALUES('2023-11-15', 123, '2023-11-22');
UPDATE rental SET rental_date = 2023-11-15 WHERE condition;

REVOKE INSERT ON TABLE rental FROM rental;


CREATE ROLE client_Mike_Tyson;

DO $$ 
BEGIN
  IF (SELECT COUNT(*) FROM payment WHERE customer_id = customer_id_of_interest) > 0 AND
     (SELECT COUNT(*) FROM rental WHERE customer_id = customer_id_of_interest) > 0 THEN
    CREATE ROLE client_Mike_Tyson;
    GRANT USAGE ON SCHEMA public TO client_Mike_Tyson;
    GRANT SELECT ON TABLE rental TO client_Mike_Tyson;
    GRANT SELECT ON TABLE payment TO client_Mike_Tyson;
    GRANT client_Mike_Tyson TO customer_username_of_interest;
  END IF;
END $$;

SET ROLE TO client_Mike_Tyson;

SELECT * FROM rental WHERE customer_id = current_user;
SELECT * FROM payment WHERE customer_id = current_user;

RESET ROLE;
