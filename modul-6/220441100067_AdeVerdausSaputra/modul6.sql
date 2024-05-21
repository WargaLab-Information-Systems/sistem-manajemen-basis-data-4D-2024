create database OutsourcingCompany;

use OutsourcingCompany;

drop database OutsourcingCompany;

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

CREATE TABLE employees (
    employee_id INT not null PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50),
    salary FLOAT,
    date_hired DATE,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

CREATE TABLE certificates (
    certificate_id INT PRIMARY KEY,
    employee_id INT,
    certificate_name VARCHAR(100),
    issue_date DATE,
    expiry_date DATE,
    training_id int,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (training_id) REFERENCES trainings(training_id)
);

CREATE TABLE trainings (
    training_id INT PRIMARY KEY,
    certificate_name  VARCHAR(100),
    duration_in_months INT
);

select * from trainings;

CREATE TABLE notifications (
    notification_id INT PRIMARY KEY not null,
    employee_id INT,
    message TEXT,
    date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);


-- Data for companies
INSERT INTO companies (company_id, company_name, address) VALUES
(1, 'Tech Innovators', '123 Tech Street'),
(2, 'Global Solutions', '456 Solution Avenue'),
(3, 'Creative Minds', '789 Creative Boulevard');

-- Data for projects
INSERT INTO projects (project_id, project_name, client_company, start_date, end_date) VALUES
(1, 'Project Alpha', 'Tech Innovators', '2024-01-01', '2024-12-31'),
(2, 'Project Beta', 'Global Solutions', '2024-02-01', '2024-11-30'),
(3, 'Project Gamma', 'Creative Minds', '2024-03-01', '2024-10-31'),
(4, 'Project Tetta', 'Whealty Minds', '2024-03-05', '2024-03-28');

-- Data for employees
INSERT INTO employees (employee_id, name, position, salary, date_hired, project_id) VALUES
(1, 'Alice Johnson', 'Software Engineer', 75000, '2022-01-15', 1),
(2, 'Bob Smith', 'Data Scientist', 80000, '2024-02-20', 2),
(3, 'Charlie Brown', 'Project Manager', 90000, '2024-03-25', 3),
(4, 'Diana Prince', 'UX Designer', 70000, '2022-04-30', 1),
(5, 'Ethan Hunt', 'DevOps Engineer', 78000, '2022-05-15', 2),
(6, 'Fiona Glenanne', 'QA Engineer', 65000, '2022-06-10', 3),
(7, 'George Michaels', 'Business Analyst', 72000, '2022-07-05', 1),
(8, 'Hannah Montana', 'Software Developer', 74000, '2022-08-20', 2),
(9, 'Ian Fleming', 'Technical Writer', 62000, '2022-09-25', 3),
(10, 'Jane Doe', 'HR Specialist', 68000, '2022-10-30', 1),
(11, 'Yanto Fleming', 'Technical Writer', 62000, '2022-09-25', 3),
(12, 'Iani Fleming', 'Technical Writer', 62000, '2022-09-25', 3);

-- Data for certificates
INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date, training_id) VALUES
(1, 1, 'AWS Certified Solutions Architect', '2024-04-01', '2024-05-11',1),
(2, 2, 'Certified Data Professional', '2022-07-01', '2024-05-012',2),
(3, 3, 'PMP Certification', '2022-08-01', '2024-04-01',3),
(4, 4, 'Certified UX Designer', '2022-09-01', '2023-09-01',4),
(5, 5, 'AWS Certified DevOps Engineer', '2022-10-01', '2025-10-01',5),
(6, 6, 'ISTQB Certified Tester', '2022-11-01', '2025-11-01',6),
(7, 7, 'Certified Business Analyst', '2022-12-01', '2025-12-01',7),
(8, 8, 'Oracle Certified Professional', '2023-01-01', '2026-01-01',8),
(9, 9, 'Certified Technical Writer', '2023-02-01', '2026-02-01',9),
(10, 10, 'HR Certification', '2023-03-01', '2026-03-01',10);

