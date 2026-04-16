/*   The Budgeting Problem
You have multiple bank accounts, credit cards, and investment accounts. Money flows between them all the time:

Paycheck → Checking
Checking → Savings
Checking → Credit Card (payment)
Credit Card → Expenses
Investment Account → Checking (dividend)
You want to visualize: Where is my money actually going?
*/



Create database Transactions;
use transactions;
show tables;
-- Drop the old denormalized table
-- Drop previous tables if you want a clean start (optional)
DROP TABLE IF EXISTS accounts CASCADE;
DROP TABLE IF EXISTS budgets CASCADE;
DROP TABLE IF EXISTS transactions CASCADE;
DROP TABLE IF EXISTS categories CASCADE;


-- 1. Accounts table
CREATE TABLE accounts (
    account_id SERIAL PRIMARY KEY,
    account_name VARCHAR(100) NOT NULL UNIQUE,
    account_type VARCHAR(50) NOT NULL,
    balance NUMERIC(15,2) DEFAULT 0.00,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Categories table
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    category_type VARCHAR(20) NOT NULL CHECK (category_type IN ('Income', 'Expense', 'Transfer')),
    description TEXT
);

-- 3. Transactions table
CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    from_account_id INTEGER REFERENCES accounts(account_id) ON DELETE SET NULL,
    to_account_id INTEGER REFERENCES accounts(account_id) ON DELETE SET NULL,
    amount NUMERIC(15,2) NOT NULL CHECK (amount > 0),
    category_id INTEGER REFERENCES categories(category_id) ON DELETE SET NULL,
    transaction_date DATE NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK (from_account_id IS NOT NULL OR to_account_id IS NOT NULL)
);

-- 4. Budgets table (NEW) - Monthly budgets per category
CREATE TABLE budgets (
    budget_id SERIAL PRIMARY KEY,
    category_id INTEGER NOT NULL REFERENCES categories(category_id) ON DELETE CASCADE,
    budget_month DATE NOT NULL,                    -- First day of the month, e.g., '2026-03-01'
    budgeted_amount NUMERIC(15,2) NOT NULL CHECK (budgeted_amount >= 0),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(category_id, budget_month)              -- Only one budget per category per month
);

-- Indexes for performance
CREATE INDEX idx_transactions_date ON transactions(transaction_date);
CREATE INDEX idx_transactions_category ON transactions(category_id);
CREATE INDEX idx_budgets_month ON budgets(budget_month);
CREATE INDEX idx_budgets_category ON budgets(category_id);
  
-- insert values into accounts
INSERT INTO accounts (account_name, account_type, balance, description) VALUES
('Checking', 'Bank', 4850.00, 'Main daily spending and salary account'),
('Savings', 'Bank', 6200.00, 'Emergency fund and long-term savings'),
('Credit Card', 'Credit Card', -1240.00, 'Visa credit card ending ****4321'),
('Investment', 'Investment', 15800.00, 'Stock and mutual fund brokerage account'),
('Rent', 'Expense Bucket', 0.00, 'Housing payments'),
('Groceries', 'Expense Bucket', 0.00, 'Food and household items'),
('Utilities', 'Expense Bucket', 0.00, 'Electricity, water, internet bills'),
('Dining Out', 'Expense Bucket', 0.00, 'Restaurants and takeout'),
('Gas', 'Expense Bucket', 0.00, 'Fuel and transportation'),
('Shopping', 'Expense Bucket', 0.00, 'Clothing, online shopping'),
('Healthcare', 'Expense Bucket', 0.00, 'Medical and insurance'),
('Entertainment', 'Expense Bucket', 0.00, 'Movies, games, subscriptions');

