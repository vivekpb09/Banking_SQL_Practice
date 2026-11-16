create database bank;
show databases;
use bank;
show tables;

create table customers
(
cust_id int primary key,
first_name varchar(50),
last_name varchar(50),
email varchar(50),
contact_no varchar(20),
bod date,
gender enum("M","F")
);

show tables;desc customers;

alter table customers
add column demo int;

alter table customers
modify demo varchar(20);

alter table customers
drop column demo;

insert into customers values
(1,"vivek","bangar","vivekpb09@gmail.com","9623067232","2002-02-14","M"),
(2,"soham","bhoir","sohamb@gmail.com","9623557232","2004-04-01","M"),
(3,"hartik","patil","hpatil09@gmail.com","9623067285","2005-11-11","M"),
(4,"mayuri","bhoir","mbhoir@gmail.com","9623065225","2004-05-27","F");

select * from customers;
use bank;
CREATE TABLE Accounts (
	Account_ID int primary key,
    Account_Type Varchar(30),
    Balance Decimal(10,2),
    Customer_ID int,
    Branch_ID int
    );
    
use bank;



create table branches(
branch_id int primary key,
branch_name varchar(80),
branch_address varchar(80),
branch_phone_no varchar(20)
);

use bank;

create table loan(
loan_id int primary key,
loan_amt decimal(10,2),
interest_rate decimal(5,2),
start_date date,
end_date date,
customer_id int 
);

use bank;

create table transaction_table(
tran_id int primary key,
tran_date date,
amount decimal(10,2),
tran_type varchar(50),
account_id int 
);



ALTER TABLE customers
RENAME COLUMN cust_id TO customer_id;

ALTER TABLE accounts
RENAME COLUMN Account_ID TO account_id;


ALTER TABLE accounts
RENAME COLUMN Customer_ID TO customer_id;



select month(now());
select day(current_date());
select current_time();

select timestampdiff(year, 2022-02-21, current_date());

use bank;
select *, timestampdiff(year,bod,now()) as age1 from customers;


alter table customers
add column Age int;
update customers
set age=timestampdiff(year,bod,current_date());

set sql_safe_updates=(0);
select* from customers;