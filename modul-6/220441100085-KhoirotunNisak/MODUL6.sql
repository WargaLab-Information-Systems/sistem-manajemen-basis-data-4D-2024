CREATE DATABASE OutsourcingCompany;

USE OutsourcingCompany;


CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    client_company VARCHAR(100),
    start_date DATE,
    end_date DATE
);


CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    NAME VARCHAR(100),
    POSITION VARCHAR(50),
    salary FLOAT,
    date_hired DATE,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);


CREATE TABLE certificates (
    certificate_id INT PRIMARY KEY,
    employee_id INT,
    certificate_name VARCHAR(100),
    issue_date DATE,
    expiry_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);


CREATE TABLE trainings (
    training_id INT PRIMARY KEY,
    certificate_name VARCHAR(100),
    duration_in_months INT
);


CREATE TABLE notifications (
    notification_id INT PRIMARY KEY,
    employee_id INT,
    message TEXT,
    DATE DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
CREATE TABLE temp_notifications AS SELECT * FROM notifications;
DELETE FROM notifications;
ALTER TABLE notifications MODIFY COLUMN notification_id INT AUTO_INCREMENT;
INSERT INTO notifications (employee_id, message, DATE)
SELECT employee_id, message, DATE FROM temp_notifications;
DROP TABLE temp_notifications;

CREATE TABLE companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    address TEXT
);



INSERT INTO projects (project_id, project_name, client_company, start_date, end_date) VALUES
(1, 'Pengembangan Website', 'Solusi Teknologi Inc.', '2023-01-15', '2023-06-15'),
(2, 'Pengembangan Aplikasi Mobile', 'Inovatech Ltd.', '2023-03-01', '2023-09-01'),
(3, 'Migrasi Basis Data', 'DataSecure Corp.', '2023-04-20', '2023-12-20');

INSERT INTO employees (employee_id, NAME, POSITION, salary, date_hired, project_id) VALUES
(1, 'Andi Susanto', 'Pengembang Perangkat Lunak', 60000000, '2022-01-10', 1),
(2, 'Budi Santoso', 'Manajer Proyek', 80000000, '2021-09-15', 2),
(3, 'Citra Dewi', 'Administrator Basis Data', 55000000, '2022-03-20', 3),
(4, 'Dewi Lestari', 'Desainer UI/UX', 50000000, '2023-02-01', 1),
(5, 'Eko Prasetyo', 'Pengembang Backend', 62000000, '2022-11-25', 2);
 
 UPDATE employees SET salary = 3000000 WHERE employee_id = 1;
 UPDATE employees SET salary = 4000000 WHERE employee_id = 2;
 UPDATE employees SET salary = 5000000 WHERE employee_id = 3;
 UPDATE employees SET salary = 6000000 WHERE employee_id = 4;
 UPDATE employees SET salary = 7000000 WHERE employee_id = 5
 
INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date) VALUES
(1, 1, 'Pengembang Java Bersertifikat', '2023-01-01', '2025-01-01'),
(2, 2, 'Sertifikasi PMP', '2022-06-15', '2025-06-15'),
(3, 3, 'Administrator Basis Data Bersertifikat', '2023-03-01', '2026-03-01'),
(4, 4, 'Desainer UX Bersertifikat', '2023-02-10', '2024-02-10'),
(5, 5, 'Pengembang AWS Bersertifikat', '2022-12-01', '2025-12-01');

UPDATE certificates SET certificate_id = 1 WHERE employee_id = 1
UPDATE certificates SET certificate_id = 2 WHERE employee_id = 2;
UPDATE certificates SET certificate_id = 3 WHERE employee_id = 3;
UPDATE certificates SET certificate_id = 4 WHERE employee_id = 4;
UPDATE certificates SET certificate_id = 5 WHERE employee_id = 5

INSERT INTO trainings (training_id, certificate_name, duration_in_months) VALUES
(1, 'Pengembang Java Bersertifikat', 3),
(2, 'Sertifikasi PMP', 4),
(3, 'Administrator Basis Data Bersertifikat', 3),
(4, 'Desainer UX Bersertifikat', 2),
(5, 'Pengembang AWS Bersertifikat', 3);

INSERT INTO notifications (notification_id, employee_id, message, DATE) VALUES
(1, 1, 'Batas waktu proyek Anda sudah dekat.', '2023-05-01'),
(2, 2, 'Pembaharuan kebijakan perusahaan baru.', '2023-04-15'),
(3, 3, 'Jadwal pemeliharaan basis data.', '2023-06-20'),
(4, 4, 'Rapat tinjauan desain besok.', '2023-05-10'),
(5, 5, 'Pembaruan rencana migrasi server.', '2023-07-01');
UPDATE notifications SET employee_id = 2 WHERE notification_id = 2
UPDATE notifications SET employee_id = 3 WHERE notification_id = 3;
UPDATE notifications SET employee_id = 4 WHERE notification_id = 4;
UPDATE notifications SET employee_id = 5 WHERE notification_id = 5

