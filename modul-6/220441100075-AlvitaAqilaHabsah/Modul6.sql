CREATE DATABASE OutsourcingCompany;
USE OutsourcingCompany;

CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100),
    client_company VARCHAR(100),
    start_date DATE,
    end_date DATE);
    
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    NAME VARCHAR(100),
    POSITION VARCHAR(50),
    salary FLOAT,
    date_hired DATE,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id));
    
CREATE TABLE certificates (
    certificate_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    certificate_name VARCHAR(100),
    issue_date DATE,
    expiry_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id));

CREATE TABLE trainings (
    training_id INT PRIMARY KEY,
    certificate_name VARCHAR(100),
    duration_in_months INT);

CREATE TABLE notifications (
    notification_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    message TEXT,
    DATE DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id));

CREATE TABLE companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    address TEXT);
    
INSERT INTO projects (project_name, client_company, start_date, end_date)VALUES
('Website Development', 'Acme Corp', '2024-05-21', '2024-07-15'),
('Mobile App Design', 'Starlight Inc.', '2024-06-03', '2024-09-20'),
('Data Analytics Project', 'Horizon Solutions', '2024-04-10', '2024-07-05'),
('Marketing Campaign Strategy', 'Global Enterprises', '2024-02-08', '2024-04-28'),
('Social Media Management', 'NextGen Tech', '2024-04-25', '2024-06-30');

-- Mengisi tabel employees
INSERT INTO employees (employee_id, NAME, POSITION, salary, date_hired, project_id) VALUES
(1, 'Alicia', 'Developer', 5500000, '2021-10-15', 1),
(2, 'Bobi', 'Designer', 4500000, '2022-03-20', 2),
(3, 'Reynan', 'Manager', 6000000, '2021-03-12', 3),
(4, 'David', 'Tester', 4000000, '2023-06-11', 4),
(5, 'Evelin', 'Developer', 5000000, '2023-05-25', 5);

-- Mengisi tabel certificates
INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date) VALUES
(1, 1, 'Sertifikasi Arsitek Solusi AWS', '2023-03-20', '2025-01-20'),
(2, 2, 'Sertifikasi Scrum Master', '2023-02-20', '2025-05-20'),
(3, 3, 'Sertifikasi Manajemen Proyek Profesional (PMP)', '2023-06-20', '2025-03-20'),
(4, 4, 'Sertifikasi Tester Profesional (ISTQB)', '2023-10-20', '2025-04-20'),
(5, 5, 'Sertifikasi Analis Data', '2023-05-20', '2025-11-20');

-- Mengisi tabel trainings
INSERT INTO trainings (training_id, certificate_name, duration_in_months) VALUES
(1, 'Sertifikasi Arsitek Solusi AWS', 3),
(2, 'Sertifikasi Scrum Master', 2),
(3, 'Sertifikasi Manajemen Proyek Profesional (PMP)', 4),
(4, 'Sertifikasi Tester Profesional (ISTQB)', 2),
(5, 'Sertifikasi Analis Data', 3);

-- Mengisi tabel notifications
INSERT INTO notifications (notification_id, employee_id, message, DATE) VALUES
(1, 1, 'Rapat proyek hari Senin', '2023-09-06'),
(2, 2, 'Meeting proyek diundur ke tanggal 15.', '2023-10-15'),
(3, 3, 'Harap lengkapi laporan bulanan.', '2023-12-04'),
(4, 4, 'Penting: Pembaruan sistem.', '2024-02-15'),
(5, 5, 'Undangan pelatihan Full Stack.', '2024-05-05');

-- Mengisi tabel companies
INSERT INTO companies (company_id, company_name, address) VALUES
(1, 'Acme Corp', 'Jalan Merdeka No. 1, Jakarta'),
(2, 'Starlight Inc.', 'Jalan Sudirman No. 2, Jakarta'),
(3, 'Horizon Solutions', 'Jalan Thamrin No. 3, Jakarta'),
(4, 'Global Enterprises', 'Jalan Gatot Subroto No. 4, Jakarta'),
(5, 'NextGen Tech', 'Jalan Rasuna Said No. 5, Jakarta');

SELECT * FROM projects;
SELECT * FROM employees;
SELECT * FROM trainings;
SELECT * FROM certificates;
SELECT * FROM notifications;
SELECT * FROM companies;

