CREATE DATABASE m6;

USE m6;


CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    client_company VARCHAR(100),
    start_date DATE,
    end_date DATE
);

DROP TABLE projects;

INSERT INTO projects (project_id, project_name, client_company, start_date, end_date) VALUES
(1, 'Apk instan', 'Sol Tekno Inc.', '2023-01-15', '2023-06-15'),
(2, 'Aps for moba', 'Varitech Ltd.', '2023-03-01', '2023-09-01'),
(3, 'Migrasi Data', 'DataSev Corp.', '2023-04-20', '2023-12-20');

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    NAME VARCHAR(100),
    POSITION VARCHAR(50),
    salary FLOAT,
    date_hired DATE,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

DROP TABLE employees;

INSERT INTO employees (employee_id, NAME, POSITION, salary, date_hired, project_id) VALUES
(1, 'Zigg', 'PPL', 60000000, '2022-01-10', 1),
(2, 'Axcieel', 'Manajer Proyek', 80000000, '2021-09-15', 2),
(3, 'Swatimita', 'Administrator ', 55000000, '2022-03-20', 3),
(4, 'Axcelion', 'Desainer UI/UX', 50000000, '2023-02-01', 1),
(5, 'Voyage', 'Pengembang Backend, Frontend', 62000000, '2022-11-25', 2);

CREATE TABLE certificates (
    certificate_id INT PRIMARY KEY,
    employee_id INT,
    certificate_name VARCHAR(100),
    issue_date DATE,
    expiry_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date) VALUES
(1, 1, 'Pengembang APK Bersertifikat', '2023-01-01', '2025-01-01'),
(2, 2, 'Sertifikasi PMPK', '2022-06-15', '2025-06-15'),
(3, 3, 'Administrator Data Bersertifikat', '2023-03-01', '2026-03-01'),
(4, 4, 'Desainer UI/UX sertifikat', '2023-02-10', '2024-02-10'),
(5, 5, 'Pengembang AWS sertifikat', '2022-12-01', '2025-12-01');

CREATE TABLE trainings (
    training_id INT PRIMARY KEY,
    certificate_name VARCHAR(100),
    duration_in_months INT
);

INSERT INTO trainings (training_id, certificate_name, duration_in_months) VALUES
(1, 'Pengembang APK Bersertifikat', 3),
(2, 'Sertifikasi PMPK', 4),
(3, 'Administrator Data Bersertifikat', 3),
(4, 'Desainer UI/UX sertifikat', 2),
(5, 'Pengembang AWS sertifikat', 3);

CREATE TABLE notifications (
    notification_id INT PRIMARY KEY,
    employee_id INT,
    message TEXT,
    dates DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

DROP TABLE notifications;

INSERT INTO notifications (notification_id, employee_id, message, dates) VALUES
(1, 1, 'Batas waktu proyek sudah dekat.', '2023-05-01'),
(2, 2, 'Kebijakan perusahaan baru.', '2023-04-15'),
(3, 3, 'Jadwal pemeliharaan data.', '2023-06-20'),
(4, 4, 'Tinjauan desain.', '2023-05-10'),
(5, 5, 'Pembaruan server.', '2023-07-01');

CREATE TABLE companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    address TEXT
);

INSERT INTO companies (company_id, company_name, address) VALUES
(1, 'Sol Tekno Inc.', 'Jl. Mutiara No.123, Jakarta'),
(2, 'Varitech Ltd.', 'Jl. Jamrud No.456, Bandung'),
(3, 'DataSev Corp.', 'Jl. Emas No.789, Surabaya');

 
 UPDATE employees SET salary = 3000000 WHERE employee_id = 1;
 UPDATE employees SET salary = 4000000 WHERE employee_id = 2;
 UPDATE employees SET salary = 5000000 WHERE employee_id = 3;
 UPDATE employees SET salary = 6000000 WHERE employee_id = 4;
 UPDATE employees SET salary = 7000000 WHERE employee_id = 5;
 
INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date) VALUES
(1, 1, 'Pengembang Java Bersertifikat', '2023-01-01', '2025-01-01'),
(2, 2, 'Sertifikasi PMP', '2022-06-15', '2025-06-15'),
(3, 3, 'Administrator Basis Data Bersertifikat', '2023-03-01', '2026-03-01'),
(4, 4, 'Desainer UX Bersertifikat', '2023-02-10', '2024-02-10'),
(5, 5, 'Pengembang AWS Bersertifikat', '2022-12-01', '2025-12-01');