-- Data for trainings
INSERT INTO trainings (training_id, certificate_name, duration_in_months) VALUES
(1, 'AWS Certified Solutions Architect', 6),
(2, 'Certified Data Professional', 6),
(3, 'PMP Certification', 6),
(4, 'Certified UX Designer', 6),
(5, 'AWS Certified DevOps Engineer', 6),
(6, 'ISTQB Certified Tester', 6),
(7, 'Certified Business Analyst', 6),
(8, 'Oracle Certified Professional', 6),
(9, 'Certified Technical Writer', 6),
(10, 'HR Certification', 3),
(11, 'Jagoan Kampung', 6),
(12, 'HDODOCertification', 6),
(13, 'IVI Certification', 6);

-- Data for notifications
INSERT INTO notifications (notification_id, employee_id, message, date) VALUES
(1, 1, 'Annual performance review scheduled', '2023-06-15'),
(2, 2, 'Training session on data analytics', '2023-07-20'),
(3, 3, 'Project deadline approaching', '2023-08-25'),
(4, 4, 'Design workshop next week', '2023-09-30'),
(5, 5, 'DevOps best practices webinar', '2023-10-15'),
(6, 6, 'QA team meeting', '2023-11-10'),
(7, 7, 'Business analysis certification renewal', '2023-12-05'),
(8, 8, 'Database optimization techniques', '2024-01-20'),
(9, 9, 'Technical writing standards update', '2024-02-25'),
(10, 10, 'HR policies review', '2024-03-30');


-- 1

DELIMITER //

CREATE PROCEDURE TambahBonusTahunan()
BEGIN
    DECLARE tanggal_sekarang DATE;
    SET tanggal_sekarang = CURDATE();

    UPDATE employees
    SET salary = salary * 1.10
    WHERE DATEDIFF(tanggal_sekarang, date_hired) > 365;
    SELECT employees.name,salary, date_hired FROM employees WHERE DATEDIFF(tanggal_sekarang, date_hired) > 365;
END //

DELIMITER ;
drop procedure TambahBonusTahunan;
select * from employees;
CALL TambahBonusTahunan();
INSERT INTO employees (employee_id, name, position, salary, date_hired, project_id) VALUES
(17, 'Johnson Susilo', 'Software Engineer', 1000000, '2022-01-15', 1);
-- 2
DELIMITER //

CREATE PROCEDURE PerpanjangProyek()
BEGIN
    DECLARE tanggal_sekarang DATE;
    SET tanggal_sekarang = CURDATE();

    UPDATE projects
    SET end_date = DATE_ADD(end_date, INTERVAL 3 MONTH)
    WHERE DATEDIFF(end_date, tanggal_sekarang) < 30;
    
    select project_name, start_date, end_date from projects;
END //
DELIMITER ;

INSERT INTO projects (project_id, project_name, client_company, start_date, end_date) VALUES
(7, 'Project Alpha', 'Tech Innovators', '2024-01-01', '2024-01-31');
drop procedure PerpanjangProyek;
select * from projects;

CALL PerpanjangProyek();


-- 3

DELIMITER //

CREATE PROCEDURE UpdateCertificates(IN employeeID INT)
BEGIN
    DECLARE certCount INT;
    DECLARE currentDate DATE;
    
    -- Hitung jumlah sertifikat yang dimiliki oleh karyawan
    SELECT COUNT(*) INTO certCount FROM certificates WHERE employee_id = employeeID;
    
    -- Ambil tanggal hari ini
    SET currentDate = CURDATE();
    
    -- Jika karyawan memiliki sertifikat
    IF certCount > 0 THEN
        -- Perbarui sertifikat yang sudah kadaluarsa
        UPDATE certificates 
        SET expiry_date = ADDDATE(currentDate, INTERVAL 1 YEAR)
        WHERE employee_id = employeeID AND expiry_date < currentDate;
        
        -- Jika ada sertifikat yang diperbarui, tampilkan pesan
        IF ROW_COUNT() > 0 THEN
            SELECT CONCAT('Certificates for employee ', employeeID, ' have been updated.') AS message;
        ELSE
            SELECT CONCAT('No certificates for employee ', employeeID, ' need to be updated.') AS message;
        END IF;
    ELSE
        SELECT CONCAT('Employee ', employeeID, ' does not have any certificates.') AS message;
    END IF;
    INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date, training_id) VALUES
		(15, 1, 'Jaggoan Kampung', '2024-04-01', '2024-05-11',11);
    
