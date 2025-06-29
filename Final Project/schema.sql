-- Users table to store user information
CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE
);

-- Accounts table to store bank accounts
CREATE TABLE accounts (
    account_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    account_name TEXT NOT NULL,
    balance DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Categories table for transaction types
CREATE TABLE categories (
    category_id INTEGER PRIMARY KEY,
    category_name TEXT NOT NULL UNIQUE
);

-- Transactions table to record financial activities
CREATE TABLE transactions (
    transaction_id INTEGER PRIMARY KEY,
    account_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    transaction_date DATE NOT NULL,
    description TEXT,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Budgets table for monthly category budgets
CREATE TABLE budgets (
    budget_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    month DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Index for faster queries on transactions by account and date
CREATE INDEX idx_transactions_account_date ON transactions(account_id, transaction_date);

-- View for monthly spending per category
CREATE VIEW monthly_spending AS
    SELECT
        t.category_id,
        c.category_name,
        strftime('%Y-%m', t.transaction_date) AS month,
        SUM(t.amount) AS total_spent
    FROM transactions t
    JOIN categories c ON t.category_id = c.category_id
    WHERE t.amount < 0 -- Negative amounts represent expenses
    GROUP BY t.category_id, month;
