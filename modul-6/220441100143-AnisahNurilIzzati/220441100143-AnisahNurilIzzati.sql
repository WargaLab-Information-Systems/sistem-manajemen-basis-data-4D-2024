CREATE DATABASE OutsourcingCompany;
USE OutsourcingCompany;

CREATE TABLE projects (
project_id INT PRIMARY KEY auto_increment,
project_name VARCHAR(100),
client_company VARCHAR(100),
start_date DATE,
end_date DATE
);

CREATE TABLE employees (
employee_id INT PRIMARY KEY auto_increment,
nama VARCHAR(100),
position VARCHAR(50),
salary FLOAT,
date_hired DATE,
project_id INT, 
FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

CREATE TABLE certificates (
certificate_id INT PRIMARY KEY auto_increment,
employee_id INT,
certificate_name VARCHAR(100),
issue_date DATE,
expiry_date DATE,
FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE trainings (
training_id INT PRIMARY KEY auto_increment,
certificate_name VARCHAR(100),
duration_in_months INT
);

CREATE TABLE notifications (
notification_id INT PRIMARY KEY AUTO_INCREMENT ,
employee_id INT, 
message TEXT,
dates DATE,
FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE companies (
company_id INT PRIMARY KEY auto_increment,
company_name VARCHAR(100),
address TEXT
);

INSERT INTO projects (project_id, project_name, client_company, start_date, end_date) VALUES
(1, 'Proyek Satu', 'Tech Solutions', '2024-01-15', '2024-09-30'),
(2, 'Proyek Dua', 'Innovative Labs', '2024-02-01', '2024-06-01'),
(3, 'Proyek Tiga', 'Future Enterprises', '2024-03-10', '2024-05-28'),
(4, 'Proyek Empat', 'Smart Innovations', '2024-04-20', '2024-06-10'), 
(5, 'Proyek Lima', 'Creative Minds', '2024-05-05', '2024-08-12');

INSERT INTO employees (employee_id, nama, position, salary, date_hired, project_id) VALUES
(1, 'Mawar', 'Software Engineer', 600000.00, '2022-01-15', 1),
(2, 'Melati', 'Data Analyst', 550000.00, '2020-07-20', 2),
(3, 'Nilam', 'Project Manager', 750000.00, '2020-03-25', 3),
(4, 'Anggraini', 'System Administrator', 500000.00, '2019-11-10', 4),
(5, 'Dahlia', 'Quality Assurance', 480000.00, '2024-04-21', 5);

INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date) VALUES
(1, 1, 'Sertifikat Programmer Java', '2022-06-01', '2024-02-01'),
(2, 2, 'Sertifikat Data Scientist', '2021-08-15', '2024-02-15'),
(3, 3, 'Sertifikat Manajemen Proyek Profesional', '2020-12-20', '2024-03-20'),
(4, 4, 'Sertifikat Jaringan Associate', '2019-04-10', '2024-04-10'),
(5, 5, 'Sertifikat Penguji QA', '2021-09-30', '2024-03-30');

INSERT INTO trainings (training_id, certificate_name, duration_in_months) VALUES
(1, 'Sertifikat Programmer Java', 6),
(2, 'Sertifikat Data Scientist', 8),
(3, 'Sertifikat Manajemen Proyek Profesional', 9),
(4, 'Sertifikat Jaringan Associate', 7),
(5, 'Sertifikat Penguji QA', 5);

INSERT INTO notifications (notification_id, employee_id, message, dates) VALUES
(1, 1, 'Sertifikat Programmer Java Anda akan kadaluarsa dalam 6 bulan.', '2024-06-01'),
(2, 2, 'Sertifikat Data Scientist Anda akan kadaluarsa dalam 2 bulan.', '2024-03-15'),
(3, 3, 'Harap perbarui sertifikat Manajemen Proyek Anda.', '2024-04-20'),
(4, 4, 'Sertifikat Jaringan Associate sudah kadaluarsa.', '2024-04-10'),
(5, 5, 'Pembaharuan sertifikat Penguji QA jatuh tempo tahun depan.', '2024-04-30');

-- soal 1
DELIMITER //
CREATE PROCEDURE tambah_bonus()
BEGIN
    DECLARE bonus_gaji DECIMAL(10,2);
    DECLARE total_salary DECIMAL(10,2);
    
    SELECT nama, salary, 
        CASE 
            WHEN date_hired <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) 
            THEN salary * 0.1
            ELSE 0 
        END AS bonus_gaji,
        CASE 
            WHEN date_hired <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) 
            THEN salary + salary * 0.1
            ELSE salary 
        END AS total_salary
    FROM employees;
