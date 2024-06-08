CREATE DATABASE OutsourcingCompany;
USE OutsourcingCompany;
DROP DATABASE OutsourcingCompany;

CREATE TABLE projects(
	project_id INT NOT NULL PRIMARY KEY auto_increment,
    project_name VARCHAR(100),
    client_company VARCHAR(100),
	start_date DATE,
	end_date DATE
);
INSERT INTO projects VALUES 
(11, 'Pengembangan Aplikasi E-commerce', 'Toko Retail Online', '2024-01-15', '2024-06-30'),
(12, 'Desain Website Perusahaan', 'PT. Kreasi Digital', '2024-02-01', '2024-03-31'),
(13, 'Konsultasi Keamanan Siber', 'Bank Nasional', '2024-03-10', '2024-04-20'),
(14, 'Sistem Manajemen Inventaris', 'CV. Mitra Jaya', '2024-04-05', '2024-07-15'),
(15, 'Desain Grafis dan Branding', 'PT. Riset Pasar Indonesia', '2024-03-25', '2024-05-10'),
(16, 'Pembuatan Konten Media Sosial', 'Agensi Periklanan', '2024-04-22', '2024-06-30'),
(17, 'Pengembangan Perangkat Lunak Pendidikan', 'Sekolah Menengah Atas', '2024-05-01', '2024-08-31'),
(18, 'Strategi Pemasaran Digital', 'Restoran XYZ', '2024-05-10', '2024-07-30'),
(19, 'Analisis Data dan Pelaporan', 'Perusahaan Startup', '2024-04-18', '2024-05-25'),
(20, 'Pelatihan Customer Service', 'PT. Hospitality Indonesia', '2024-05-15', '2024-06-15');

CREATE TABLE employees(
	employee_id INT NOT NULL PRIMARY KEY auto_increment,
    employee_name VARCHAR(100),
    position VARCHAR(50),
    salary FLOAT,
    date_hired DATE,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects (project_id)
);
-- select * from employees;
INSERT INTO employees VALUES
(1, 'Budi Setiawan', 'Software Engineer', 5500000, '2024-02-01', 11),
(2, 'Ani Lestari', 'Web Developer', 4500000, '2024-03-15', 12),
(3, 'Cipto Raharja', 'Network Engineer', 6000000, '2024-04-01', 13),
(4, 'Dini Puspita', 'Data Analyst', 5500000, '2024-05-05', 14),
(5, 'Edi Susanto', 'Graphic Designer', 4000000, '2024-06-10', 15),
(6, 'Fani Anggraini', 'Digital Marketing Specialist', 5000000, '2022-07-15', 16),
(7, 'Gito Widyawan', 'Software Tester', 4200000, '2024-08-20', 17),
(8, 'Hani Cahyanti', 'Project Manager', 7000000, '2024-09-01', 18),
(9, 'Ika Sari', 'Human Resources Specialist', 5300000, '2024-10-05', 19),
(10, 'Joko Widodo', 'Customer Service Representative', 3800000, '2024-11-10', 20);

CREATE TABLE certificates(
	certificate_id INT NOT NULL PRIMARY KEY auto_increment,
	employee_id INT, 
	certificate_name VARCHAR(100),
	issue_date DATE,
	expiry_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);
INSERT INTO certificates VALUES
(1, 1, 'Sertifikasi Microsoft Certified Solutions Associate (MCSA)', '2023-12-15', '2026-12-15'),
(2, 2, 'Sertifikat Profesi Nasional Web Developer', '2024-01-20', '2027-01-20'),
(3, 3, 'Cisco Certified Network Associate (CCNA)', '2024-02-25', '2028-02-25'),
(4, 4, 'Certified Analytics Professional (CAP)', '2024-03-10', '2029-03-10'),
(5, 5, 'Adobe Certified Associate (ACA) in Graphic Design', '2024-04-15', '2030-04-15'),
(6, 6, 'Google Digital Garage Certification', '2024-05-20', '2031-05-20'),
(7, 7, 'ISTQB Certified Tester Foundation Level (CTFL)', '2024-06-25', '2032-06-25'),
(8, 8, 'Project Management Professional (PMP)', '2024-07-10', '2033-07-10'),
(9, 9, 'Society for Human Resource Management (SHRM) Certified Professional (SHRM-CP)', '2024-08-15', '2034-08-15'),
(10, 10, 'Microsoft Office Specialist (MOS)', '2024-09-20', '2035-09-20');

