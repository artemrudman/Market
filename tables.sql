CREATE TABLE branch(
    id SERIAL PRIMARY KEY,
    branch_name VARCHAR(50) NOT NULL,
    barcode INT NOT NULL,
	branch_location VARCHAR(100) NOT NULL,
	address VARCHAR(100) NOT NULL,
	timezone VARCHAR(50) NOT NULL,
	branch_status_id INT NOT NULL,
	work_hours VARCHAR(150) NOT NULL,
	phone_number VARCHAR(50) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by_id INT NOT NULL,
	updated_by_id INT NOT NULL
);

CREATE TABLE branch_statuses(
    id SERIAL PRIMARY KEY,
    branch_status VARCHAR(50) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	created_by_id INT NOT NULL,
	updated_by_id INT NOT NULL
    /* 
        open
	    closed
	    acceptance
	    overordered
    */
);

CREATE TABLE branch_items(
    id SERIAL PRIMARY KEY,
    branch_id INT NOT NULL,
    item_name VARCHAR(150) NOT NULL,
    item_description VARCHAR(350) NOT NULL,
    item_ingredients VARCHAR(350) NOT NULL,
    barcode INT NOT NULL,
	weight INT NOT NULL,
	product_type_id INT NOT NULL,
	storage_type_id INT NOT NULL,
	shelf_id_amount_json JSON NOT NULL,
	expires_date TIMESTAMP,
	price FLOAT,
	sale_price FLOAT,
	is_sale BOOLEAN,
	created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by_id INT NOT NULL,
	updated_by_id INT NOT NULL
);

CREATE TABLE branch_items_statuses(
    item_id INT NOT NULL,
    condition_status_name VARCHAR(50) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	created_by_id INT NOT NULL,
	updated_by_id INT NOT NULL
    /* 
    	available
        not available
        break
        collects and prepare order
    */
);

CREATE TABLE branch_shelfs(
    id SERIAL PRIMARY KEY,
    shelf_name VARCHAR(50) NOT NULL,
    number_of_cells INT NOT NULL,
	storage_type_id INT NOT NULL,
	status_name_id INT NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by_id INT NOT NULL,
	updated_by_id INT NOT NULL
);





CREATE TABLE storage_types(
    id SERIAL PRIMARY KEY,
    storage_type_name VARCHAR(50) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	created_by_id INT NOT NULL,
	updated_by_id INT NOT NULL
    /* 
        ambient shelf
        fridge shelf
        frozen shelf
        ...
    */
);

CREATE TABLE product_types(
    id SERIAL PRIMARY KEY,
    product_type_name VARCHAR(50) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	created_by_id INT NOT NULL,
	updated_by_id INT NOT NULL
    /* 
        milk
        alcohol
        drink
        ...
    */
);




CREATE TABLE user(
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
	general_status_id INT NOT NULL,
	password_hash VARCHAR(250),
	email VARCHAR(50) NOT NULL,
	phone_number VARCHAR(50) NOT NULL,
	sale_promocode JSON NOT NULL,
	payment_info JSON,
	created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by_id INT NOT NULL,
	updated_by_id INT NOT NULL
);

CREATE TABLE user_roles(
    id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    /* 
        executive director
        manager
        warehouse worker
        deliveryman
        technical director
        technical support
        customer support
    */
);

CREATE TABLE user_statuses(
    id SERIAL PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	created_by_id INT NOT NULL,
	updated_by_id INT NOT NULL
    /* 
    	active
	    not active
	    pending
    */
);





CREATE TABLE worker(
    id SERIAL PRIMARY KEY,
    worker_name VARCHAR(50) NOT NULL,
	barcode_hash VARCHAR(250),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by_id INT NOT NULL,
	updated_by_id INT NOT NULL,
	role_id INT NOT NULL,
	status_id INT NOT NULL,
	email VARCHAR(50) NOT NULL,
	phone_number VARCHAR(50) NOT NULL,
	sale_promocode JSON NOT NULL
);

CREATE TABLE worker_statuses(
    id SERIAL PRIMARY KEY,
    worker_status_name VARCHAR(50) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	created_by_id INT NOT NULL,
	updated_by_id INT NOT NULL
    /* 
        available
        not available
        break
        collects and prepare order
    */
);





CREATE TABLE deliveryman(
    id SERIAL PRIMARY KEY,
	deliveryman_name VARCHAR(50) NOT NULL,
	barcode INT NOT NULL,
	created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by_id INT NOT NULL,
	updated_by_id INT NOT NULL,
	role_id INT NOT NULL,
	deliveryman_status_id INT NOT NULL,
	email VARCHAR(50) NOT NULL,
	phone_number VARCHAR(50) NOT NULL,
	sale_promocode JSON NOT NULL
);

CREATE TABLE deliveryman_statuses(
    id SERIAL PRIMARY KEY,
    deliveryman_status_name VARCHAR(50) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	created_by_id INT NOT NULL,
	updated_by_id INT NOT NULL
    /* 
        available
        returning
        break
        handling over orders
        on the way to client
        picking up order
    */
);




CREATE TABLE order(
    id SERIAL PRIMARY KEY,
    order_number VARCHAR(50) NOT NULL,
	item_amount_json JSON NOT NULL,
    created_by_id INT NOT NULL,
	updated_by_id INT NOT NULL,
	order_status_id INT NOT NULL,
	user_id INT NOT NULL,
	delivery_address VARCHAR(150) NOT NULL,
	created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	worker_id INT NOT NULL,
	deliveryman_id INT NOT NULL, 
    start_gather_order_time TIMESTAMP,
    finish_gather_order_time TIMESTAMP,
    deliveryman_take_time TIMESTAMP,
	delivery_finish_time TIMESTAMP
);

CREATE TABLE order_statuses(
    id SERIAL PRIMARY KEY,
    order_status_name VARCHAR(50) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	created_by_id INT NOT NULL,
	updated_by_id INT NOT NULL
    /* 
        awaiting preparation
        preparing
        ready for pickup
        delivering
        delivered
        returned
        partly returned
        not active
    */
);