-- insert values into categories
INSERT INTO categories (category_name, category_type, description) VALUES
('Salary', 'Income', 'Monthly salary or paycheck deposit'),
('Dividend', 'Income', 'Investment returns and dividends'),
('Transfer', 'Transfer', 'Moving money between your own accounts'),
('Rent', 'Expense', 'Monthly house or apartment rent'),
('Groceries', 'Expense', 'Supermarket and food shopping'),
('Dining Out', 'Expense', 'Restaurants, cafes, and food delivery'),
('Utilities', 'Expense', 'Electricity, water, gas, and internet'),
('Gas', 'Expense', 'Petrol, diesel, and transportation fuel'),
('Shopping', 'Expense', 'Clothes, gadgets, Amazon purchases'),
('Healthcare', 'Expense', 'Doctor visits, medicines, insurance'),
('Entertainment', 'Expense', 'Movies, streaming, games, hobbies');

-- insert values into transactions
INSERT INTO transactions (from_account_id, to_account_id, amount, category_id, transaction_date, description)
VALUES
-- Income
((SELECT account_id FROM accounts WHERE account_name = 'Paycheck' LIMIT 1), 
 (SELECT account_id FROM accounts WHERE account_name = 'Checking'), 
 70000.00, (SELECT category_id FROM categories WHERE category_name = 'Salary'), '2026-04-01', 'April 2026 salary credit'),

((SELECT account_id FROM accounts WHERE account_name = 'Investment'), 
 (SELECT account_id FROM accounts WHERE account_name = 'Checking'), 
 1250.00, (SELECT category_id FROM categories WHERE category_name = 'Dividend'), '2026-04-05', 'Quarterly dividend payout'),

-- Transfers
((SELECT account_id FROM accounts WHERE account_name = 'Checking'), 
 (SELECT account_id FROM accounts WHERE account_name = 'Savings'), 
 10000.00, (SELECT category_id FROM categories WHERE category_name = 'Transfer'), '2026-04-02', 'Monthly savings transfer'),

((SELECT account_id FROM accounts WHERE account_name = 'Checking'), 
 (SELECT account_id FROM accounts WHERE account_name = 'Credit Card'), 
 5000.00, (SELECT category_id FROM categories WHERE category_name = 'Transfer'), '2026-04-10', 'Credit card bill payment'),

-- Expenses
((SELECT account_id FROM accounts WHERE account_name = 'Checking'), 
 (SELECT account_id FROM accounts WHERE account_name = 'Rent'), 
 18000.00, (SELECT category_id FROM categories WHERE category_name = 'Rent'), '2026-04-03', 'April rent payment'),

((SELECT account_id FROM accounts WHERE account_name = 'Checking'), 
 (SELECT account_id FROM accounts WHERE account_name = 'Groceries'), 
 6200.00, (SELECT category_id FROM categories WHERE category_name = 'Groceries'), '2026-04-07', 'Weekly grocery shopping at Reliance Mart'),

((SELECT account_id FROM accounts WHERE account_name = 'Credit Card'), 
 (SELECT account_id FROM accounts WHERE account_name = 'Dining Out'), 
 1850.00, (SELECT category_id FROM categories WHERE category_name = 'Dining Out'), '2026-04-08', 'Dining out with family'),

((SELECT account_id FROM accounts WHERE account_name = 'Checking'), 
 (SELECT account_id FROM accounts WHERE account_name = 'Utilities'), 
 2450.00, (SELECT category_id FROM categories WHERE category_name = 'Utilities'), '2026-04-12', 'Electricity + Internet bill'),

((SELECT account_id FROM accounts WHERE account_name = 'Credit Card'), 
 (SELECT account_id FROM accounts WHERE account_name = 'Shopping'), 
 4200.00, (SELECT category_id FROM categories WHERE category_name = 'Shopping'), '2026-04-15', 'Amazon and Flipkart orders'),

((SELECT account_id FROM accounts WHERE account_name = 'Checking'), 
 (SELECT account_id FROM accounts WHERE account_name = 'Gas'), 
 1350.00, (SELECT category_id FROM categories WHERE category_name = 'Gas'), '2026-04-18', 'Petrol refill'),

((SELECT account_id FROM accounts WHERE account_name = 'Checking'), 
 (SELECT account_id FROM accounts WHERE account_name = 'Healthcare'), 
 850.00, (SELECT category_id FROM categories WHERE category_name = 'Healthcare'), '2026-04-20', 'Doctor consultation and medicines'),

