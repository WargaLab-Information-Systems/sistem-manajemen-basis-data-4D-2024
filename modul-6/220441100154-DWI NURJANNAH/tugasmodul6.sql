CREATE DATABASE OutsourcingCompany;
USE OutsourcingCompany;
SET SQL_SAFE_UPDATES = 0;

drop database OutsourcingCompany; 

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
	('Project A', 'Client 1', '2022-03-01', '2024-01-31'),
	('Project B', 'Client 2', '2024-02-01', '2024-08-31'),
	('Project C', 'Client 3', '2024-03-01', '2024-09-30'),
	('Project D', 'Client 4', '2020-12-01', NULL),
	('Project E', 'Client 5', '2024-05-01', '2024-11-30'),
	('Project F', 'Client 5', '2024-03-01', '2024-05-30');
		
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
	('Alice', 'Developer', 50000.00, '2023-01-01', 1),
	('Bob', 'Manager', 70000.00, '2022-02-01', 2),
	('Charlie', 'Analyst', 60000.00, '2021-03-01', 3),
	('David', 'Developer', 50000.00, '2024-04-01', 4),
	('Eve', 'Manager', 70000.00, '2022-05-01', 5);
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
	(1, 'Cert A', '2021-01-01', '2024-01-01'),
	(2, 'Cert B', '2022-02-01', '2025-02-01'),
	(3, 'Cert C', '2023-03-01', '2024-03-01'),
	(4, 'Cert D', '2023-04-01', '2025-04-01'),
	(5, 'Cert E', '2022-05-01', '2024-05-01');
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
	('Certificate A', 6),
	('Certificate B', 12),
	('Certificate C', 3),
	('Certificate D', 9),
	('Certificate E', 6);
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
  ('Samsung Electronics', 'Jl.Tunjungan'),
  ('Apple', 'Jl. Jendral Sudirman'),
  ('Tourindo Guide', 'Jl.Kadet Soewoko'),
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
-- memeriksa dan memperbarui data pelatihan setiap karyawan. 
-- ada pelatihan baru yang tersedia, tambahkan pelatihan tersebut ke dalam tabel certificates 
DELIMITER //
CREATE PROCEDURE UpdatePelatihan()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE emp_id INT;
    DECLARE emp_nama VARCHAR(100);
    DECLARE pelatihan_name VARCHAR(100);
    DECLARE cur CURSOR FOR SELECT e.employee_id, e.name, t.certificate_name 
                           FROM employees e
                           CROSS JOIN trainings t
                           WHERE NOT EXISTS (SELECT * FROM certificates c WHERE c.employee_id = e.employee_id AND c.certificate_name = t.certificate_name);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_id, emp_nama, pelatihan_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO certificates (employee_id, certificate_name, issue_date, expiry_date)
        VALUES (emp_id, pelatihan_name, CURDATE(), DATE_ADD(CURDATE(), INTERVAL (SELECT duration_in_months FROM trainings WHERE certificate_name = pelatihan_name) MONTH));
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
CALL UpdatePelatihan();
SELECT * FROM certificates; 
select *from trainings;


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
        IF EXISTS (SELECT 1 FROM employees WHERE employee_id = current_id) THEN
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

 drop database OutsourcingCompany;