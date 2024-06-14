CREATE DATABASE OutsourcingCompany;
USE OutsourcingCompany;
DROP DATABASE OutsourcingCompany;

CREATE TABLE projects(
	project_id INT KEY AUTO_INCREMENT NOT NULL,
	project_name VARCHAR(100),
	client_company VARCHAR(100),
	start_date DATE,
	end_date DATE
);
DESC projects;

CREATE TABLE employees(
	employee_id INT KEY AUTO_INCREMENT NOT NULL,
	name VARCHAR(100),
	position VARCHAR(50),
	salary FLOAT,
	date_hired DATE,
	project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects (project_id)
);
DESC employees;

CREATE TABLE certificates(	
	certificate_id INT KEY AUTO_INCREMENT NOT NULL,
	employee_id INT,
	certificate_name VARCHAR(100),
	issue_date DATE,
	expiry_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);
DESC certificates;

CREATE TABLE trainings(
	training_id INT KEY AUTO_INCREMENT NOT NULL,
	certificate_name VARCHAR(100),
	duration_in_months INT
);
DESC trainings;

CREATE TABLE notifications(
	notification_id INT KEY AUTO_INCREMENT NOT NULL,
	employee_id INT,
	message TEXT,
	date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);
DESC notifications;

CREATE TABLE companies(
	company_id INT KEY AUTO_INCREMENT NOT NULL,
	company_name VARCHAR(100),
	address TEXT
);
DESC companies;

INSERT INTO projects (project_id, project_name, client_company, start_date, end_date) VALUES
    (11, 'Aplikasi Perpustakaan', 'PT XYZ', '2023-04-07', '2024-05-22'),
	(12, 'Aplikasi Mobile Banking', 'Bank XYZ', '2020-09-01', '2021-08-31'),
	(13, 'Website E-commerce', 'TokoOnline', '2022-01-15', '2023-01-14'),
	(14, 'Sistem Penggajian', 'PT Jaya', '2019-11-01', '2020-10-31'),
	(15, 'Aplikasi Reservasi Hotel', 'Hotel Bintang', '2023-03-01', '2024-02-29'),
	(16, 'Sistem Informasi Sekolah', 'Yayasan Cerdas', '2021-06-01', '2022-05-31'),
	(17, 'Aplikasi Transportasi', 'GoTransport', '2024-02-01', '2024-04-15'),
	(18, 'Sistem Keuangan', 'FinanceCorp', '2023-08-01', '2024-05-01'),
	(19, 'Aplikasi Kesehatan', 'HealthApp', '2022-11-01', '2023-10-31'),
	(20, 'Sistem Pengelolaan Proyek', 'ProManage', '2023-07-01', '2024-03-30');
SELECT * FROM projects;

DELETE FROM projects;

INSERT INTO employees (employee_id, name, position, salary, date_hired, project_id) VALUES
	(1, 'Budi Santoso', 'Manajer Proyek', 15000000, '2022-01-15', 11),
	(2, 'Ani Setiawati', 'Pengembang', 10000000, '2021-03-12', 12),
	(3, 'Citra Lestari', 'Analis Bisnis', 12000000, '2020-11-01', 13),
	(4, 'Dodi Rahman', 'Pengembang', 10000000, '2019-07-23', 14),
	(5, 'Eko Priyanto', 'Tester', 8000000, '2023-12-10', 15),
	(6, 'Fajar Nugroho', 'Desainer UI/UX', 9000000, '2023-09-19', 16),
	(7, 'Gina Melati', 'Manajer HRD', 13000000, '2018-09-25', 17),
	(8, 'Hadi Susanto', 'Pengembang', 10000000, '2020-02-17', 18),
	(9, 'Irma Dewi', 'Tester', 8000000, '2024-01-30', 19),
	(10, 'Joko Saputra', 'Pengembang', 10000000, '2024-04-15', 20);
SELECT * FROM employees;
DELETE FROM employees;

INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date) VALUES
	(21, 1, 'PMP', '2021-04-01', '2024-04-01'),
	(22, 2, 'Java Developer', '2020-09-01', '2023-09-01'),
	(23, 3, 'Business Analyst', '2019-11-01', '2022-11-01'),
	(24, 4, 'Java Developer', '2018-07-01', '2021-07-01'),
	(25, 5, 'ISTQB', '2023-01-01', '2026-01-01'),
	(26, 6, 'UI/UX Design', '2022-08-01', '2025-08-01'),
	(27, 7, 'HR Management', '2018-09-01', '2021-09-01'),
	(28, 8, 'Python Developer', '2020-02-01', '2023-02-01'),
	(29, 9, 'ISTQB', '2021-06-01', '2024-06-01'),
	(30, 10, 'Java Developer', '2022-04-01', '2025-04-01');