((SELECT account_id FROM accounts WHERE account_name = 'Checking'), 
 (SELECT account_id FROM accounts WHERE account_name = 'Entertainment'), 
 1200.00, (SELECT category_id FROM categories WHERE category_name = 'Entertainment'), '2026-04-22', 'Movie tickets and Netflix subscription');

  
-- Sample Budgets for March 2026 (you can demo adding more for April, etc.)
INSERT INTO budgets (category_id, budget_month, budgeted_amount, notes) VALUES
((SELECT category_id FROM categories WHERE category_name = 'Rent'), '2026-04-01', 18000.00, 'Fixed monthly rent'),
((SELECT category_id FROM categories WHERE category_name = 'Groceries'), '2026-04-01', 8000.00, 'Monthly food budget'),
((SELECT category_id FROM categories WHERE category_name = 'Dining Out'), '2026-04-01', 4000.00, 'Eating out limit'),
((SELECT category_id FROM categories WHERE category_name = 'Utilities'), '2026-04-01', 3000.00, 'Bills budget'),
((SELECT category_id FROM categories WHERE category_name = 'Gas'), '2026-04-01', 2000.00, 'Fuel expenses'),
((SELECT category_id FROM categories WHERE category_name = 'Shopping'), '2026-04-01', 5000.00, 'Non-essential shopping'),
((SELECT category_id FROM categories WHERE category_name = 'Healthcare'), '2026-04-01', 1500.00, 'Medical expenses'),
((SELECT category_id FROM categories WHERE category_name = 'Entertainment'), '2026-04-01', 2500.00, 'Leisure and subscriptions'),
((SELECT category_id FROM categories WHERE category_name = 'Salary'), '2026-04-01', 70000.00, 'Expected income');


-- Verify the data
SELECT 'Accounts' AS table_name, COUNT(*) FROM accounts
UNION ALL
SELECT 'Categories', COUNT(*) FROM categories
UNION ALL
SELECT 'Transactions', COUNT(*) FROM transactions
UNION ALL
SELECT 'Budgets', COUNT(*) FROM budgets;


-- =====================================================
-- 40 Basic to Intermediate SQL Queries for Budgeting System
-- Database: transactions (MySQL Version)
-- Tables: accounts, categories, transactions, budgets
-- Perfect for live teaching sessions on DBMS using SQL
-- =====================================================

-- =====================================================
-- SECTION 1: Very Basic Queries (1-10)
-- =====================================================

-- Query 1: View all accounts
-- Explanation: This is the most basic SELECT statement. It retrieves every column and every row from the accounts table.
-- Teaching Tip: Start your session with this. Ask students: "What do you see? Why is * not always the best choice in real projects?"
SELECT * FROM accounts;

-- Query 2: View only account names and their current balances
-- Explanation: Instead of selecting all columns (*), we project only the required columns. This improves readability and performance.
-- Teaching Tip: Explain "Column Projection". Ask: "In a real banking app, would you show the entire table to the user?"
SELECT account_name, balance 
FROM accounts;

-- Query 3: List all categories with their type, sorted
-- Explanation: Retrieves categories and sorts them first by type, then by name. Demonstrates multi-column sorting.
-- Teaching Tip: Show how ORDER BY makes output professional and easy to read.
SELECT category_name, category_type 
FROM categories 
ORDER BY category_type, category_name;

-- Query 4: Show only expense categories
-- Explanation: Uses WHERE clause to filter rows based on a condition. Very important concept for any reporting.
-- Teaching Tip: Ask students to modify it for 'Income' and 'Transfer' categories.
SELECT category_name 
FROM categories 
WHERE category_type = 'Expense';

-- Query 5: Find accounts with positive balance
-- Explanation: Uses comparison operator (>) and sorts by balance in descending order.
-- Teaching Tip: Discuss real-life use - "Which accounts have money available right now?"
SELECT account_name, balance 
FROM accounts 
WHERE balance > 0 
ORDER BY balance DESC;

