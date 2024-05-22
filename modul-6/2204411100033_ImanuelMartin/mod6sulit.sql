-- Step 1 : buat database
CREATE DATABASE OutsourcingCompany2;
-- step 2 : pilih db yang sudah dibuat untuk digunakan 
USE OutsourcingCompany2;
-- step 3 : buat tabel sesuai dengan soal perhatikan tabel mana yang tidak memiliki foreign key diddalamnya itu yang dibuat terlebih dahulu
	-- Buat tabel Projects
	CREATE TABLE projects (
	    project_id INT PRIMARY KEY AUTO_INCREMENT,
	    project_name VARCHAR(100) NOT NULL,
	    client_company VARCHAR(100) NOT NULL,
	    start_date DATE NOT NULL,
	    end_date DATE NOT NULL
	);
	-- Buat tabel trainings
	CREATE TABLE trainings (
	    training_id INT PRIMARY KEY AUTO_INCREMENT,
	    certificate_name VARCHAR(100) NOT NULL,
	    duration_in_months INT NOT NULL
	    FOREIGN KEY certificates ref
	);
	-- Buatt tabel companies
	CREATE TABLE companies (
	    company_id INT PRIMARY KEY AUTO_INCREMENT,
	    company_name VARCHAR(100) NOT NULL,
	    address TEXT NOT NULL
	);
	-- buat tabel employess
	CREATE TABLE employees (
	    employee_id INT PRIMARY KEY AUTO_INCREMENT,
	    NAME VARCHAR(100) NOT NULL,
	    POSITION VARCHAR(50) NOT NULL,
	    salary FLOAT NOT NULL,
	    date_hired DATE NOT NULL,
	    project_id INT,
	    FOREIGN KEY (project_id) REFERENCES projects(project_id)
	);
	-- buat tabel certificates
	CREATE TABLE certificates (
	    certificate_id INT PRIMARY KEY AUTO_INCREMENT,
	    employee_id INT,
	    certificate_name VARCHAR(100) NOT NULL,
	    issue_date DATE NOT NULL,
	    expiry_date DATE NOT NULL,
	    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
	);
	-- buat tabel notification
	CREATE TABLE notifications (
	    notification_id INT PRIMARY KEY AUTO_INCREMENT,
	    employee_id INT,
	    message TEXT NOT NULL,
	    DATE DATE NOT NULL,
	    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
	);
