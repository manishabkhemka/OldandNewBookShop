


use database2;

create table user(
id int auto_increment not null primary key,
email varchar(100),
password varchar(100),
firstname varchar(50),
lastname varchar(50),
addressline1 varchar(100),
addressline2 varchar(100),
city varchar(50),
country varchar(100),
zipcode int,
mobileno int,
email_verified varchar(100),
role varchar(20),
created_at date,
status varchar(10)
);
create table address_detail
(
	id int auto_increment not  null primary key,
	user_id int not null,
    addressline1 varchar(100),
	addressline2 varchar(100),
	city varchar(50),
    state varchar(50),
	country varchar(100),
	zipcode int,
    shipping_flag boolean
);
create table payment_info
(
	id int auto_increment not  null primary key,
    user_id int not null,
    payment_type varchar(50),
    cardnumber int,
    cvv int,
    expirydate date,
    Foreign key (user_id) references user(id));
 create table seller_info
(
	id int auto_increment not  null primary key,
	user_id int not null,
	bank_no int,
    account_no int,
    status varchar(10),
   Foreign key (user_id) references user(id)
);   
create table book_details
(
	id int auto_increment not  null primary key,
    name varchar(100),
    isbn int,
    category varchar(50),
    author_name varchar(50),
    publisher_name varchar(50),
    price float,
    ratings int,
    stock int,
    weight float,
    status varchar(10),
    seller_id int,
    Foreign key (seller_id) references seller_info(id));

create table order_books
(
	id int auto_increment not  null primary key,
	user_id int not null,
    book_id int not null,
  	quantity int,
	shipping float,
	total_amount float,
    status varchar(20),
    Foreign key (user_id) references user(id),
	Foreign key (book_id) references book_details(id)
);


create table order_shipping_details
(
	id int auto_increment not  null primary key,
	order_id int not null,
    shipping_date date,
    shipname varchar(50),
    trackingno varchar(50),
    shipaddressline1 varchar(100),
	shipaddressline2 varchar(100),
	city varchar(50),
	country varchar(100),
	zipcode int 
);


