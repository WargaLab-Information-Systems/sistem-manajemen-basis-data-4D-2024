create database OutsuorcingCompany;
use OutsuorcingCompany;
drop database OutsuorcingCompany;

create table projects(
project_id int primary key,
project_name varchar(100),
client_company varchar(100),
start_date date,
end_date date
);

create table employees(
employee_id int primary key,
name varchar (100),
position varchar(100),
salary float,
date_hired date,
project_id int,
FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

create table certificates(
certificate_id int primary key AUTO_INCREMENT,
employee_id int,
certificate_name varchar(100),
issue_date date,
expiry_date date,
FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

create table trainings(
training_id int primary key,
certificate_name varchar(100),
duration_in_months int
);

create table notifications(
notification_id int primary key AUTO_INCREMENT,
employee_id int,
message text,
date date,
FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

create table companies(
company_id int primary key,
company_name varchar(100),
address text
);

INSERT INTO projects (project_id, project_name, client_company, start_date, end_date) VALUES
(1, 'Website Redesign', 'Tech Solutions Inc.', '2024-01-15', '2024-04-30'),
(2, 'Mobile App Development', 'Innovatech Ltd.', '2024-02-01', '2024-04-25'),
(3, 'Cloud Migration', 'Global Enterprises', '2024-03-10', '2024-09-25'),
(4, 'Cybersecurity Audit', 'SecureNet Corp.', '2024-04-20', '2024-05-31'),
(5, 'Data Analytics Platform', 'Data Insights LLC', '2024-05-05', '2024-11-10');

INSERT INTO employees (employee_id, name, position, salary, date_hired, project_id) VALUES
(1, 'Alisa Putri', 'Frontend Developer', 650000, '2022-12-01', 1),
(2, 'Bobbi Risky', 'Backend Developer', 700000, '2023-10-15', 2),
(3, 'Caroline', 'Cloud Engineer', 850000, '2023-02-20', 3),
(4, 'Dinda laras', 'Security Analyst', 780000, '2023-03-05', 4),
(5, 'Stayla nanda', 'Data Scientist', 900000, '2023-04-01', 5);

INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date) VALUES
(1, 1, 'Certified Frontend Developer', '2024-01-10', '2026-01-10'),
(2, 2, 'Certified Java Developer', '2024-02-15', '2026-02-15'),
(3, 3, 'AWS Certified Solutions Architect', '2024-03-20', '2026-03-20'),
(4, 4, 'Certified Information Systems Security Professional (CISSP)', '2024-04-25', '2026-04-25'),
(5, 5, 'Certified Data Scientist', '2024-05-30', '2026-05-30');

INSERT INTO trainings (training_id, certificate_name, duration_in_months) VALUES
(1, 'Certified Frontend Developer', 3),
(2, 'Certified Java Developer', 4),
(3, 'AWS Certified Solutions Architect', 5),
(4, 'Certified Information Systems Security Professional (CISSP)', 6),
(5, 'Certified Data Scientist', 6);

INSERT INTO notifications (notification_id, employee_id, message, date) VALUES
(1, 1, 'Review kinerja Anda dijadwalkan pada 15 Maret 2024.', '2024-03-01'),
(2, 2, 'Silakan kirimkan lembar waktu Anda untuk bulan Februari.', '2024-02-28'),
(3, 3, 'Pengingat: Perpanjangan sertifikasi AWS jatuh tempo pada 20 Maret 2026.', '2024-03-01'),
(4, 4, 'Sesi pelatihan keamanan dijadwalkan pada 30 April 2024.', '2024-04-15'),
(5, 5, 'Pertemuan kick-off proyek analisis data baru pada 5 Mei 2024.', '2024-04-25');

INSERT INTO companies (company_id, company_name, address) VALUES
(1, 'Tech Solutions Inc.', 'Jl. Teknologi No. 15, Jakarta, Indonesia'),
(2, 'Innovatech Ltd.', 'Jl. Inovasi No. 20, Bandung, Indonesia'),
(3, 'Global Enterprises', 'Jl. Internasional No. 10, Surabaya, Indonesia'),
(4, 'SecureNet Corp.', 'Jl. Keamanan No. 25, Yogyakarta, Indonesia'),
(5, 'Data Insights LLC', 'Jl. Data No. 5, Bali, Indonesia');

drop table companies;

-- 1. Buatlah stored procedure yang memeriksa setiap karyawan dalam tabel employees. 
-- Jika karyawan sudah bekerja lebih dari satu tahun, tambahkan bonus sebesar 10% dari gaji mereka.
DELIMITER //
CREATE PROCEDURE get_bonus()
BEGIN
SELECT name, salary, 
		CASE 
           WHEN date_hired <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) 
           THEN salary * 0.1
		ELSE 0 
		END AS bonus_gaji,
		CASE 
           WHEN date_hired <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) 
           THEN salary + salary * 0.1
           ELSE salary 
		END AS total_salary
