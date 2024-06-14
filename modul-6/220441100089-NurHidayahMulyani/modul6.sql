CREATE DATABASE OutsourcingCompany;
USE OutsourcingCompany;

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    client_company VARCHAR(100),
    start_date DATE,
    end_date DATE
);

INSERT INTO projects (project_id, project_name, client_company, start_date, end_date)
VALUES
(1, 'Project Pbo', 'Company A', '2024-01-01', '2024-09-01'),
(2, 'Project Pbw', 'Company B', '2022-07-01', '2024-05-29'),
(3, 'Project Manager', 'Company C', '2023-05-01', '2024-10-10'),
(4, 'Project Analyst', 'Company D', '2023-09-01', '2024-09-01'),
(5, 'Project Activity', 'Company E', '2023-01-01', '2024-11-01');
update projects set end_date = '2024-06-29' where project_id = 2;

CREATE TABLE employees (
    employee_id INT(11) PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50),
    salary FLOAT,
    date_hired DATE,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO employees (employee_id, name, position, salary, date_hired, project_id)
VALUES
    (1, 'Sukma', 'Programmer', 8000000.00, '2024-01-15', 1),
    (2, 'Nuha', 'Manajer Proyek', 10000000.00, '2022-03-10', 2),
    (3, 'Tya', 'Analisis Kualitas', 6500000.00, '2023-05-20', 3),
    (4, 'Ria', 'Desainer UI/UX', 8500000.00, '2024-07-05', 4),
    (5, 'Putri', 'Administrator Database', 9000000.00, '2023-02-28', 5);


CREATE TABLE certificates (
    certificate_id INT PRIMARY KEY auto_increment,
    employee_id INT,
    certificate_name VARCHAR(100),
    issue_date DATE,
    expiry_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date)
VALUES
    (1, 1, 'Pemrograman Java', '2023-03-15', '2023-03-15'),
    (2, 2, 'Manajemen Proyek Profesional', '2022-04-20', '2023-04-20'),
    (3, 3, 'Penguji Bersertifikasi ISTQB', '2023-07-01', '2023-07-01'),
    (4, 4, 'Fundamental Desain UI/UX', '2022-09-10', '2023-05-28'),
    (5, 5, 'Dasar-dasar Administrasi Database', '2023-04-05', '2025-06-05');
    
CREATE TABLE trainings (
    training_id INT PRIMARY KEY auto_increment,
    certificate_name VARCHAR(100),
    duration_in_months INT
);

INSERT INTO trainings (training_id, certificate_name, duration_in_months)
VALUES
    (1, 'Pengembangan Agile', 3),
    (2, 'Keterampilan Komunikasi', 2),
    (3, 'Perencanaan Proyek', 2),
    (4, 'Manajemen Database', 4),
    (5, 'Prinsip Desain UI/UX', 3);

CREATE TABLE notifications (
    notification_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    message TEXT,
    date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO notifications (notification_id, employee_id, message, date)
VALUES
    (1, 1, 'Pertemuan dijadwalkan ulang besok.', '2023-04-25'),
    (2, 2, 'Pengingat: Pertemuan tinjauan proyek hari ini.', '2024-06-05'),
    (3, 3, 'Sesi pelatihan tentang pengujian QA minggu depan.', '2023-06-15'),
    (4, 4, 'Desain baru diunggah untuk ditinjau.', '2024-09-20'),
    (5, 5, 'Pencadangan database dijadwalkan malam ini.', '2023-03-05');
    


CREATE TABLE companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    address TEXT
);

INSERT INTO companies (company_id, company_name, address)
VALUES
    (1, 'ABC Corp', '123 Jalan Utama, Surabaya, Indonesia'),
    (2, 'XYZ Inc', '456 Jalan Oak, Sidoarjo, Indonesia'),
    (3, 'LMN Co.', '789 Jalan Elm, Malang, Indonesia'),
    (4, 'PQR Ltd.', '321 Jalan Maple, Jombang, Indonesia'),
    (5, 'UVW Enterprises', '654 Jalan Pine, Kamal, Indonesia');
    

 
-- 1. Buatlah stored procedure yang memeriksa setiap karyawan dalam tabel employees. 
-- Jika karyawan sudah bekerja lebih dari satu tahun, tambahkan bonus sebesar 10% dari gaji mereka.
DELIMITER //
CREATE PROCEDURE bonus()
BEGIN
    SELECT name AS nama_pekerja, salary AS gaji, 
        CASE -- memeriksa
            WHEN date_hired <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) 
            THEN salary * 0.1
            ELSE 0 
        END AS bonus_gaji,
        CASE 
            WHEN date_hired <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) 
            THEN salary + salary * 0.1
            ELSE salary 
        END AS total_gaji
    FROM employees;
END //
DELIMITER ;
CALL bonus();
select*from employees;

