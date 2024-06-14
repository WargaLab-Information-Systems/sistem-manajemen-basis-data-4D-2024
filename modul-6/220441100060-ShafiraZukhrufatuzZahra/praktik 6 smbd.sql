CREATE DATABASE OutsourcingCompany;
USE OutsourcingCompany;


-- PROYEK
CREATE TABLE projects (
  project_id INT PRIMARY KEY AUTO_INCREMENT,
  project_name VARCHAR(100) NOT NULL,
  client_company VARCHAR(100) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE DEFAULT NULL
);
DESC projects;
INSERT INTO projects (project_name, client_company, start_date, end_date)
VALUES
	('E-commerce Development', 'NFC Indonesia', '2022-03-01', '2024-01-31'),
	('Mobile App Development', 'Samsung Electronics', '2021-09-01', '2023-12-31'),
	('Data Analytics Platform', 'Apple', '2023-07-01', '2024-06-30'),
	('Cloud Migration', 'Tourindo Guide', '2020-12-01', NULL),
	('CRM Implementation', 'Epsilon Systems', '2022-02-01', '2023-08-31');
SELECT * FROM projects;



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
INSERT INTO employees (name, position, salary, date_hired, project_id)
VALUES
	('Jonatan', 'Software Developer', 50000.00, '2023-01-01', 1),
	('Jeje', 'Project Manager', 75000.00, '2022-06-01', 2),
	('Mira', 'Database Administrator', 60000.00, '2024-02-15', 3),
	('Hani', 'Web Developer', 45000.00, '2021-11-01', 2),
	('David', 'Business Analyst', 58000.00, '2023-05-10', 1);
SELECT * FROM employees;


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
INSERT INTO certificates (employee_id, certificate_name, issue_date, expiry_date)
VALUES
	(1, 'Java Certified Programmer', '2021-04-01', '2024-03-31'),
	(2, 'Certified Scrum Master', '2022-08-15', '2025-08-14'),
	(3, 'Oracle Database Certified Associate', '2020-10-10', '2023-10-09'),
	(4, 'AWS Certified Solutions Architect - Associate', '2023-12-24', '2026-12-23'),
	(5, 'Microsoft Certified Solutions Associate: SharePoint 2019', '2022-05-05', '2025-05-04');
SELECT * FROM certificates;


--  PELATIHAN
CREATE TABLE trainings (
  training_id INT PRIMARY KEY AUTO_INCREMENT,
  certificate_name VARCHAR(100) NOT NULL,
  duration_in_months INT NOT NULL,
  UNIQUE (certificate_name) 
);
DESC trainings;
INSERT INTO trainings (certificate_name, duration_in_months)
VALUES
	('Python Programming', 3),
	('Git and GitHub', 1),
	('Agile Methodology', 2),
	('Cybersecurity Awareness', 0.5),
	('Effective Communication Skills', 1);
SELECT * FROM trainings;


-- PEMBERITAHUAN 
CREATE TABLE notifications (
  notification_id INT PRIMARY KEY AUTO_INCREMENT,
  employee_id INT NOT NULL,
  message TEXT NOT NULL,
  date DATE NOT NULL,
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
DESC notifications;
INSERT INTO notifications (employee_id, message, date)
VALUES
	(1, 'Performance review scheduled for next week.', '2024-05-21'),
	(2, 'Project deadline approaching. Please ensure all tasks are completed on time.', '2024-05-17'),
	(3, 'New training opportunity available: Advanced SQL for Data Analysts.', '2024-05-14'),
	(4, 'Company picnic is happening next month. Please RSVP by May 31st.', '2024-05-10'),
	(5, 'Welcome to the team! We\'re excited to have you on board.', '2024-04-01');
SELECT * FROM notifications;


-- PERUSAHAAN 
CREATE TABLE companies (
  company_id INT PRIMARY KEY AUTO_INCREMENT,
  company_name VARCHAR(100) NOT NULL,
  address TEXT NOT NULL
);
DESC companies;
INSERT INTO companies (company_name, address)
VALUES
  ('NFC Indonesia', 'Kuningan City'),
  ('Samsung Electronics', 'Jl.Jababeka Raya'),
  ('Apple', 'Jl. Jendral Sudirman Lt.18'),
  ('Tourindo Guide', 'Jl.Prof.Dr.Satrio'),
  ('Epsilon Systems', 'Kuningan City');
SELECT * FROM companies;


-- SOAL
-- NOMOR 1
-- karyawan bekerja lebih dari 1th = bonus 10%
DELIMITER //
CREATE PROCEDURE hitungBonus()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE emp_id INT;
    DECLARE emp_gaji FLOAT;
    DECLARE emp_tgl_mulai DATE;
    DECLARE bonus FLOAT;
    DECLARE cur CURSOR FOR SELECT employee_id, salary, date_hired FROM employees;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_id, emp_gaji, emp_tgl_mulai;
        IF done THEN
            LEAVE read_loop;
        END IF;
        IF TIMESTAMPDIFF(YEAR, emp_tgl_mulai, CURDATE()) >= 1 THEN
            SET bonus = emp_gaji * 0.10;
            UPDATE employees SET salary = salary + bonus WHERE employee_id = emp_id;
        END IF;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
CALL hitungBonus;
SELECT * FROM employees;


-- NOMOR 2
-- proyek berakhir dalam kurang dari 1 bulan = panjang proyek selama 3 bulan 
DELIMITER //
CREATE PROCEDURE perpanjangProjek()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE proj_id INT;
    DECLARE proj_tgl_akhir DATE;
    DECLARE new_tgl_akhir DATE;
    DECLARE cur CURSOR FOR SELECT project_id, end_date FROM projects WHERE end_date IS NOT NULL;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO proj_id, proj_tgl_akhir;
        IF done THEN
            LEAVE read_loop;
        END IF;
        IF DATEDIFF(proj_tgl_akhir, CURDATE()) < 30 THEN
            SET new_tgl_akhir = DATE_ADD(proj_tgl_akhir, INTERVAL 3 MONTH);
            UPDATE projects SET end_date = new_tgl_akhir WHERE project_id = proj_id;
        END IF;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
CALL perpanjangProjek();
SELECT * FROM projects;
 

-- NOMOR 3
ALTER TABLE certificates ADD COLUMN training_id INT DEFAULT NULL;
ALTER TABLE certificates ADD CONSTRAINT fk_training_id FOREIGN KEY (training_id) REFERENCES trainings(training_id);
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
-- mengirimkan notifikasi kepada semua karyawan mengenai pelatihan baru yang akan datang.
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