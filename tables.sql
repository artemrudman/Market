=================================================================GENERAL===================================================================

=====Branches===== (+)
	(id, branch_name, barcode, branch_location, address, timezone, branch_status_id, work_hours, phone_number, created_date, updated_date, created_by_id, updated_by_id)
	
	CREATE TABLE branches (
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
	)


=====Items===== (+)
	(id, item_name, barcode, created_date, updated_date, weight_one, product_type_id, (shelf_id:amount).JSON, expires_date, storage_type_id)
	
	CREATE TABLE items (
    id SERIAL PRIMARY KEY,
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
	)


=====Users===== (+)
	(id, user_name, created_date, updated_date, created_by_id, updated_by_id, general_status_id, email, phone_number, ??payment??, sale_promocode)

    CREATE TABLE users (
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
	)

=====Workers===== (+) 
	(id, worker_name, barcode(password), created_date, updated_date, created_by_id, updated_by_id, role_id, status_id, email, phone_number, sale_promocode)

	CREATE TABLE workers (
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
  )
  



=====Deliverymans===== (+)
	(id, deliveryman_name, barcode, created_date, updated_date, created_by_id, updated_by_id, role_id, deliveryman_status_id, email, phone_number, sale_promocode)

    CREATE TABLE deliverymans (
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
	)



=====Roles===== (+)
	(id, role_name, created_date, updated_date)

	CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  )

	executive director
	manager
	warehouse worker
	deliveryman
	technical director
	technical support
	customer support
	


=====Orders===== (+)
	(id, order_number, (item:amount).JSON, created_date, updated_date, created_by_id, updated_by_id, order_status_id, user_phone_number_id, delivery_address)
	
	CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_number VARCHAR(50) NOT NULL,
	item_amount_json JSON NOT NULL,
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
	)



=====Shelfs===== (+)
	(id, shelf_name, number_of_cells, storage_type_id, status_name_id created_date, updated_date, created_by_id, updated_by_id)

	CREATE TABLE shelfs (
    id SERIAL PRIMARY KEY,
    shelf_name VARCHAR(50) NOT NULL,
    number_of_cells INT NOT NULL,
	storage_type_id INT NOT NULL,
	status_name_id INT NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by_id INT NOT NULL,
	updated_by_id INT NOT NULL
	)
	


=====Settings=====
	()



=====Processes=====
	(id, operation_number, description, created_date, updated_date, created_by_id, updated_by_id, (???items, contractor, executor???))



=====???CardsForPayment???=====


=====Discount Codes=====




=================================================================STATUSES===================================================================

=====Branch_statuses===== (+)
	(id, branch_status, created_date, updated_date, created_by_id, updated_by_id)
	open
	closed
	acceptance
	overordered



=====Deliveryman_statuses===== (+)
	(id, deliveryman_status_name, created_date, updated_date, updated_by_id)

	CREATE TABLE deliveryman_statuses (
    id SERIAL PRIMARY KEY,
    deliveryman_status_name VARCHAR(50) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	created_by_id INT NOT NULL,
	updated_by_id INT NOT NULL
  )

	available
	returning
	break
	handling over orders
	on the way to client
	picking up order



=====Worker_statuses===== (+)
	(id, worker_status_name, created_date, updated_date, updated_by_id)

	CREATE TABLE worker_statuses (
    id SERIAL PRIMARY KEY,
    worker_status_name VARCHAR(50) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	created_by_id INT NOT NULL,
	updated_by_id INT NOT NULL
  )

	available
	not available
	break
	collects and prepare order
	


=====Order_statuses===== (+)
	(id, order_status_name, created_date, updated_date, updated_by_id)

	CREATE TABLE order_statuses (
    id SERIAL PRIMARY KEY,
    order_status_name VARCHAR(50) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	created_by_id INT NOT NULL,
	updated_by_id INT NOT NULL
  )

	awaiting preparation
	preparing
	ready for pickup
	delivering
	delivered
	returned
	partly returned
	not active
	


=====Item_condition_statuses===== (+)
	(id, condition_status_name, created_date, updated_date, created_by_id, updated_by_id)

	CREATE TABLE condition_statuses (
    id SERIAL PRIMARY KEY,
    condition_status_name VARCHAR(50) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	created_by_id INT NOT NULL,
	updated_by_id INT NOT NULL
  )

	expired
	bad smell
	not looks good
	broken
	


=====General_statuses===== (+)
	(id, status_name, created_date, updated_date, updated_by_id)

	CREATE TABLE general_statuses (
    id SERIAL PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	created_by_id INT NOT NULL,
	updated_by_id INT NOT NULL
  )

	active
	not active
	pending
	



=================================================================TYPES===================================================================	
	
=====Storage_types=====(+)
	(id, storage_type_name, created_date, updated_date, updated_by_id)

	CREATE TABLE storage_types (
    id SERIAL PRIMARY KEY,
    storage_type_name VARCHAR(50) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	created_by_id INT NOT NULL,
	updated_by_id INT NOT NULL
  )

	ambient shelf
	fridge shelf
	frozen shelf


	
=====Product_types===== (+)
	(id, product_type_name, created_date, updated_date, updated_by_id)

	CREATE TABLE product_types (
    id SERIAL PRIMARY KEY,
    product_type_name VARCHAR(50) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	created_by_id INT NOT NULL,
	updated_by_id INT NOT NULL
  )

	ADD ALL FROM APP...
	milk
	alcohol
	drink





OTHER NOTICES
	Platforms
		PC
		android
		iOS
		
	Triggers PostgreSQL

	Websockets

	Private Support Chat (first answer in chatGPT)
	
	Safety (use all safety methods)
	
	Android scanner(masaphone)
	
	Main stats BAR
	
	Anatysys by period - graphics etc.
	
	Worker time slots(for all workers)
	
	Refer a friends
	
Questions	
	How to realize the cart? (first answer in chatGPT) all answers 9 august
	How to realize Payment? (first answer in chatGPT)
	How to realize map? (first answer in chatGPT)
	How to make safety DB and code? (first answer in chatGPT)
	How to realize returns?
	How to reduce overload in nodeJS app for million users? (first answer in chatGPT)
	
	