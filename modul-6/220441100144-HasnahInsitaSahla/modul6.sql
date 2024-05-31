CREATE DATABASE OutsourcingCompany;
USE OutsourcingCompany;

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    client_company VARCHAR(100),
    start_date DATE,
    end_date DATE
);

INSERT INTO projects (project_id, project_name, client_company, start_date, end_date)
VALUES
    (1, 'Proyek A', 'ABC Corp', '2023-02-01', '2023-08-31'),
    (2, 'Proyek B', 'XYZ Inc', '2022-05-10', '2024-05-30'),
    (3, 'Proyek C', 'LMN Co.', '2023-01-10', '2024-06-01'),
    (4, 'Proyek D', 'PQR Ltd.', '2022-08-15', '2024-02-28'),
    (5, 'Proyek E', 'UVW Enterprises', '2023-03-20', '2023-09-30');
    

CREATE TABLE employees (
    employee_id INT(11) PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50),
    salary FLOAT,
    date_hired DATE,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO employees (employee_id, name, position, salary, date_hired, project_id)
VALUES
    (1, 'Sehun', 'Programmer', 8000000.00, '2024-01-15', 1),
    (2, 'Haechan', 'Manajer Proyek', 10000000.00, '2022-03-10', 2),
    (3, 'Kyungsoo', 'Analisis Kualitas', 6500000.00, '2023-05-20', 1),
    (4, 'Renjun', 'Desainer UI/UX', 8500000.00, '2024-07-05', 2),
    (5, 'Jeno', 'Administrator Database', 9000000.00, '2023-02-28', 1);


CREATE TABLE certificates (
    certificate_id INT PRIMARY KEY auto_increment,
    employee_id INT,
    certificate_name VARCHAR(100),
    issue_date DATE,
    expiry_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date)
VALUES
    (1, 1, 'Pemrograman Java', '2023-03-15', '2023-03-15'),
    (2, 2, 'Manajemen Proyek Profesional', '2022-04-20', '2023-04-20'),
    (3, 3, 'Penguji Bersertifikasi ISTQB', '2023-07-01', '2023-07-01'),
    (4, 4, 'Fundamental Desain UI/UX', '2022-09-10', '2023-05-28'),
    (5, 5, 'Dasar-dasar Administrasi Database', '2023-04-05', '2025-06-05');
    
CREATE TABLE trainings (
    training_id INT PRIMARY KEY,
    certificate_name VARCHAR(100),
    duration_in_months INT
);

INSERT INTO trainings (training_id, certificate_name, duration_in_months)
VALUES
    (1, 'Pengembangan Agile', 3),
    (2, 'Keterampilan Komunikasi', 2),
    (3, 'Perencanaan Proyek', 2),
    (4, 'Manajemen Database', 4),
    (5, 'Prinsip Desain UI/UX', 3);

CREATE TABLE notifications (
    notification_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    message TEXT,
    date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO notifications (notification_id, employee_id, message, date)
VALUES
    (1, 1, 'Pertemuan dijadwalkan ulang besok.', '2023-04-25'),
    (2, 2, 'Pengingat: Pertemuan tinjauan proyek hari ini.', '2024-06-05'),
    (3, 3, 'Sesi pelatihan tentang pengujian QA minggu depan.', '2023-06-15'),
    (4, 4, 'Desain baru diunggah untuk ditinjau.', '2024-09-20'),
    (5, 5, 'Pencadangan database dijadwalkan malam ini.', '2023-03-05');
    


CREATE TABLE companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    address TEXT
);

INSERT INTO companies (company_id, company_name, address)
VALUES
    (1, 'ABC Corp', '123 Jalan Utama, Surabaya, Indonesia'),
    (2, 'XYZ Inc', '456 Jalan Oak, Sidoarjo, Indonesia'),
    (3, 'LMN Co.', '789 Jalan Elm, Malang, Indonesia'),
    (4, 'PQR Ltd.', '321 Jalan Maple, Jombang, Indonesia'),
    (5, 'UVW Enterprises', '654 Jalan Pine, Kamal, Indonesia');
    
    
-- 1. Buatlah stored procedure yang memeriksa setiap karyawan dalam tabel employees. 
-- Jika karyawan sudah bekerja lebih dari satu tahun, tambahkan bonus sebesar 10% dari gaji mereka.

DELIMITER //

CREATE PROCEDURE bonus_satutahun()
BEGIN
    UPDATE employees
    SET salary = CASE
        WHEN date_hired < DATE_SUB(NOW(), INTERVAL 1 YEAR) THEN salary + (salary * 0.10)
        ELSE salary
    END;
    SELECT * FROM employees;
END //

DELIMITER ;
drop procedure bonus_satutahun;
call bonus_satutahun();
SELECT * FROM employees;

-- 2. Buatlah stored procedure yang memeriksa setiap proyek dalam tabel projects.
-- Jika proyek akan berakhir dalam waktu kurang dari satu bulan, perpanjang proyek selama tiga bulan.
DELIMITER //

CREATE PROCEDURE perpanjangproyek()
BEGIN
    UPDATE projects
    SET end_date = CASE
        WHEN end_date >= CURDATE() AND end_date < DATE_ADD(CURDATE(), INTERVAL 1 MONTH) THEN DATE_ADD(end_date, INTERVAL 3 MONTH)
        ELSE end_date
    END;
    SELECT * FROM projects;
END //

DELIMITER ;
drop procedure perpanjangproyek;
call perpanjangproyek();
SELECT * FROM projects;

-- 3. Buatlah stored procedure yang memeriksa dan memperbarui data pelatihan setiap karyawan. 
-- Jika ada pelatihan baru yang tersedia, tambahkan pelatihan tersebut ke dalam tabel certificates.
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
			SELECT IFNULL(MAX(certificate_id), 0) + 1 INTO new_cert_id FROM certificates;
			INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date) VALUES
        (new_cert_id, idemplo, 'belajar memasak ayam goyeng', '2024-05-01', '2024-05-18');
        ELSE
            SELECT CONCAT('Tidak ada sertifikat karyawan ', idemplo, ' perlu diperbarui.') AS message;
        END IF;
    ELSE
        SELECT CONCAT('karyawan ', idemplo, ' tidak memiliki sertif.') AS message;
    END IF;

    SELECT * FROM certificates;
END //

DELIMITER ;

SELECT * FROM certificates;
drop procedure updatesertif;
call updatesertif(2);

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
END//

DELIMITER ;
drop procedure kirimnotif;
CALL kirimnotif();
SELECT * FROM notifications;


drop database outsourcingcompany;