UPDATE certificates SET certificate_id = 6 WHERE employee_id = 1;
UPDATE certificates SET certificate_id = 7 WHERE employee_id = 2;
UPDATE certificates SET certificate_id = 8 WHERE employee_id = 3;
UPDATE certificates SET certificate_id = 9 WHERE employee_id = 4;
UPDATE certificates SET certificate_id = 10 WHERE employee_id = 5;



-- 1. Buatlah stored procedure yang memeriksa setiap karyawan dalam tabel employees. 
-- Jika karyawan sudah bekerja lebih dari satu tahun, tambahkan bonus sebesar 10% dari gaji mereka.

DELIMITER //

CREATE PROCEDURE  bonusnya()
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

CALL bonusnya();
SELECT*FROM employees;

-- 2. Buatlah stored procedure yang memeriksa setiap proyek dalam tabel projects.
-- Jika proyek akan berakhir dalam waktu kurang dari satu bulan, perpanjang proyek selama tiga bulan.

DELIMITER //

CREATE PROCEDURE  tambah()
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
CALL tambah();
SELECT*FROM projects;

-- 3. Buatlah stored procedure yang memeriksa dan memperbarui data pelatihan setiap karyawan. 
-- Jika ada pelatihan baru yang tersedia, tambahkan pelatihan tersebut ke dalam tabel certificates.


DELIMITER //

CREATE PROCEDURE perbaruisertif(
    IN emp_id INT
)
BEGIN
    DECLARE num_certificates INT;
    DECLARE new_certificate_id INT;

    SELECT COUNT(*) INTO num_certificates FROM certificates WHERE employee_id = emp_id;
    SET @current_date = CURDATE(); 

    UPDATE certificates 
    SET expiry_date = ADDDATE(expiry_date, INTERVAL 1 YEAR)
    WHERE employee_id = emp_id AND expiry_date < @current_date;

    IF num_certificates = 0 THEN
        SELECT IFNULL(MAX(certificate_id), 0) + 1 INTO new_certificate_id FROM certificates;

        INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date) 
        VALUES (new_certificate_id, emp_id, 'php lagi', '2024-05-01', '2024-05-18');
    END IF;

    IF ROW_COUNT() > 0 THEN
        SELECT CONCAT('Sertifikat untuk karyawan ', emp_id, ' sudah diperbarui.') AS message;
    ELSE
        SELECT CONCAT('Tidak ada sertifikat yang perlu diperbarui untuk karyawan ', emp_id) AS message;
    END IF;
    
END //

DELIMITER ;

CALL perbaruisertif(2);
SELECT*FROM certificates;




 -- 4. 
 -- Buatlah STORED PROCEDURE yang mengirimkan notifikasi kepada semua karyawan mengenai pelatihan baru yang akan datang.
DELIMITER //

CREATE PROCEDURE sp_send_notification_new_training()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE employee_id INT;
    DECLARE employee_name VARCHAR(100);
    DECLARE training_name VARCHAR(100);
    DECLARE training_duration INT;
    DECLARE notification_message TEXT;
    DECLARE notification_date DATE;

    DECLARE cur_employee CURSOR FOR SELECT e.employee_id, e.NAME FROM employees e;
    DECLARE cur_training CURSOR FOR SELECT t.certificate_name, t.duration_in_months FROM trainings t;

    OPEN cur_employee;
    OPEN cur_training;

    read_loop: LOOP
        FETCH cur_employee INTO employee_id, employee_name;
        FETCH cur_training INTO training_name, training_duration;

        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        SET notification_message = CONCAT('Pelatihan baru "', training_name, '" akan datang dengan durasi ', training_duration, ' bulan.');
        SET notification_date = DATE_ADD(CURDATE(), INTERVAL 1 MONTH);

        INSERT INTO notifications (employee_id, message, dates)
        VALUES (employee_id, notification_message, notification_date);
    END LOOP;

    CLOSE cur_employee;
    CLOSE cur_training;
END //

DELIMITER ;

SELECT * FROM notifications;

DROP PROCEDURE sp_send_notification_new_training;