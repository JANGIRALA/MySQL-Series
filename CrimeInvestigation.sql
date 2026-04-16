-- =====================================================
-- CRIME INVESTIGATION DATABASE - FULL SQL FILE
-- "Operation Shadow Transfer" - ₹3.8 Crore Bank Robbery Case
-- MySQL Version - Ready for Live Session
-- =====================================================
-- Author/Instructor: Prof. Srinivas Jangirala
-- =====================================================
-- 1. CREATE DATABASE AND TABLES
-- =====================================================

CREATE DATABASE IF NOT EXISTS crime_investigation;
USE crime_investigation;

-- Table 1: Suspects
CREATE TABLE suspects (
    suspect_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    phone VARCHAR(15),
    address VARCHAR(255),
    status ENUM('Arrested', 'Under Investigation', 'Released') DEFAULT 'Under Investigation',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table 2: Bank Accounts
CREATE TABLE bank_accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    account_number VARCHAR(20) UNIQUE NOT NULL,
    bank_name VARCHAR(50) NOT NULL,
    account_holder VARCHAR(100),
    account_type ENUM('Victim', 'Suspicious', 'Mule') NOT NULL
);

-- Table 3: Transactions (Core Table)
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    from_account_id INT,
    to_account_id INT,
    amount DECIMAL(15,2) NOT NULL,
    transaction_date DATETIME NOT NULL,
    transaction_type VARCHAR(50),
    suspect_id INT,
    FOREIGN KEY (from_account_id) REFERENCES bank_accounts(account_id) ON DELETE SET NULL,
    FOREIGN KEY (to_account_id) REFERENCES bank_accounts(account_id) ON DELETE SET NULL,
    FOREIGN KEY (suspect_id) REFERENCES suspects(suspect_id) ON DELETE SET NULL
);

-- Table 4: Evidence
CREATE TABLE evidence (
    evidence_id INT AUTO_INCREMENT PRIMARY KEY,
    suspect_id INT,
    transaction_id INT,
    evidence_type VARCHAR(50) NOT NULL,
    description TEXT,
    collected_date DATE NOT NULL,
    FOREIGN KEY (suspect_id) REFERENCES suspects(suspect_id) ON DELETE SET NULL,
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id) ON DELETE SET NULL
);

-- =====================================================
-- 2. INSERT 20 RECORDS FOR EACH TABLE
-- =====================================================

-- 20 Suspects
INSERT INTO suspects (full_name, date_of_birth, phone, address, status) VALUES
('Ravi Malhotra', '1985-03-12', '9876543210', 'Andheri West, Mumbai', 'Arrested'),
('Priya Sharma', '1992-07-25', '9876543211', 'Powai, Mumbai', 'Under Investigation'),
('Karan Singh', '1988-11-05', '9876543212', 'Thane', 'Under Investigation'),
('Neha Gupta', '1995-01-18', '9876543213', 'Navi Mumbai', 'Under Investigation'),
('Amit Verma', '1987-09-30', '9876543214', 'Borivali, Mumbai', 'Under Investigation'),
('Sneha Rao', '1993-04-15', '9876543215', 'Pune', 'Released'),
('Vikas Patel', '1984-12-22', '9876543216', 'Surat', 'Under Investigation'),
('Meera Khan', '1991-06-08', '9876543217', 'Hyderabad', 'Arrested'),
('Rahul Nair', '1989-02-14', '9876543218', 'Bangalore', 'Under Investigation'),
('Anjali Desai', '1996-11-20', '9876543219', 'Chennai', 'Under Investigation'),
('Sanjay Gupta', '1982-08-05', '9876543220', 'Delhi', 'Released'),
('Pooja Reddy', '1994-03-10', '9876543221', 'Kochi', 'Under Investigation'),
('Arjun Malhotra', '1986-05-25', '9876543222', 'Ahmedabad', 'Arrested'),
('Divya Sharma', '1990-10-12', '9876543223', 'Indore', 'Under Investigation'),
('Rohit Singh', '1988-07-18', '9876543224', 'Jaipur', 'Under Investigation'),
('Kavita Nair', '1992-01-30', '9876543225', 'Lucknow', 'Released'),
('Manoj Kumar', '1983-09-05', '9876543226', 'Patna', 'Under Investigation'),
('Sunita Verma', '1995-12-08', '9876543227', 'Bhopal', 'Under Investigation'),
('Vivek Rao', '1987-04-22', '9876543228', 'Nagpur', 'Arrested'),
('Preeti Joshi', '1991-08-15', '9876543229', 'Vadodara', 'Under Investigation');

