CREATE DATABASE rental_mobil;
USE rental_mobil;
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
('Kiki Andrian', 'Manager', '081234567892', 'kiki.andrian@gmail.com'),
('Lia Permata', 'Supervisor', '081298765434', 'lia.permata@gmail.com'),
('Mira Wijaya', 'Staff', '081212345680', 'mira.wijaya@gmail.com'),
('Nana Suhendra', 'Clerk', '081276543212', 'nana.suhendra@gmail.com'),
('Oka Saputra', 'Administrator', '081234098767', 'oka.saputra@gmail.com'),
('Putu Santoso', 'Manager', '081234567893', 'putu.santoso@gmail.com'),
('Ria Sari', 'Supervisor', '081298765435', 'ria.sari@gmail.com'),
('Sita Rahma', 'Staff', '081212345681', 'sita.rahma@gmail.com'),
('Tono Wirawan', 'Clerk', '081276543213', 'tono.wirawan@gmail.com'),
('Umi Hasanah', 'Administrator', '081234098768', 'umi.hasanah@gmail.com');

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
('Andi Wijaya', 'Jl. R.A. Kartini No. 8, Jakarta', '081355667788', 'andi.wijaya@gmail.com'),
('Bella Putri', 'Jl. Siliwangi No. 12, Bandung', '081367891234', 'bella.putri@gmail.com'),
('Cahyo Nugroho', 'Jl. Mangga Besar No. 17, Surabaya', '081312345679', 'cahyo.nugroho@gmail.com'),
('Dewi Anggraini', 'Jl. Letjen S. Parman No. 22, Medan', '081378945612', 'dewi.anggraini@gmail.com'),
('Edy Santoso', 'Jl. Slamet Riyadi No. 10, Yogyakarta', '081398765432', 'edy.santoso@gmail.com'),
('Fika Ramadhani', 'Jl. Buah Batu No. 33, Bandung', '081355667799', 'fika.ramadhani@gmail.com'),
('Gina Mahardika', 'Jl. Pemuda No. 15, Surabaya', '081312345680', 'gina.mahardika@gmail.com'),
('Haris Fadillah', 'Jl. Jend. Sudirman No. 5, Jakarta', '081367891235', 'haris.fadillah@gmail.com'),
('Ira Susanti', 'Jl. Diponegoro No. 25, Semarang', '081398765433', 'ira.susanti@gmail.com'),
('Jaka Pratama', 'Jl. Ahmad Yani No. 30, Malang', '081355667800', 'jaka.pratama@gmail.com');

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
('Hyundai', 'Creta', 2021, 'Putih', 850000.00, 'Tersedia'),
('Ford', 'Ranger', 2020, 'Hitam', 1000000.00, 'Dipinjam'),
('Kia', 'Seltos', 2019, 'Merah', 700000.00, 'Tersedia'),
('Chevrolet', 'Trailblazer', 2022, 'Abu-abu', 950000.00, 'Tersedia'),
('Mazda', 'CX-5', 2021, 'Biru', 900000.00, 'Dipinjam'),
('Jeep', 'Wrangler', 2020, 'Silver', 1300000.00, 'Tersedia'),
('Peugeot', '3008', 2019, 'Putih', 800000.00, 'Dipinjam'),
('Subaru', 'Forester', 2022, 'Hitam', 950000.00, 'Tersedia'),
('Volkswagen', 'Tiguan', 2021, 'Biru', 900000.00, 'Tersedia'),
('Audi', 'Q5', 2020, 'Coklat', 1400000.00, 'Dipinjam');

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
(1, '2023-09-10', 'Servis AC dan penggantian filter kabin', 500000.00),
(2, '2023-10-05', 'Pemeriksaan sistem transmisi dan penggantian oli transmisi', 650000.00),
(3, '2023-11-15', 'Penggantian lampu utama dan penyetelan lampu', 200000.00),
(4, '2023-12-20', 'Pemeriksaan dan servis sistem rem ABS', 850000.00),
(5, '2024-01-10', 'Penggantian wiper dan pengisian cairan pembersih', 150000.00),
(6, '2024-02-05', 'Penggantian knalpot dan pengecekan emisi', 700000.00),
(7, '2024-03-20', 'Penggantian filter bahan bakar dan servis injektor', 400000.00),
(8, '2024-04-15', 'Servis dan pemeriksaan sistem suspensi', 600000.00),
(9, '2024-05-10', 'Pemeriksaan dan penggantian baterai remote kunci', 100000.00),
(10, '2024-06-01', 'Penggantian kaca depan dan kalibrasi sensor', 1200000.00);

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
	(1, 1, 1, '2024-05-10', '2024-05-13', 1500000.00, 'Selesai'),
	(2, 2, 2, '2024-05-11', '2024-05-15', 3000000.00, 'Belum Selesai'),
	(3, 3, 3, '2024-05-12', '2024-05-12', 600000.00, 'Selesai'),
	(4, 4, 4, '2024-05-13', '2024-05-15', 1400000.00, 'Belum Selesai'),
	(5, 5, 5, '2024-05-14', '2023-05-16', 1100000.00, 'Belum Selesai'),
	(6, 6, 6, '2024-05-15', '2023-05-20', 3250000.00, 'Selesai'),
	(7, 7, 7, '2024-05-16', '2023-05-19', 2400000.00, 'Belum Selesai'),
	(8, 8, 8, '2024-05-17', '2023-05-21', 3600000.00, 'Selesai'),
	(9, 9, 9, '2024-05-19', '2023-05-23', 2800000.00, 'Belum Selesai'),
	(10, 10, 10, '2024-05-22', '2023-05-24', 2400000.00, 'Belum Selesai');
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
    (1, '2024-05-13', 1500000.00, 'Tunai'),
    (2, '2024-05-15', 1000000.00, 'Kartu Kredit'),
    (3, '2024-05-12', 600000.00, 'Transfer Bank'),
    (4, '2024-05-14', 700000.00, 'Tunai'),
    (5, '2024-05-17', 800000.00, 'Kartu Debit'),
    (6, '2024-05-20', 3250000.00, 'Transfer Bank'),
    (7, '2024-05-18', 2000000.00, 'Tunai'),
    (8, '2024-05-21', 3600000.00, 'Kartu Kredit'),
    (9, '2024-05-24', 2500000.00, 'Transfer Bank');
    -- (10, '2024-05-25', 2400000.00, 'Kartu Debit');
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
UPDATE transaksi SET status_transaksi='Selesai' WHERE id_transaksi = 7;
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
SELECT * FROM transaksi;

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
(3, '2024-05-24', 240000.00, 'Kartu Debit');
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
VALUES (1, 1, 7, '2024-05-13', '2024-05-15', 'Belum Selesai');
SELECT * FROM transaksi;
select * from mobil;


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
DELETE FROM transaksi WHERE id_transaksi = 19;

-- cek apakah trigger berjalan 
SELECT * FROM log_hapus_transaksi; 