-- Query 6: Find large transactions (above 5000)
-- Explanation: Filters numeric data using > operator. Good for spotting significant money movements.
-- Teaching Tip: Change the threshold live and ask students what value they would use for their own budget.
SELECT transaction_id, amount, description 
FROM transactions 
WHERE amount > 5000 
ORDER BY amount DESC;

-- Query 7: Show the 10 most recent transactions
-- Explanation: Combines ORDER BY DESC with LIMIT to implement "latest first" pagination.
-- Teaching Tip: This pattern is used in almost every mobile and web application.
SELECT transaction_date, description, amount 
FROM transactions 
ORDER BY transaction_date DESC 
LIMIT 10;

-- Query 8: List budgets for April 2026 with category names
-- Explanation: Introduces simple JOIN between budgets and categories tables.
-- Teaching Tip: Explain why we need JOIN - "We cannot show only numbers; users want meaningful names."
SELECT b.budgeted_amount, c.category_name 
FROM budgets b
JOIN categories c ON b.category_id = c.category_id
WHERE b.budget_month = '2026-04-01';

-- Query 9: Count total number of transactions
-- Explanation: Uses aggregate function COUNT(*) to get the total row count.
-- Teaching Tip: Aggregates are the foundation of all reporting and analytics.
SELECT COUNT(*) AS total_transactions 
FROM transactions;

-- Query 10: Find the highest single transaction amount
-- Explanation: Uses MAX() aggregate function.
-- Teaching Tip: Ask: "What other aggregates (MIN, AVG, SUM) would be useful for budgeting?"
SELECT MAX(amount) AS highest_amount 
FROM transactions;


-- =====================================================
-- SECTION 2: Basic Aggregations & Grouping (11-20)
-- =====================================================

-- Query 11: Total money across all accounts
-- Explanation: Uses SUM() to calculate overall financial position.
-- Teaching Tip: This is the first question every person asks: "How much money do I have in total?"
SELECT SUM(balance) AS total_money 
FROM accounts;

-- Query 12: Number of accounts by type
-- Explanation: GROUP BY with COUNT() - shows distribution of different account types.
-- Teaching Tip: GROUP BY is one of the most important concepts in SQL. Practice it with different columns.
SELECT account_type, COUNT(*) AS account_count 
FROM accounts 
GROUP BY account_type;

-- Query 13: Total spending by expense category
-- Explanation: JOIN + GROUP BY + SUM - classic "Where is my money going?" query.
-- Teaching Tip: This query is the heart of any budgeting application.
SELECT c.category_name, SUM(t.amount) AS total_spent 
FROM transactions t
JOIN categories c ON t.category_id = c.category_id
WHERE c.category_type = 'Expense'
GROUP BY c.category_name 
ORDER BY total_spent DESC;

-- Query 14: Average transaction amount
-- Explanation: Uses AVG() aggregate function.
-- Teaching Tip: Discuss when average can be misleading (outliers).
SELECT AVG(amount) AS average_transaction 
FROM transactions;

-- Query 15: Number of transactions per category
-- Explanation: Shows activity level per category using COUNT and GROUP BY.
-- Teaching Tip: High count + high amount = area that needs attention in budget.
SELECT c.category_name, COUNT(*) AS transaction_count 
FROM transactions t
JOIN categories c ON t.category_id = c.category_id
GROUP BY c.category_name 
ORDER BY transaction_count DESC;

-- Query 16: Accounts sorted by balance (highest to lowest)
-- Explanation: Reinforces sorting on numeric data.
-- Teaching Tip: Combine with LIMIT to show top 3 richest accounts.
SELECT account_name, balance 
FROM accounts 
ORDER BY balance DESC;

-- Query 17: Transactions within a specific date range
-- Explanation: Date filtering using BETWEEN operator.
-- Teaching Tip: Date handling is extremely important in financial systems.
SELECT transaction_date, amount, description 
FROM transactions 
WHERE transaction_date BETWEEN '2026-04-01' AND '2026-04-15';