-- 20 Bank Accounts
INSERT INTO bank_accounts (account_number, bank_name, account_holder, account_type) VALUES
('12345678901', 'National Bank', 'Rajesh Kumar', 'Victim'),
('98765432109', 'HDFC Bank', 'Ravi Malhotra', 'Suspicious'),
('55555555555', 'ICICI Bank', 'Karan Singh', 'Mule'),
('11112222333', 'SBI', 'Priya Sharma', 'Suspicious'),
('44445555666', 'Axis Bank', 'Neha Gupta', 'Mule'),
('77778888999', 'Kotak Bank', 'Amit Verma', 'Victim'),
('22223333444', 'Yes Bank', 'Sneha Rao', 'Mule'),
('88889999000', 'Federal Bank', 'Vikas Patel', 'Suspicious'),
('33334444555', 'Canara Bank', 'Meera Khan', 'Mule'),
('66667777888', 'Union Bank', 'Rahul Nair', 'Victim'),
('99990000111', 'Bank of Baroda', 'Anjali Desai', 'Suspicious'),
('12121212121', 'Indian Bank', 'Sanjay Gupta', 'Mule'),
('34343434343', 'Punjab National Bank', 'Pooja Reddy', 'Victim'),
('56565656565', 'IDBI Bank', 'Arjun Malhotra', 'Suspicious'),
('78787878787', 'Central Bank', 'Divya Sharma', 'Mule'),
('90909090909', 'RBL Bank', 'Rohit Singh', 'Suspicious'),
('10101010101', 'Bandhan Bank', 'Kavita Nair', 'Mule'),
('23232323232', 'DBS Bank', 'Manoj Kumar', 'Victim'),
('45454545454', 'Lakshmi Vilas Bank', 'Sunita Verma', 'Suspicious'),
('67676767676', 'South Indian Bank', 'Vivek Rao', 'Mule');

-- 20 Transactions (Money Trail)
INSERT INTO transactions (from_account_id, to_account_id, amount, transaction_date, transaction_type, suspect_id) VALUES
(1, 2, 1250000.00, '2026-04-15 09:15:00', 'Transfer', 1),
(2, 3, 800000.00, '2026-04-15 09:45:00', 'Transfer', 3),
(1, 4, 650000.00, '2026-04-15 10:05:00', 'Transfer', 2),
(3, 5, 450000.00, '2026-04-15 10:30:00', 'Transfer', 4),
(6, 8, 920000.00, '2026-04-15 11:10:00', 'Transfer', 5),
(2, 9, 380000.00, '2026-04-15 11:45:00', 'Withdrawal', 1),
(4, 11, 720000.00, '2026-04-15 12:20:00', 'Transfer', 2),
(5, 12, 290000.00, '2026-04-15 13:05:00', 'Transfer', 3),
(7, 14, 510000.00, '2026-04-15 14:15:00', 'Transfer', 8),
(8, 15, 670000.00, '2026-04-15 15:30:00', 'Withdrawal', 7),
(9, 16, 410000.00, '2026-04-15 16:10:00', 'Transfer', 9),
(10, 17, 850000.00, '2026-04-15 17:00:00', 'Transfer', 10),
(11, 18, 330000.00, '2026-04-15 17:45:00', 'Withdrawal', 11),
(12, 19, 480000.00, '2026-04-15 18:30:00', 'Transfer', 12),
(13, 20, 620000.00, '2026-04-15 19:15:00', 'Transfer', 13),
(14, 2, 290000.00, '2026-04-15 20:00:00', 'Transfer', 14),
(15, 4, 750000.00, '2026-04-15 20:45:00', 'Withdrawal', 15),
(16, 6, 440000.00, '2026-04-15 21:30:00', 'Transfer', 16),
(17, 8, 680000.00, '2026-04-15 22:15:00', 'Transfer', 17),
(18, 10, 520000.00, '2026-04-15 23:00:00', 'Withdrawal', 18);

