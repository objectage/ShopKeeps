Drop database shopkeeps;
Create database shopkeeps;

use shopkeeps;

create table itemmaster(
id int NOT NULL AUTO_INCREMENT , 
icode char(4) not null unique, 
iname varchar(30) not null,
category varchar(40), 
unit varchar(4) not null, 
stock float(6,2) not null, 
price float(8,2) not null,
sold int default 0,
primary key(id)
);


create  table users (
id int NOT NULL AUTO_INCREMENT , 
uname varchar(20) not null unique, 
name varchar(100) not null,
password varchar(30) not null,
primary key(id)
);


create table orders(
id int NOT NULL AUTO_INCREMENT , 
ordercode  char(10) not null unique,
ts timestamp default current_timestamp, 
description varchar(50) null,
tprice float(8,2) not null,
status char(10) default 'pending',
primary key(id)
);


create table ordetails(
 id int NOT NULL AUTO_INCREMENT , 
 oid int not null,
 itno int not null,
 p_unit float(6,2), 
 qty float(6,2), 
 price float(6,2),
 primary key(id),
 constraint fk_orderdetails_orders foreign key(oid) references orders(id),
 constraint fk_orderdetails_itemmaster foreign key (itno) references itemmaster(id)
);