-- Query 18: Show only income transactions
-- Explanation: Filtering after joining with categories table.
-- Teaching Tip: Always filter on the meaningful business column (category_type).
SELECT t.amount, c.category_name 
FROM transactions t
JOIN categories c ON t.category_id = c.category_id
WHERE c.category_type = 'Income';

-- Query 19: Total budgeted amount for April 2026
-- Explanation: Simple aggregation on budgets table.
-- Teaching Tip: Compare this with actual spending (next queries).
SELECT SUM(budgeted_amount) AS total_budget 
FROM budgets 
WHERE budget_month = '2026-04-01';

-- Query 20: Categories that have no transactions yet
-- Explanation: Uses subquery with NOT IN to find missing data.
-- Teaching Tip: This pattern is very useful for "inactive" or "unused" items.
SELECT category_name 
FROM categories 
WHERE category_id NOT IN (SELECT category_id FROM transactions);


-- =====================================================
-- SECTION 3: Basic Joins & Filtering (21-30)
-- =====================================================

-- Query 21: Show transactions with from_account and to_account names
-- Explanation: Self JOIN on accounts table using LEFT JOIN to handle possible NULLs.
-- Teaching Tip: Explain why we use LEFT JOIN here (some transactions may have only from or only to).
SELECT 
    fa.account_name AS from_account,
    ta.account_name AS to_account,
    t.amount,
    t.transaction_date
FROM transactions t
LEFT JOIN accounts fa ON t.from_account_id = fa.account_id
LEFT JOIN accounts ta ON t.to_account_id = ta.account_id;

-- Query 22: Budget vs Actual for Rent category
-- Explanation: Basic budget vs actual comparison for one category.
-- Teaching Tip: This is the beginning of real variance analysis.
SELECT 
    b.budgeted_amount,
    COALESCE(SUM(t.amount), 0) AS actual_spent
FROM budgets b
LEFT JOIN transactions t 
    ON t.category_id = b.category_id 
    AND t.transaction_date >= b.budget_month 
    AND t.transaction_date < DATE_ADD(b.budget_month, INTERVAL 1 MONTH)
WHERE b.budget_month = '2026-04-01'
  AND b.category_id = (SELECT category_id FROM categories WHERE category_name = 'Rent')
GROUP BY b.budgeted_amount;

-- Query 23: Rich transaction view with category and account
-- Explanation: Multiple JOINs to create a meaningful report.
-- Teaching Tip: This is how most financial reports are built in real applications.
SELECT 
    t.transaction_date,
    c.category_name,
    fa.account_name AS from_account,
    t.amount,
    t.description
FROM transactions t
JOIN categories c ON t.category_id = c.category_id
LEFT JOIN accounts fa ON t.from_account_id = fa.account_id;

-- Query 24: Accounts that have made at least one transaction
-- Explanation: Uses DISTINCT to remove duplicate account names.
-- Teaching Tip: DISTINCT is useful but can hide performance issues if overused.
SELECT DISTINCT a.account_name 
FROM accounts a
JOIN transactions t 
    ON a.account_id = t.from_account_id 
    OR a.account_id = t.to_account_id;

-- Query 25: Total income in April 2026
-- Explanation: Filtered aggregation using date range and category type.
-- Teaching Tip: Combine income and expense queries to calculate net savings.
SELECT SUM(t.amount) AS total_income 
FROM transactions t
JOIN categories c ON t.category_id = c.category_id
WHERE c.category_type = 'Income'
  AND t.transaction_date >= '2026-04-01' 
  AND t.transaction_date < '2026-05-01';

-- Query 26: Update a transaction description (DML)
-- Explanation: Basic UPDATE statement. Always use WHERE clause!
-- Teaching Tip: Warn students: "Never run UPDATE without WHERE in production!"
UPDATE transactions 
SET description = 'Updated: April rent payment' 
WHERE transaction_id = 1;   -- Change ID according to your data

-- Query 27: Delete test transactions
-- Explanation: DELETE with LIKE pattern matching.
-- Teaching Tip: Always take backup before running DELETE in live environment.
DELETE FROM transactions 
WHERE description LIKE '%test%' 
  AND transaction_date > '2026-04-01';

