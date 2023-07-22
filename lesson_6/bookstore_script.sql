create table book (
	title varchar(100),
	isbn varchar(50) primary key,
	pages integer,
	price money,
	description varchar(256),
	publisher varchar(100)
);
	
create table chapter (
	id integer primary key,
	number integer,
	title varchar(50) /*references popular_books(author_name) unique*/,
	content varchar(1024)
);

create table author (
 	name varchar(50),
	bio varchar(100),
	email varchar(20) primary key
);

select 
	constraint_name, table_name, column_name
from
	information_schema.key_column_usage
where 
	table_name = 'author';

create table popular_books (
	book_title varchar(50) references author(email),
	author_name varchar(100),
	number_sold integer,
	number_previewed integer,
	primary key (book_title, author_name)
);

select 
	constraint_name, table_name, column_name
from
	information_schema.key_column_usage
where 
	table_name = 'popular_books';

-- references
create table book_details(
	id integer primary key,
	book_isbn varchar(50) references book(isbn) unique,
	rating decimal,
	language varchar(10),
	keywords text,
	date_published date 
);


select 
	constraint_name, table_name, column_name
from
	information_schema.key_column_usage
where 
	table_name = 'book_details';


create table books_authors(
	book_isbn varchar(50) references book(isbn),
	author_email varchar(20) references author(email),
	primary key (book_isbn, author_email)
);


create table page (
	id integer references chapter(id),
	content text, 
	header varchar(20),
	footer varchar(20)
);

select 
	constraint_name, table_name, column_name
from
	information_schema.key_column_usage
where 
	table_name = 'page';

insert into book(isbn, title, pages, price, description,publisher) values 
(9780142404676, 'Winnie-the-Pooh', 250, $10, 'Pooh and Piglet walked home', 'Puffin Books'),
(9781408855652, 'Harry Potter and the Philosopher’s Stone', 342, $12, 'Boy who lived', 'Bloomsbury'),
(9780486474915, 'The Adventures of Sherlock Holmes', 240, $25, 'Crime/Mystery', 'Digireads');

insert into author(name, bio, email) values
('Alan Alexander Milne', 'Author Winnie the Pooh and etc', 'alan@gmail.com'),
('J.K. Rowling', 'Popular women', 'jkrow@gmail.com'),
('Arthur Conan Doyle', 'Author Sherlock Holmes', 'conan#gmail.com');


