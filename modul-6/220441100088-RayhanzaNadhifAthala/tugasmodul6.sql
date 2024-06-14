
CREATE DATABASE OutsourcingCompany;

USE OutsourcingCompany;


CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50) NOT NULL,
    salary FLOAT NOT NULL,
    date_hired DATE NOT NULL,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);


CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100) NOT NULL,
    client_company VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);


CREATE TABLE certificates (
    certificate_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    certificate_name VARCHAR(100) NOT NULL,
    issue_date DATE NOT NULL,
    expiry_date DATE NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);



CREATE TABLE trainings (
    training_id INT PRIMARY KEY AUTO_INCREMENT,
    certificate_name VARCHAR(100) NOT NULL,
    duration_in_months INT NOT NULL
);


CREATE TABLE notifications (
    notification_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    message TEXT NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);


	
CREATE TABLE companies (
    company_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(100) NOT NULL,
    address TEXT NOT NULL
);


INSERT INTO projects (project_name, client_company, start_date, end_date) VALUES
('Proyek Android', 'Perusahaan Shopee', '2024-02-01', '2024-11-30'),
('Proyek WEB', 'Perusahaan Inde', '2024-02-01', '2024-11-30'),
('Proyek UI/UX', 'Perusahaan Gojek', '2024-02-01', '2024-06-22'),
('Proyek Java', 'Perusahaan Shopee', '2024-02-01', '2024-07-30');
update certificates set certificate_id=4 where certificate_id=12;
select * from employees;

update employees set salary =  18000000 where employee_id=2;

-- Memasukkan data ke tabel employees
INSERT INTO employees (name, position, salary, date_hired, project_id) VALUES
('Arifin', 'Manager', 15000000, '2023-01-15', 1),
('Safira', 'Developer', 10000000, '2023-02-20', 2),
('Putra', 'Designer', 8000000, '2023-03-10', 3),
('Nadhif', 'Tester', 7000000, '2023-04-05', 4);

-- Memasukkan data ke tabel certificates
INSERT INTO certificates (employee_id, certificate_name, issue_date, expiry_date) VALUES
(5, 'PMP', '2023-01-20', '2026-01-19'),
(6, 'Front End Designer', '2023-03-15', '2026-03-14'),
(7, 'UI/UX', '2023-05-10', '2026-05-09'),
(8, 'Software Testing', '2023-06-25', '2026-06-24');
select * from certificates;

update notifications set date='2023-05-19' where notification_id=2;
-- Memasukkan data ke tabel trainings
INSERT INTO trainings (training_id,certificate_name, duration_in_months) VALUES
(1,'PMP', 6),
(2,'Front End Designer', 4),
(3,'UI/UX', 3),
(4, 'Software Testing', 2);

-- Memasukkan data ke tabel notifications
INSERT INTO notifications (notification_id, employee_id, message, date) VALUES
(1,5, 'Rapat penting pada hari Senin', '2024-05-19'),
(2,6, 'Proyek baru akan dimulai bulan depan', '2024-05-19'),
(3,7, 'Pelatihan desain minggu depan', '2024-05-19'),
(4,8, 'Pengujian sistem versi baru', '2024-05-19');

-- Memasukkan data ke tabel companies
INSERT INTO companies (company_id,company_name, address) VALUES
(1,'Perusahaan Xav', 'Jl. Merdeka No. 1, Jakarta'),
(2, 'Perusahaan Yoki', 'Jl. Sudirman No. 25, Surabaya');





SET SQL_SAFE_UPDATES = 0;

CALL delete_old_notifications();
select * from notifications;

select * from employees;
-- Buatlah stored procedure yang memeriksa setiap karyawan dalam tabel employees.
-- Jika karyawan sudah bekerja lebih dari satu tahun, tambahkan bonus sebesar 10% dari gaji mereka.


