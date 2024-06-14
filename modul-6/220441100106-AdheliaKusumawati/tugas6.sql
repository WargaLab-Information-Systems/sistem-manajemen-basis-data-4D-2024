create database OutsourcingCompany;
use OutsourcingCompany;
drop database OutsourcingCompany;

create table employees(
employee_id INT Primary Key,
name VARCHAR(100),
position VARCHAR(50),
salary FLOAT,
date_hired DATE,
project_id INT,
Foreign Key (project_id) references projects (project_id)
);

INSERT INTO employees (employee_id, name, position, salary, date_hired, project_id) VALUES
(41, 'Indah', 'Project Manager', 2500000.00, '2024-01-15', 1),
(42, 'Bobi', 'Developer', 2500000.00, '2023-02-20', 2),
(43, 'Emma', 'Designer', 7000000.00, '2023-03-10', 3),
(44, 'Dana', 'QA Engineer', 5000000.00, '2023-12-05', 4),
(45, 'Eva', 'Data Analyst', 3000000.00, '2023-05-15', 5),
(46, 'Franky', 'Developer', 5500000.00, '2023-01-25', 1),
(47, 'Grace', 'System Admin', 1400000.00, '2023-07-10', 1),
(48, 'Gea', 'Support Specialist', 4000000.00, '2023-08-01', 2);

-- Membuat tabel projects
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    client_company VARCHAR(100),
    start_date DATE,
    end_date DATE
);
drop table projects;
drop table employees;
drop table certificates;
drop table notifications;
INSERT INTO projects (project_id, project_name, client_company, start_date, end_date) VALUES
(1, 'Proyek IT dan Pengembangan Perangkat Lunak', 'TechWave Solutions', '2024-02-01', '2024-05-03'),
(2, 'Proyek Administratif dan Back Office', 'AdminPro Services', '2024-01-02', '2024-02-05'),
(3, 'Proyek Customer Support dan Call Center', 'SupportHub Inc.', '2024-03-01', '2024-04-30'),
(4, 'Proyek Human Resources', 'HR Connect Inc.', '2024-02-15', '2024-03-17'),
(5, 'Proyek Pemasaran dan Digital Marketing', 'MarketMasters Inc.', '2024-03-02', '2024-04-05');


create Table certificates(
certificate_id INT Primary Key,
employee_id INT,
certificate_name VARCHAR(100),
issue_date DATE,
expiry_date DATE,
Foreign Key (employee_id) references employees(employee_id)
);

INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date) VALUES
(11, 41, 'Project Management Professional', '2023-01-10', '2026-01-10'),
(12, 42, 'Certified Java Developer', '2023-02-15', '2026-02-15'),
(13, 43, 'Adobe Certified Expert', '2023-03-20', '2026-03-20'),
(14, 44, 'Certified QA Engineer', '2023-04-25', '2026-04-25'),
(15, 45, 'Data Science Certification', '2023-05-30', '2026-05-30'),
(16, 46, 'AWS Certified Developer', '2023-06-15', '2026-06-15'),
(17, 47, 'Microsoft Certified: Azure Administrator', '2023-07-20', '2026-07-20'),
(18, 48, 'ITIL Foundation Certification', '2023-08-10', '2026-08-10');

create Table trainings(
training_id INT Primary Key,
certificate_name VARCHAR(100),
duration_in_months INT
);

INSERT INTO trainings (training_id, certificate_name, duration_in_months) VALUES
(21, 'CompTIA Security+', 4),
(22, 'Cisco Certified Network Associate (CCNA)', 5),
(23, 'Certified ScrumMaster (CSM)', 2),
(24, 'Google Cloud Certified - Professional Data Engineer', 6),
(25, 'Salesforce Certified Platform Developer I', 3),
(26, 'Certified Ethical Hacker (CEH)', 6),
(27, 'Certified Information Systems Auditor (CISA)', 4),
(28, 'Certified Kubernetes Administrator (CKA)', 3);

create Table notifications(
notification_id INT Primary Key auto_increment,
employee_id INT,
message TEXT,
date DATE,
Foreign Key (employee_id) references employees(employee_id)
);

INSERT INTO notifications (notification_id, employee_id, message, date) VALUES
(31, 41, 'Project Alpha has been approved. Please start the initial setup.', '2024-01-01'),
(32, 42, 'Your Java Developer certification exam is scheduled for next week.', '2024-01-10'),
(33, 43, 'Adobe Certified Expert renewal is due in 3 months.', '2024-01-15'),
(34, 44, 'QA team meeting rescheduled to Friday.', '2024-01-20'),
(35, 45, 'Data Science project presentation is tomorrow.', '2024-01-25'),
(36, 46, 'AWS Certified Developer exam results are out.', '2024-01-30'),
(37, 47, 'Azure training session starts next Monday.', '2024-02-05'),
(38, 48, 'ITIL Foundation Certification needs to be renewed.', '2024-02-10');