-- step 4 : Setelah create table kita diwajibkan untuk mengisi data pada setiap tabel
	INSERT INTO projects (project_id, project_name, client_company, start_date, end_date) VALUES
	(1, 'Project Alpha', 'PT. Sejahtera', '2024-05-01', '2024-05-11'),-- b
	(2, 'Project Beta', 'CV. Maju Jaya', '2024-03-01', '2024-03-29'),-- b
	(3, 'Project Gamma', 'PT. Aman Sentosa', '2022-03-15', '2022-03-29'),-- b
	(4, 'Project Delta', 'PT. Cahaya', '2020-07-01', '2020-07-29'),-- b
	(5, 'Project Epsilon', 'CV. Abadi', '2021-09-01', '2021-09-29'),-- b
	(6, 'Project Zeta', 'PT. Langgeng', '2022-05-01', '2024-05-01'),
	(7, 'Project Eta', 'CV. Sukses', '2020-10-01', '2023-10-01'),
	(8, 'Project Theta', 'PT. Makmur', '2021-11-01', '2023-11-01'),
	(9, 'Project Iota', 'CV. Berkah', '2022-02-01', '2024-02-01'),
	(10, 'Project Kappa', 'PT. Harmoni', '2021-12-01', '2023-12-01');
	
	INSERT INTO trainings (training_id, certificate_name, duration_in_months) VALUES
	(1, 'Certified Manager', 12),
	(2, 'Certified Analyst', 12),
	(3, 'Certified Developer', 12),
	(4, 'Certified Designer', 12),
	(5, 'Certified Tester', 12),
	(6, 'Certified Support', 12),
	(7, 'Certified Admin', 12),
	(8, 'Certified HR', 12),
	(9, 'Certified Sales', 12),
	(10, 'Certified Marketing', 12);
	INSERT INTO trainings (training_id, certificate_name, duration_in_months) VALUES
	(11, 'Certified Manager', 12)
	
	
	
	INSERT INTO companies (company_id, company_name, address) VALUES
	(1, 'PT. Sejahtera', 'Jl. Merdeka No. 1, Jakarta'),
	(2, 'CV. Maju Jaya', 'Jl. Sudirman No. 2, Bandung'),
	(3, 'PT. Aman Sentosa', 'Jl. Thamrin No. 3, Surabaya'),
	(4, 'PT. Cahaya', 'Jl. Gatot Subroto No. 4, Medan'),
	(5, 'CV. Abadi', 'Jl. Kuningan No. 5, Semarang'),
	(6, 'PT. Langgeng', 'Jl. Gajah Mada No. 6, Yogyakarta'),
	(7, 'CV. Sukses', 'Jl. Diponegoro No. 7, Malang'),
	(8, 'PT. Makmur', 'Jl. Panglima Polim No. 8, Solo'),
	(9, 'CV. Berkah', 'Jl. Ahmad Yani No. 9, Palembang'),
	(10, 'PT. Harmoni', 'Jl. Pemuda No. 10, Denpasar');
	
	INSERT INTO employees (employee_id, NAME, POSITION, salary, date_hired, project_id) VALUES
	(1, 'Budi Santoso', 'Manager', 10000000, '2022-01-10', 1),
	(2, 'Siti Aminah', 'Analyst', 8000000, '2021-05-15', 1),
	(3, 'Agus Rahmat', 'Developer', 7000000, '2020-07-20', 2),
	(4, 'Dewi Kusuma', 'Designer', 6500000, '2023-01-25', 3),
	(5, 'Rudi Hartono', 'Tester', 6000000, '2019-11-30', 2),
	(6, 'Indah Sari', 'Support', 5500000, '2018-08-10', 3),
	(7, 'Asep Hidayat', 'Admin', 5000000, '2017-03-18', 1),
	(8, 'Lina Marlina', 'HR', 9500000, '2021-09-25', 2),
	(9, 'Udin Wahyudi', 'Sales', 7000000, '2022-04-12', 3),
	(10, 'Ratna Wijaya', 'Marketing', 7200000, '2020-12-05', 1);
	
	
	DELETE FROM  certificates 
	INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date) VALUES
	(1, 1, 'Certified Manager', '2022-02-01', '2023-02-01'),
	(2, 2, 'Certified Analyst', '2021-06-15', '2022-06-15'),
	(3, 3, 'Certified Developer', '2020-08-01', '2021-08-01'),
	(4, 4, 'Certified Designer', '2023-02-01', '2024-02-01'),
	(5, 5, 'Certified Tester', '2019-12-01', '2020-12-01'),
	(6, 6, 'Certified Support', '2018-09-01', '2019-09-01'),
	(7, 7, 'Certified Admin', '2017-04-01', '2018-04-01'),
	(8, 8, 'Certified HR', '2021-10-01', '2022-10-01'),
	(9, 9, 'Certified Sales', '2022-05-01', '2023-05-01'),
	(10, 10, 'Certified Marketing', '2021-12-05', '2022-12-05')
	INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date) VALUES
	(11, 1, 'Certified Manager', '2022-02-01', '2023-02-01');
	SELECT * FROM certificates
	
	INSERT INTO notifications (notification_id, employee_id, message, DATE) VALUES
	(1, 1, 'Performance review meeting scheduled', '2023-01-15'),
	(2, 2, 'Training session on new software', '2023-02-10'),
	(3, 3, 'Company annual meeting', '2023-03-05'),
	(4, 4, 'Health and safety training', '2023-04-20'),
	(5, 5, 'Project deadline approaching', '2023-05-25'),
	(6, 6, 'New company policies update', '2023-06-30'),
	(7, 7, 'Performance appraisal reminder', '2023-07-15'),
	(8, 8, 'Team building event next week', '2023-08-22'),
	(9, 9, 'Client feedback required', '2023-09-10'),
	(10, 10, 'Quarterly sales report submission', '2023-10-05');
