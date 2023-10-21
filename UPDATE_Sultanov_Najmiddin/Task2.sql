UPDATE customer
SET first_name = 'YourFirstName',
    last_name = 'YourLastName',
    email = 'your@email.com',
    address_id = (SELECT address_id FROM address WHERE address_id = 1) -- Choose an existing address from the address table
WHERE customer_id = 1;