-- 20 Evidence Records
INSERT INTO evidence (suspect_id, transaction_id, evidence_type, description, collected_date) VALUES
(1, 1, 'CCTV', 'Ravi seen near ATM after transfer', '2026-04-16'),
(2, 3, 'IP Trace', 'Login from Priya’s residential IP', '2026-04-17'),
(3, 2, 'Phone Log', 'Call to Karan before transaction', '2026-04-16'),
(4, 4, 'Witness', 'Neha seen withdrawing cash', '2026-04-18'),
(5, 5, 'CCTV', 'Amit at suspicious ATM', '2026-04-17'),
(1, 6, 'Bank Statement', 'Large withdrawal by Ravi', '2026-04-19'),
(2, 7, 'Digital Footprint', 'Malicious code linked to Priya', '2026-04-20'),
(8, 9, 'Phone Log', 'Meera coordinated with group', '2026-04-18'),
(7, 10, 'CCTV', 'Vikas at cash point', '2026-04-19'),
(9, 11, 'Witness', 'Rahul seen with Karan', '2026-04-21'),
(10, 12, 'IP Trace', 'Anjali’s device used', '2026-04-20'),
(11, 13, 'Bank CCTV', 'Sanjay at withdrawal', '2026-04-22'),
(12, 14, 'Phone Record', 'Pooja called mastermind', '2026-04-19'),
(13, 15, 'CCTV', 'Arjun at multiple ATMs', '2026-04-21'),
(14, 16, 'Digital Evidence', 'Divya’s laptop had transaction logs', '2026-04-23'),
(15, 17, 'Witness', 'Rohit seen with cash bag', '2026-04-22'),
(16, 18, 'Phone Log', 'Kavita coordinated withdrawals', '2026-04-24'),
(17, 19, 'CCTV', 'Manoj at final drop point', '2026-04-23'),
(18, 20, 'Bank Statement', 'Sunita received final transfer', '2026-04-25'),
(19, 1, 'Forensic Report', 'Ravi’s fingerprint on device', '2026-04-26');

-- =====================================================
-- 3. 40 SQL QUERIES (Basic to Advanced)
-- =====================================================

-- =====================================================
-- CRIME INVESTIGATION DATABASE - FULL SQL FILE
-- "Operation Shadow Transfer" - ₹3.8 Crore Bank Robbery Case
-- MySQL Version - Ready for Live Session
-- =====================================================

-- =====================================================
-- 1. CREATE DATABASE AND TABLES
-- =====================================================
CREATE DATABASE IF NOT EXISTS crime_investigation;
USE crime_investigation;

CREATE TABLE suspects (
    suspect_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    phone VARCHAR(15),
    address VARCHAR(255),
    status ENUM('Arrested', 'Under Investigation', 'Released') DEFAULT 'Under Investigation',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE bank_accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    account_number VARCHAR(20) UNIQUE NOT NULL,
    bank_name VARCHAR(50) NOT NULL,
    account_holder VARCHAR(100),
    account_type ENUM('Victim', 'Suspicious', 'Mule') NOT NULL
);

CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    from_account_id INT,
    to_account_id INT,
    amount DECIMAL(15,2) NOT NULL,
    transaction_date DATETIME NOT NULL,
    transaction_type VARCHAR(50),
    suspect_id INT,
    FOREIGN KEY (from_account_id) REFERENCES bank_accounts(account_id) ON DELETE SET NULL,
    FOREIGN KEY (to_account_id) REFERENCES bank_accounts(account_id) ON DELETE SET NULL,
    FOREIGN KEY (suspect_id) REFERENCES suspects(suspect_id) ON DELETE SET NULL
);

CREATE TABLE evidence (
    evidence_id INT AUTO_INCREMENT PRIMARY KEY,
    suspect_id INT,
    transaction_id INT,
    evidence_type VARCHAR(50) NOT NULL,
    description TEXT,
    collected_date DATE NOT NULL,
    FOREIGN KEY (suspect_id) REFERENCES suspects(suspect_id) ON DELETE SET NULL,
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id) ON DELETE SET NULL
);

-- =====================================================
-- 2. INSERT 20 RECORDS FOR EACH TABLE
-- =====================================================

-- 20 Suspects
INSERT INTO suspects (full_name, date_of_birth, phone, address, status) VALUES
('Ravi Malhotra', '1985-03-12', '9876543210', 'Andheri West, Mumbai', 'Arrested'),
('Priya Sharma', '1992-07-25', '9876543211', 'Powai, Mumbai', 'Under Investigation'),
('Karan Singh', '1988-11-05', '9876543212', 'Thane', 'Under Investigation'),
('Neha Gupta', '1995-01-18', '9876543213', 'Navi Mumbai', 'Under Investigation'),
('Amit Verma', '1987-09-30', '9876543214', 'Borivali, Mumbai', 'Under Investigation'),
('Sneha Rao', '1993-04-15', '9876543215', 'Pune', 'Released'),
('Vikas Patel', '1984-12-22', '9876543216', 'Surat', 'Under Investigation'),
('Meera Khan', '1991-06-08', '9876543217', 'Hyderabad', 'Arrested'),
('Rahul Nair', '1989-02-14', '9876543218', 'Bangalore', 'Under Investigation'),
('Anjali Desai', '1996-11-20', '9876543219', 'Chennai', 'Under Investigation'),
('Sanjay Gupta', '1982-08-05', '9876543220', 'Delhi', 'Released'),
('Pooja Reddy', '1994-03-10', '9876543221', 'Kochi', 'Under Investigation'),
('Arjun Malhotra', '1986-05-25', '9876543222', 'Ahmedabad', 'Arrested'),
('Divya Sharma', '1990-10-12', '9876543223', 'Indore', 'Under Investigation'),
('Rohit Singh', '1988-07-18', '9876543224', 'Jaipur', 'Under Investigation'),
('Kavita Nair', '1992-01-30', '9876543225', 'Lucknow', 'Released'),
('Manoj Kumar', '1983-09-05', '9876543226', 'Patna', 'Under Investigation'),
('Sunita Verma', '1995-12-08', '9876543227', 'Bhopal', 'Under Investigation'),
('Vivek Rao', '1987-04-22', '9876543228', 'Nagpur', 'Arrested'),
('Preeti Joshi', '1991-08-15', '9876543229', 'Vadodara', 'Under Investigation');

