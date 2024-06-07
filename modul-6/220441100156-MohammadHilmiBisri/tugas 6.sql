CREATE DATABASE OutsourcingCompany;

USE OutsourcingCompany;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50),
    salary FLOAT,
    date_hired DATE,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    client_company VARCHAR(100),
    start_date DATE,
    end_date DATE
);

CREATE TABLE certificates (
    certificate_id INT PRIMARY KEY,
    employee_id INT,
    certificate_name VARCHAR(100),
    issue_date DATE,
    expiry_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE trainings (
    training_id INT PRIMARY KEY,
    certificate_name VARCHAR(100),
    duration_in_months INT
);

CREATE TABLE notifications (
    notification_id INT PRIMARY KEY,
    employee_id INT,
    message TEXT,
    date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    address TEXT
);

INSERT INTO employees (employee_id, name, position, salary, date_hired, project_id) VALUES (1, 'John Doe', 'Manager', 5000, '2022-01-01', 1), (2, 'Jane Smith', 'Developer', 3000, '2022-02-15', 1), (3, 'Mike Johnson', 'Analyst', 4000, '2022-03-10', 2), (4, 'Emily Brown', 'Designer', 3500, '2022-04-20', 2), (5, 'David Wilson', 'Tester', 2500, '2022-05-05', 3), (6, 'Sarah Davis', 'Developer', 3000, '2022-06-15', 3), (7, 'Michael Lee', 'Manager', 5000, '2022-07-01', 4), (8, 'Jennifer Clark', 'Analyst', 4000, '2022-08-10', 4), (9, 'Christopher Taylor', 'Designer', 3500, '2022-09-20', 5), (10, 'Jessica Martinez', 'Tester', 2500, '2022-10-05', 5);
INSERT INTO projects (project_id, project_name, client_company, start_date, end_date) VALUES (1, 'Project A', 'Company X', '2022-01-01', '2022-06-30'), (2, 'Project B', 'Company Y', '2022-02-15', '2022-07-31'), (3, 'Project C', 'Company Z', '2022-03-10', '2022-08-31'), (4, 'Project D', 'Company X', '2022-04-20', '2022-09-30'), (5, 'Project E', 'Company Y', '2022-05-05', '2022-10-31');
INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date) VALUES (1, 1, 'Certificate A', '2022-01-01', '2023-01-01'), (2, 2, 'Certificate B', '2022-02-15', '2023-02-15'), (3, 3, 'Certificate C', '2022-03-10', '2023-03-10'), (4, 4, 'Certificate D', '2022-04-20', '2023-04-20'), (5, 5, 'Certificate E', '2022-05-05', '2023-05-05');
INSERT INTO trainings (training_id, certificate_name, duration_in_months) VALUES (1, 'Training A', 3), (2, 'Training B', 6), (3, 'Training C', 9), (4, 'Training D', 12), (5, 'Training E', 15);
INSERT INTO notifications (notification_id, employee_id, message, date) VALUES (1, 1, 'Notification A', '2022-01-01'), (2, 2, 'Notification B', '2022-02-15'), (3, 3, 'Notification C', '2022-03-10'), (4, 4, 'Notification D', '2022-04-20'), (5, 5, 'Notification E', '2022-05-05');
INSERT INTO companies (company_id, company_name, address) VALUES (1, 'Company X', 'Address X'), (2, 'Company Y', 'Address Y'), (3, 'Company Z', 'Address Z');

DELIMITER //
CREATE PROCEDURE TambahBonusKepadaKaryawan()
BEGIN
    -- Deklarasi variabel
    DECLARE selesai INT DEFAULT FALSE;
    DECLARE idKaryawan INT;
    DECLARE tanggalDihire DATE;
    DECLARE gajiKaryawan FLOAT;
    DECLARE tahunBekerja INT;
    DECLARE jumlahBonus FLOAT;
    DECLARE tanggalSekarang DATE;
    
    -- Deklarasi cursor untuk mengambil data karyawan
    DECLARE kursorKaryawan CURSOR FOR
        SELECT employee_id, salary, date_hired
        FROM employees;
    
    -- Handler untuk menangani jika data tidak ditemukan
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET selesai = TRUE;

    -- Mengatur tanggal sekarang
    SET tanggalSekarang = CURDATE();

    -- Membuka cursor
    OPEN kursorKaryawan;

    -- Loop untuk membaca data karyawan
    baca_loop: LOOP
        -- Mengambil data karyawan dari cursor
        FETCH kursorKaryawan INTO idKaryawan, gajiKaryawan, tanggalDihire;

        -- Jika data tidak ditemukan, keluar dari loop
        IF selesai THEN
            LEAVE baca_loop;
        END IF;

        -- Menghitung tahun bekerja
        SET tahunBekerja = TIMESTAMPDIFF(YEAR, tanggalDihire, tanggalSekarang);

        -- Jika tahun bekerja lebih dari 1 tahun, tambahkan bonus
        IF tahunBekerja > 1 THEN
            SET jumlahBonus = gajiKaryawan * 0.1;

            -- Update gaji karyawan dengan tambahan bonus
            UPDATE employees
            SET salary = salary + jumlahBonus
            WHERE employee_id = idKaryawan;
        END IF;
    END LOOP;

    -- Menutup cursor
    CLOSE kursorKaryawan;
