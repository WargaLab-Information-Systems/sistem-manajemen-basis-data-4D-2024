create database db_OutsourcingCompany;
USE db_OutsourcingCompany;

drop database db_OutsourcingCompany;
create table employees(
	employee_id INT primary key,
    nama VARCHAR(100),
    posisi VARCHAR(50),
    gaji FLOAT,
    tgl_dipekerjakan DATE,
    project_id INT,
    foreign key(project_id) references projects(project_id)
    );
INSERT INTO employees (employee_id, nama, posisi, gaji, tgl_dipekerjakan, project_id)
VALUES
	(1,'Jonatan', 'Software Developer', 50000.00, '2023-01-01', 1),
	(2,'Jeje', 'Project Manager', 75000.00, '2022-06-01', 2),
	(3,'Mira', 'Database Administrator', 60000.00, '2024-02-15', 3),
	(4,'Hani', 'Web Developer', 45000.00, '2021-11-01', 2),
	(5,'David', 'Business Analyst', 58000.00, '2023-05-10', 1);

select * from employees;

create table projects(
	project_id INT primary key,
    nama_project VARCHAR(100),
    klien_perusahaan VARCHAR(100),
    tgl_mulai DATE,
    tgl_akhir DATE
    );
drop table projects;
INSERT INTO projects (project_id,nama_project, klien_perusahaan, tgl_mulai, tgl_akhir) VALUES
    (1, 'E-commerce Development', 'NFC Indonesia', '2023-03-01', '2024-01-31'),
    (2, 'Data Analisis', 'Grand jaya', '2020-12-01', '2025-12-31'),
    (3, 'Mobile App Development', 'Samsung Electronics', '2023-09-01', '2023-12-31'),
    (4, 'Data Analytics Platform', 'Apple', '2023-07-01', '2024-06-30'),
    (5, 'CRM Implementation', 'Epsilon Systems', '2023-02-01', '2023-08-31');
    
INSERT INTO projects (project_id,nama_project, klien_perusahaan, tgl_mulai, tgl_akhir) VALUES
    (6, 'Development1', 'IndonesiaJaya1', '2024-04-01', '2024-05-20');



SELECT * FROM projects;
    
create table certificates(
	certificates_id INT primary key,
    nama_sertifikat VARCHAR(100),
    tgl_penerbit DATE,
    tgl_kedaluarsa DATE,
    employee_id INT,
    foreign key(employee_id) references employees(employee_id)
    );

INSERT INTO certificates (certificates_id, nama_sertifikat, tgl_penerbit, tgl_kedaluarsa, employee_id)
VALUES
	(1, 'Java Certified Programmer', '2021-04-01', '2024-03-31',1),
	(2, 'Certified Scrum Master', '2022-08-15', '2025-08-14',2),
	(3, 'Oracle Database Certified Associate', '2020-10-10', '2023-10-09',3),
	(4, 'AWS Certified Solutions Architect - Associate', '2023-12-24', '2026-12-23',4),
	(5, 'Microsoft Certified Solutions Associate: SharePoint 2019', '2022-05-05', '2025-05-04',5);
    
create table trainings(
	training_id INT primary key,
    nama_sertifikat VARCHAR(100),
    durasi_bulan INT
    );

INSERT INTO trainings (training_id, nama_sertifikat, durasi_bulan)
VALUES
	(1,'Python Programming', 3),
	(2,'Git and GitHub', 1),
	(3,'Agile Methodology', 2),
	(4,'Cybersecurity Awareness', 0.5),
	(5,'Effective Communication Skills', 1);
    
CREATE TABLE notifications (
    notification_id INT AUTO_INCREMENT PRIMARY KEY,
    pesan VARCHAR(255),
    tgl DATE,
    employee_id INT,
    foreign key(employee_id) references employees(employee_id)
);
    
INSERT INTO notifications (pesan, tgl, employee_id)
VALUES
	('Performance review scheduled for next week.', '2024-05-21',1),
	('Project deadline approaching. Please ensure all tasks are completed on time.', '2024-05-17',2),
	('New training opportunity available: Advanced SQL for Data Analysts.', '2024-05-14',3),
	('Company picnic is happening next month. Please RSVP by May 31st.', '2024-05-10',4),
	('Welcome to the team! We\'re excited to have you on board.', '2024-04-01',5);
    
