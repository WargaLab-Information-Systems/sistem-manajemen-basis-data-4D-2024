CREATE DATABASE OutsourcingCompany;
USE OutsourcingCompany;

DROP DATABASE OutsourcingCompany;

-- Membuat tabel employees
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50),
    salary FLOAT,
    date_hired DATE,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- Membuat tabel projects
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    client_company VARCHAR(100),
    start_date DATE,
    end_date DATE
);

-- Membuat tabel certificates
CREATE TABLE certificates (
    certificate_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    certificate_name VARCHAR(100),
    issue_date DATE,
    expiry_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
drop table certificates;

-- Membuat tabel trainings
CREATE TABLE trainings (
    training_id INT PRIMARY KEY,
    certificate_name VARCHAR(100),
    duration_in_months INT
);

-- Membuat tabel notifications
CREATE TABLE notifications (
    notification_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    message TEXT,
    date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
drop table notifications;

-- Membuat tabel companies
CREATE TABLE companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    address TEXT
);

-- Mengisi tabel employees dengan data contoh
INSERT INTO employees (employee_id, name, position, salary, date_hired, project_id) VALUES
(101, 'Alifia', 'Software Engineer', 60000, '2024-02-15', 201),
(102, 'Andini', 'Project Manager', 80000, '2021-03-10', 202),
(103, 'Farra', 'QA Engineer', 50000, '2020-05-20', 203),
(104, 'Fiana', 'Business Analyst', 70000, '2023-02-01', 204),
(105, 'Shafira', 'DevOps Engineer', 75000, '2019-11-25', 205);


INSERT INTO projects (project_id, project_name, client_company, start_date, end_date) VALUES
(201, 'Project Alpha', 'Company A', '2024-01-01', '2024-06-01'),
(202, 'Project Beta', 'Company B', '2022-07-01', '2024-05-29'),
(203, 'Project Gamma', 'Company C', '2023-05-01', '2024-10-10'),
(204, 'Project Delta', 'Company D', '2023-09-01', '2024-09-01'),
(205, 'Project Epsilon', 'Company E', '2023-01-01', '2024-11-01');

-- Mengisi tabel certificates dengan data contoh
INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date) VALUES
(301, 101, 'AWS Certified Solutions Architect', '2022-02-01', '2025-02-01'),
(302, 102, 'PMP Certification', '2021-04-15', '2024-04-15'),
(303, 103, 'ISTQB Certified Tester', '2020-06-01', '2023-06-01'),
(304, 104, 'Certified Business Analyst', '2023-03-01', '2026-03-01'),
(305, 105, 'Certified Kubernetes Administrator', '2020-12-01', '2023-12-01');

-- Mengisi tabel trainings dengan data contoh
INSERT INTO trainings (training_id, certificate_name, duration_in_months) VALUES
(401, 'Advanced Java Programming', 6),
(402, 'Agile Project Management', 4),
(403, 'Cloud Security', 3),
(404, 'Data Science Bootcamp', 12),
(405, 'Cybersecurity Fundamentals', 5);

-- Mengisi tabel notifications dengan data contoh
INSERT INTO notifications (notification_id, employee_id, message, date) VALUES
(501, 101, 'Annual performance review meeting', '2024-05-01'),
(502, 102, 'New company policies', '2024-04-15'),
(503, 103, 'Upcoming training session', '2024-03-20'),
(504, 104, 'Project milestone deadline', '2024-06-10'),
(505, 105, 'Security training update', '2024-04-05');

-- Mengisi tabel companies dengan data contoh
INSERT INTO companies (company_id, company_name, address) VALUES
(601, 'Company A', '123 Business St, City, Country'),
(602, 'Company B', '456 Industrial Rd, City, Country'),
(603, 'Company C', '789 Corporate Ave, City, Country'),
(604, 'Company D', '101 Innovation Dr, City, Country'),
(605, 'Company E', '202 Enterprise Blvd, City, Country');