-- Buatlah stored procedure yang memeriksa setiap proyek dalam tabel projects.
-- Jika proyek akan berakhir dalam waktu kurang dari satu bulan, perpanjang proyek selama tiga bulan.
DELIMITER //
CREATE PROCEDURE nomer2()
BEGIN
    DECLARE tgl DATE;
    SET tgl = CURDATE();
    UPDATE projects
    SET end_date = DATE_ADD(end_date, INTERVAL 3 MONTH)
    WHERE DATEDIFF(end_date, tgl) < 30;
    select project_name, start_date, end_date from projects;
END //
DELIMITER ;
INSERT INTO projects (project_id, project_name, client_company, start_date, end_date) VALUES
(9, 'Proyek Sumber Daya Perusahaan', 'PSDP', '2024-01-01', '2024-06-22');
update projects set end_date = '2024-06-15' where project_id=1;

select * from projects;
CALL nomer2();

-- Buatlah stored procedure yang memeriksa dan memperbarui data pelatihan setiap karyawan.
-- Jika ada pelatihan baru yang tersedia, tambahkan pelatihan tersebut ke dalam tabel certificates.
DELIMITER //
CREATE PROCEDURE updatesertif2(
IN idemployee INT)
BEGIN
    DECLARE jmlsertif INT;
    DECLARE tgl DATE;
    DECLARE new_cert_id INT;
    DECLARE new_training_id INT;
    
    SELECT COUNT(*) INTO jmlsertif FROM certificates WHERE employee_id = idemployee;
    SET tgl = CURDATE();

    IF jmlsertif > 0 THEN
        UPDATE certificates
        SET expiry_date = ADDDATE(expiry_date, INTERVAL 1 YEAR)
        WHERE employee_id = idemployee AND expiry_date < tgl;
        IF ROW_COUNT() > 0 THEN
            SELECT (MAX(training_id)) + 1 INTO new_training_id FROM trainings;
            INSERT INTO trainings (training_id, certificate_name, duration_in_months) VALUES
                (new_training_id, 'Sertifikasi Data Mining', 5);
			
            SELECT CONCAT('Sertif untuk karyawan ', idemployee, ' sudah diupdate.') AS message;
			SELECT (MAX(certificate_id)) + 1 INTO new_cert_id FROM certificates;
			INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date) VALUES
        (new_cert_id, idemployee, 'Sertifikasi Data Mining', '2024-05-01', '2024-05-18');
        ELSE
            SELECT CONCAT('Sertifikat Karyawan ', idemployee, ' Tidak perlu diperbarui.') AS message;
        END IF;
    ELSE
        SELECT CONCAT('karyawan ', idemployee, ' tidak punya sertif.') AS message;
    END IF;
	
    SELECT * FROM trainings;
    SELECT * FROM certificates;
END //
DELIMITER ;
SELECT * FROM trainings;
SELECT * FROM certificates;
drop procedure updatesertif2;
CALL updatesertif2(3);

select * from certificates;

DELIMITER //
CREATE PROCEDURE nomer4()
BEGIN
    DECLARE tgl DATE;
    DECLARE id_emp INT ;
    DECLARE id_emp_terakhir INT;
    SET tgl = CURDATE();
    SELECT MAX(employee_id) INTO id_emp_terakhir FROM employees;
    REPEAT
        SET id_emp = id_emp + 1;
        IF EXISTS (SELECT * FROM employees WHERE employee_id = id_emp) THEN
            INSERT INTO notifications (employee_id, message, date)
            SELECT id_emp, 'Jangan Lewatkan pelatihan Android !', tgl;
        END IF;
    UNTIL id_emp = id_emp_terakhir END REPEAT;
    SELECT * FROM notifications;
END //
DELIMITER ;
CALL nomer4();
select * from employees;
select * from notifications;
delete from notifications where notification_id=9;

DELIMITER ;


select* from certificates;
update certificates set expiry_date='2024-05-23' where employee_id=6;
select * from trainings;
select * from certificates;

