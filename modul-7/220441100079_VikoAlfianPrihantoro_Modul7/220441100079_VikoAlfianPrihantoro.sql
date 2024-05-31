CREATE DATABASE db_modul7;
USE db_modul7;
DROP DATABASE rental_mobil;

CREATE TABLE pegawai(
	id_pegawai INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nama VARCHAR (50) NOT NULL,
	jabatan VARCHAR (50) NOT NULL,
	no_telepon VARCHAR (15)NOT NULL,
	email VARCHAR (50) NOT NULL 
);
DESC pegawai;

INSERT INTO pegawai (nama, jabatan, no_telepon, email) VALUES
    ('Ahmad Kurniawan', 'Manager', '081300123456', 'ahmad.kurniawan@gmail.com'),
    ('Bambang Hartono', 'Supervisor', '081399876543', 'bambang.hartono@gmail.com'),
    ('Cici Nurhaliza', 'Staff', '081312345678', 'cici.nurhaliza@gmail.com'),
    ('Dian Prasetyo', 'Clerk', '081376543210', 'dian.prasetyo@gmail.com'),
    ('Endang Sulastri', 'Administrator', '081300987654', 'endang.sulastri@gmail.com'),
    ('Farhan Maulana', 'Manager', '081300123457', 'farhan.maulana@gmail.com'),
    ('Gilang Pratama', 'Supervisor', '081399876544', 'gilang.pratama@gmail.com'),
    ('Hana Setiawati', 'Staff', '081312345679', 'hana.setiawati@gmail.com'),
    ('Iqbal Ramadhan', 'Clerk', '081376543211', 'iqbal.ramadhan@gmail.com'),
    ('Junaidi Haryanto', 'Administrator', '081300987655', 'junaidi.haryanto@gmail.com');
SELECT * FROM pegawai;

CREATE TABLE pelanggan (
	id_pelanggan INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nama VARCHAR (100) NOT NULL,
	alamat TEXT NOT NULL,
	no_telepon VARCHAR (15)NOT NULL,
	email VARCHAR (50) NOT NULL 
);
DESC pelanggan;

INSERT INTO pelanggan (nama, alamat, no_telepon, email) VALUES
    ('Adi Saputra', 'Jl. Kebon Jeruk No. 10, Jakarta', '081345678901', 'adi.saputra@gmail.com'),
    ('Bayu Pratama', 'Jl. Pasir Koja No. 15, Bandung', '081398765432', 'bayu.pratama@gmail.com'),
    ('Cindy Anggraeni', 'Jl. Basuki Rahmat No. 20, Surabaya', '081323456789', 'cindy.anggraeni@gmail.com'),
    ('Dina Maharani', 'Jl. Sisingamangaraja No. 25, Medan', '081376543210', 'dina.maharani@gmail.com'),
    ('Eris Kurniawan', 'Jl. Malioboro No. 5, Yogyakarta', '081345098765', 'eris.kurniawan@gmail.com'),
    ('Fauzan Arifin', 'Jl. Cihampelas No. 30, Bandung', '081345678902', 'fauzan.arifin@gmail.com'),
    ('Gilang Saputra', 'Jl. Pemuda No. 35, Surabaya', '081398765434', 'gilang.saputra@gmail.com'),
    ('Hilda Nuraini', 'Jl. Mangga Besar No. 40, Jakarta', '081323456780', 'hilda.nuraini@gmail.com'),
    ('Iqbal Fadillah', 'Jl. Dr. Sutomo No. 45, Semarang', '081376543212', 'iqbal.fadillah@gmail.com'),
    ('Julianto Santoso', 'Jl. Pahlawan No. 50, Malang', '081345098766', 'julianto.santoso@gmail.com');

SELECT * FROM pelanggan;

CREATE TABLE mobil (
	id_mobil INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	merk VARCHAR (50) NOT NULL,
	model VARCHAR (50) NOT NULL,
	tahun INT (11) NOT NULL,
	warna VARCHAR (20) NOT NULL,
	harga_sewa DECIMAL (10,2) NOT NULL,
	STATUS ENUM ('Dipinjam','Tersedia')
);
DESC mobil;