--  Step 5 : Buat Stored Procedure sesuai yang diminta pada soal
	-- soal 1
	DELIMITER //
	CREATE OR REPLACE PROCEDURE soal1()
	BEGIN
		DECLARE emp_id INT;
		DECLARE emp_salary FLOAT;
		DECLARE hire_date DATE;
		DECLARE curr_date DATE;
		DECLARE bonus_year INT;
		
		SET curr_date = CURDATE();
		SET bonus_year = 1 ;-- bisa 12 tapi nanti diganti month ini pake tahun jadi pake 1
		
		SELECT MIN(employee_id) INTO emp_id FROM employees; 
		WHILE emp_id IS NOT NULL DO
		-- Ambil informasi karyawan dan simpan ke variabel emp_salary dan hire_date
		SELECT salary, date_hired INTO emp_salary, hire_date FROM employees WHERE employee_id = emp_id;
		
		-- Periksa apakah karyawan telah bekerja lebih dari satu tahun
		IF TIMESTAMPDIFF(YEAR, hire_date, curr_date) >= bonus_year THEN
		    -- Update gaji dengan tambahan bonus 10%
		    UPDATE employees SET salary = salary + (salary*0.10) WHERE employee_id = emp_id;
		END IF;
		
		-- Ambil ID karyawan berikutnya
		SELECT MIN(employee_id) INTO emp_id FROM employees WHERE employee_id > emp_id;
	    END WHILE;
	END//
	DELIMITER;
	
	CALL soal1()
	
	SELECT * FROM employees
	
	-- soal 2
	SELECT * FROM projects
	DELIMITER //

	CREATE PROCEDURE soal2()
	BEGIN
	    DECLARE id_proj INT;
	    DECLARE waktu_mulai DATE;
	    DECLARE waktu_selesai DATE;

	    SELECT MIN(project_id) INTO id_proj FROM projects;
	    
	    WHILE id_proj IS NOT NULL DO
		SELECT start_date, end_date INTO waktu_mulai, waktu_selesai FROM projects WHERE project_id = id_proj;
		
		IF DATEDIFF(waktu_selesai,waktu_mulai) < 31 THEN 
		    UPDATE projects SET end_date = DATE_ADD(waktu_selesai, INTERVAL 3 MONTH) WHERE project_id = id_proj;
		END IF;
		
		SELECT MIN(project_id) INTO id_proj FROM projects WHERE project_id > id_proj;
	    END WHILE;
	END //

	DELIMITER ;
	
	CALL soal2()
	
	SELECT * FROM projects

	
	-- soal 3
	-- drop procedure soal3
	SELECT * FROM certificates
	DELIMITER //

	CREATE OR REPLACE PROCEDURE soal3()
	BEGIN
	    DECLARE sertif_id INT;
	    DECLARE waktu_terbit DATE;
	    DECLARE waktu_kadaluarsa DATE;
	    DECLARE waktu_saatini DATE;

	    SET waktu_saatini = CURDATE();

	    -- Proses update sertifikat yang kadaluarsa
	    SELECT MIN(certificate_id) INTO sertif_id FROM certificates;

	    WHILE sertif_id IS NOT NULL DO
		SELECT issue_date, expiry_date INTO waktu_terbit, waktu_kadaluarsa 
		FROM certificates 
		WHERE certificate_id = sertif_id;

		IF waktu_kadaluarsa < waktu_saatini THEN
		
		    UPDATE certificates 
		    SET issue_date = CURDATE(), 
			expiry_date = DATE_ADD(CURDATE(), INTERVAL 12 MONTH) 
		    WHERE certificate_id = sertif_id;
		END IF;
		IF waktu_saatini > waktu_kadaluarsa THEN 
		INSERT INTO certificates (employee_id, certificate_id, certificate_name,issue_date, expiry_date)
		VALUES employee_id, certificate_id,'pelatihan Office' ,CURDATE(), DATE_ADD(CURDATE(), INTERVAL 12 MONTH);
		END ELSE;
		SELECT MIN(certificate_id) INTO sertif_id FROM certificates WHERE certificate_id >sertif_id;

	    END WHILE;
	END //
	DELIMITER ;
	CALL soal3();
	SELECT * FROM certificates
	
	-- soal 4
	DELIMITER //

	CREATE OR REPLACE PROCEDURE soal4()
	BEGIN
	    DECLARE notification_id INT DEFAULT 11;
	    DECLARE emp_id INT DEFAULT 1;
	    DECLARE msg TEXT;
	    DECLARE curr_date DATE;
	    DECLARE 
	    
	    SET curr_date = CURDATE();
	    SET msg = 'Ada Pelatihan Baru tolong dikerjakan';

	    WHILE notification_id <= 20 DO
		INSERT INTO notifications (notification_id, employee_id, message, DATE) 
		VALUES (notification_id, emp_id, msg, curr_date);
		
		SET notification_id = notification_id + 1;
		SET emp_id = emp_id + 1;
	    END WHILE;
	END //

	DELIMITER ;
	
	CALL soal4()
	
	-- revisi soal 4
	DELIMITER //
	
	CREATE OR REPLACE PROCEDURE soal4R()
	BEGIN 
	DECLARE notif_id INT ;
	DECLARE emp_id INT ;
	DECLARE msg TEXT;
	DECLARE tanggal DATE;
	
	SET msg = 'pelatihan baru tersedia. Silahkan kerjakan';
	SET tanggal = CURDATE();
	SELECT MIN(employee_id) INTO emp_id FROM employees;
	WHILE emp_id IS NOT NULL DO
		INSERT INTO notifications (notification_id, employee_id, message, DATE) 
		VALUES (notif_id, emp_id, msg, tanggal);
		SET notif_id = notif_id + 1;
		SELECT MIN(employee_id) INTO emp_id FROM employees WHERE employee_id>emp_id;

	 END WHILE;

	END//
	DELIMITER;
	
	CALL soal4R()
	DELETE FROM notifications WHERE notification_id = 21
	
	
	
	SELECT * FROM notifications
	
	
	
	DELIMITER //

	CREATE OR REPLACE PROCEDURE soal3R()
	BEGIN
	    DECLARE sertif_id INT;
	    DECLARE waktu_terbit DATE;
	    DECLARE waktu_kadaluarsa DATE;
	    DECLARE waktu_saatini DATE;
	    DECLARE certificate_name VARCHAR(100);
	    DECLARE emp_id INT;

	    SET certificate_name = 'Pelatihan Word';
	    SET waktu_saatini = CURDATE();

	    -- Proses update sertifikat yang kadaluarsa
	    SELECT MIN(certificate_id) INTO sertif_id FROM certificates;

	    WHILE sertif_id IS NOT NULL DO
		SELECT issue_date, expiry_date, employee_id INTO waktu_terbit, waktu_kadaluarsa, emp_id
		FROM certificates 
		WHERE certificate_id = sertif_id;

		IF waktu_kadaluarsa < waktu_saatini THEN
		    UPDATE certificates 
		    SET issue_date = CURDATE(), 
			expiry_date = DATE_ADD(CURDATE(), INTERVAL 12 MONTH)
		    WHERE certificate_id = sertif_id;

		    
		END IF;
		IF waktu_saatini < waktu_kadaluarsa THEN
		    INSERT INTO certificates (employee_id, certificate_name, issue_date, expiry_date)
		    VALUES (emp_id, certificate_name, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 12 MONTH));
		    
		 END IF;
		

		SELECT MIN(certificate_id) INTO sertif_id FROM certificates WHERE certificate_id > sertif_id;
	    END WHILE;
	END //

	DELIMITER ;


CALL soal3R()
	SELECT * FROM certificates 
	
	
	
	