CREATE TABLE trainings(
	training_id INT NOT NULL PRIMARY KEY auto_increment,
	certificate_name VARCHAR(100),
	duration_in_months INT
);
INSERT INTO trainings VALUES 
(1, 'Keamanan Siber', 2),
(2, 'Analisis Data', 3),
(3, 'Pemasaran Digital', 1),
(4, 'Desain Grafis', 2),
(5, 'Customer Service', 1),
(6, 'Pengembangan Perangkat Lunak', 4),
(7, 'Microsoft Office', 1),
(8, 'Akuntansi', 3),
(9, 'Sumber Daya Manusia', 2),
(10, 'Bahasa Inggris', 6);

CREATE TABLE notification(
	notification_id INT NOT NULL PRIMARY KEY auto_increment,
	employee_id INT,
	message TEXT,
	notif_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);
-- drop table notification;
INSERT INTO notification VALUES
(1, 1, 'Pengingat: Deadline submit laporan proyek "Pengembangan Aplikasi E-commerce" tinggal 1 minggu lagi.', '2024-05-20'),
(2, 2, 'Anda ditugaskan untuk mengikuti pelatihan "Desain Grafis" pada tanggal 2024-06-05.', '2024-05-21'),
(3, 3, 'Permintaan cuti Anda untuk tanggal 2024-06-10 - 2024-06-12 telah disetujui.', '2024-05-22'),
(4, 4, 'Anda memiliki presentasi data analisis untuk proyek "Analisis Data dan Pelaporan" pada tanggal 2024-05-25.', '2024-05-23'),
(5, 5, 'Desain logo baru untuk klien "Agensi Periklanan" telah disetujui. Silahkan lanjutkan dengan proses pembuatan materi iklan.', '2024-05-24'),
(6, 6, 'Anda mendapatkan bonus kinerja untuk bulan April 2024.', '2024-05-25'),
(7, 7, 'Perbaikan bug pada perangkat lunak edukasi telah selesai. Silahkan lakukan pengujian kembali.', '2024-05-26'),
(8, 8, 'Meeting dengan tim marketing untuk membahas strategi pemasaran digital untuk Restoran XYZ akan diadakan pada tanggal 2024-05-28.', '2024-05-27'),
(9, 9, 'Proses rekrutmen untuk posisi HR Assistant telah dibuka. Silahkan sebarkan informasi ini kepada tim Anda.', '2024-05-28'),
(10, 10, 'Penilaian kinerja karyawan untuk periode Q1 2024 telah dibuka. Silahkan isi penilaian Anda sebelum tanggal 2024-06-01.', '2024-05-29');

CREATE TABLE companies(
	company_id INT NOT NULL PRIMARY KEY auto_increment,
	company_name VARCHAR(100),
	address TEXT
);
INSERT INTO companies VALUES
(1, 'Toko Retail Online', 'Jalan Raya Sudirman No. 56, Jakarta'),
(2, 'PT. Kreasi Digital', 'Gedung Graha Mas, Lantai 10, Jalan MH Thamrin Kav. 3, Jakarta'),
(3, 'Bank Nasional', 'Menara Bank Nasional, Jalan Jenderal Sudirman Kav. 52, Jakarta'),
(4, 'CV. Mitra Jaya', 'Komplek Pergudangan Industri Cakung, Blok C No. 12, Jakarta Timur'),
(5, 'PT. Riset Pasar Indonesia', 'Graha Niaga Lantai 8, Jalan Rasuna Said Kav. X-3, Kuningan, Jakarta Selatan'),
(6, 'Agensi Periklanan', 'Ruko Golden Square Blok B No. 15, Jalan Gading Elok, Kelapa Gading, Jakarta Utara'),
(7, 'Sekolah Menengah Atas', 'Jalan Merdeka No. 17, Bandung'),
(8, 'Restoran XYZ', 'Jalan Sukajadi No. 23, Bandung'),
(9, 'Perusahaan Startup', 'Gedung TechHub Sudirman, Lantai 5, Jalan Sudirman Kav. 51, Jakarta'),
(10, 'PT. Hospitality Indonesia', 'Jalan Gatot Subroto No. 83, Jakarta');