-- Query 28: Insert new budget for May 2026
-- Explanation: INSERT using subquery to get category_id dynamically.
-- Teaching Tip: This pattern avoids hardcoding IDs - very good practice.
INSERT INTO budgets (category_id, budget_month, budgeted_amount, notes)
VALUES (
    (SELECT category_id FROM categories WHERE category_name = 'Groceries'),
    '2026-05-01',
    8500.00,
    'Increased grocery budget for May'
);

-- Query 29: Categories that are over budget (using HAVING)
-- Explanation: HAVING clause is used to filter groups after aggregation.
-- Teaching Tip: Difference between WHERE and HAVING is a very common interview question.
SELECT c.category_name, b.budgeted_amount, SUM(t.amount) AS actual
FROM budgets b
JOIN categories c ON b.category_id = c.category_id
JOIN transactions t ON t.category_id = b.category_id
WHERE b.budget_month = '2026-04-01'
GROUP BY c.category_name, b.budgeted_amount
HAVING SUM(t.amount) > b.budgeted_amount;

-- Query 30: Create a reusable view for budget summary
-- Explanation: Views store complex queries for easy reuse.
-- Teaching Tip: Views improve code maintainability and security.
CREATE OR REPLACE VIEW budget_summary AS
SELECT c.category_name, b.budgeted_amount, 
       COALESCE(SUM(t.amount), 0) AS actual_spent
FROM budgets b
JOIN categories c ON b.category_id = c.category_id
LEFT JOIN transactions t 
    ON t.category_id = b.category_id 
    AND t.transaction_date >= b.budget_month 
    AND t.transaction_date < DATE_ADD(b.budget_month, INTERVAL 1 MONTH)
GROUP BY c.category_name, b.budgeted_amount;

-- Usage of the view:
-- SELECT * FROM budget_summary ORDER BY actual_spent DESC;


-- =====================================================
-- SECTION 4: Slightly Advanced Queries (31-40)
-- =====================================================

-- Query 31: Running (cumulative) total of expenses
-- Explanation: Uses Window function SUM() OVER() to show running total.
-- Teaching Tip: Window functions are very powerful and widely used in financial reporting.
SELECT 
    transaction_date,
    amount,
    SUM(amount) OVER (ORDER BY transaction_date) AS running_total_expense
FROM transactions t
JOIN categories c ON t.category_id = c.category_id
WHERE c.category_type = 'Expense'
ORDER BY transaction_date;

-- Query 32: Budget utilization with status using CASE
-- Explanation: Combines calculation, ROUND, and CASE expression for readable status.
-- Teaching Tip: CASE is like IF-ELSE in SQL. Very useful for reports.
SELECT 
    c.category_name,
    b.budgeted_amount,
    COALESCE(SUM(t.amount), 0) AS actual,
    ROUND(COALESCE(SUM(t.amount), 0) / b.budgeted_amount * 100, 2) AS utilization_pct,
    CASE 
        WHEN COALESCE(SUM(t.amount), 0) > b.budgeted_amount THEN 'Over Budget ⚠️'
        ELSE 'Within Budget ✓'
    END AS status
FROM budgets b
JOIN categories c ON b.category_id = c.category_id
LEFT JOIN transactions t 
    ON t.category_id = b.category_id 
    AND t.transaction_date >= b.budget_month 
    AND t.transaction_date < DATE_ADD(b.budget_month, INTERVAL 1 MONTH)
WHERE b.budget_month = '2026-04-01'
GROUP BY c.category_name, b.budgeted_amount;

-- Query 33: Transactions above average amount
-- Explanation: Uses subquery in WHERE clause.
-- Teaching Tip: Subqueries are useful when we need to compare with a calculated value.
SELECT t.amount, c.category_name
FROM transactions t
JOIN categories c ON t.category_id = c.category_id
WHERE t.amount > (SELECT AVG(amount) FROM transactions);

