CREATE DATABASE OutsourcingCompany;
USE OutsourcingCompany;

CREATE TABLE company (
	company_id INT PRIMARY KEY,
	company_name VARCHAR(100),
	address TEXT
);

CREATE TABLE project (
	project_id INT PRIMARY KEY,
	project_name VARCHAR(100),
	client_company VARCHAR(100),
	start_date DATE,
	end_date DATE
);

CREATE TABLE training (
	training_id INT PRIMARY KEY,
	certificate_name VARCHAR(100),
	duration_in_months INT
);

CREATE TABLE employee (
	employee_id INT PRIMARY KEY,
	name VARCHAR(100),
	position VARCHAR(50),
	salary FLOAT,
	date_hired DATE,
	project_id INT,
	FOREIGN KEY (project_id) REFERENCES project(project_id)
);

CREATE TABLE certificate (
	certificate_id INT PRIMARY KEY,
	employee_id INT,
	certificate_name VARCHAR(100),
	issue_date DATE,
	expiry_date DATE,
	FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

CREATE TABLE notification (
	notification_id INT PRIMARY KEY AUTO_INCREMENT,
	employee_id INT,
	message TEXT,
	date DATE,
	FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

INSERT INTO company (company_id, company_name, address)
VALUES
(1, 'PT. Teknologi Nusantara', 'Jl. Merdeka No. 10, Jakarta'),
(2, 'PT. Finansial Mandiri', 'Jl. Sudirman No. 25, Jakarta'),
(3, 'PT. E-commerce Indonesia', 'Jl. Thamrin No. 30, Jakarta');

INSERT INTO project (project_id, project_name, client_company, start_date, end_date)
VALUES
(1, 'Pengembangan Aplikasi Mobile', 'PT. Teknologi Nusantara', '2024-01-15', '2024-06-15'),
(2, 'Sistem Informasi Keuangan', 'PT. Finansial Mandiri', '2024-02-20', '2024-06-10'),
(3, 'Pengembangan Website E-commerce', 'PT. E-commerce Indonesia', '2024-05-05', '2024-10-05');

INSERT INTO employee (employee_id, name, position, salary, date_hired, project_id)
VALUES
(1, 'Imam arishandi', 'Software Engineer', 5000000, '2020-01-01', 1),
(2, 'Della Ayu', 'Data Analyst', 4000000, '2019-06-01', 2),
(3, 'Romauli Napitu', 'Marketing Manager', 7000000, '2018-03-01', 3),
(4, 'Sifak Saput', 'IT Support', 3000000, '2017-09-01', 1),
(5, 'Tesa putri', 'HR Manager', 6000000, '2016-12-01', NULL),
(6, 'Bintang Wahyu', 'Sales Manager', 8000000, '2015-06-01', 2),
(7, 'Angga Jalas', 'Data Scientist', 9000000, '2014-03-01', 3),
(8, 'Khoirotunnisak', 'Graphic Designer', 2500000, '2024-05-01', 1),
(9, 'Irfan Faruq', 'Web Developer', 3500000, '2012-12-01', 2),
(10, 'Izzudin Arrafat', 'Financial Analyst', 4500000, '2012-06-01', 3);

INSERT INTO certificate (certificate_id, employee_id, certificate_name, issue_date, expiry_date)
VALUES
(1, 1, 'Sertifikasi Java', '2020-01-01', '2022-12-31'),
(2, 2, 'Sertifikasi Analisis Data', '2019-06-01', '2021-06-30'),
(3, 3, 'Sertifikasi Pemasaran', '2018-03-01', '2020-03-31'),
(4, 4, 'Sertifikasi Bantuan IT', '2017-09-01', '2019-09-30'),
(5, 5, 'Sertifikasi HR', '2016-12-01', '2018-12-31'),
(6, 6, 'Sertifikasi Penjualan', '2015-06-01', '2017-06-30'),
(7, 7, 'Sertifikasi Ilmu Data', '2014-03-01', '2016-03-31'),
(8, 8, 'Sertifikasi Desain Grafis', '2013-09-01', '2015-09-30'),
(9, 9, 'Sertifikasi Pengembangan Web', '2012-12-01', '2014-12-31'),
(10, 10, 'Sertifikasi Analisis Keuangan', '2012-06-01', '2014-06-30');

INSERT INTO training (training_id, certificate_name, duration_in_months) VALUES
(1, 'Sertifikasi Java', 6),
(2, 'Sertifikasi Analisis Data', 3),
(3, 'Sertifikasi Pemasaran', 4),
(4, 'Sertifikasi Bantuan IT', 8),
(5, 'Sertifikasi HR', 5),
(6, 'Sertifikasi Penjualan', 7),
(7, 'Sertifikasi Ilmu Data', 4),
(8, 'Sertifikasi Desain Grafis', 6),
(9, 'Sertifikasi Pengembangan Web', 9),
(10, 'Sertifikasi Analisis Keuangan', 5);

INSERT INTO notification (notification_id, employee_id, message, date) VALUES
(1, 1, 'Anda telah diberikan tugas pada proyek Situs E-commerce.', '2024-01-01'),  
(2, 2, 'Proyek Analisis Data Anda telah selesai.', '2024-02-01'),  
(3, 3, 'Anda telah dipromosikan menjadi Manajer Pemasaran.', '2024-03-01'),  
(4, 4, 'Sertifikasi Bantuan IT Anda telah diterbitkan.', '2024-04-01'), 
(5, 5, 'Anda telah diberikan tugas pada proyek Kampanye Pemasaran.', '2024-05-01'), 
(6, 6, 'Sertifikasi Penjualan Anda telah diterbitkan.', '2023-10-01'),
(7, 7, 'Anda telah diberikan tugas pada proyek Analisis Data.', '2023-11-01'), 
(8, 8, 'Sertifikasi Desain Grafis Anda telah diterbitkan.', '2023-12-01'),
(9, 9, 'Anda telah diberikan tugas pada proyek Situs E-commerce.', '2023-09-01'),
(10, 10, 'Sertifikasi Analisis Keuangan Anda telah diterbitkan.', '2024-01-01'); 
 
-- NOMOR 1
-- Buatlah stored procedure yang memeriksa setiap karyawan dalam tabel employees. 
-- Jika karyawan sudah bekerja lebih dari satu tahun, tambahkan bonus sebesar 10% dari gaji mereka.
DELIMITER //
CREATE PROCEDURE get_bonus()
BEGIN
SELECT e.name, e.salary, 
		CASE 
			WHEN e.date_hired <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) 
			THEN e.salary * 0.1
			ELSE 0 
		END AS bonus_gaji,
		CASE 
			WHEN e.date_hired <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) 
			THEN e.salary + e.salary * 0.1
			ELSE e.salary 
		END AS total_salary
