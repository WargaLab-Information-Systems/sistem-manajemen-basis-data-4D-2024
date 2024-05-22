CREATE DATABASE OutsourcingCompany2;
USE OutsourcingCompany2;

-- PROYEK
CREATE TABLE projects (
  project_id INT PRIMARY KEY AUTO_INCREMENT,
  project_name VARCHAR(100) NOT NULL,
  client_company VARCHAR(100) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE DEFAULT NULL
);
DESC projects;

-- KARYAWAN 
CREATE TABLE employees (
  employee_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  position VARCHAR(50) NOT NULL,
  salary FLOAT NOT NULL,
  date_hired DATE NOT NULL,
  project_id INT DEFAULT NULL,
  FOREIGN KEY (project_id) REFERENCES projects(project_id)
);
DESC employees;

--  SERTIFIKAT
CREATE TABLE certificates (
  certificate_id INT PRIMARY KEY AUTO_INCREMENT,
  employee_id INT NOT NULL,
  certificate_name VARCHAR(100) NOT NULL,
  issue_date DATE NOT NULL,
  expiry_date DATE,
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
DESC certificates;

--  PELATIHAN
CREATE TABLE trainings (
  training_id INT PRIMARY KEY AUTO_INCREMENT,
  certificate_name VARCHAR(100) NOT NULL,
  duration_in_months INT NOT NULL,
  UNIQUE (certificate_name) 
);
DESC trainings;
ALTER TABLE certificates ADD COLUMN training_id INT DEFAULT NULL;
ALTER TABLE certificates ADD CONSTRAINT fk_training_id FOREIGN KEY (training_id) REFERENCES trainings(training_id);

-- PEMBERITAHUAN 
CREATE TABLE notifications (
  notification_id INT PRIMARY KEY AUTO_INCREMENT,
  employee_id INT NOT NULL,
  message TEXT NOT NULL,
  date DATE NOT NULL,
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
DESC notifications;

-- PERUSAHAAN 
CREATE TABLE companies (
  company_id INT PRIMARY KEY AUTO_INCREMENT,
  company_name VARCHAR(100) NOT NULL,
  address TEXT NOT NULL
);
DESC companies;


INSERT INTO projects (project_name, client_company, start_date, end_date)
VALUES
	('E-commerce Development', 'Starlink', '2022-03-01', '2024-03-31'),
	('Data Analys', 'Hyundai', '2021-09-01', '2024-03-31'),
	('Data Analytics', 'Huawei', '2023-07-01', '2024-09-30'),
	('Management Big Data', 'Tourindo', '2020-12-01', NULL),
	('CRM Implementation', 'Epsilon', '2022-02-01', '2023-11-31');
SELECT * FROM projects;

INSERT INTO employees (name, position, salary, date_hired, project_id)
VALUES
	('Jonatan', 'Software Analys', 50000.00, '2023-01-01', 1),
	('Jeje', 'Project Manager', 75000.00, '2022-06-01', 2),
	('Mira', 'Database Manager', 60000.00, '2024-02-15', 3),
	('Hani', 'Web Developer', 45000.00, '2021-11-01', 2),
	('David', 'Business Project', 58000.00, '2023-05-10', 1);
SELECT * FROM employees;

INSERT INTO certificates (employee_id, certificate_name, issue_date, expiry_date)
VALUES
	(1, 'Java Certified', '2021-04-01', '2024-03-31'),
	(2, 'Scrum Master', '2022-08-15', '2025-08-14'),
	(3, 'Oracle Database', '2020-10-10', '2023-10-09'),
	(4, ' Solutions Architect', '2023-12-24', '2026-12-23'),
	(5, ' Solutions Associate', '2022-05-05', '2025-05-04');
SELECT * FROM certificates;

INSERT INTO trainings (certificate_name, duration_in_months)
VALUES
	('Python', 3),
	('Effective', 1),
	('Methodology', 2),
	('Cybersecurity', 0.5),
	('Communication', 1);
SELECT * FROM trainings;

INSERT INTO notifications (employee_id, message, date)
VALUES
	(1, 'Performance review scheduled for next week.', '2024-05-21'),
	(2, 'Project deadline approaching. Please ensure all tasks are completed on time.', '2024-05-17'),
	(3, 'New training opportunity available: Advanced SQL for Data Analysts.', '2024-05-14'),
	(4, 'Company picnic is happening next month. Please RSVP by May 31st.', '2024-05-10'),
	(5, 'Welcome to the team! We\'re excited to have you on board.', '2024-04-01');
SELECT * FROM notifications;

INSERT INTO companies (company_name, address)
VALUES
  ('Starlink', 'Kalibata City'),
  ('Hyundai', 'Jl.Dukun District'),
  ('Huawei', 'Jl. Jendral Sudirman'),
  ('Tourindo', 'Jl.Prof Muhaimin'),
  ('Epsilon', 'Casablanka City');
SELECT * FROM companies;


-- NOMOR 1
-- Stored procedure memeriksa setiap karyawan dalam tabel employees. 
-- Jika karyawan sudah bekerja lebih dari satu tahun, tambahkan bonus sebesar 10% dari gaji.
DELIMITER //
CREATE PROCEDURE hitungBonusTahunan()
BEGIN
    DECLARE selesai INT DEFAULT 0;
    DECLARE karyawan_id INT;
    DECLARE gaji_karyawan FLOAT;
    DECLARE tanggal_mulai DATE;
    DECLARE bonus_gaji FLOAT;
    DECLARE karyawan_cur CURSOR FOR SELECT employee_id, salary, date_hired FROM employees;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET selesai = 1;

    OPEN karyawan_cur;
    loop_karyawan: LOOP
        FETCH karyawan_cur INTO karyawan_id, gaji_karyawan, tanggal_mulai;
        IF selesai THEN
            LEAVE loop_karyawan;
        END IF;
        IF TIMESTAMPDIFF(YEAR, tanggal_mulai, CURDATE()) >= 1 THEN
            SET bonus_gaji = gaji_karyawan * 0.10;
            UPDATE employees SET salary = salary + bonus_gaji WHERE employee_id = karyawan_id;
        END IF;
    END LOOP;
    CLOSE karyawan_cur;
END //
DELIMITER ;

CALL hitungBonusTahunan();
SELECT * FROM employees;



-- NOMOR 2
-- Stored procedure memeriksa setiap proyek dalam tabel projects. 
-- Jika proyek akan berakhir dalam waktu kurang dari satu bulan, perpanjang proyek selama tiga bulan.
DELIMITER //
DELIMITER //
CREATE PROCEDURE perpanjangProyek()
BEGIN
    DECLARE selesai INT DEFAULT 0;
    DECLARE proyek_id INT;
    DECLARE tanggal_akhir_sekarang DATE;
    DECLARE tanggal_akhir_baru DATE;
    DECLARE proyek_cursor CURSOR FOR SELECT project_id, end_date FROM projects WHERE end_date IS NOT NULL;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET selesai = 1;

    OPEN proyek_cursor;
    loop_proyek: LOOP
        FETCH proyek_cursor INTO proyek_id, tanggal_akhir_sekarang;
        IF selesai THEN
            LEAVE loop_proyek;
        END IF;
        IF DATEDIFF(tanggal_akhir_sekarang, CURDATE()) <= 30 THEN
            SET tanggal_akhir_baru = DATE_ADD(tanggal_akhir_sekarang, INTERVAL 3 MONTH);
            UPDATE projects SET end_date = tanggal_akhir_baru WHERE project_id = proyek_id;
        END IF;
    END LOOP;
    CLOSE proyek_cursor;
END //
DELIMITER ;
drop procedure perpanjangProyekk;
CALL perpanjangProyek();
SELECT * FROM projects;


 

-- NOMOR 3
-- Stored procedure memeriksa dan memperbarui data pelatihan setiap karyawan. 
-- Jika ada pelatihan baru yang tersedia, tambahkan pelatihan tersebut ke dalam tabel certificates. 
DELIMITER //
CREATE PROCEDURE updateCertificatesPelatihan()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE training_id INT;
    DECLARE training_name VARCHAR(100);
    DECLARE issue_date DATE;
    DECLARE expiry_date DATE;
    DECLARE cur CURSOR FOR SELECT training_id, certificate_name FROM trainings;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO training_id, training_name;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Memeriksa apakah pelatihan ini sudah ada dalam tabel certificates
        IF NOT EXISTS (SELECT 1 FROM certificates WHERE certificate_name = training_name) THEN
            SET issue_date = CURDATE();
            SET expiry_date = DATE_ADD(issue_date, INTERVAL 3 YEAR);  -- Misal, masa berlaku sertifikat 3 tahun
            INSERT INTO certificates (employee_id, certificate_name, issue_date, expiry_date, training_id)
            SELECT employee_id, training_name, issue_date, expiry_date, training_id FROM employees;
        END IF;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
CALL updateCertificatesPelatihan();
SELECT * FROM certificates;


-- NOMOR 4
-- Stored procedure mengirimkan notifikasi kepada semua karyawan mengenai pelatihan baru yang akan datang.
DELIMITER //
CREATE PROCEDURE NotifyEmployeesNewTraining()
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
        
        -- Periksa apakah pelatihan akan datang (dalam durasinya)
        IF pelatihan_duration > 0 THEN
            INSERT INTO notifications (employee_id, message, date)
            SELECT employee_id, CONCAT('Upcoming training: ', pelatihan_nama, '. Duration: ', pelatihan_duration, ' months'), CURDATE()
            FROM employees;
        END IF;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
CALL NotifyEmployeesNewTraining();
SELECT * FROM notifications;