-- Query 34: Monthly spending trend
-- Explanation: Uses DATE_FORMAT to group by month start.
-- Teaching Tip: DATE_FORMAT and DATE_ADD are essential for time-series analysis in MySQL.
SELECT 
    DATE_FORMAT(transaction_date, '%Y-%m-01') AS month,
    SUM(amount) AS monthly_spending
FROM transactions t
JOIN categories c ON t.category_id = c.category_id
WHERE c.category_type = 'Expense'
GROUP BY DATE_FORMAT(transaction_date, '%Y-%m-01')
ORDER BY month;

-- Query 35: Accounts with zero or null balance
-- Explanation: Handles both zero and NULL values.
-- Teaching Tip: Always consider NULLs in financial data.
SELECT account_name 
FROM accounts 
WHERE balance = 0 
   OR balance IS NULL;

-- Query 36: Rank categories by total spending
-- Explanation: Uses RANK() window function (MySQL 8.0+).
-- Teaching Tip: RANK(), DENSE_RANK(), ROW_NUMBER() are frequently asked in interviews.
SELECT 
    c.category_name,
    SUM(t.amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(t.amount) DESC) AS spending_rank
FROM transactions t
JOIN categories c ON t.category_id = c.category_id
WHERE c.category_type = 'Expense'
GROUP BY c.category_name;

-- Query 37: Net cash flow (Income minus Expense)
-- Explanation: Uses conditional aggregation with CASE inside SUM.
-- Teaching Tip: This is a very common pattern in finance and accounting reports.
SELECT 
    SUM(CASE WHEN c.category_type = 'Income' THEN t.amount ELSE 0 END) AS total_income,
    SUM(CASE WHEN c.category_type = 'Expense' THEN t.amount ELSE 0 END) AS total_expense,
    SUM(CASE WHEN c.category_type = 'Income' THEN t.amount 
             WHEN c.category_type = 'Expense' THEN -t.amount 
             ELSE 0 END) AS net_cash_flow
FROM transactions t
JOIN categories c ON t.category_id = c.category_id;

-- Query 38: Categories with budget but no spending
-- Explanation: Uses NOT EXISTS subquery.
-- Teaching Tip: NOT EXISTS is often more efficient than NOT IN for large tables.
SELECT c.category_name, b.budgeted_amount
FROM budgets b
JOIN categories c ON b.category_id = c.category_id
WHERE NOT EXISTS (
    SELECT 1 FROM transactions t 
    WHERE t.category_id = b.category_id 
      AND t.transaction_date >= b.budget_month 
      AND t.transaction_date < DATE_ADD(b.budget_month, INTERVAL 1 MONTH)
);

-- Query 39: Year-to-Date (YTD) spending for 2026
-- Explanation: Calculates spending from the start of the year.
-- Teaching Tip: YTD, MTD, QTD calculations are standard in financial dashboards.
SELECT SUM(t.amount) AS ytd_spending
FROM transactions t
JOIN categories c ON t.category_id = c.category_id
WHERE c.category_type = 'Expense'
  AND transaction_date >= '2026-01-01';

-- Query 40: Most frequent transaction descriptions
-- Explanation: Groups by text column and finds top repeated items.
-- Teaching Tip: Useful to identify regular expenses like "Netflix", "Petrol", etc.
SELECT description, COUNT(*) AS frequency
FROM transactions
GROUP BY description
ORDER BY frequency DESC
LIMIT 5;

-- =====================================================
-- End of 40 Queries (MySQL Version)
-- =====================================================
-- Teaching Tip for Trainers:
-- 1. Run queries one by one in MySQL Workbench / DBeaver / phpMyAdmin
-- 2. Explain concept first, then run, then discuss real-life budgeting use
-- 3. Ask students to modify each query slightly (e.g., change dates, add filters)
-- 4. Use these as foundation before moving to Triggers, Stored Procedures, or Indexing
-- =====================================================
-- End of 40 Queries
-- =====================================================
-- Teaching Tip for Trainers:
-- 1. Run queries one by one
-- 2. Explain concept first, then run, then discuss real-life use
-- 3. Ask students to modify each query slightly
-- 4. Use these as foundation before moving to Triggers, Stored Procedures, or Indexing
