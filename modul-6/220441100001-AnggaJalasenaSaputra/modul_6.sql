CREATE DATABASE OutsourcingCompany;
USE OutsourcingCompany;

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
('Project A', 'Client 1', '2023-02-10', '2024-06-20'),
('Project B', 'Client 2', '2023-02-22', '2024-05-10'),
('Project C', 'Client 3', '2023-03-20', '2024-09-30'),
('Project D', 'Client 4', '2023-04-09', '2024-05-31'),
('Project E', 'Client 5', '2023-05-06', '2024-06-30'),
('Project F', 'Client 6', '2023-02-06', '2024-06-25'),
('Project G', 'Client 7', '2023-07-03', '2024-08-31'),
('Project H', 'Client 8', '2023-02-05', '2024-06-31'),
('Project I', 'Client 9', '2023-09-03', '2024-12-31'),
('Project J', 'Client 10', '2023-03-05', '2024-06-09');
SELECT * FROM projects;
 

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
	('Ali', 'Developer', 50000.00, '2023-01-02', 1),
	('Bobi', 'Manager', 70000.00, '2022-02-03', 2),
	('Chilie', 'Analyst', 60000.00, '2021-03-04', 3),
	('Dava', 'Developer', 50000.00, '2024-04-05', 4),
	('Eva', 'Manager', 70000.00, '2022-05-06', 5),
    ('Frank', 'Analyst', 6000, '2024-06-01', 6),
	('Grace', 'Developer', 5000, '2024-07-01', 7),
	('Hank', 'Manager', 7000, '2024-08-01', 8),
	('Ivy', 'Analyst', 6000, '2024-09-01', 9),
	('Jack', 'Developer', 5000, '2024-10-01', 10);
SELECT * FROM employees;

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
	(1, 'Certif A', '2021-01-01', '2024-01-03'),
	(2, 'Certif B', '2022-02-01', '2025-02-02'),
	(3, 'Certif C', '2023-03-01', '2024-03-04'),
	(4, 'Certif D', '2023-04-01', '2025-04-06'),
	(5, 'Certif E', '2022-05-01', '2024-05-05'),
    (6, 'Certif F', '2024-06-01', '2025-06-01'),
	(7, 'Certif G', '2024-07-01', '2025-07-01'),
	(8, 'Certif H', '2024-08-01', '2025-08-01'),
	(9, 'Certif I', '2024-09-01', '2025-09-01'),
	(10, 'Certif J', '2024-10-01', '2025-10-01');
SELECT * FROM certificates;


CREATE TABLE trainings (
  training_id INT PRIMARY KEY AUTO_INCREMENT,
  certificate_name VARCHAR(100) NOT NULL,
  duration_in_months INT NOT NULL,
  UNIQUE (certificate_name) 
);
DESC trainings;
INSERT INTO trainings (certificate_name, duration_in_months)
VALUES
	('Certificate A', 5),
	('Certificate B', 15),
	('Certificate C', 2),
	('Certificate D', 8),
	('Certificate E', 9),
    ('Certificate F', 6),	
	('Certificate G', 12),
	('Certificate H', 3),
	('Certificate I', 9),
	('Certificate J', 6);
SELECT * FROM trainings;

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
(1, 'Notification 1 for Employee 1', '2024-01-01'),
(2, 'Notification 2 for Employee 2', '2024-02-01'),
(3, 'Notification 3 for Employee 3', '2024-03-01'),
(4, 'Notification 4 for Employee 4', '2024-04-01'),
(5, 'Notification 5 for Employee 5', '2024-05-01'),
(6, 'Notification 6 for Employee 6', '2024-06-01'),
(7, 'Notification 7 for Employee 7', '2024-07-01'),
(8, 'Notification 8 for Employee 8', '2024-08-01'),
(9, 'Notification 9 for Employee 9', '2024-09-01'),
(10, 'Notification 10 for Employee 10','2024-10-01');
SELECT * FROM notifications;

CREATE TABLE companies (
  company_id INT PRIMARY KEY AUTO_INCREMENT,
  company_name VARCHAR(100) NOT NULL,
  address TEXT NOT NULL
);
DESC companies;
INSERT INTO companies (company_name, address)
VALUES
  ('Tech Innovators', 'Jl. Thamrin'),
  ('Green Energy Solutions', 'Jl. Diponegoro'),
  ('Quantum Computing Inc.', 'Jl. Merdeka Barat'),
  ('Smart Home Solutions', 'Jl. Gatot Subroto'),
  ('Eco-Friendly Products', 'Jl. Sudirman');
SELECT * FROM companies;


-- 1 --
DELIMITER //
CREATE PROCEDURE addBonus()
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
CALL addBonus;
SELECT * FROM employees; 

-- 2 --
ALTER TABLE projects ADD COLUMN extend_end_date DATE;
DELIMITER //
CREATE PROCEDURE sp_perpanjangan_proyek()
	BEGIN
		DECLARE done INT DEFAULT 0;
		DECLARE id INT;
		DECLARE end DATE;
		DECLARE now DATE;
		DECLARE cur CURSOR FOR SELECT project_id, end_date AS tanggal_awal FROM projects;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

		OPEN cur;

		read_loop: LOOP
			FETCH cur INTO id, end;
			IF done THEN
				LEAVE read_loop;
			END IF;

			IF DATEDIFF(end, CURDATE()) < 30 THEN
            SET now = DATE_ADD(end, INTERVAL 3 MONTH);
            UPDATE projects SET extend_end_date = now WHERE project_id = id;
			END IF;
		END LOOP;

		CLOSE cur;
	END //
DELIMITER ;
CALL sp_perpanjangan_proyek();
SELECT * FROM projects;
 

-- 3 --
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


-- 4 --
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
            SELECT employee_id, CONCAT('Pelatihan yang akan datang: ', pelatihan_nama, '. Duration: ', pelatihan_duration, ' months'), CURDATE()
            FROM employees;
        END IF;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
CALL NotifyEmployeesNewTraining();
SELECT * FROM notifications;