-- 1. Buatlah stored procedure yang memeriksa setiap karyawan dalam tabel employees. Jika karyawan 
-- sudah bekerja lebih dari satu tahun, tambahkan bonus sebesar 10% dari gaji mereka.
DELIMITER //
CREATE PROCEDURE bonus_satutahun()
BEGIN
    UPDATE employees
    SET salary = CASE
        WHEN date_hired < DATE_SUB(NOW(), INTERVAL 1 YEAR) THEN salary + (salary * 0.10)
        ELSE salary
    END;
    SELECT * FROM employees;
END //
DELIMITER ;
-- DROP PROCEDURE bonus_satutahun;
CALL bonus_satutahun();


-- 2. Buatlah stored procedure yang memeriksa setiap proyek dalam tabel projects. Jika proyek akan berakhir 
-- dalam waktu kurang dari satu bulan, perpanjang proyek selama tiga bulan.
DELIMITER //
CREATE PROCEDURE perpanjang_proyek()
BEGIN
    DECLARE proyekpanjang DATE;
    SET proyekpanjang = CURDATE();
    UPDATE projects
    SET end_date = DATE_ADD(end_date, INTERVAL 3 MONTH)
    WHERE DATEDIFF(end_date, proyekpanjang) < 30;
    SELECT 
        project_id AS proyek_id, 
        project_name AS nama_proyek, 
        end_date AS tanggal_berakhir_proyek
    FROM projects;
END //

DELIMITER ;
CALL perpanjang_proyek;
-- DROP PROCEDURE perpanjang_proyek;


-- 3. Buatlah stored procedure yang memeriksa dan memperbarui data pelatihan setiap karyawan. Jika ada pelatihan baru yang tersedia, 
-- tambahkan pelatihan tersebut ke dalam tabel certificates.
-- DELIMITER //
-- CREATE PROCEDURE updatesertif(
-- IN idemplo INT)
-- BEGIN
--     DECLARE byksertif INT;
--     DECLARE tanggalnow DATE;
--     DECLARE new_cert_id INT;

--     SELECT COUNT(*) INTO byksertif FROM certificates WHERE employee_id = idemplo;
--     SET tanggalnow = CURDATE();

--     IF byksertif > 0 THEN
--         UPDATE certificates 
--         SET expiry_date = ADDDATE(expiry_date, INTERVAL 1 YEAR)
--         WHERE employee_id = idemplo AND expiry_date < tanggalnow;
--         IF ROW_COUNT() > 0 THEN
--             SELECT CONCAT('Sertif untuk karyawan ', idemplo, ' sudah diupdate.') AS message;
--         ELSE
--             SELECT CONCAT('Tidak ada sertifikat karyawan ', idemplo, ' perlu diperbarui.') AS message;
--         END IF;
--     ELSE
--         SELECT CONCAT('karyawan ', idemplo, ' tidak memiliki sertif.') AS message;
--     END IF;
--     
--     SELECT IFNULL(MAX(certificate_id), 0) + 1 INTO new_cert_id FROM certificates;
--     INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date) VALUES
--         (new_cert_id, idemplo, 'Pelatihan Data Science', '2024-05-01', '2026-05-18');
--     SELECT * FROM certificates;
-- END //
-- DELIMITER ;
-- CALL updatesertif(111);
-- DROP PROCEDURE updatesertif;