END //
DELIMITER ;
CALL TambahBonusKepadaKaryawan();
SELECT * FROM employees;

DELIMITER //
CREATE PROCEDURE PerpanjangProyek()
BEGIN
    -- Deklarasi variabel
    DECLARE selesai INT DEFAULT FALSE;
    DECLARE idProyek INT;
    DECLARE tanggalSelesaiProyek DATE;
    DECLARE hariHinggaSelesai INT;
    DECLARE tanggalBaruSelesai DATE;
    DECLARE tanggalSekarang DATE;
    DECLARE kursorProyek CURSOR FOR
        SELECT project_id, end_date
        FROM projects;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET selesai = TRUE;

    -- Mengatur tanggal sekarang
    SET tanggalSekarang = CURDATE();

    -- Membuka cursor
    OPEN kursorProyek;

    -- Loop untuk membaca data proyek
    baca_loop: LOOP
        -- Mengambil data proyek dari cursor
        FETCH kursorProyek INTO idProyek, tanggalSelesaiProyek;

        -- Jika data tidak ditemukan, keluar dari loop
        IF selesai THEN
            LEAVE baca_loop;
        END IF;

        -- Menghitung hari hingga selesai proyek
        SET hariHinggaSelesai = DATEDIFF(tanggalSelesaiProyek, tanggalSekarang);

        -- Jika hari hingga selesai kurang dari 30 hari, perpanjang tanggal selesai
        IF hariHinggaSelesai < 30 THEN
            SET tanggalBaruSelesai = DATE_ADD(tanggalSelesaiProyek, INTERVAL 3 MONTH);

            -- Update tanggal selesai proyek
            UPDATE projects
            SET end_date = tanggalBaruSelesai
            WHERE project_id = idProyek;
        END IF;
    END LOOP;

    -- Menutup cursor
    CLOSE kursorProyek;
END //
DELIMITER ;
CALL PerpanjangProyek();
SELECT * FROM projects;

DELIMITER //
CREATE PROCEDURE UpdatePelatihanKaryawan() -- Membuat prosedur baru dengan nama "UpdatePelatihanKaryawan"
BEGIN -- Mulai blok prosedur
        -- Declare variables
    DECLARE selesai INT DEFAULT FALSE;
    DECLARE idKaryawan INT;
    DECLARE idPelatihan INT;
    DECLARE namaPelatihan VARCHAR(100);
    DECLARE durasiPelatihan INT;
    DECLARE selesai2 INT DEFAULT FALSE;
    DECLARE ciai INT;

    -- Declare cursors
    DECLARE kursorKaryawan CURSOR FOR
        SELECT employee_id
        FROM employees;
    DECLARE kursorPelatihan CURSOR FOR
        SELECT training_id, certificate_name, duration_in_months
        FROM trainings;

    -- Declare handlers
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET selesai = TRUE , selesai2 = TRUE;


    SET ciai = (SELECT MAX(certificate_id) FROM certificates) + 1;
    -- Membuka cursor karyawan
    OPEN kursorKaryawan; -- Membuka cursor "kursorKaryawan" untuk digunakan

    -- Loop untuk membaca data karyawan
    baca_loop: LOOP -- Mulai loop dengan label "baca_loop"
        -- Mengambil data karyawan dari cursor
        FETCH kursorKaryawan INTO idKaryawan; -- Mengambil baris berikutnya dari cursor "kursorKaryawan" dan menyimpan id karyawan ke dalam variabel "idKaryawan"

        -- Jika data tidak ditemukan, keluar dari loop
        IF selesai THEN -- Jika variabel "selesai" bernilai TRUE...
            LEAVE baca_loop; -- ...keluar dari loop "baca_loop"
        END IF;

        -- Membuka cursor pelatihan
        OPEN kursorPelatihan; -- Membuka cursor "kursorPelatihan" untuk digunakan

        -- Loop untuk membaca data pelatihan
        baca_loop2: LOOP -- Mulai loop dengan label "baca_loop2"
            -- Mengambil data pelatihan dari cursor
            FETCH kursorPelatihan INTO idPelatihan, namaPelatihan, durasiPelatihan; -- Mengambil baris berikutnya dari cursor "kursorPelatihan" dan menyimpan id pelatihan, nama pelatihan, dan durasi pelatihan ke dalam variabel "idPelatihan", "namaPelatihan", dan "durasiPelatihan"

            -- Jika data tidak ditemukan, keluar dari loop
            IF selesai2 THEN -- Jika variabel "selesai2" bernilai TRUE...
                LEAVE baca_loop2; -- ...keluar dari loop "baca_loop2"
            END IF;

            -- Menambahkan sertifikat baru ke tabel certificates
            INSERT INTO certificates (certificate_id, employee_id, certificate_name, issue_date, expiry_date)
            VALUES (ciai, idKaryawan, namaPelatihan, CURDATE(), DATE_ADD(CURDATE(), INTERVAL durasiPelatihan MONTH)); 
            SET ciai = ciai + 1;
        END LOOP; -- Akhir dari loop "baca_loop2"

        -- Menutup cursor pelatihan
        CLOSE kursorPelatihan; -- Menutup cursor "kursorPelatihan"
    END LOOP; -- Akhir dari loop "baca_loop"

    -- Menutup cursor karyawan
    CLOSE kursorKaryawan; -- Menutup cursor "kursorKaryawan"
