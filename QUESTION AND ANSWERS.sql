USE Bank;

SELECT COUNT(*) AS total_customers FROM Customers;

SELECT COUNT(*) AS total_branches FROM Branches;

SELECT COUNT(*) AS total_accounts FROM Accounts;

SELECT COUNT(*) AS total_transactions FROM Transaction_table;

SELECT COUNT(*) AS total_loans FROM Loan;

-- 1. Customers having multiple accounts
SELECT customer_id, COUNT(*) AS total_accounts
FROM Accounts
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- 2. Highest account balance
SELECT *
FROM Accounts
ORDER BY balance DESC
LIMIT 1;

-- 3. Transaction type count
SELECT tran_type, COUNT(*)
FROM Transaction_table
GROUP BY tran_type;

-- 4. Customers having multiple loans
SELECT customer_id, COUNT(*) AS total_loans
FROM Loan
GROUP BY customer_id
HAVING COUNT(*) > 1;


SELECT COUNT(*) AS total_customers
FROM Customers;


SELECT *
FROM Customers
WHERE first_name IS NULL
   OR last_name IS NULL
   OR bod IS NULL
   OR email IS NULL
   OR contact_no IS NULL;
   
   SELECT *
FROM Customers
WHERE bod = (
    SELECT MAX(bod)
    FROM Customers
);

SELECT *
FROM Customers
WHERE bod = (
    SELECT MIN(bod)
    FROM Customers
);

SELECT COUNT(*) AS customers_before_1990
FROM Customers
WHERE YEAR(bod) < 1990;

SELECT COUNT(*) AS customers_after_1990
FROM Customers
WHERE YEAR(bod) > 1990;

SELECT
    customer_id,
    first_name,
    last_name,
    COUNT(account_id) AS total_accounts
FROM Customers c
JOIN Accounts a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(a.account_id) > 1;

SELECT
    account_type,
    COUNT(*) AS total_accounts
FROM Accounts
GROUP BY account_type;

SELECT SUM(balance) AS total_balance
FROM Accounts;

SELECT ROUND(AVG(balance), 2) AS average_balance
FROM Accounts;

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(a.balance) AS total_balance
FROM Customers c
JOIN Accounts a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_balance DESC
LIMIT 5;

SELECT *
FROM Accounts
WHERE balance IS NULL;

SELECT
    b.branch_id,
    b.branch_name,
    COUNT(a.account_id) AS total_accounts
FROM Branches b
JOIN Accounts a
    ON b.branch_id = a.branch_id
GROUP BY
    b.branch_id,
    b.branch_name
ORDER BY total_accounts DESC
LIMIT 1;

SELECT SUM(amount) AS total_transaction_amount
FROM Transactions;

SELECT
    transaction_type,
    COUNT(*) AS total_transactions
FROM Transactions
GROUP BY transaction_type;

SELECT
    transaction_type,
    COUNT(*) AS transaction_volume
FROM Transactions
GROUP BY transaction_type
ORDER BY transaction_volume DESC
LIMIT 1;

SELECT
    a.account_id,
    a.customer_id,
    COUNT(t.transaction_id) AS total_transactions
FROM Accounts a
JOIN Transactions t
    ON a.account_id = t.account_id
GROUP BY
    a.account_id,
    a.customer_id
ORDER BY total_transactions DESC
LIMIT 1;

SELECT ROUND(AVG(amount), 2) AS average_transaction_amount
FROM Transactions;

SELECT *
FROM Transactions
WHERE transaction_date IS NULL
   OR amount IS NULL;
   
   SELECT SUM(loan_amount) AS total_loan_amount
FROM Loans;

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    l.loan_id,
    l.loan_amount
FROM Customers c
JOIN Loans l
    ON c.customer_id = l.customer_id
ORDER BY l.loan_amount DESC
LIMIT 1;

SELECT *
FROM Loans
WHERE interest_rate = (
    SELECT MAX(interest_rate)
    FROM Loans
);

SELECT *
FROM Loans
WHERE LOWER(loan_status) = 'active';

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(l.loan_id) AS total_loans
FROM Customers c
JOIN Loans l
    ON c.customer_id = l.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(l.loan_id) > 1;

SELECT ROUND(AVG(loan_amount), 2) AS average_loan_amount
FROM Loans;

SELECT
    b.branch_id,
    b.branch_name,
    COUNT(DISTINCT a.customer_id) AS total_customers
FROM Branches b
JOIN Accounts a
    ON b.branch_id = a.branch_id
GROUP BY
    b.branch_id,
    b.branch_name
ORDER BY total_customers DESC
LIMIT 1;

SELECT
    b.branch_name,
    COUNT(a.account_id) AS total_accounts
FROM Branches b
LEFT JOIN Accounts a
    ON b.branch_id = a.branch_id
GROUP BY
    b.branch_id,
    b.branch_name
ORDER BY total_accounts DESC
LIMIT 1;

SELECT
    b.branch_name,
    SUM(a.balance) AS total_balance
FROM Branches b
JOIN Accounts a
    ON b.branch_id = a.branch_id
GROUP BY
    b.branch_id,
    b.branch_name
ORDER BY total_balance DESC
LIMIT 1;

SELECT
    b.branch_name,
    COUNT(t.transaction_id) AS total_transactions
FROM Branches b
JOIN Accounts a
    ON b.branch_id = a.branch_id
JOIN Transactions t
    ON a.account_id = t.account_id
GROUP BY
    b.branch_id,
    b.branch_name
ORDER BY total_transactions DESC
LIMIT 1;

SELECT
    b.branch_id,
    b.branch_name,
    SUM(l.loan_amount) AS total_loan_exposure
FROM Branches b
JOIN Loans l
    ON b.branch_id = l.branch_id
GROUP BY
    b.branch_id,
    b.branch_name
ORDER BY total_loan_exposure DESC
LIMIT 1;