INSERT INTO companies (company_id, company_name, address) VALUES
(1, 'Solusi Teknologi Inc.', 'Jl. Teknologi No.123, Jakarta'),
(2, 'Inovatech Ltd.', 'Jl. Inovasi No.456, Bandung'),
(3, 'DataSecure Corp.', 'Jl. Keamanan No.789, Surabaya');


-- 1. Buatlah stored procedure yang memeriksa setiap karyawan dalam tabel employees. 
-- Jika karyawan sudah bekerja lebih dari satu tahun, tambahkan bonus sebesar 10% dari gaji mereka.

DELIMITER //

CREATE PROCEDURE CALL bonus()
BEGIN
    DECLARE id INT;
    DECLARE gaji FLOAT;
    DECLARE tanggal DATE;

    SET id = (SELECT MIN(employee_id) FROM employees);
    WHILE id IS NOT NULL DO
        SET gaji = (SELECT salary FROM employees WHERE employee_id = id);
        SET tanggal = (SELECT date_hired FROM employees WHERE employee_id = id);

        IF DATEDIFF(CURDATE(), tanggal) >= 365 THEN
            UPDATE employees 
            SET salary = salary * 1.10 
            WHERE employee_id = id;
        END IF;

        SET id = (SELECT MIN(employee_id) FROM employees WHERE employee_id > id);
    END WHILE;
END//
DELIMITER ;
SELECT*FROM employees

-- 2. Buatlah stored procedure yang memeriksa setiap proyek dalam tabel projects.
-- Jika proyek akan berakhir dalam waktu kurang dari satu bulan, perpanjang proyek selama tiga bulan.

DELIMITER //

CREATE PROCEDURE CALL tambah()
BEGIN
    DECLARE p_id INT;
    DECLARE berakhir DATE;
    
    SET p_id = (SELECT MIN(project_id) FROM projects);
    
    WHILE p_id IS NOT NULL DO
        SELECT end_date INTO berakhir FROM projects WHERE project_id = p_id;

        IF DATEDIFF(berakhir, CURDATE()) < 30 THEN
            UPDATE projects 
            SET end_date = DATE_ADD(berakhir, INTERVAL 3 MONTH)
            WHERE project_id = p_id;
        END IF;

        SET p_id = (SELECT MIN(project_id) FROM projects WHERE project_id > p_id);
    END WHILE;
END //

DELIMITER ;
SELECT*FROM projects

-- 3. Buatlah stored procedure yang memeriksa dan memperbarui data pelatihan setiap karyawan. 
-- Jika ada pelatihan baru yang tersedia, tambahkan pelatihan tersebut ke dalam tabel certificates.


DELIMITER //

CREATE PROCEDURE InsertSertif(
IN id_emp INT)
BEGIN
    DECLARE sertif INT;
    DECLARE tanggal DATE;
    DECLARE id_baru INT;

    -- Menghitung jumlah sertifikat untuk karyawan tertentu
    SELECT COUNT(*) INTO sertif FROM certificates WHERE employee_id = id_emp;
    SET tanggal = CURDATE();

    -- Periksa apakah karyawan memiliki sertifikat
    IF sertif > 0 THEN
        -- Update expiry_date sertifikat yang ada
        UPDATE certificates 
        SET expiry_date = ADDDATE(expiry_date, INTERVAL 1 YEAR)
        WHERE employee_id = id_emp AND expiry_date < tanggal;

        -- Memberikan pesan berdasarkan hasil update
        IF ROW_COUNT() > 0 THEN
            SELECT CONCAT('Sertif untuk karyawan ', id_emp, ' sudah diupdate.') AS message;
        END IF;
   
    END IF;

    -- Memastikan certificate_id yang unik
    SELECT IFNULL(MAX(certificate_id), 0) + 1 INTO id_baru FROM certificates;

    INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date) VALUES
        (id_baru, id_emp, 'belajar Laravel 11', '2024-05-01', '2024-05-18');

    
    
END //

DELIMITER ;
SELECT * FROM certificates;
CALL InsertSertif(3);


-- 4 Buatlah stored procedure yang mengirimkan notifikasi kepada semua karyawan mengenai pelatihan baru yang akan datang.

ALTER TABLE notifications MODIFY COLUMN notification_id INT AUTO_INCREMENT;

DELIMITER //
CREATE PROCEDURE kirim_notifikasi()
BEGIN
    DECLARE id_maksimum INT;
    DECLARE id_minimum INT;
    DECLARE id_sekarang INT;

    SELECT MIN(employee_id), MAX(employee_id) INTO id_minimum, id_maksimum FROM employees;
    SET id_sekarang = id_minimum;

    WHILE id_sekarang <= id_maksimum DO
        -- Memeriksa apakah id_sekarang ada di tabel employees
        IF EXISTS (SELECT * FROM employees WHERE employee_id = id_sekarang) THEN
            INSERT INTO notifications (employee_id, message, DATE)
            VALUES (id_sekarang, 'Pelatihan baru akan segera dimulai. Silakan periksa jadwal Anda untuk detail lebih lanjut.', CURDATE());
        END IF;
        SET id_sekarang = id_sekarang + 1;
    END WHILE;
END//
DELIMITER ;

SELECT * FROM notifications;


CALL kirim_notifikasi()