FROM employee e;
END //
DELIMITER ;

-- DROP PROCEDURE get_bonus;
CALL get_bonus();

-- NOMOR 2
-- Buatlah stored procedure yang memeriksa setiap proyek dalam tabel projects. 
-- Jika proyek akan berakhir dalam waktu kurang dari satu bulan, perpanjang proyek selama tiga bulan.
DELIMITER //
CREATE PROCEDURE cek_project(
	IN input_idproject INT
)
BEGIN
    DECLARE proj_end_date DATE;
    DECLARE new_end_date DATE;

    SELECT end_date INTO proj_end_date FROM project WHERE project_id = input_idproject;

    IF DATE_SUB(proj_end_date, INTERVAL 1 MONTH) <= CURRENT_DATE 
		THEN
        SET new_end_date = DATE_ADD(proj_end_date, INTERVAL 3 MONTH);
    ELSE
        SET new_end_date = proj_end_date;
    END IF;

    SELECT p.project_name, p.start_date, p.end_date, new_end_date FROM project p WHERE project_id = input_idproject;
END //
DELIMITER ;

CALL cek_project(3);

-- Buatlah stored procedure yang memeriksa dan memperbarui data pelatihan setiap karyawan. 
-- Jika ada pelatihan baru yang tersedia, tambahkan pelatihan tersebut ke dalam tabel certificates.
-- NOMOR 3
DELIMITER //
CREATE PROCEDURE updatesertif(
IN input_idemployee INT)
BEGIN
    DECLARE jmlsertif INT;
    DECLARE tgl DATE;
    DECLARE new_cert_id INT;
    DECLARE new_training_id INT;
    
    SELECT COUNT(*) INTO jmlsertif FROM certificate WHERE employee_id = input_idemployee;
    SET tgl = CURDATE();

    IF jmlsertif > 0 THEN
        UPDATE certificate 
        SET expiry_date = ADDDATE(expiry_date, INTERVAL 1 YEAR)
        WHERE employee_id = input_idemployee AND expiry_date < tgl;
        IF ROW_COUNT() > 0 THEN
            SELECT IFNULL(MAX(training_id), 0) + 1 INTO new_training_id FROM training;
            INSERT INTO training (training_id, certificate_name, duration_in_months) VALUES
                (new_training_id, 'Sertifikasi Web Design', 5);
			
            SELECT CONCAT('Sertif untuk karyawan ', input_idemployee, ' sudah diupdate.') AS message;
			SELECT IFNULL(MAX(certificate_id), 0) + 1 INTO new_cert_id FROM certificate;
			INSERT INTO certificate (certificate_id, employee_id, certificate_name, issue_date, expiry_date) VALUES
        (new_cert_id, input_idemployee, 'Sertifikasi Web Design', '2024-05-01', '2024-05-18');
        ELSE
            SELECT CONCAT('Tidak ada sertifikat karyawan ', input_idemployee, ' perlu diperbarui.') AS message;
        END IF;
    ELSE
        SELECT CONCAT('karyawan ', input_idemployee, ' tidak memiliki sertif.') AS message;
    END IF;
	
    SELECT * FROM training;
    SELECT * FROM certificate;
END //
DELIMITER ;

SELECT * FROM training;
SELECT * FROM certificate;
-- DROP PROCEDURE updatesertif;
CALL updatesertif(1);

-- Buatlah stored procedure yang mengirimkan notifikasi kepada semua karyawan mengenai pelatihan baru yang akan datang.
-- NOMOR 4
DELIMITER //
CREATE PROCEDURE send_notification()
BEGIN
    DECLARE max_id INT;
    DECLARE min_id INT;
    DECLARE current_id INT;

    SELECT MIN(employee_id), MAX(employee_id) INTO min_id, max_id FROM employee;
    SET current_id = min_id;

    WHILE current_id <= max_id DO
        -- Memeriksa apakah current_id ada di tabel employees
        IF EXISTS (SELECT * FROM employee WHERE employee_id = current_id) THEN
            INSERT INTO notification (employee_id, message, date)
            VALUES (current_id, 'Pelatihan baru akan segera dimulai. Silakan periksa jadwal Anda untuk detail lebih lanjut.', CURDATE());
        END IF;
        SET current_id = current_id + 1;
    END WHILE;
    SELECT * FROM notification;
END//
DELIMITER ;
-- DROP PROCEDURE send_notification;-- 
CALL send_notification();

-- DROP DATABASE OutsourcingCompany;



