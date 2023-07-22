create table title (
	title varchar(100),
	bio varchar(150),
	adress varchar(250),
	index_adress varchar(10),
	primary key (title, index_adress)
);

create table information (
	telephon integer primary key,
	work_time timestamp,
	ratings integer,
	reviews integer,
	google_adress varchar(250)
);

create table menu (
	category varchar(50) references certain_categories(category),
	code_id integer primary key,
	dish boolean,
	name varchar(65),
	description varchar(150),
	price money
);

create table certain_categories (
	category varchar(50) primary key,
	description_categories varchar(150),
	time_categories timestamp,
	same_price money 
);	

