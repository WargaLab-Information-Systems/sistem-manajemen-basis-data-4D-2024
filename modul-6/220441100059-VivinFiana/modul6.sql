create database OutsourcingCompany;
use OutsourcingCompany;
drop database OutsourcingCompany;

create table companies(
company_id int key auto_increment not null,
company_name varchar (100) not null,
address text not null
);
drop table companies;

insert into companies (company_name, address) values
('Tech Solutions', 'Jl. Sudirman No. 1, Jakarta'),
('Innovatech', 'Jl. Thamrin No. 22, Bandung'),
('Web Creators', 'Jl. Rasuna Said No. 5, Tangerang'),
('Cloud Services', 'Jl. Gatot Subroto No. 7, Jakarta'),
('Data Analytics', 'Jl. Kebon Sirih No. 9, Bandung');

create table projects(
project_id int primary key auto_increment not null,
project_name varchar (100) not null,
client_company varchar (100) not null,
start_date date not null,
end_date date not null
);
drop table projects;

insert into projects (project_name, client_company, start_date, end_date) values
('Proyek Aplikasi Mobile', 'Tech Solutions', '2024-01-01', '2024-06-30'),
('Sistem Manajemen Data', 'Innovatech', '2024-02-01', '2024-07-31'),
('Website E-commerce', 'Web Creators', '2024-03-01', '2024-08-31'),
('Migrasi ke Cloud', 'Cloud Services', '2024-04-01', '2024-09-30'),
('Analisis Data Bisnis', 'Data Analytics', '2024-05-01', '2024-10-31');

create table employees(
employee_id int primary key auto_increment not null,
name varchar (100) not null,
position varchar (50) not null,
salary float not null,
date_hired date not null,
project_id int not null,
foreign key (project_id) references projects (project_id)
);

insert into employees (name, position, salary, date_hired, project_id) values 
('Andi Wijaya', 'Pengembang', 8000000, '2022-01-15', 1),
('Budi Santoso', 'Manajer Proyek', 12000000, '2023-02-20', 2),
('Citra Dewi', 'Desainer UI/UX', 9000000, '2023-03-10', 3),
('Dian Pratama', 'Analis Data', 10000000, '2021-04-05', 4),
('Eko Saputra', 'Administrator Sistem', 8500000, '2022-05-25', 5);
drop table employees;

create table certificates(
certificate_id int primary key auto_increment not null,
employee_id int not null,
certificate_name varchar (100) not null,
issue_date date not null,
expiry_date date not null,
foreign key (employee_id) references employees (employee_id)
);
drop table certificates;

insert into certificates (employee_id, certificate_name, issue_date, expiry_date) values 
(1, 'Sertifikat Pengembangan Web', '2023-06-01', '2026-06-01'),
(2, 'Sertifikat Manajemen Proyek', '2023-07-01', '2026-07-01'),
(3, 'Sertifikat Desain UX', '2023-08-01', '2026-08-01'),
(4, 'Sertifikat Analisis Data', '2023-09-01', '2026-09-01'),
(5, 'Sertifikat Administrasi Sistem', '2023-10-01', '2026-10-01');

create table trainings(
training_id int key auto_increment not null,
certificate_name varchar (100) not null,
duration_in_months int not null
);

insert into trainings (certificate_name, duration_in_months) values
('Pengembangan Web', 6),
('Manajemen Proyek', 6),
('Desain UX', 6),
('Analisis Data', 6),
('Administrasi Sistem', 6);
drop table trainings;

create table notifications(
notification_id int primary key auto_increment not null,
employee_id int not null,
message text not null,
date date not null,
foreign key (employee_id) references employees (employee_id)
);
insert into notifications (employee_id, message, date) values 
(1, 'Pelatihan Pengembangan Web akan dimulai bulan depan', '2024-05-01'),
(2, 'Manajemen Proyek: Silakan update status proyek', '2024-05-02'),
(3, 'Desain UX: Workshop akan diadakan minggu depan', '2024-05-03'),
(4, 'Analisis Data: Laporan kuartalan akan segera dimulai', '2024-05-04'),
(5, 'Administrasi Sistem: Maintenance server minggu depan', '2024-05-05');
drop table notifications;

-- no1
-- karyawan bekerja lebih dari 1th = bonus 10%
DELIMITER //
CREATE PROCEDURE hitungBonus()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE emp_id INT;
    DECLARE emp_gaji FLOAT;
    DECLARE emp_tgl_mulai DATE;
    DECLARE bonus FLOAT;
    DECLARE cur CURSOR FOR SELECT employee_id, salary, date_hired FROM employees;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_id, emp_gaji, emp_tgl_mulai;
        IF done THEN
            LEAVE read_loop;
        END IF;
        IF TIMESTAMPDIFF(YEAR, emp_tgl_mulai, CURDATE()) >= 1 THEN
            SET bonus = emp_gaji * 0.10;
            UPDATE employees SET salary = salary + bonus WHERE employee_id = emp_id;
        END IF;
    END LOOP;	
    CLOSE cur;
END //
DELIMITER ;
CALL hitungBonus;
SELECT * FROM employees;
insert into employees (name, position, salary, date_hired, project_id) values 
('Imam', 'Pengembang', 1000000, '2022-01-15', 1);

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
        FETCH cur INTO proj_id, proj_tgl_akhir;
        IF done THEN
            LEAVE read_loop;
        END IF;
        IF DATEDIFF(proj_tgl_akhir, CURDATE()) < 30 THEN
            SET new_tgl_akhir = DATE_ADD(proj_tgl_akhir, INTERVAL 3 MONTH);
            UPDATE projects SET end_date = new_tgl_akhir WHERE project_id = proj_id;
        END IF;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
CALL perpanjangProjek();
SELECT * FROM projects;

-- no3
ALTER TABLE certificates ADD COLUMN training_id INT DEFAULT NULL;
ALTER TABLE certificates ADD CONSTRAINT fk_training_id FOREIGN KEY (training_id) REFERENCES trainings(training_id);
DELIMITER //
CREATE PROCEDURE updateCertificatesPelatihan()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE training_id INT;
    DECLARE training_name VARCHAR(100);
    DECLARE issue_date DATE;
    DECLARE expiry_date DATE;
    DECLARE cur CURSOR FOR SELECT training_id, certificate_name FROM trainings;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO training_id, training_name;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Memeriksa apakah pelatihan ini sudah ada dalam tabel certificates
        IF NOT EXISTS (SELECT 1 FROM certificates WHERE certificate_name = training_name) THEN
            SET issue_date = CURDATE();
            SET expiry_date = DATE_ADD(issue_date, INTERVAL 3 YEAR);  -- Misal, masa berlaku sertifikat 3 tahun
            INSERT INTO certificates (employee_id, certificate_name, issue_date, expiry_date, training_id)
            SELECT employee_id, training_name, issue_date, expiry_date, training_id FROM employees;
        END IF;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
CALL updateCertificatesPelatihan();
SELECT * FROM certificates;
drop procedure updateCertificatesPelatihan;

-- no 4
-- mengirimkan notifikasi kepada semua karyawan mengenai pelatihan baru yang akan datang.
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