-- 20 Bank Accounts
INSERT INTO bank_accounts (account_number, bank_name, account_holder, account_type) VALUES
('12345678901', 'National Bank', 'Rajesh Kumar', 'Victim'),
('98765432109', 'HDFC Bank', 'Ravi Malhotra', 'Suspicious'),
('55555555555', 'ICICI Bank', 'Karan Singh', 'Mule'),
('11112222333', 'SBI', 'Priya Sharma', 'Suspicious'),
('44445555666', 'Axis Bank', 'Neha Gupta', 'Mule'),
('77778888999', 'Kotak Bank', 'Amit Verma', 'Victim'),
('22223333444', 'Yes Bank', 'Sneha Rao', 'Mule'),
('88889999000', 'Federal Bank', 'Vikas Patel', 'Suspicious'),
('33334444555', 'Canara Bank', 'Meera Khan', 'Mule'),
('66667777888', 'Union Bank', 'Rahul Nair', 'Victim'),
('99990000111', 'Bank of Baroda', 'Anjali Desai', 'Suspicious'),
('12121212121', 'Indian Bank', 'Sanjay Gupta', 'Mule'),
('34343434343', 'Punjab National Bank', 'Pooja Reddy', 'Victim'),
('56565656565', 'IDBI Bank', 'Arjun Malhotra', 'Suspicious'),
('78787878787', 'Central Bank', 'Divya Sharma', 'Mule'),
('90909090909', 'RBL Bank', 'Rohit Singh', 'Suspicious'),
('10101010101', 'Bandhan Bank', 'Kavita Nair', 'Mule'),
('23232323232', 'DBS Bank', 'Manoj Kumar', 'Victim'),
('45454545454', 'Lakshmi Vilas Bank', 'Sunita Verma', 'Suspicious'),
('67676767676', 'South Indian Bank', 'Vivek Rao', 'Mule');

-- 20 Transactions
INSERT INTO transactions (from_account_id, to_account_id, amount, transaction_date, transaction_type, suspect_id) VALUES
(1, 2, 1250000.00, '2026-04-15 09:15:00', 'Transfer', 1),
(2, 3, 800000.00, '2026-04-15 09:45:00', 'Transfer', 3),
(1, 4, 650000.00, '2026-04-15 10:05:00', 'Transfer', 2),
(3, 5, 450000.00, '2026-04-15 10:30:00', 'Transfer', 4),
(6, 8, 920000.00, '2026-04-15 11:10:00', 'Transfer', 5),
(2, 9, 380000.00, '2026-04-15 11:45:00', 'Withdrawal', 1),
(4, 11, 720000.00, '2026-04-15 12:20:00', 'Transfer', 2),
(5, 12, 290000.00, '2026-04-15 13:05:00', 'Transfer', 3),
(7, 14, 510000.00, '2026-04-15 14:15:00', 'Transfer', 8),
(8, 15, 670000.00, '2026-04-15 15:30:00', 'Withdrawal', 7),
(9, 16, 410000.00, '2026-04-15 16:10:00', 'Transfer', 9),
(10, 17, 850000.00, '2026-04-15 17:00:00', 'Transfer', 10),
(11, 18, 330000.00, '2026-04-15 17:45:00', 'Withdrawal', 11),
(12, 19, 480000.00, '2026-04-15 18:30:00', 'Transfer', 12),
(13, 20, 620000.00, '2026-04-15 19:15:00', 'Transfer', 13),
(14, 2, 290000.00, '2026-04-15 20:00:00', 'Transfer', 14),
(15, 4, 750000.00, '2026-04-15 20:45:00', 'Withdrawal', 15),
(16, 6, 440000.00, '2026-04-15 21:30:00', 'Transfer', 16),
(17, 8, 680000.00, '2026-04-15 22:15:00', 'Transfer', 17),
(18, 10, 520000.00, '2026-04-15 23:00:00', 'Withdrawal', 18);