SELECT * FROM certificates;

INSERT INTO trainings (training_id, certificate_name, duration_in_months) VALUES
	(31, 'PMP', 6),
	(32, 'Java Developer', 4),
	(33, 'Business Analyst', 5),
	(34, 'ISTQB', 3),
	(35, 'UI/UX Design', 4),
	(36, 'HR Management', 6),
	(37, 'Python Developer', 4),
	(38, 'Network Security', 5),
	(39, 'Project Management', 6),
	(40, 'Data Science', 6);
SELECT * FROM trainings;

INSERT INTO notifications (notification_id, employee_id, message, date) VALUES
	(41, 1, 'Selamat, Anda telah dipromosikan!', '2023-04-01'),
	(42, 2, 'Sertifikasi Java Developer Anda akan segera berakhir.', '2023-08-01'),
	(43, 3, 'Rapat proyek dijadwalkan ulang ke minggu depan.', '2023-05-10'),
	(44, 4, 'Jangan lupa mengisi laporan mingguan.', '2023-03-15'),
	(45, 5, 'Penyegaran training ISTQB akan dimulai minggu depan.', '2023-02-01'),
	(46, 6, 'Desain UI/UX baru telah disetujui.', '2023-01-20'),
	(47, 7, 'HR Management training akan dimulai bulan depan.', '2023-06-01'),
	(48, 8, 'Proyek baru akan dimulai bulan depan.', '2023-05-01'),
	(49, 9, 'Sertifikasi ISTQB Anda akan segera berakhir.', '2023-05-30'),
	(50, 10, 'Jadwal pelatihan Java Developer telah diperbarui.', '2023-04-15');
SELECT * FROM notifications;
DELETE FROM notifications;

INSERT INTO companies (company_id, company_name, address) VALUES
	(1, 'PT ABC', 'Jl. Sudirman No. 10, Jakarta'),
	(2, 'Bank XYZ', 'Jl. Thamrin No. 5, Jakarta'),
	(3, 'TokoOnline', 'Jl. Mangga Dua No. 8, Jakarta'),
	(4, 'PT Jaya', 'Jl. Gatot Subroto No. 3, Jakarta'),
	(5, 'Hotel Bintang', 'Jl. Kuningan No. 2, Jakarta'),
	(6, 'Yayasan Cerdas', 'Jl. Merdeka No. 1, Jakarta'),
	(7, 'GoTransport', 'Jl. Prapatan No. 12, Jakarta'),
	(8, 'FinanceCorp', 'Jl. Casablanca No. 4, Jakarta'),
	(9, 'HealthApp', 'Jl. Rasuna Said No. 7, Jakarta'),
	(10, 'ProManage', 'Jl. KH. Wahid Hasyim No. 9, Jakarta');
SELECT * FROM companies;

-- NOMOR1-- 
DROP PROCEDURE AddBonus;
DELIMITER //
CREATE PROCEDURE AddBonus(
    IN emp_id INT, 
    OUT new_salary FLOAT,
    OUT emp_name VARCHAR(100),
    OUT emp_date_hired DATE
)
BEGIN
    DECLARE emp_salary FLOAT;
    DECLARE emp_bonus FLOAT;

    -- Mendapatkan data karyawan berdasarkan employee_id
    SELECT name, salary, date_hired INTO emp_name, emp_salary, emp_date_hired
    FROM employees
    WHERE employee_id = emp_id;

    -- Memeriksa apakah karyawan sudah bekerja lebih dari satu tahun
    IF TIMESTAMPDIFF(YEAR, emp_date_hired, CURDATE()) > 1 THEN
        SET emp_bonus = emp_salary * 0.10;
        SET new_salary = emp_salary + emp_bonus;
        
        -- Memperbarui gaji karyawan
        UPDATE employees
        SET salary = new_salary
        WHERE employee_id = emp_id;
    ELSE
        -- Jika tidak memenuhi syarat, kembalikan gaji asli tanpa bonus
        SET new_salary = emp_salary;
    END IF;
END //
DELIMITER ;
CALL AddBonus(8, @new_salary, @emp_name, @emp_date_hired);
SELECT @new_salary, @emp_name, @emp_date_hired;


-- NOMOR2--
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



-- NOMOR3-- 
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


-- NOMOR4--
DROP PROCEDURE NotifyEmployeesNewTraining;
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







  















 










	