INSERT INTO mobil (merk, model, tahun, warna, harga_sewa, STATUS) VALUES
    ('Hyundai', 'Santa Fe', 2023, 'Putih', 1500000.00, 'Tersedia'),
    ('Kia', 'Seltos', 2021, 'Merah', 700000.00, 'Dipinjam'),
    ('Ford', 'Everest', 2020, 'Biru', 1200000.00, 'Tersedia'),
    ('Chevrolet', 'Trailblazer', 2022, 'Hitam', 1300000.00, 'Dipinjam'),
    ('Mazda', 'CX-5', 2021, 'Abu-abu', 900000.00, 'Tersedia'),
    ('BMW', 'X1', 2023, 'Silver', 2000000.00, 'Dipinjam'),
    ('Mercedes-Benz', 'GLA', 2022, 'Putih', 2200000.00, 'Tersedia'),
    ('Audi', 'Q5', 2020, 'Hitam', 2300000.00, 'Dipinjam'),
    ('Volkswagen', 'Tiguan', 2021, 'Merah', 1800000.00, 'Tersedia'),
    ('Lexus', 'NX', 2022, 'Biru', 2500000.00, 'Tersedia');
SELECT * FROM mobil;


CREATE TABLE perawatan (
	id_perawatan INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	id_mobil INT (11)NOT NULL ,
	tanggal DATE NOT NULL,
	deskripsi TEXT NOT NULL ,
	biaya DECIMAL (10,2) NOT NULL,
	FOREIGN KEY (id_mobil)REFERENCES mobil(id_mobil)
);
DESC perawatan;

INSERT INTO perawatan (id_mobil, tanggal, deskripsi, biaya) VALUES
    (1, '2024-01-20', 'Ganti oli dan servis transmisi', 350000.00),
    (2, '2024-02-15', 'Penggantian baterai dan pemeriksaan sistem kelistrikan', 1600000.00),
    (3, '2024-03-05', 'Perbaikan suspensi dan pengecekan roda', 550000.00),
    (4, '2024-04-10', 'Servis berkala dan penggantian filter bahan bakar', 750000.00),
    (5, '2024-05-18', 'Penggantian oli transmisi dan pemeriksaan sistem rem', 1300000.00),
    (6, '2024-06-12', 'Ganti oli mesin dan pemeriksaan emisi', 450000.00),
    (7, '2024-06-22', 'Penggantian kampas rem dan servis sistem pengereman', 850000.00),
    (8, '2024-07-08', 'Pemeriksaan rutin dan penggantian sabuk pengaman', 650000.00),
    (9, '2024-07-18', 'Penggantian per dan penyetelan suspensi', 950000.00),
    (10, '2024-08-05', 'Pemeriksaan sistem pendingin dan penggantian termostat', 800000.00);
SELECT * FROM perawatan;


CREATE TABLE transaksi (
	id_transaksi INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	id_pelanggan INT (11) NOT NULL,
	id_mobil INT (11) NOT NULL,
	id_pegawai INT (11) NOT NULL,
	tanggal_mulai DATE NOT NULL,
	tanggal_Selesai DATE NOT NULL,
	total_biaya DECIMAL (10,2) NOT NULL,
	status_transaksi ENUM ('Belum Selesai','Selesai') NOT NULL,
	FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
	FOREIGN KEY (id_mobil) REFERENCES mobil(id_mobil),
	FOREIGN KEY (id_pegawai) REFERENCES pegawai(id_pegawai)
);
DESC transaksi;

INSERT INTO transaksi (id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, total_biaya, status_transaksi) VALUES
    (1, 1, 1, '2024-06-01', '2024-06-05', 2000000.00, 'Selesai'),
    (2, 2, 2, '2024-06-02', '2024-06-06', 3200000.00, 'Belum Selesai'),
    (3, 3, 3, '2024-06-03', '2024-06-03', 700000.00, 'Selesai'),
    (4, 4, 4, '2024-06-04', '2024-06-07', 1600000.00, 'Belum Selesai'),
    (5, 5, 5, '2024-06-05', '2024-06-08', 1200000.00, 'Belum Selesai'),
    (6, 6, 6, '2024-06-06', '2024-06-10', 3500000.00, 'Selesai'),
    (7, 7, 7, '2024-06-07', '2024-06-10', 2500000.00, 'Belum Selesai'),
    (8, 8, 8, '2024-06-08', '2024-06-12', 3800000.00, 'Selesai'),
    (9, 9, 9, '2024-06-09', '2024-06-13', 3000000.00, 'Belum Selesai'),
    (10, 10, 10, '2024-06-10', '2024-06-14', 2600000.00, 'Belum Selesai');
SELECT * FROM transaksi;


CREATE TABLE pembayaran (
	id_pembayaran INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	id_transaksi INT(11) NOT NULL,
	tanggal_pembayaran DATE NOT NULL,
	jumlah_pembayaran DECIMAL (10,2),
	metode_pembayaran VARCHAR (50),
	FOREIGN KEY (id_transaksi) REFERENCES transaksi (id_transaksi)
);
DESC pembayaran;

