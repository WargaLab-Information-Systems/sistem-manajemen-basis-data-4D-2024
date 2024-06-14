CREATE DATABASE db_OutsourcingCompany;
USE db_OutsourcingCompany;
DROP DATABASE db_OutsourcingCompany;

CREATE TABLE IF NOT EXISTS projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    client_company VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);
DESC projects;

CREATE TABLE IF NOT EXISTS trainings (
    training_id INT AUTO_INCREMENT PRIMARY KEY,
    certificate_name VARCHAR(100) NOT NULL,
    duration_in_months INT NOT NULL
);
DESC trainings;

CREATE TABLE IF NOT EXISTS companies (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    address TEXT NOT NULL
);
DESC companies;

CREATE TABLE IF NOT EXISTS employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50) NOT NULL,
    salary FLOAT NOT NULL,
    date_hired DATE NOT NULL,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);
DESC employees;

CREATE TABLE IF NOT EXISTS certificates (
    certificate_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    certificate_name VARCHAR(100) NOT NULL,
    issue_date DATE NOT NULL,
    expiry_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
DESC certificates;

CREATE TABLE IF NOT EXISTS notifications (
    notification_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    message TEXT NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
DESC notifications;


-- Menambahkan 10 data pada tabel projects
INSERT INTO projects (project_name, client_company, start_date, end_date) VALUES
('Project 1', 'Client A', '2023-01-01', '2024-05-15'),
('Project 2', 'Client B', '2023-02-01', '2024-05-25'),
('Project 3', 'Client C', '2023-03-01', '2024-06-20'),
('Project 4', 'Client A', '2023-04-01', '2024-06-15'),
('Project 5', 'Client D', '2023-05-01', '2024-05-27'),
('Project 6', 'Client C', '2023-06-01', '2024-06-30'),
('Project 7', 'Client B', '2023-07-01', '2024-06-05'),
('Project 8', 'Client C', '2023-08-01', '2024-08-30'),
('Project 9', 'Client B', '2023-09-01', '2024-09-19'),
('Project 10', 'Client A', '2023-10-01', '2024-10-20');
SELECT * FROM projects;

-- Menambahkan 10 data pada tabel trainings
INSERT INTO trainings (certificate_name, duration_in_months) VALUES
('Certificate A', 6),
('Certificate B', 12),
('Certificate C', 3),
('Certificate D', 10),
('Certificate E', 6),
('Certificate F', 6),
('Certificate G', 12),
('Certificate H', 3),
('Certificate I', 9),
('Certificate J', 6);
SELECT * FROM trainings;

-- Menambahkan 10 data pada tabel companies
INSERT INTO companies (company_name, address) VALUES
('Company A', 'Sampang'),
('Company B', 'Bangkalan'),
('Company C', 'Gresik'),
('Company D', 'Sidoarjo'),
('Company E', 'Surabaya'),
('Company F', 'Sumenep'),
('Company G', 'Pamekasan'),
('Company H', 'Kediri'),
('Company I', 'Jakarta'),
('Company J', 'Jogjakarta');
SELECT * FROM companies;

-- Menambahkan 10 data pada tabel employees
INSERT INTO employees (name, position, salary, date_hired, project_id) VALUES
('Alicia', 'Senior Developer', 6000, '2023-01-15', 2),
('Bobby', 'Lead Manager', 8000, '2023-02-16', 3),
('Charlotte', 'Senior Analyst', 6500, '2023-03-17', 4),
('Derek', 'Junior Developer', 4500, '2023-04-18', 5),
('Eva', 'Project Manager', 7500, '2023-05-19', 6),
('Francis', 'Data Analyst', 6200, '2023-06-20', 7),
('Graceanne', 'Full Stack Developer', 5500, '2023-07-21', 8),
('Henry', 'Operations Manager', 7700, '2023-08-22', 9),
('Isabella', 'Business Analyst', 6300, '2023-09-23', 10),
('Jackson', 'Backend Developer', 5200, '2023-10-24', 1);
SELECT * FROM employees;

-- Menambahkan 10 data pada tabel certificates
INSERT INTO certificates (employee_id, certificate_name, issue_date, expiry_date) VALUES
(1, 'Cert A', '2024-01-01', '2025-01-01'),
(2, 'Cert B', '2024-02-01', '2025-02-01'),
(3, 'Cert C', '2024-03-01', '2025-03-01'),
(4, 'Cert D', '2024-04-01', '2025-04-01'),
(5, 'Cert E', '2024-05-01', '2025-05-01'),
(6, 'Cert F', '2024-06-01', '2025-06-01'),
(7, 'Cert G', '2024-07-01', '2025-07-01'),
(8, 'Cert H', '2024-08-01', '2025-08-01'),
(9, 'Cert I', '2024-09-01', '2025-09-01'),
(10, 'Cert J', '2024-10-01', '2025-10-01');
SELECT * FROM certificates;

-- Menambahkan 10 data pada tabel notifications
INSERT INTO notifications (employee_id, message, date) VALUES
(1, 'Welcome Alicia to the team!', '2024-01-15'),
(2, 'Congratulations Bobby on your promotion!', '2024-02-16'),
(3, 'Charlotte, please complete your training.', '2024-03-17'),
(4, 'Derek, your project starts today.', '2024-04-18'),
(5, 'Eva, meeting scheduled for project planning.', '2024-05-19'),
(6, 'Francis, new data available for analysis.', '2024-06-20'),
(7, 'Graceanne, deploy the new feature today.', '2024-07-21'),
(8, 'Henry, operations review meeting.', '2024-08-22'),
(9, 'Isabella, update on business strategy.', '2024-09-23'),
(10, 'Jackson, backend system maintenance.', '2024-10-24');
SELECT * FROM notifications;

-- NOMOR 1
DELIMITER //
CREATE PROCEDURE sp_bonus_karyawan()
	BEGIN
		DECLARE done INT DEFAULT 0;
		DECLARE id INT;
		DECLARE bonus FLOAT;
		DECLARE hire DATE;
		DECLARE cur CURSOR FOR SELECT employee_id, salary, date_hired FROM employees;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

		OPEN cur;

		read_loop: LOOP
			FETCH cur INTO id, bonus, hire;
			IF done THEN
				LEAVE read_loop;
			END IF;

			IF TIMESTAMPDIFF(YEAR, hire, CURDATE()) >= 1 THEN
				SET bonus = bonus * 0.10;
				UPDATE employees SET salary = salary + bonus WHERE employee_id = id;
			END IF;
		END LOOP;

		CLOSE cur;
	END //
DELIMITER ;
CALL sp_bonus_karyawan();
SELECT * FROM employees;


-- NOMOR 2
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

-- NOMOR 3
ALTER TABLE certificates ADD COLUMN training_id INT DEFAULT NULL;
ALTER TABLE certificates ADD CONSTRAINT fk_training_id FOREIGN KEY (training_id) REFERENCES trainings(training_id);
DELIMITER //
CREATE PROCEDURE sp_cek_dan_update_certificates()
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
            SET expiry_date = DATE_ADD(issue_date, INTERVAL 3 YEAR);
            INSERT INTO certificates (employee_id, certificate_name, issue_date, expiry_date, training_id)
            SELECT employee_id, training_name, issue_date, expiry_date, training_id FROM employees;
        END IF;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
CALL sp_cek_dan_update_certificates();
SELECT * FROM certificates;


-- NOMOR 4
DELIMITER //
CREATE PROCEDURE sp_notifikasi_pelatihan_baru()
	BEGIN
		DECLARE done INT DEFAULT 0;
		DECLARE training_duration FLOAT;
		DECLARE training_name VARCHAR(100);
		DECLARE cur CURSOR FOR SELECT certificate_name, duration_in_months FROM trainings;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

		OPEN cur;

		read_loop: LOOP
			FETCH cur INTO training_name, training_duration;
			IF done THEN
				LEAVE read_loop;
			END IF;

			IF training_duration > 0 THEN
            INSERT INTO notifications (employee_id, message, date)
            SELECT employee_id, CONCAT('Upcoming training: ', training_name, '. Duration: ', training_duration, ' months'), CURDATE()
            FROM employees;
        END IF;
    END LOOP;
    CLOSE cur;

	END //
DELIMITER ;
CALL sp_notifikasi_pelatihan_baru();
SELECT * FROM notifications;