DROP TABLE notifications;

-- 1. Stored procedure untuk menambahkan bonus 10% kepada karyawan yang sudah bekerja lebih dari satu tahun
DELIMITER //
CREATE PROCEDURE bonus_karyawan()
BEGIN
  DECLARE employee_id INT;
  DECLARE continue_processing BOOL DEFAULT TRUE;
  DECLARE employee_cursor CURSOR FOR SELECT employee_id FROM employees;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET continue_processing = FALSE;
  OPEN employee_cursor;
  WHILE continue_processing DO
    FETCH employee_cursor INTO employee_id;    -- mengambil baris berikutnya dari hasil query
    IF continue_processing THEN
      UPDATE employees
      SET salary = salary * 0.10
      WHERE employee_id = employee_id AND DATEDIFF(CURDATE(), date_hired) > 365;
    END IF;
  END WHILE;
  CLOSE employee_cursor;
END //
DELIMITER ;
CALL bonus_karyawan();
SELECT * FROM employees;

-- 2. stored procedure yang memeriksa setiap proyek dalam tabel projects
DELIMITER //
CREATE PROCEDURE perpanjangan_proyek()
BEGIN
    DECLARE done BOOLEAN DEFAULT FALSE;
    DECLARE projectID INT;
    DECLARE projectEndDate DATE;
    DECLARE currentDate DATE;
    DECLARE cur CURSOR FOR SELECT project_id, end_date FROM projects WHERE DATEDIFF(end_date, CURDATE()) < 30;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO projectID, projectEndDate;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SET currentDate = CURDATE();
        IF DATEDIFF(projectEndDate, currentDate) < 30 THEN
            UPDATE projects
            SET end_date = DATE_ADD(projectEndDate, INTERVAL 3 MONTH)
            WHERE project_id = projectID;
        END IF;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
CALL perpanjangan_proyek();
SELECT * FROM projects;

-- 3. stored procedure yang memeriksa dan memperbarui data pelatihan setiap karyawan. 
DELIMITER //
CREATE PROCEDURE update_pelatihan()
BEGIN
    DECLARE done BOOLEAN DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE train_id INT;
    DECLARE cert_name VARCHAR(100);
    DECLARE train_dur INT;
    DECLARE cur CURSOR FOR SELECT employee_id FROM employees;
    DECLARE cur2 CURSOR FOR SELECT t.training_id, t.certificate_name, t.duration_in_months FROM trainings t
        WHERE NOT EXISTS (
            SELECT 1 
            FROM certificates c 
            WHERE c.certificate_name = t.certificate_name);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_id;
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- Reset done handler for second cursor
        SET done = FALSE;
        OPEN cur2;
        read_loop2: LOOP
            FETCH cur2 INTO train_id, cert_name, train_dur;
            IF done THEN
                LEAVE read_loop2;
            END IF;
            -- Insert new certificate for employee
            INSERT INTO certificates (employee_id, certificate_name, issue_date, expiry_date, training_id)
            VALUES (emp_id, cert_name, CURDATE(), DATE_ADD(CURDATE(), INTERVAL train_dur MONTH), train_id);
        END LOOP;
        CLOSE cur2;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
CALL update_pelatihan();
SELECT * FROM certificates; 

-- 4. Buatlah stored procedure yang mengirimkan notifikasi kepada semua karyawan mengenai pelatihan baru yang akan datang.
DELIMITER //
CREATE PROCEDURE notifikasi_pelatihan()
BEGIN
    DECLARE pelatihan_nama VARCHAR(100);
    DECLARE pelatihan_duration FLOAT;
    DECLARE done INT DEFAULT 0;
    DECLARE cur CURSOR FOR SELECT certificate_name, duration_in_months FROM trainings;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO pelatihan_nama, pelatihan_duration;
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- Periksa apakah pelatihan akan datang (dalam durasinya) cancat= penggabungan
        IF pelatihan_duration > 0 THEN
            INSERT INTO notifications (employee_id, message, DATE)
            SELECT employee_id, CONCAT('Pelatihan yang akan datang: ', pelatihan_nama, '. Durasi: ', pelatihan_duration, ' Bulan'), CURDATE()
            FROM employees;
        END IF;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
CALL notifikasi_pelatihan();
SELECT * FROM notifications;