-- 2. Buatlah stored procedure yang memeriksa setiap proyek dalam tabel projects. 
-- Jika proyek akan berakhir dalam waktu kurang dari satu bulan, perpanjang proyek selama tiga bulan.
DELIMITER //
CREATE PROCEDURE perpanjangProjek()
BEGIN
    DECLARE done INT DEFAULT 0; -- menandai akhir dari pengulangan cursor.
    DECLARE proj_id INT; -- menyimpan project_id dari tabel project
    DECLARE proj_tgl_akhir DATE;
    DECLARE new_tgl_akhir DATE;
    DECLARE cur CURSOR FOR SELECT project_id, end_date FROM projects WHERE end_date IS NOT NULL; -- mengambil
    -- ketika cursor tidak menemukan data lagi variabel done diatur menjadi 1.
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1; 

    OPEN cur;
    read_loop: LOOP -- Memulai loop yang akan membaca data dari cursor satu per satu.
        FETCH cur INTO proj_id, proj_tgl_akhir; -- Mengambil data dari cursor.
        IF done THEN -- Jika variabel done bernilai 1, keluar dari loop.
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
call perpanjangProjek();
SELECT * FROM projects;


-- 3. Buatlah stored procedure yang memeriksa dan memperbarui data pelatihan setiap karyawan. 
-- Jika ada pelatihan baru yang tersedia, tambahkan pelatihan tersebut ke dalam tabel certificates.
DELIMITER //
CREATE PROCEDURE updatesertif(
IN input_idemployee INT)
BEGIN
    DECLARE jmlsertif INT;  -- Menyimpan jumlah sertifikat yang dimiliki oleh karyawan.
    DECLARE tgl DATE;
    DECLARE new_cert_id INT;
    DECLARE new_training_id INT;
    
-- Menghitung berapa banyak sertifikat yang dimiliki oleh karyawan dengan employee_id yang diberikan dan menyimpannya ke dalam jmlsertif.
    SELECT COUNT(*) INTO jmlsertif FROM certificates WHERE employee_id = input_idemployee;
    SET tgl = CURDATE();

    IF jmlsertif > 0 THEN
        UPDATE certificates  -- Memperbarui tanggal kadaluarsa semua sertifikat karyawan yang sudah lewat dengan menambahkan satu tahun.
        SET expiry_date = ADDDATE(expiry_date, INTERVAL 1 YEAR)
        WHERE employee_id = input_idemployee AND expiry_date < tgl;
--         Jika ada baris yang diperbarui, lanjutkan untuk menambahkan pelatihan baru
        IF ROW_COUNT() > 0 THEN
            SELECT IFNULL(MAX(training_id), 0) + 1 INTO new_training_id FROM trainings; -- Menentukan ID pelatihan baru dengan mengambil ID tertinggi saat ini dan menambahkannya 1.
            INSERT INTO trainings (training_id, certificate_name, duration_in_months) VALUES
                (new_training_id, 'Sertifikasi Web Design', 5);--  Menambahkan pelatihan baru dengan nama 'Sertifikasi Web Design' dan durasi 5 bulan.
-- 	pesan konfirmasi
            SELECT CONCAT('Sertif untuk karyawan ', input_idemployee, ' sudah diupdate.') AS message;
			SELECT IFNULL(MAX(certificate_id), 0) + 1 INTO new_cert_id FROM certificates;
			INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date) VALUES
        (new_cert_id, input_idemployee, 'Sertifikasi Web Design', '2024-05-01', '2024-05-18');
        ELSE
            SELECT CONCAT('Tidak ada sertifikat karyawan ', input_idemployee, ' perlu diperbarui.') AS message;
        END IF;
    ELSE
        SELECT CONCAT('karyawan ', input_idemployee, ' tidak memiliki sertif.') AS message;
    END IF;
END //
DELIMITER ;
CALL updatesertif(3);
SELECT * FROM trainings;
SELECT * FROM certificates;


-- 4. Buatlah stored procedure yang mengirimkan notifikasi kepada semua karyawan 
-- mengenai pelatihan baru yang akan datang.
DELIMITER //

CREATE PROCEDURE kirimnotif()
BEGIN
    DECLARE max_id INT; -- menyimpan ID karyawan terbesar.
    DECLARE min_id INT;
    DECLARE current_id INT; --  menyimpan ID karyawan saat ini yang sedang diproses dalam loop.

 -- untuk mendapatkan ID karyawan terkecil dan terbesar dari tabel employees
    SELECT MIN(employee_id), MAX(employee_id) INTO min_id, max_id FROM employees;
    SET current_id = min_id; -- untuk memulai loop dari ID karyawan terkecil.

    WHILE current_id <= max_id DO
    --  memeriksa apakah karyawan dengan current_id ada dalam tabel employees.
        IF EXISTS (SELECT * FROM employees WHERE employee_id = current_id) THEN
            INSERT INTO notifications (employee_id, message, date)
            VALUES (current_id, 'Pelatihan baru akan segera dimulai. Silakan periksa jadwal Anda untuk detail lebih lanjut.', CURDATE());
        END IF;
        SET current_id = current_id + 1; -- untuk memperoses karyawan selanjutnya
    END WHILE;
    SELECT * FROM notifications;
END//
DELIMITER ;
CALL kirimnotif();
SELECT * FROM notifications;