-- 20 Evidence
INSERT INTO evidence (suspect_id, transaction_id, evidence_type, description, collected_date) VALUES
(1, 1, 'CCTV', 'Ravi seen near ATM after transfer', '2026-04-16'),
(2, 3, 'IP Trace', 'Login from Priya’s residential IP', '2026-04-17'),
(3, 2, 'Phone Log', 'Call to Karan before transaction', '2026-04-16'),
(4, 4, 'Witness', 'Neha seen withdrawing cash', '2026-04-18'),
(5, 5, 'CCTV', 'Amit at suspicious ATM', '2026-04-17'),
(1, 6, 'Bank Statement', 'Large withdrawal by Ravi', '2026-04-19'),
(2, 7, 'Digital Footprint', 'Malicious code linked to Priya', '2026-04-20'),
(8, 9, 'Phone Log', 'Meera coordinated with group', '2026-04-18'),
(7, 10, 'CCTV', 'Vikas at cash point', '2026-04-19'),
(9, 11, 'Witness', 'Rahul seen with Karan', '2026-04-21'),
(10, 12, 'IP Trace', 'Anjali’s device used', '2026-04-20'),
(11, 13, 'Bank CCTV', 'Sanjay at withdrawal', '2026-04-22'),
(12, 14, 'Phone Record', 'Pooja called mastermind', '2026-04-19'),
(13, 15, 'CCTV', 'Arjun at multiple ATMs', '2026-04-21'),
(14, 16, 'Digital Evidence', 'Divya’s laptop had transaction logs', '2026-04-23'),
(15, 17, 'Witness', 'Rohit seen with cash bag', '2026-04-22'),
(16, 18, 'Phone Log', 'Kavita coordinated withdrawals', '2026-04-24'),
(17, 19, 'CCTV', 'Manoj at final drop point', '2026-04-23'),
(18, 20, 'Bank Statement', 'Sunita received final transfer', '2026-04-25'),
(19, 1, 'Forensic Report', 'Ravi’s fingerprint on device', '2026-04-26');

-- =====================================================
-- 3. 40 INVESTIGATIVE SQL QUERIES
-- =====================================================

-- Question 1: Show the complete list of all suspects under investigation.
SELECT * FROM suspects;

-- Question 2: List the full name, phone number, and status of all arrested suspects.
SELECT full_name, phone, status FROM suspects WHERE status = 'Arrested';

-- Question 3: Show the account number and account holder name for all victim accounts.
SELECT account_number, account_holder FROM bank_accounts WHERE account_type = 'Victim';

-- Question 4: What is the total amount of money stolen in this robbery?
SELECT SUM(amount) AS total_stolen FROM transactions;

-- Question 5: Show the 10 largest transactions in descending order of amount.
SELECT * FROM transactions ORDER BY amount DESC LIMIT 10;

-- Question 6: How many transactions is each suspect linked to?
SELECT s.full_name, COUNT(t.transaction_id) AS transaction_count 
FROM suspects s LEFT JOIN transactions t ON s.suspect_id = t.suspect_id 
GROUP BY s.full_name;

-- Question 7: What are the different types of evidence collected so far?
SELECT DISTINCT evidence_type FROM evidence;

-- Question 8: Which suspects have no evidence recorded against them yet?
SELECT full_name FROM suspects WHERE suspect_id NOT IN (SELECT suspect_id FROM evidence);

-- Question 9: Show the 10 most recent transactions with date and amount.
SELECT transaction_date, amount, transaction_type 
FROM transactions ORDER BY transaction_date DESC LIMIT 10;

-- Question 10: How many accounts are there in each bank?
SELECT bank_name, COUNT(*) AS account_count FROM bank_accounts GROUP BY bank_name;

-- Question 11: How much money has each suspect moved in total?
SELECT s.full_name, SUM(t.amount) AS total_moved 
FROM suspects s JOIN transactions t ON s.suspect_id = t.suspect_id 
GROUP BY s.full_name ORDER BY total_moved DESC;

-- Question 12: How many transactions are linked to each account type?
SELECT ba.account_type, COUNT(t.transaction_id) AS txn_count 
FROM bank_accounts ba 
JOIN transactions t ON ba.account_id = t.from_account_id OR ba.account_id = t.to_account_id 
GROUP BY ba.account_type;

-- Question 13: What is the average amount per transaction?
SELECT AVG(amount) AS average_transaction_amount FROM transactions;

-- Question 14: How many pieces of evidence are collected against each suspect?
SELECT s.full_name, COUNT(e.evidence_id) AS evidence_count 
FROM suspects s LEFT JOIN evidence e ON s.suspect_id = e.suspect_id 
GROUP BY s.full_name;

-- Question 15: What is the monthly total of stolen money?
SELECT DATE_FORMAT(transaction_date, '%Y-%m') AS month, 
       SUM(amount) AS monthly_total 
FROM transactions GROUP BY DATE_FORMAT(transaction_date, '%Y-%m');