FROM employees ;
END //
DELIMITER ;
DROP procedure  get_bonus;
CALL get_bonus();
select * from employees;
drop database OutsuorcingCompany;

-- 2. Buatlah stored procedure yang memeriksa setiap proyek dalam tabel projects. Jika proyek akan berakhir 
-- dalam waktu kurang dari satu bulan, perpanjang proyek selama tiga bulan.
DELIMITER //
CREATE PROCEDURE perpanjangproject()
BEGIN
SELECT project_id, project_name, end_date,
	CASE 
            WHEN end_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 1 MONTH) 
            THEN DATE_ADD(end_date, INTERVAL 3 MONTH)
            ELSE end_date
        END AS extend_end_date
FROM projects;
END //
DELIMITER ;
CALL perpanjangproject();
DROP PROCEDURE perpanjangproject;


-- 3. Buatlah stored procedure yang memeriksa dan memperbarui data pelatihan setiap karyawan. 
-- Jika ada pelatihan baru yang tersedia, tambahkan pelatihan tersebut ke dalam tabel certificates.
DELIMITER //

CREATE PROCEDURE updatesertif(
IN idemplo INT)
BEGIN
    DECLARE byksertif INT;
    DECLARE tanggalnow DATE;
    DECLARE new_cert_id INT;

    -- Menghitung jumlah sertifikat untuk karyawan tertentu
    SELECT COUNT(*) INTO byksertif FROM certificates WHERE employee_id = idemplo;
    SET tanggalnow = CURDATE();

    -- memeriksa apakah karyawan memiliki sertifikat lebih dari 0
    IF byksertif > 0 THEN
        -- Update expiry_date sertifikat yang ada
        UPDATE certificates 
        SET expiry_date = ADDDATE(expiry_date, INTERVAL 1 YEAR)
        WHERE employee_id = idemplo AND expiry_date < tanggalnow;

        -- Memberikan pesan berdasarkan hasil update
        IF ROW_COUNT() > 0 THEN
            SELECT CONCAT('Sertif untuk karyawan ', idemplo, ' sudah diupdate.') AS message;
        ELSE
            SELECT CONCAT('Tidak ada sertifikat karyawan ', idemplo, ' perlu diperbarui.') AS message;
        END IF;
    ELSE
        -- Jika karyawan tidak memiliki sertifikat
        SELECT CONCAT('karyawan ', idemplo, ' tidak memiliki sertif.') AS message;
    END IF;

    -- Memastikan certificate_id yang unik
    SELECT IFNULL(MAX(certificate_id),0) + 1 INTO new_cert_id FROM certificates;

    -- Menambahkan sertifikat baru dengan certificate_id unik
    INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date) VALUES
        (new_cert_id, idemplo, 'sertifikat terbaik', '2024-05-01', '2024-05-18');

    -- Menampilkan semua data dari tabel certificates
    SELECT * FROM certificates;
END //

DELIMITER ;

drop procedure updatesertif;
call updatesertif(1);
select * from certificates;

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
        -- Memeriksa apakah current_id ada di tabel employees
        IF EXISTS (SELECT * FROM employees WHERE employee_id = current_id) THEN
            INSERT INTO notifications (employee_id, message, date)
            VALUES (current_id, 'Pelatihan baru akan segera dimulai. Silakan periksa jadwal Anda untuk detail lebih lanjut.', CURDATE());
        END IF;
        SET current_id = current_id + 1;
    END WHILE;
    SELECT * FROM notifications;
END//

DELIMITER ;
drop procedure kirimnotif;
CALL kirimnotif();
select * from notifications;