END // -- Akhir dari blok prosedur
DELIMITER ;
INSERT INTO trainings (training_id, certificate_name, duration_in_months) VALUES (6, 'Training F', 18), (7, 'Training G', 24);
CALL UpdatePelatihanKaryawan();
SELECT * FROM Certificates;


DELIMITER //
CREATE OR REPLACE PROCEDURE KirimNotifikasiPelatihanBaru()
BEGIN
    -- Deklarasi variabel
    DECLARE selesai INT DEFAULT FALSE;
    DECLARE idKaryawan INT;
    DECLARE niai INT;
    DECLARE pelatihanBaru TEXT;
    DECLARE semuapelatihan TEXT DEFAULT '';
    DECLARE kursorKaryawan CURSOR FOR
        SELECT employee_id
        FROM employees;
    DECLARE kursorPelatihan CURSOR FOR
        SELECT certificate_name
        FROM trainings;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET selesai = TRUE;

    SET niai = (SELECT MAX(notification_id) FROM notifications) + 1;

    -- Membuka cursor pelatihan
    OPEN kursorPelatihan;

    -- Loop untuk membaca data pelatihan
    baca_loop2: LOOP
        -- Mengambil data pelatihan dari cursor
        FETCH kursorPelatihan INTO pelatihanBaru;

        -- Jika data tidak ditemukan, keluar dari loop
        IF selesai THEN
            LEAVE baca_loop2;
        END IF;

        -- Menambahkan pelatihan baru ke daftar semua pelatihan
        SET semuapelatihan = CONCAT(semuapelatihan, ', ', pelatihanBaru);
    END LOOP;

    -- Menutup cursor pelatihan
    CLOSE kursorPelatihan;

    -- Reset selesai flag
    SET selesai = FALSE;

    -- Membuka cursor karyawan
    OPEN kursorKaryawan;

    -- Loop untuk membaca data karyawan
    baca_loop: LOOP
        -- Mengambil data karyawan dari cursor
        FETCH kursorKaryawan INTO idKaryawan;

        -- Jika data tidak ditemukan, keluar dari loop
        IF selesai THEN
            LEAVE baca_loop;
        END IF;

        -- Menambahkan notifikasi pelatihan baru ke tabel notifications
        INSERT INTO notifications (notification_id, employee_id, message, date)
        VALUES (niai, idKaryawan, CONCAT('Pelatihan baru yang akan datang: ', semuapelatihan), CURDATE());
        SET niai = niai + 1;
    END LOOP;

    -- Menutup cursor karyawan
    CLOSE kursorKaryawan;
END //
DELIMITER ;
CALL KirimNotifikasiPelatihanBaru();
SELECT * FROM notifications;
INSERT INTO trainings (training_id, certificate_name, duration_in_months)
VALUES ('9','Nama Sertifikat', '2');