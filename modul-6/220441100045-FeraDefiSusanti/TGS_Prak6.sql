CREATE DATABASE OutsourcingCompany;
USE OutsourcingCompany;

-- Create tables
CREATE TABLE companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    address TEXT
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    client_company VARCHAR(100),
    start_date DATE,
    end_date DATE
);

CREATE TABLE trainings (
    training_id INT PRIMARY KEY,
    certificate_name VARCHAR(100),
    duration_in_months INT
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50),
    salary FLOAT,
    date_hired DATE,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

CREATE TABLE notifications (
	notification_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    message TEXT,
    date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE certificates (
    certificate_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    certificate_name VARCHAR(100),
    issue_date DATE,
    expiry_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Insert data into companies
INSERT INTO companies (company_id, company_name, address) VALUES
(1, 'PT ABC Indonesia', 'Jl. Sudirman No. 45, Jakarta'),
(2, 'PT XYZ Technology', 'Jl. Thamrin No. 21, Jakarta'),
(3, 'PT Karya Mandiri', 'Jl. Gatot Subroto No. 55, Bandung'),
(4, 'PT Nusantara Jaya', 'Jl. Merdeka No. 67, Surabaya'),
(5, 'PT Bina Sejahtera', 'Jl. Diponegoro No. 88, Yogyakarta');

-- Insert data into projects
INSERT INTO projects (project_id, project_name, client_company, start_date, end_date) VALUES
(1, 'Sistem Manajemen Inventori', 'PT Sejahtera Sentosa', '2024-02-15', '2024-08-30'),
(2, 'Aplikasi Pembayaran Online', 'CV Lancar Jaya', '2024-03-10', '2024-10-20'),
(3, 'Pengembangan Situs Web', 'PT Cipta Karya Bersama', '2024-04-05', '2024-11-15'),
(4, 'Implementasi Sistem ERP', 'CV Mandiri Sukses', '2024-05-20', '2024-12-31'),
(5, 'Pembuatan Aplikasi Mobile', 'PT Teknologi Baru', '2024-06-18', '2025-01-25'),
(6, 'Aplikasi Hotel', 'PT Hotel Purnama', '2024-02-15', '2024-05-30');

-- Insert data into trainings
INSERT INTO trainings (training_id, certificate_name, duration_in_months) VALUES
(1, 'Sertifikasi Oracle Database', 6),
(2, 'Pelatihan Manajemen Proyek', 4),
(3, 'Sertifikasi Java Programming', 5),
(4, 'Pelatihan Keamanan Informasi', 3),
(5, 'Sertifikasi Jaringan Komputer', 6);
UPDATE trainings SET certificate_name = 'AWS Certified Solutions Architect', duration_in_months = 3 
     WHERE training_id = 2;

-- Insert data into employees
INSERT INTO employees (employee_id, name, position, salary, date_hired, project_id) VALUES
(1, 'Raka Putra', 'Developer', 7000000, '2022-09-15', 1),
(2, 'Bima Aji', 'Project Manager', 8000000, '2022-05-20', 2),
(3, 'Citra Dewi', 'Data Analyst', 8000000, '2023-03-10', 3),
(4, 'Sinta Lestari', 'Security Specialist', 9000000, '2024-04-25', 4),
(5, 'Eka Wahyu', 'Cloud Engineer', 8500000, '2023-05-30', 5);

-- Insert data into notifications
INSERT INTO notifications (notification_id, employee_id, message, date) VALUES
(1, 1, 'Pengingat: Rapat Proyek Hari Ini Pukul 10.00 WIB', '2024-05-20'),
(2, 2, 'Perubahan Jadwal Meeting Besok', '2024-05-21'),
(3, 3, 'Pemberitahuan: Pelatihan Baru Akan Dimulai', '2024-05-22'),
(4, 4, 'Info: Deadline Uji Coba Sistem', '2024-05-23'),
(5, 5, 'Update: Progress Pengembangan Aplikasi Mobile', '2024-05-24');

-- Data untuk tabel certificates
INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date) VALUES
(1, 1, 'Sertifikasi Oracle Database', '2023-07-15', '2025-07-15'),
(2, 2, 'Pelatihan Manajemen Proyek', '2023-08-20', '2025-08-20'),
(3, 3, 'Sertifikasi Java Programming', '2023-09-25', '2025-09-25'),
(4, 4, 'Pelatihan Keamanan Informasi', '2023-10-30', '2025-10-30'),
(5, 5, 'Sertifikasi Jaringan Komputer', '2023-11-05', '2025-11-05');


-- SOAL 1
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

-- SOAL 2
DELIMITER //
CREATE PROCEDURE perpanjang_proyek()
BEGIN
  DECLARE done BOOLEAN DEFAULT FALSE;
  DECLARE project_id_var INT;
  DECLARE new_end_date_var DATE;
  DECLARE project_cursor CURSOR FOR SELECT project_id, end_date FROM projects;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  OPEN project_cursor;
  project_loop: LOOP
    FETCH project_cursor INTO project_id_var, new_end_date_var;  
    IF done THEN
      LEAVE project_loop;
    END IF;    
    IF DATEDIFF(new_end_date_var, CURDATE()) < 30 THEN
      UPDATE projects
      SET end_date = DATE_ADD(new_end_date_var, INTERVAL 3 MONTH)
      WHERE project_id = project_id_var;
    END IF;
  END LOOP;
  CLOSE project_cursor;
END //
DELIMITER ;
call perpanjang_proyek();
SELECT * FROM projects;

-- soal 3
-- relasi antar tabel certificaate dan training
ALTER TABLE certificates ADD training_id INT default null;
ALTER TABLE certificates ADD CONSTRAINT fk_training_id FOREIGN KEY (training_id) REFERENCES trainings(training_id);
DELIMITER //
CREATE PROCEDURE update_pelatihan()
BEGIN
    DECLARE done BOOLEAN DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE train_id INT;
    DECLARE cert_name VARCHAR(100);
    DECLARE train_dur INT;
    DECLARE cur CURSOR FOR SELECT employee_id FROM employees;
    DECLARE cur2 CURSOR FOR 
        SELECT t.training_id, t.certificate_name, t.duration_in_months 
        FROM trainings t
        WHERE NOT EXISTS (
            SELECT 1 
            FROM certificates c 
            WHERE c.certificate_name = t.certificate_name
        );
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

-- soal 4
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
            INSERT INTO notifications (employee_id, message, date)
            SELECT employee_id, CONCAT('Pelatihan yang akan datang: ', pelatihan_nama, '. Durasi: ', pelatihan_duration, ' Bulan'), CURDATE()
            FROM employees;
        END IF;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
CALL notifikasi_pelatihan();
SELECT * FROM notifications;