-- no1
-- karyawan bekerja lebih dari 1th = bonus 10%
-- 1. Buatlah stored procedure yang memeriksa setiap karyawan dalam tabel employees. Jika karyawan 
-- sudah bekerja lebih dari satu tahun, tambahkan bonus sebesar 10% dari gaji mereka.
DELIMITER //
CREATE PROCEDURE hitungBonus()
BEGIN
    DECLARE done INT DEFAULT 0; -- Mendeklarasikan variabel untuk menyimpan data sementara
    DECLARE emp_id INT;
    DECLARE emp_gaji FLOAT;
    DECLARE emp_tgl_mulai DATE;
    DECLARE bonus FLOAT;
    DECLARE cur CURSOR FOR SELECT employee_id, salary, date_hired FROM employees; -- Membuka cursor untuk mengambil data karyawan dari tabel
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1; -- Menangani kondisi ketika tidak ada lagi data yang diambil dari cursor.

    OPEN cur; -- Membuka cursor
    read_loop: LOOP
        FETCH cur INTO emp_id, emp_gaji, emp_tgl_mulai; -- mengambil data karyawan dari cursor
        IF done THEN
            LEAVE read_loop; -- Keluar dari loop jika semua data telah diambil.
        END IF;
        IF TIMESTAMPDIFF(YEAR, emp_tgl_mulai, CURDATE()) >= 1 THEN -- Memeriksa apakah karyawan telah bekerja lebih dari satu tahun.
            SET bonus = emp_gaji * 0.10;       -- Menghitung bonus sebesar 10% dari gaji
            UPDATE employees SET salary = salary + bonus WHERE employee_id = emp_id;   -- Memperbarui gaji karyawan dengan menambahkan bonus.
        END IF;
    END LOOP;
    CLOSE cur; -- Menutup cursor setelah selesai.
END //
DELIMITER ;
CALL hitungBonus;
SELECT * FROM employees;



-- no2 
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
        FETCH cur INTO proj_id, proj_tgl_akhir; -- Mengambil data proyek dari cursor.
        IF done THEN
            LEAVE read_loop;
        END IF;
        IF DATEDIFF(proj_tgl_akhir, CURDATE()) < 30 THEN   -- Memeriksa apakah proyek akan berakhir dalam waktu kurang dari 30 hari.
            SET new_tgl_akhir = DATE_ADD(proj_tgl_akhir, INTERVAL 3 MONTH);  -- Menghitung tanggal akhir baru dengan menambahkan 3 bulan.
            UPDATE projects SET end_date = new_tgl_akhir WHERE project_id = proj_id;   -- Memperbarui tanggal akhir proyek di tabel projects
        END IF;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
CALL perpanjangProjek();
SELECT * FROM projects;



-- no3
-- stored procedure yang memeriksa dan memperbarui data pelatihan setiap karyawan. 
-- Jika ada pelatihan baru yang tersedia, 
-- tambahkan pelatihan tersebut ke dalam tabel certificates.
DELIMITER //
CREATE PROCEDURE UpdatePelatihan()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE emp_id INT;
    DECLARE emp_nama VARCHAR(100);
    DECLARE pelatihan_name VARCHAR(100);
    -- Membuka cursor untuk mengambil data karyawan dan pelatihan 
    -- yang belum dimiliki oleh karyawan dari tabel employees dan trainings.
    DECLARE cur CURSOR FOR SELECT e.employee_id, e.name, t.certificate_name 
		FROM employees e
		CROSS JOIN trainings t
		WHERE NOT EXISTS (SELECT * FROM certificates c WHERE c.employee_id = e.employee_id AND c.certificate_name = t.certificate_name);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1; -- Menangani kondisi ketika tidak ada lagi data yang diambil dari cursor.

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_id, emp_nama, pelatihan_name; -- Mengambil data karyawan dan pelatihan dari cursor.
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- Menambahkan pelatihan baru ke tabel certificates dengan issue_date saat ini 
        -- dan expiry_date berdasarkan durasi pelatihan dari tabel trainings.
        INSERT INTO certificates (employee_id, certificate_name, issue_date, expiry_date)
        VALUES (emp_id, pelatihan_name, CURDATE(), DATE_ADD(CURDATE(), INTERVAL (SELECT duration_in_months FROM trainings WHERE certificate_name = pelatihan_name) MONTH));
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
CALL UpdatePelatihan();
SELECT * FROM certificates; 




-- no 4
-- mengirimkan notifikasi kepada semua karyawan mengenai pelatihan baru yang akan datang.
DELIMITER //
CREATE PROCEDURE NotifyEmployeesNewTraining()
BEGIN
    DECLARE pelatihan_nama VARCHAR(100);
    DECLARE pelatihan_duration FLOAT;
    DECLARE done INT DEFAULT 0;
    DECLARE cur CURSOR FOR SELECT certificate_name, duration_in_months FROM trainings; -- Membuka cursor untuk mengambil data pelatihan dari tabel trainings.
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1; -- Menangani kondisi ketika tidak ada lagi data yang diambil dari cursor.

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO pelatihan_nama, pelatihan_duration;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Periksa apakah pelatihan akan datang (dalam durasinya)
        IF pelatihan_duration > 0 THEN      -- Memeriksa apakah pelatihan memiliki durasi lebih dari 0 bulan.
        
        -- Mengirim notifikasi kepada semua karyawan mengenai pelatihan baru 
        -- dan menambahkan notifikasi tersebut ke tabel notifications.
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




