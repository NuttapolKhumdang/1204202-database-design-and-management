-- Insert Employees
-- Covers different departments, salaries > 30000, and employees with/without supervisors.
INSERT INTO employee (employee_id, name, salary, department, supervisor_id) VALUES
('E01', 'Somchai', 80000.00, 'MGMT', NULL),
('E02', 'Nida', 60000.00, 'DEV', 'E01'),
('E03', 'Anan', 35000.00, 'DEV', 'E02'),
('E04', 'Ploy', 32000.00, 'DEV', 'E02'),
('E05', 'Kan', 40000.00, 'QA', 'E02'),
('E06', 'Mint', 45000.00, 'DESIGN', 'E01'),
('E07', 'Tor', 30000.00, 'DESIGN', 'E05'),
('E11', 'Somchai_1', 25000.00, 'PR', NULL),
('E12', 'Job', 40000.00, 'DEV', 'E02'),
('E13', 'Ken', 38000.00, 'QA', 'E05');

-- Insert Customers
-- Covers specific IDs requested in the sample outputs.
INSERT INTO customer (customer_id, name, phone) VALUES
('C01', 'Big Corp', '0810000001'),
('C02', 'StartupX', '0810000002'),
('C03', 'GovOffice', '0810000003'),
('C05', 'C5555', '0810000005'),
('C06', 'C6666', '0810000006'),
('C07', 'C7777', '0810000007');

-- Insert Projects
-- Covers budgets > 500,000, durations > 60, starts in 2025/2026, and early/late finishes.
INSERT INTO project (project_id, customer_id, name, budget, start_date, duration, finish_date) VALUES
('P01', 'C01', 'Payroll System', 1200000.00, '2025-01-20', 90, '2026-04-05'),
('P02', 'C02', 'HR Portal', 400000.00, '2025-02-01', 75, '2025-04-15'),
('P03', 'C03', 'E-commerce App', 1200000.00, '2025-01-15', 100, '2026-05-20'),
('P04', 'C01', 'Gov Dashboard', 600000.00, '2025-03-01', 80, '2025-05-15'),
('P05', 'C01', 'Mobile Game', 550000.00, '2025-02-18', 45, '2026-03-20'),
('P06', 'C02', 'Data Migration', 350000.00, '2025-06-01', 50, NULL),
('P11', 'C01', 'Payroll System', 600000.00, '2026-01-01', 100, '2026-04-11'),
('P12', 'C02', 'HR Portal', 500000.00, '2026-02-01', 75, '2026-04-17'),
('P14', 'C07', 'Gov Dashboard', 800000.00, '2026-03-01', 80, '2026-06-29'),
('P25', 'C05', 'Mobile Game', 900000.00, '2026-05-10', 80, '2026-07-09'),
('P26', 'C06', 'Data Migration 2', 550000.00, '2026-05-01', 50, '2026-05-21');

-- Insert Workson
-- Ensures some employees work on > 2 projects, and some have no projects in 2026.
INSERT INTO workson (work_id, project_id, employee_id, role) VALUES
(1, 'P01', 'E02', 'Leader'),
(2, 'P01', 'E03', 'Programmer'),
(3, 'P03', 'E03', 'Programmer'),
(4, 'P04', 'E03', 'Programmer'),
(5, 'P05', 'E03', 'Tester'),
(6, 'P11', 'E03', 'Programmer'),
(7, 'P01', 'E04', 'Programmer'),
(8, 'P02', 'E04', 'Programmer'),
(9, 'P03', 'E04', 'Programmer'),
(10, 'P11', 'E12', 'Leader'),
(11, 'P12', 'E12', 'Programmer'),
(12, 'P14', 'E12', 'Tester');

-- Insert Meetings
-- Covers meeting dates in 2025 and 2026 to allow grouping and filtering.
INSERT INTO meeting (meeting_id, employee_id, customer_id, meeting_date, location) VALUES
('M01', 'E01', 'C01', '2025-01-10', 'HQ'),
('M02', 'E02', 'C02', '2025-02-15', 'Zoom'),
('M03', 'E01', 'C01', '2025-05-20', 'Customer Office'),
('M04', 'E03', 'C03', '2025-11-11', 'Zoom'),
('M05', 'E01', 'C01', '2026-01-15', 'HQ');

-- Insert Leaves
-- Covers specific constraints: days between 1 and 5, types (sick, personal, vacation), and multi-year data.
INSERT INTO leaves (leave_id, employee_id, leave_type, leave_date, days) VALUES
(1, 'E03', 'vacation', '2025-04-01', 4),
(2, 'E03', 'sick', '2025-06-10', 2),
(3, 'E03', 'personal', '2025-08-15', 1),
(4, 'E04', 'vacation', '2025-05-01', 5),
(5, 'E04', 'vacation', '2025-12-01', 5),
(6, 'E05', 'sick', '2025-02-10', 3),
(7, 'E05', 'sick', '2025-03-10', 4),
(8, 'E03', 'personal', '2026-01-15', 2),
(9, 'E03', 'sick', '2026-02-20', 1),
(10, 'E12', 'vacation', '2026-03-01', 4),
(11, 'E13', 'personal', '2026-04-05', 2);
