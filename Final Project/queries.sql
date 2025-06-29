-- Insert a new user
INSERT INTO users (name, email) VALUES ('John Doe', 'john@example.com');

-- Insert a new account for a user
INSERT INTO accounts (user_id, account_name, balance)
VALUES (1, 'Checking Account', 1000.00);

-- Insert a category
INSERT INTO categories (category_name) VALUES ('Groceries');

-- Insert a transaction (expense)
INSERT INTO transactions (account_id, category_id, amount, transaction_date, description)
VALUES (1, 1, -50.00, '2025-05-27', 'Grocery shopping');

-- Insert a transaction (income)
INSERT INTO transactions (account_id, category_id, amount, transaction_date, description)
VALUES (1, 1, 500.00, '2025-05-01', 'Salary deposit');

-- Set a monthly budget
INSERT INTO budgets (user_id, category_id, month, amount)
VALUES (1, 1, '2025-05-01', 200.00);

-- Update account balance after a transaction
UPDATE accounts
SET balance = balance + (SELECT amount FROM transactions WHERE transaction_id = last_insert_rowid())
WHERE account_id = (SELECT account_id FROM transactions WHERE transaction_id = last_insert_rowid());

-- Delete a transaction (e.g., to correct an error)
DELETE FROM transactions WHERE transaction_id = 1;

-- Select current balance for all accounts of a user
SELECT account_name, balance
FROM accounts
WHERE user_id = 1;

-- Select transactions for an account in a specific month
SELECT t.transaction_date, c.category_name, t.amount, t.description
FROM transactions t
JOIN categories c ON t.category_id = c.category_id
WHERE t.account_id = 1
AND strftime('%Y-%m', t.transaction_date) = '2025-05';

-- Check budget vs. spending for a category in a month
SELECT
    b.amount AS budget,
    COALESCE(ms.total_spent, 0) AS spent,
    b.amount + COALESCE(ms.total_spent, 0) AS remaining
FROM budgets b
LEFT JOIN monthly_spending ms
ON b.category_id = ms.category_id
AND b.month = ms.month
WHERE b.user_id = 1
AND b.month = '2025-05-01';