create Table companies(
company_id INT Primary Key,
company_name VARCHAR(100),
address TEXT
);

INSERT INTO companies (company_id, company_name, address) VALUES
(51, 'Tech Innovators Inc.', 'New York'),
(52, 'Green Energy Solutions', 'Tokyo'),
(53, 'Healthcare Partners', 'Abu Dhabi'),
(54, 'EduTech Co.', 'Ankara'),
(55, 'FinServ Corp.', 'Saint Petersburg'),
(56, 'Retail Giants Ltd.', 'Amsterdam'),
(57, 'Global Logistics', 'Berlin'),
(58, 'Creative Media Agency', 'Seattle');

-- Buatlah stored procedure yang memeriksa setiap karyawan dalam tabel employees. Jika karyawan sudah bekerja lebih dari satu tahun, tambahkan bonus sebesar 10% dari gaji mereka.
DELIMITER //
CREATE PROCEDURE KasiBonus()
BEGIN
    SELECT 
        name, salary AS OriginalSalary,
        CASE 
            WHEN date_hired <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) THEN salary * 0.10
            ELSE salary = 0
        END AS BonusSalary,
        CASE
            WHEN date_hired <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) THEN salary + salary * 0.10
            ELSE salary
        END AS total_salary
    FROM 
        employees;
END //
DELIMITER ;
call KasiBonus;
drop procedure kasiBonus;
select * from employees;

-- Buatlah stored procedure yang memeriksa setiap proyek dalam tabel projects. Jika proyek akan berakhir dalam waktu kurang dari satu bulan, perpanjang proyek selama tiga bulan.
DELIMITER //
CREATE PROCEDURE perpanjangproyek()
BEGIN
    SELECT 
        project_name, client_company, start_date, end_date,
        CASE
            WHEN end_date <= date_sub(CURDATE(), INTERVAL 1 MONTH) THEN DATE_ADD(end_date, INTERVAL 3 MONTH)
			else NULL
        END AS new_end_date
    FROM 
        projects;
END //
DELIMITER ;
call perpanjangproyek;
drop procedure perpanjangproyek;
select * from projects;

-- Buatlah stored procedure yang memeriksa dan memperbarui data pelatihan setiap karyawan. Jika ada pelatihan baru yang tersedia, tambahkan pelatihan tersebut ke dalam tabel certificates.

drop procedure updatesertif;
DELIMITER //

CREATE PROCEDURE updatesertif(
IN idemplo INT)
BEGIN
    DECLARE byksertif INT;
    DECLARE tanggalnow DATE;
    DECLARE new_cert_id INT;

    SELECT COUNT(*) INTO byksertif FROM certificates WHERE employee_id = idemplo;
    SET tanggalnow = CURDATE();

    IF byksertif > 0 THEN
        UPDATE certificates 
        SET expiry_date = ADDDATE(expiry_date, INTERVAL 1 YEAR)
        WHERE employee_id = idemplo AND expiry_date < tanggalnow;

        IF ROW_COUNT() > 0 THEN
            SELECT CONCAT('Sertif untuk karyawan ', idemplo, ' sudah diupdate.') AS message;
        ELSE
            SELECT CONCAT('Tidak ada sertifikat karyawan ', idemplo, ' perlu diperbarui.') AS message;
        END IF;
    ELSE
        SELECT CONCAT('karyawan ', idemplo, ' tidak memiliki sertif.') AS message;
    END IF;

    SELECT IFNULL(MAX(certificate_id), 0) + 1 INTO new_cert_id FROM certificates;

    INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date) VALUES
        (new_cert_id, idemplo, 'Android certiicates', '2024-05-01', '2024-05-18');

    SELECT * FROM certificates;
END //

DELIMITER ;

drop procedure updatesertif;
call updatesertif(41);
select * from certificates;


-- Buatlah stored procedure yang mengirimkan notifikasi kepada semua karyawan mengenai pelatihan baru yang akan datang.
-- 4. Buatlah stored procedure yang mengirimkan notifikasi
--  kepada semua karyawan mengenai pelatihan baru yang akan datang.
DELIMITER //
CREATE PROCEDURE kirimnotif()
BEGIN
    DECLARE max_id INT;
    DECLARE min_id INT;
    DECLARE current_id INT;

    SELECT MIN(employee_id), MAX(employee_id) INTO min_id, max_id FROM employees;
    SET current_id = min_id;

    WHILE current_id <= max_id DO
        IF EXISTS (SELECT * FROM employees WHERE employee_id = current_id) THEN
            INSERT INTO notifications (employee_id, message, date)
            VALUES (current_id, 'Pelatihan baru akan segera dimulai. Silakan periksa jadwal Anda untuk detail lebih lanjut.', CURDATE());
        END IF;
        SET current_id = current_id + 1;
    END WHILE;
    SELECT * FROM notifications;
END //
DELIMITER ;
CALL kirimnotif();
drop procedure kirimnotif;
select * from notifications;