-- Question 16: Show the total amount moved by each suspect along with their current status.
SELECT s.full_name, s.status, SUM(t.amount) AS total_moved 
FROM suspects s JOIN transactions t ON s.suspect_id = t.suspect_id 
GROUP BY s.full_name, s.status;

-- Question 17: Which bank has the highest number of suspicious or mule accounts?
SELECT bank_name, COUNT(*) AS suspicious_accounts 
FROM bank_accounts 
WHERE account_type IN ('Suspicious', 'Mule') 
GROUP BY bank_name ORDER BY suspicious_accounts DESC;

-- Question 18: How many transactions happened on 15th April 2026?
SELECT COUNT(*) AS transactions_on_15_april 
FROM transactions WHERE DATE(transaction_date) = '2026-04-15';

-- Question 19: List all suspects who have at least one evidence record.
SELECT DISTINCT s.full_name 
FROM suspects s JOIN evidence e ON s.suspect_id = e.suspect_id;

-- Question 20: What is the total number of evidence records collected?
SELECT COUNT(*) AS total_evidence FROM evidence;

-- Question 21: Show the complete money trail with suspect name, from account, to account, and amount.
SELECT t.transaction_id, s.full_name AS suspect, 
       fa.account_number AS from_account, 
       ta.account_number AS to_account, 
       t.amount, t.transaction_date
FROM transactions t
JOIN suspects s ON t.suspect_id = s.suspect_id
LEFT JOIN bank_accounts fa ON t.from_account_id = fa.account_id
LEFT JOIN bank_accounts ta ON t.to_account_id = ta.account_id;

-- Question 22: Show all evidence along with the suspect name and related transaction amount.
SELECT e.evidence_type, e.description, s.full_name AS suspect, t.amount
FROM evidence e
JOIN suspects s ON e.suspect_id = s.suspect_id
LEFT JOIN transactions t ON e.transaction_id = t.transaction_id;

-- Question 23: Which suspects were involved in both transfers and withdrawals?
SELECT DISTINCT s.full_name 
FROM suspects s
JOIN transactions t ON s.suspect_id = t.suspect_id
WHERE t.transaction_type IN ('Transfer', 'Withdrawal');

-- Question 24: Which accounts received money from victim accounts?
SELECT DISTINCT ba.account_number, ba.account_holder, ba.account_type 
FROM transactions t
JOIN bank_accounts ba ON t.to_account_id = ba.account_id
WHERE t.from_account_id IN (SELECT account_id FROM bank_accounts WHERE account_type = 'Victim');

-- Question 25: Show all transactions done by arrested suspects.
SELECT t.*, s.full_name 
FROM transactions t
JOIN suspects s ON t.suspect_id = s.suspect_id
WHERE s.status = 'Arrested';

-- Question 26: List suspects along with the number of different evidence types against them.
SELECT s.full_name, COUNT(DISTINCT e.evidence_type) AS different_evidence_types 
FROM suspects s JOIN evidence e ON s.suspect_id = e.suspect_id 
GROUP BY s.full_name;

-- Question 27: Find the suspect who moved the highest amount of money.
SELECT s.full_name, SUM(t.amount) AS total_moved 
FROM suspects s JOIN transactions t ON s.suspect_id = t.suspect_id 
GROUP BY s.full_name ORDER BY total_moved DESC LIMIT 1;

-- Question 28: Show the money flow only for mule accounts.
SELECT t.transaction_id, t.amount, ba.account_number 
FROM transactions t
JOIN bank_accounts ba ON t.to_account_id = ba.account_id
WHERE ba.account_type = 'Mule';

-- Question 29: How many pieces of evidence were collected in April 2026?
SELECT COUNT(*) AS april_evidence 
FROM evidence 
WHERE collected_date BETWEEN '2026-04-01' AND '2026-04-30';

-- Question 30: List all victim accounts that lost money (had outgoing transactions).
SELECT DISTINCT ba.account_number, ba.account_holder 
FROM bank_accounts ba
JOIN transactions t ON ba.account_id = t.from_account_id
WHERE ba.account_type = 'Victim';

-- Question 31: Show the running (cumulative) total of stolen money over time.
SELECT transaction_date, amount,
       SUM(amount) OVER (ORDER BY transaction_date) AS running_total_stolen
FROM transactions ORDER BY transaction_date;

-- Question 32: Classify each suspect as High Risk or Medium Risk based on money moved.
SELECT s.full_name, SUM(t.amount) AS total_moved,
       CASE WHEN SUM(t.amount) > 500000 THEN 'High Risk ⚠️' ELSE 'Medium Risk' END AS risk_level
FROM suspects s JOIN transactions t ON s.suspect_id = t.suspect_id 
GROUP BY s.full_name;