-- Buatlah stored procedure yang memeriksa dan memperbarui data pelatihan setiap karyawan. 
-- Jika ada pelatihan baru yang tersedia, tambahkan pelatihan tersebut ke dalam tabel certificates.
-- NOMOR 3
DELIMITER //
CREATE PROCEDURE updatesertif(
IN input_idemployee INT)
BEGIN
    DECLARE tgl DATE;
    DECLARE new_cert_id INT;
    DECLARE new_training_id INT;
    
    SET tgl = CURDATE();

    -- Perbarui tanggal kedaluwarsa sertifikat jika sudah mendekati kedaluwarsa
    UPDATE certificates
    SET expiry_date = ADDDATE(expiry_date, INTERVAL 1 YEAR)
    WHERE employee_id = input_idemployee AND expiry_date < tgl;
    
    -- Cari ID sertifikat baru
    SELECT IFNULL(MAX(certificate_id), 0) + 1 INTO new_cert_id FROM certificates;
    
    -- Tambahkan sertifikat baru
    INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date) 
    VALUES (new_cert_id, input_idemployee, 'Pelatihan Baru', CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 YEAR));
    
    -- Cari ID pelatihan baru
    SELECT IFNULL(MAX(training_id), 0) + 1 INTO new_training_id FROM trainings;
    
    -- Tambahkan pelatihan baru ke dalam tabel trainings
    INSERT INTO trainings (training_id, certificate_name, duration_in_months) 
    VALUES (new_training_id, 'Pelatihan Baru', 3);
    
    -- Tampilkan sertifikat dan pelatihan yang ada
    SELECT * FROM certificates;
    SELECT * FROM trainings;
END //
DELIMITER ;

-- Panggil stored procedure
CALL updatesertif(1);


DROP PROCEDURE updatesertif;

-- Buatlah stored procedure yang mengirimkan notifikasi kepada semua karyawan mengenai pelatihan baru yang akan datang.
-- NOMOR 4
DELIMITER //
CREATE PROCEDURE send_notification()
BEGIN
    DECLARE max_id INT;
    DECLARE min_id INT;
    DECLARE current_id INT;

    SELECT MIN(employee_id), MAX(employee_id) INTO min_id, max_id FROM employees;
    SET current_id = min_id;

    WHILE current_id <= max_id DO
        -- Memeriksa apakah current_id ada di tabel employees
        IF EXISTS (SELECT * FROM employees WHERE employee_id = current_id) THEN
            INSERT INTO notification (employee_id, message, notif_date)
            VALUES (current_id, 'Pelatihan baru akan segera dimulai. Silakan periksa jadwal Anda untuk detail lebih lanjut.', CURDATE());
        END IF;
        SET current_id = current_id + 1;
    END WHILE;
    SELECT * FROM notification;
END//
DELIMITER ;
DROP PROCEDURE send_notification;
CALL send_notification();


-- 4. Buatlah stored procedure yang mengirimkan notifikasi
--  kepada semua karyawan mengenai pelatihan baru yang akan datang.
-- DELIMITER //
-- CREATE PROCEDURE kirimnotif()
-- BEGIN
--     DECLARE max_id INT;
--     DECLARE min_id INT;
--     DECLARE current_id INT;

--     SELECT MIN(employee_id), MAX(employee_id) INTO min_id, max_id FROM employees;
--     SET current_id = min_id;

--     WHILE current_id <= max_id DO
--         IF EXISTS (SELECT * FROM employees WHERE employee_id = current_id) THEN
--             INSERT INTO notification (employee_id, message, notif_date)
--             VALUES (current_id, 'Pelatihan baru akan segera dimulai. Silakan periksa jadwal Anda untuk detail lebih lanjut.', CURDATE());
--         END IF;
--         SET current_id = current_id + 1;
--     END WHILE;
--     SELECT * FROM notification;
-- END//

-- DELIMITER ;
-- -- DROP PROCEDURE kirimnotif;
-- CALL kirimnotif();
-- SELECT * FROM notification;