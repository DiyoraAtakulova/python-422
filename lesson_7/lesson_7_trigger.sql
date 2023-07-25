drop schema if exists cc_user cascade;

create schema cc_user;

set 
	search_path = cc_user;
	
create table customers (
	customer_id integer generated always as identity primary key,
	first_name varchar(100) not null,
	last_name varchar(100) not null,
	email_address varchar(300) null,
	home_phone varchar(100) null,
	city varchar(50) null, 
	state_name varchar (50) null,
	years_old integer null
);

create table customers_log (
	changed_by varchar(100) not null,
	time_changed timestamp not null
);

create table clients (
	client_id integer generated always as identity primary key,
	high_spender integer null,
	first_name varchar(100) not null,
	last_name varchar(100) not null,
	total_spent integer null
);

create table orders (
	order_id integer generated always as identity primary key,
	quantity integer null,
	notes varchar(100) null
);

select * from customers 

-- 1
create or replace function insert_function() returns trigger as $$ begin 
	new.last_name := 'UNKNOWN';
	return new;
end; $$ language PLPGSQL;


create trigger insert_trigger
	before  update on customers
	for each row 
	execute procedure insert_function();

select * from customers;

update customers 
set years_old = 42
where last_name = 'Hall';

select * from customers;

-- 2
create or replace function log_customers_change() returns trigger as $$ begin
insert into
    customers_log (changed_by, time_changed)
values
    (User, DATE_TRUNC('minute', NOW()));
return new;
end;
$$ language PLPGSQL;

create trigger after_trigger
	after  update on customers
	for each row 
	execute procedure log_customers_change();

update customers 
set years_old  = years_old  + 10;
--where customer_id = 2;

select * from customers;

-- 3
create or replace function statement_function() returns trigger as $$ begin 
insert into
	customers (first_name, last_name)
values 
	('statement', 'run');
return new;
end;
$$ language PLPGSQL;

-- 4
create or replace function set_low_spender() returns trigger as $$ begin 
	new.high_spender = 0;
return new;
end;
$$ language PLPGSQL;

-- 5
create or replace function set_high_spender() returns trigger as $$ begin  
	new.high_spender = 1;
return new;
end;
$$ language PLPGSQL;

-- 6
create or replace function update_first() returns trigger as $$ begin 
	new.notes = concat(new.notes, 'update_first ran ');
return new;
end;
$$ language PLPGSQL;

-- 7
create or replace function update_second() returns trigger as $$ begin 
	new.notes = concat(new.notes, 'update_second ran ');
return new;
end;
$$ language PLPGSQL;

select * from customers;



COPY customers(
    first_name,
    last_name,
    email_address,
    home_phone,
    city,
    state_name,
    years_old
)
FROM
    'C:\Users\VICTUS\Documents\python\semester_3\lesson_7\customer.csv' DELIMITER ',' CSV HEADER;
   
   

 