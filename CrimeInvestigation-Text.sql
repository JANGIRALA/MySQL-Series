CREATE TABLE `suspects` (
  `suspect_id` int PRIMARY KEY AUTO_INCREMENT,
  `full_name` varchar(100),
  `phone` varchar(15),
  `address` varchar(255),
  `status` varchar(30)
);

CREATE TABLE `bank_accounts` (
  `account_id` int PRIMARY KEY AUTO_INCREMENT,
  `account_number` varchar(20) UNIQUE,
  `bank_name` varchar(50),
  `account_holder` varchar(100),
  `account_type` varchar(20)
);

CREATE TABLE `transactions` (
  `transaction_id` int PRIMARY KEY AUTO_INCREMENT,
  `from_account_id` int,
  `to_account_id` int,
  `amount` decimal(15,2),
  `transaction_date` datetime,
  `transaction_type` varchar(50),
  `suspect_id` int
);

CREATE TABLE `evidence` (
  `evidence_id` int PRIMARY KEY AUTO_INCREMENT,
  `suspect_id` int,
  `transaction_id` int,
  `evidence_type` varchar(50),
  `description` text,
  `collected_date` date
);

ALTER TABLE `transactions` ADD FOREIGN KEY (`from_account_id`) REFERENCES `bank_accounts` (`account_id`);

ALTER TABLE `transactions` ADD FOREIGN KEY (`to_account_id`) REFERENCES `bank_accounts` (`account_id`);

ALTER TABLE `transactions` ADD FOREIGN KEY (`suspect_id`) REFERENCES `suspects` (`suspect_id`);

ALTER TABLE `evidence` ADD FOREIGN KEY (`suspect_id`) REFERENCES `suspects` (`suspect_id`);

ALTER TABLE `evidence` ADD FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`);

-- Insert 20 Records for Each Table
-- Suspects (20 records)
-- SQL
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

-- Bank Accounts (20 records)
-- SQL
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

-- Transactions (20 records)
-- SQL
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

-- Evidence (20 records)
-- SQL
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
