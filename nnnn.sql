use bank;
show tables;

desc customers;
desc accounts;
desc branches;

alter table accounts
add constraint foreign key(customer_id)
references customers(customer_id);

alter table accounts
add constraint foreign key(Branch_ID)
references branches(branch_id);

alter table transaction_table
add constraint foreign key(account_id)
references accounts(account_id);

alter table loan
add constraint foreign key(customer_id)
references customers(customer_id);

use bank;
show tables;
desc accounts;
SELECT * FROM accounts;
desc accounts;

DELETE FROM transaction_table
WHERE tran_id > 0;

DELETE FROM loan
WHERE loan_id > 0;

DELETE FROM accounts
WHERE account_id > 0;

DELETE FROM customers
WHERE customer_id > 0;

SELECT customer_id FROM customers;
SELECT branch_id FROM branches;
desc accounts;



alter table customers
add column Age int not null;


ALTER TABLE CUSTOMERS