-- Question 33: Show all transactions that are above the average transaction amount.
SELECT * FROM transactions 
WHERE amount > (SELECT AVG(amount) FROM transactions);

-- Question 34: Show monthly trend of total stolen money.
SELECT DATE_FORMAT(transaction_date, '%Y-%m') AS month, 
       SUM(amount) AS monthly_total
FROM transactions GROUP BY DATE_FORMAT(transaction_date, '%Y-%m') ORDER BY month;

-- Question 35: Which suspects have evidence of at least 2 different types?
SELECT s.full_name, COUNT(DISTINCT e.evidence_type) AS evidence_types 
FROM suspects s JOIN evidence e ON s.suspect_id = e.suspect_id 
GROUP BY s.full_name HAVING evidence_types >= 2;

-- Question 36: Rank the suspects based on the total amount of money they moved.
SELECT s.full_name, SUM(t.amount) AS total_moved,
       RANK() OVER (ORDER BY SUM(t.amount) DESC) AS rank_position
FROM suspects s JOIN transactions t ON s.suspect_id = t.suspect_id 
GROUP BY s.full_name;

-- Question 37: For each suspect, show total transferred vs total withdrawn amount.
SELECT s.full_name,
       SUM(CASE WHEN t.transaction_type = 'Transfer' THEN t.amount ELSE 0 END) AS total_transferred,
       SUM(CASE WHEN t.transaction_type = 'Withdrawal' THEN t.amount ELSE 0 END) AS total_withdrawn
FROM suspects s JOIN transactions t ON s.suspect_id = t.suspect_id 
GROUP BY s.full_name;

-- Question 38: Which suspects have evidence but no recorded transactions?
SELECT s.full_name 
FROM suspects s
WHERE EXISTS (SELECT 1 FROM evidence e WHERE e.suspect_id = s.suspect_id)
  AND NOT EXISTS (SELECT 1 FROM transactions t WHERE t.suspect_id = s.suspect_id);

-- Question 39: What is the total amount stolen in the year 2026 so far?
SELECT SUM(amount) AS ytd_stolen 
FROM transactions 
WHERE transaction_date >= '2026-01-01';

-- Question 40: What are the top 5 most common types of evidence collected?
SELECT evidence_type, COUNT(*) AS frequency 
FROM evidence 
GROUP BY evidence_type 
ORDER BY frequency DESC 
LIMIT 5;

-- =====================================================
-- END OF FILE - Ready for Live Session
-- =====================================================



-- === Basic Queries (1-10) ===
SELECT * FROM suspects;                                              -- 1. All suspects
SELECT full_name, phone, status FROM suspects WHERE status = 'Arrested'; -- 2. Arrested suspects
SELECT account_number, account_holder, account_type FROM bank_accounts WHERE account_type = 'Victim'; -- 3. Victim accounts
SELECT SUM(amount) AS total_stolen FROM transactions;                -- 4. Total amount stolen
SELECT * FROM transactions ORDER BY amount DESC LIMIT 10;            -- 5. Top 10 largest transactions
SELECT s.full_name, COUNT(t.transaction_id) AS txn_count 
FROM suspects s LEFT JOIN transactions t ON s.suspect_id = t.suspect_id 
GROUP BY s.full_name;                                                -- 6. Transactions per suspect
SELECT DISTINCT evidence_type FROM evidence;                         -- 7. All evidence types
SELECT full_name FROM suspects 
WHERE suspect_id NOT IN (SELECT suspect_id FROM evidence);           -- 8. Suspects with no evidence
SELECT transaction_date, amount, transaction_type 
FROM transactions ORDER BY transaction_date DESC LIMIT 10;           -- 9. Latest 10 transactions
SELECT bank_name, COUNT(*) AS account_count 
FROM bank_accounts GROUP BY bank_name;                               -- 10. Accounts per bank

-- === Aggregations & Grouping (11-20) ===
SELECT s.full_name, SUM(t.amount) AS total_moved 
FROM suspects s JOIN transactions t ON s.suspect_id = t.suspect_id 
GROUP BY s.full_name ORDER BY total_moved DESC;                      -- 11. Money moved per suspect

SELECT ba.account_type, COUNT(t.transaction_id) AS txn_count 
FROM bank_accounts ba 
JOIN transactions t ON ba.account_id = t.from_account_id 
   OR ba.account_id = t.to_account_id 
GROUP BY ba.account_type;                                            -- 12. Transactions by account type

SELECT AVG(amount) AS avg_transaction FROM transactions;             -- 13. Average transaction amount
SELECT s.full_name, COUNT(e.evidence_id) AS evidence_count 
FROM suspects s LEFT JOIN evidence e ON s.suspect_id = e.suspect_id 
GROUP BY s.full_name;                                                -- 14. Evidence count per suspect