END//

DELIMITER ;

drop procedure UpdateCertificates;
call UpdateCertificates(1);

select * from certificates;

-- 4

delimiter //
CREATE PROCEDURE NotifikasiPelatihanBaru()
BEGIN
    DECLARE nama_pelatihan VARCHAR(100);
    DECLARE notification_pesan TEXT;
    DECLARE notification_id_val INT;

    -- Ambil nama pelatihan yang akan datang
    SELECT certificate_name INTO nama_pelatihan
    FROM trainings
    WHERE duration_in_months = 3
    LIMIT 1; -- Ambil satu pelatihan saja, jika ada lebih dari satu

    -- Buat pesan notifikasi
    SET notification_pesan = CONCAT('Pelatihan baru ', nama_pelatihan, '. akan datang !!');

    -- Ambil nilai maksimum dari notification_id yang ada dan tambahkan 1
    SELECT COALESCE(MAX(notification_id), 1) + 2 INTO notification_id_val
    FROM notifications;

    -- Masukkan notifikasi ke dalam tabel notifications untuk semua karyawan
    INSERT INTO notifications (notification_id, employee_id, message, date)
    SELECT notification_id_val + ROW_NUMBER() OVER(), employee_id, notification_pesan, CURDATE()
    FROM employees;
    
    select * from notifications;
END; 
// delimiter ;

drop procedure NotifikasiPelatihanBaru;

DELIMITER //

CREATE PROCEDURE NotifikasiPelatihanBaru()
BEGIN
    DECLARE nama_pelatihan VARCHAR(100);
    DECLARE notification_pesan TEXT;
    DECLARE notification_id_val INT;
    DECLARE done INT DEFAULT 0;

    -- Cursor untuk mengiterasi semua pelatihan dengan durasi 6 bulan
    DECLARE pelatihan_cursor CURSOR FOR
    SELECT certificate_name
    FROM trainings
    WHERE duration_in_months = 6;

    -- Handler untuk mengatur variabel done saat cursor mencapai akhir data
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Membuka cursor
    OPEN pelatihan_cursor;

    pelatihan_loop: LOOP
        -- Mengambil nama pelatihan
        FETCH pelatihan_cursor INTO nama_pelatihan;

        -- Keluar dari loop jika tidak ada lagi data
        IF done THEN
            LEAVE pelatihan_loop;
        END IF;

        -- Buat pesan notifikasi
        SET notification_pesan = CONCAT('Pelatihan baru ', nama_pelatihan, ' akan datang !!');

        -- Ambil nilai maksimum dari notification_id yang ada dan tambahkan 1
        SELECT COALESCE(MAX(notification_id), 0) + 1 INTO notification_id_val
        FROM notifications;

        -- Masukkan notifikasi ke dalam tabel notifications untuk semua karyawan
        INSERT INTO notifications (notification_id, employee_id, message, date)
        SELECT notification_id_val + ROW_NUMBER() OVER(), employee_id, notification_pesan, CURDATE()
        FROM employees;
    END LOOP pelatihan_loop;	

    -- Menutup cursor
    CLOSE pelatihan_cursor;

    SELECT * FROM notifications;
END;
//
DELIMITER ;


CALL NotifikasiPelatihanBaru();
