CREATE DATABASE OutsourcingCompany;


CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    NAME VARCHAR(100),
    POSITION VARCHAR(50),
    salary FLOAT,
    date_hired DATE,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);


INSERT INTO employees (employee_id, NAME, POSITION, salary, date_hired, project_id) VALUES 
(2, 'Budi Santoso', 'Staff', 3500000, '2022-06-15', 1),
(3, 'Citra Dewi', 'Cleaning Service', 1500000, '2021-08-01', 1),
(4, 'Dian Pratama', 'Staff', 2500000, '2022-03-20', 1),
(5, 'Eko Wahyudi', 'Admin', 300000, '2020-12-12', 1),
(6, 'Fajar Riyadi', 'Teknisi', 2700000, '2023-02-10', 1),
(7, 'Gita Ramadhani', 'Office Boy', 1600000, '2021-07-07', 1),
(11, 'Kurniawan Sari', 'Manager', 3500000, '2020-11-21', 1);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    NAME VARCHAR(100),
    POSITION VARCHAR(50),
    salary FLOAT,
    date_hired DATE,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    client_company VARCHAR(100),
    start_date DATE,
    end_date DATE
);

INSERT INTO projects VALUES (2, 'Layanan Software', 'PT. Lapindo', '2024-02-30', '2024-03-02'),
			(3, 'Perbaikan Jaringan', 'PT. PAL', '2024-01-30', '2024-04-02'),
			(4, 'Kebersihan Taman', 'UTM', '2024-02-30', '2024-05-02');



DELETE FROM projects WHERE project_id=1;
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
ALTER TABLE trainings
ADD COLUMN employee_id INT;
ALTER TABLE trainings
ADD CONSTRAINT FOREIGN KEY (employee_id)REFERENCES employees (employee_id);

INSERT INTO trainings (training_id, certificate_name, duration_in_months) VALUES
(1, 'Project Management', 6),
(2, 'Advanced SQL', 3),
(3, 'Data Analysis', 4),
(4, 'Cybersecurity Basics', 5),
(5, 'Cloud Computing', 7);


CREATE TABLE notifications (
    notification_id INT PRIMARY KEY,
    employee_id INT,
    message TEXT,
    DATE DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    address TEXT
);


--soal1

DELIMITER //
CREATE PROCEDURE tambah_gaji ()
BEGIN
    SELECT NAME, POSITION, salary, date_hired,

CASE
WHEN date_hired <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) THEN 'lebih dari satu tahun'
ELSE 'kurang dari satu tahun'
END AS status_kerja,

CASE
WHEN date_hired <=DATE_SUB(CURDATE(), INTERVAL 1 YEAR) THEN salary * 0.10
ELSE 0
END AS bonus

FROM employees ; 
END //

CALL tambah_gaji();


--soal2

DELIMITER //
CREATE PROCEDURE perpanjang_proyek()
BEGIN
SELECT project_name, start_date, end_date,
CASE
	WHEN end_date <= DATE_ADD(CURDATE(), INTERVAL 1 MONTH)THEN 'butuh diperpanjang'
	ELSE 'belum berakhir'
END AS status_projek,

CASE 
        WHEN end_date <= DATE_ADD(CURDATE(), INTERVAL 1 MONTH) THEN DATE_ADD(end_date, INTERVAL 3 MONTH)
        ELSE end_date
  END AS new_end_date

FROM projects;
 
END //
DELIMITER ;

CALL perpanjang_proyek();

--soal3

--Soal4

DELIMITER //

CREATE PROCEDURE kirim_notifikasi_pelatihan_baru()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE cert_name VARCHAR(100);
    DECLARE msg TEXT;
    DECLARE CURDATE DATE;
    
    -- Cursor untuk mendapatkan semua karyawan
    DECLARE cur_employees CURSOR FOR 
        SELECT employee_id FROM employees;
    
    -- Cursor untuk mendapatkan semua pelatihan baru
    DECLARE cur_trainings CURSOR FOR 
        SELECT certificate_name FROM trainings;
    
    -- Handler untuk kondisi akhir data
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Buka cursor untuk pelatihan baru
    OPEN cur_trainings;
    
    trainings_loop: LOOP
        FETCH cur_trainings INTO cert_name;
        IF done THEN
            LEAVE trainings_loop;
        END IF;
        
        -- Buka cursor untuk karyawan
        OPEN cur_employees;
        
        employees_loop: LOOP
            FETCH cur_employees INTO emp_id;
            IF done THEN
                LEAVE employees_loop;
            END IF;
            
            -- Buat pesan notifikasi
            SET msg = CONCAT('Pelatihan baru tersedia: ', cert_name, '. Segera daftar untuk meningkatkan keterampilan Anda.');
            SET CURDATE = CURDATE();
            
            -- Masukkan notifikasi ke tabel notifications
            INSERT INTO notifications (employee_id, message, DATE)
            VALUES (emp_id, msg, CURDATE);
        END LOOP;
        
        -- Tutup cursor karyawan setelah digunakan
        CLOSE cur_employees;
    END LOOP;
    
    -- Tutup cursor pelatihan setelah digunakan
    CLOSE cur_trainings;
END //

DELIMITER ;

CALL kirim_notifikasi_pelatihan_baru();