SELECT DATE_FORMAT(transaction_date, '%Y-%m') AS month, 
       SUM(amount) AS monthly_total 
FROM transactions GROUP BY DATE_FORMAT(transaction_date, '%Y-%m');   -- 15. Monthly trend

-- === Joins & Filtering (21-30) ===
SELECT 
    t.transaction_id, s.full_name AS suspect,
    fa.account_number AS from_account,
    ta.account_number AS to_account,
    t.amount, t.transaction_date
FROM transactions t
JOIN suspects s ON t.suspect_id = s.suspect_id
LEFT JOIN bank_accounts fa ON t.from_account_id = fa.account_id
LEFT JOIN bank_accounts ta ON t.to_account_id = ta.account_id;       -- 21. Full money trail

SELECT e.description, s.full_name, t.amount, e.evidence_type
FROM evidence e
JOIN suspects s ON e.suspect_id = s.suspect_id
LEFT JOIN transactions t ON e.transaction_id = t.transaction_id;     -- 22. Evidence with suspect & amount

SELECT DISTINCT s.full_name 
FROM suspects s
JOIN transactions t ON s.suspect_id = t.suspect_id
WHERE t.transaction_type IN ('Transfer', 'Withdrawal');              -- 23. Suspects involved in transfer/withdrawal

SELECT DISTINCT ba.account_number, ba.account_holder 
FROM transactions t
JOIN bank_accounts ba ON t.to_account_id = ba.account_id
WHERE t.from_account_id IN 
    (SELECT account_id FROM bank_accounts WHERE account_type = 'Victim'); -- 24. Accounts that received stolen money

-- === Advanced Queries (31-40) ===
SELECT 
    transaction_date, amount,
    SUM(amount) OVER (ORDER BY transaction_date) AS running_total
FROM transactions ORDER BY transaction_date;                         -- 31. Running total of stolen money

SELECT 
    s.full_name,
    SUM(t.amount) AS total_moved,
    CASE WHEN SUM(t.amount) > 500000 THEN 'High Risk' 
         ELSE 'Medium Risk' END AS risk_level
FROM suspects s
JOIN transactions t ON s.suspect_id = t.suspect_id
GROUP BY s.full_name;                                                -- 32. Risk level per suspect

SELECT * FROM transactions 
WHERE amount > (SELECT AVG(amount) FROM transactions);               -- 33. Transactions above average

SELECT DATE_FORMAT(transaction_date, '%Y-%m') AS month, 
       SUM(amount) AS monthly_total 
FROM transactions GROUP BY DATE_FORMAT(transaction_date, '%Y-%m')
ORDER BY month;                                                      -- 34. Monthly spending trend

SELECT s.full_name, COUNT(DISTINCT e.evidence_type) AS evidence_types 
FROM suspects s
JOIN evidence e ON s.suspect_id = e.suspect_id
GROUP BY s.full_name 
HAVING evidence_types >= 2;                                          -- 35. Suspects with multiple evidence types

SELECT 
    s.full_name,
    SUM(t.amount) AS total_moved,
    RANK() OVER (ORDER BY SUM(t.amount) DESC) AS rank_position
FROM suspects s
JOIN transactions t ON s.suspect_id = t.suspect_id
GROUP BY s.full_name;                                                -- 36. Rank suspects by money moved

SELECT 
    s.full_name,
    SUM(CASE WHEN t.transaction_type = 'Transfer' THEN t.amount ELSE 0 END) AS total_transferred,
    SUM(CASE WHEN t.transaction_type = 'Withdrawal' THEN t.amount ELSE 0 END) AS total_withdrawn
FROM suspects s
JOIN transactions t ON s.suspect_id = t.suspect_id
GROUP BY s.full_name;                                                -- 37. Transfer vs Withdrawal per suspect

SELECT s.full_name 
FROM suspects s
WHERE EXISTS (SELECT 1 FROM evidence e WHERE e.suspect_id = s.suspect_id)
  AND NOT EXISTS (SELECT 1 FROM transactions t WHERE t.suspect_id = s.suspect_id); -- 38. Evidence but no transaction

SELECT SUM(amount) AS ytd_stolen 
FROM transactions 
WHERE transaction_date >= '2026-01-01';                              -- 39. Year-to-date stolen amount

SELECT evidence_type, COUNT(*) AS frequency 
FROM evidence 
GROUP BY evidence_type 
ORDER BY frequency DESC 
LIMIT 5;                                                             -- 40. Most common evidence types

-- =====================================================
-- END OF FILE
-- =====================================================
-- Instructions:
-- 1. Run the CREATE TABLE section first
-- 2. Run all INSERT statements
-- 3. Then run any of the 40 queries for investigation reports
-- =====================================================