END //
DELIMITER ;

CALL tambah_bonus();


-- soal 2
DELIMITER //
CREATE PROCEDURE perpanjang_project()
BEGIN
DECLARE perpanjang_tanggal DATE;
SELECT project_id, project_name, end_date,
	CASE 
            WHEN end_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 1 MONTH) 
            THEN DATE_ADD(end_date, INTERVAL 3 MONTH)
            ELSE end_date
        END AS perpanjang_tanggal
FROM projects;
END //
DELIMITER ;

CALL perpanjang_project();


-- soal 3
DELIMITER //
CREATE PROCEDURE updatesertif(
IN id_employee INT)
BEGIN
    DECLARE banyak_sertif INT;
    DECLARE tgl_sekarang DATE;
    DECLARE id_sertif_baru INT;
    DECLARE id_training_baru INT;
    
    SELECT COUNT(*) INTO banyak_sertif FROM certificates WHERE employee_id = id_employee;
    SET tgl_sekarang = CURDATE();

    IF banyak_sertif > 0 THEN
        UPDATE certificates 
        SET expiry_date = ADDDATE(expiry_date, INTERVAL 1 YEAR)
        WHERE employee_id = id_employee AND expiry_date < tgl_sekarang;

        IF ROW_COUNT() > 0 THEN
		SELECT CONCAT('Sertif karyawan ', id_employee, ' sudah diupdate.') AS message;
			INSERT INTO trainings (training_id, certificate_name, duration_in_months) VALUES
			(id_training_baru, 'Sertifikat Pelatihan HTML CSS', '5');
            INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date) VALUES
			(id_sertif_baru, id_employee, 'Sertifikat Pelatihan HTML CSS', '2024-05-05', '2024-05-20');
        ELSE
		SELECT CONCAT('Sertifikat karyawan ', id_employee, ' tidak ada yang perlu diperbarui.') AS message;
        END IF;
    ELSE
        SELECT CONCAT('karyawan ', id_employee, ' tidak mempunya sertifikat.') AS message;
    END IF;

    SELECT IFNULL(MAX(certificate_id), 0) + 1 INTO id_sertif_baru FROM certificates;

    SELECT * FROM trainings;
    SELECT * FROM certificates;
END //
DELIMITER ;

call updatesertif(1);

-- soal 4
DELIMITER //
CREATE PROCEDURE kirim_notifikasi_pelatihan()
BEGIN
    DECLARE cur_date DATE;
    DECLARE emp_id INT DEFAULT 0;
    DECLARE last_emp_id INT;

    SET cur_date = CURDATE();
    SELECT MAX(employee_id) INTO last_emp_id FROM employees;

    REPEAT
        SET emp_id = emp_id + 1;

        IF EXISTS (SELECT * FROM employees WHERE employee_id = emp_id) THEN
            INSERT INTO notifications (employee_id, message, dates)
            SELECT emp_id, 'Pelatihan UI UX coming soon', cur_date;

        END IF;
    UNTIL emp_id >= last_emp_id END REPEAT;
    SELECT * FROM notifications;
END //
DELIMITER ;

CALL kirim_notifikasi_pelatihan();