create table companies(
	company_id INT primary key,
    nama_company VARCHAR(100),
    alamat TEXT
    );

INSERT INTO companies (company_id, nama_company, alamat)
VALUES
  (1,'NFC Indonesia', 'Kuningan City'),
  (2,'Samsung Electronics', 'Jl.Jababeka Raya'),
  (3,'Apple', 'Jl. Jendral Sudirman Lt.18'),
  (4,'Tourindo Guide', 'Jl.Prof.Dr.Satrio'),
  (5,'Epsilon Systems', 'Kuningan City');
  
  -- 1
DELIMITER //

CREATE PROCEDURE TambahBonusTahunan()
BEGIN

    SELECT nama,
		CASE 
			WHEN tgl_dipekerjakan <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) 
			THEN gaji * 0.1
			ELSE 0 
		END AS bonus_gaji,
        CASE 
			WHEN tgl_dipekerjakan <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) 
			THEN gaji + gaji * 0.1
			ELSE gaji 
	END AS total_gaji
    FROM employees; 
END //

DELIMITER ;
drop procedure TambahBonusTahunan;
CALL TambahBonusTahunan();

-- 2
DELIMITER //

CREATE PROCEDURE PerpanjangProyek()
BEGIN
    DECLARE tanggal_sekarang DATE;
    set tanggal_sekarang = CURDATE();

    select
		nama_project,
		tgl_akhir,
			if(DATEDIFF(tgl_akhir, tanggal_sekarang) < 30,
			DATE_ADD(tgl_akhir, INTERVAL 3 MONTH),
            null) AS tanggal_diperpanjang
    FROM projects;
END //

DELIMITER ;
select * from projects;
drop procedure PerpanjangProyek;
CALL PerpanjangProyek();

-- 3
DELIMITER //

CREATE PROCEDURE UpdateCertificates1(IN employeeID INT)
BEGIN
    DECLARE bykSer INT;
    DECLARE tglBr DATE;
	
    -- menghitung jumlah sertifikat
    SELECT COUNT(*) INTO bykSer 
    FROM certificates 
    WHERE employee_id = employeeID;
    
	-- tanggal hari ini
    SET tglBr = CURDATE();

    IF bykSer > 0 THEN

        UPDATE certificates 
        SET tgl_kedaluarsa = ADDDATE(tgl_kedaluarsa, INTERVAL 1 YEAR)
        WHERE employee_id = employeeID 
          AND tgl_kedaluarsa < tglBr;
		IF ROW_COUNT() > 0 THEN
            SELECT CONCAT('Sertif', employeeID, 'terupdate.') AS pesan;
        ELSE
            SELECT CONCAT('Tidak ada sertifikat ', employeeID, ' perlu diperbarui.') AS pesan;
        END IF;
	ELSE
        SELECT CONCAT('karyawan ', employeeID, ' tidak memiliki sertif.') AS pesan;
    END IF;

END//

DELIMITER ;
CALL UpdateCertificates1(6);
SELECT * FROM certificates;

-- 4
DELIMITER //

CREATE PROCEDURE NotifikasiPelatihanBaru()
BEGIN
    DECLARE tgl_Sek DATE;
    DECLARE emp_id INT DEFAULT 1;
    DECLARE id_last INT;

    SET tgl_Sek = CURDATE();
    SELECT MAX(employee_id) INTO id_last FROM employees;

    REPEAT
        IF EXISTS (SELECT 1 FROM employees WHERE employee_id = emp_id) THEN
            INSERT INTO notifications (employee_id, pesan, tgl)
            VALUES (emp_id, 'Pelatihan akan datang', tgl_Sek);
        END IF;
        SET emp_id = emp_id + 1;
    UNTIL emp_id > id_last
    END REPEAT;

    SELECT * FROM notifications;
END //

DELIMITER ;


select * from notifications;

CALL NotifikasiPelatihanBaru;
drop procedure NotifikasiPelatihanBaru;
select * from notifications;