INSERT INTO pembayaran (id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran) VALUES
    (1, '2024-06-05', 2000000.00, 'Transfer Bank'),
    (2, '2024-06-06', 3200000.00, 'Kartu Kredit'),
    (3, '2024-06-03', 700000.00, 'Tunai'),
    (4, '2024-06-07', 1600000.00, 'Kartu Debit'),
    (5, '2024-06-08', 1200000.00, 'Kartu Kredit'),
    (6, '2024-06-10', 3500000.00, 'Transfer Bank'),
    (7, '2024-06-10', 2500000.00, 'Tunai'),
    (8, '2024-06-12', 3800000.00, 'Kartu Kredit'),
    (9, '2024-06-13', 3000000.00, 'Transfer Bank'),
    (10, '2024-06-14', 2600000.00, 'Kartu Debit');
SELECT * FROM pembayaran;


-- NOMOR1--
DELIMITER //
CREATE TRIGGER after_update_transaksi
AFTER UPDATE ON transaksi
FOR EACH ROW
BEGIN
    IF NEW.status_transaksi = 'Selesai' THEN
        UPDATE mobil
        SET STATUS = 'Tersedia'
        WHERE id_mobil = NEW.id_mobil;
    END IF;
END //
DELIMITER ;
UPDATE transaksi SET status_transaksi='Selesai' WHERE id_transaksi = 1;
SELECT * FROM transaksi;
SELECT * FROM mobil;


-- NOMOR2-- 
CREATE TABLE log_pembayaran (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_pembayaran INT NOT NULL,
    id_transaksi INT NOT NULL,
    tanggal_pembayaran DATE NOT NULL,
    jumlah_pembayaran DECIMAL(10, 2) NOT NULL,
    metode_pembayaran VARCHAR(50) NOT NULL,
    TIMESTAMP TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DESC log_pembayaran;
SELECT * FROM pembayaran;
`log_pembayaran`

DELIMITER //
CREATE TRIGGER after_insert_pembayaran
	AFTER INSERT 
	ON pembayaran
	FOR EACH ROW
BEGIN 
	-- select * from log_pembayaran
	INSERT INTO log_pembayaran (id_pembayaran,id_transaksi,tanggal_pembayaran,jumlah_pembayaran,metode_pembayaran)
	VALUES (new.id_pembayaran,new.id_transaksi,new.tanggal_pembayaran,new.jumlah_pembayaran,new.metode_pembayaran);
END //
DELIMITER ;
INSERT INTO pembayaran (id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran) VALUES 
(10, '2024-05-24', 240000.00, 'Kartu Debit');
SELECT * FROM pembayaran;
SELECT * FROM log_pembayaran;


-- NOMOR3--
 DELIMITER //
CREATE TRIGGER before_insert_transaksi
BEFORE INSERT ON transaksi
FOR EACH ROW
BEGIN
    DECLARE harga_per_hari DECIMAL(10, 2);
    DECLARE jumlah_hari INT;

    -- Mendapatkan harga sewa per hari dari tabel mobil
    SELECT harga_sewa INTO harga_per_hari
    FROM mobil
    WHERE id_mobil = new.id_mobil;

    -- Menghitung jumlah hari sewa
    SET jumlah_hari = DATEDIFF(new.tanggal_selesai, new.tanggal_mulai);

    -- Menghitung total biaya
    SET new.total_biaya = harga_per_hari * jumlah_hari;
END //
DELIMITER ;
INSERT INTO transaksi (id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, status_transaksi) 
VALUES (10, 10, 7, '2024-05-25', '2024-05-28', 'Belum Selesai');
SELECT * FROM transaksi;


-- NOMOR4--
CREATE TABLE log_hapus_transaksi (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_transaksi INT NOT NULL,
    id_pelanggan INT NOT NULL,
    id_mobil INT NOT NULL,
    tanggal_mulai DATE NOT NULL,
    tanggal_selesai DATE NOT NULL,
    total_biaya DECIMAL(10, 2) NOT NULL,
    TIMESTAMP TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DESC log_hapus_transaksi;
SELECT * FROM log_hapus_transaksi;

DELIMITER //
CREATE TRIGGER after_delete_transaksi
AFTER DELETE ON transaksi
FOR EACH ROW
BEGIN
    INSERT INTO log_hapus_transaksi (id_transaksi, id_pelanggan, id_mobil, tanggal_mulai, tanggal_selesai, total_biaya)
    VALUES (OLD.id_transaksi, OLD.id_pelanggan, OLD.id_mobil, OLD.tanggal_mulai, OLD.tanggal_selesai, OLD.total_biaya);
END //
DELIMITER ;
SELECT * FROM transaksi; -- dapat id 11

-- hapus data tranksasi id 11
DELETE FROM transaksi WHERE id_transaksi = 11;

-- cek apakah trigger berjalan 
SELECT * FROM log_hapus_transaksi; 

