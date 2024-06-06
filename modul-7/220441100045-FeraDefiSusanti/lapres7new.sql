CREATE DATABASE rental_mobil;
USE rental_mobil;

CREATE TABLE pegawai(
	id_pegawai INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nama VARCHAR (50) NOT NULL,
	jabatan VARCHAR (50) NOT NULL,
	no_telepon VARCHAR (15)NOT NULL,
	email VARCHAR (50) NOT NULL 
);
DESC pegawai;

INSERT INTO pegawai (nama, jabatan, no_telepon, email) VALUES
('Rizky Putra', 'Manager', '081234567890', 'rizky.putra@email.com'),
('Salsabila Aulia', 'HRD', '081234567891', 'salsabila.aulia@email.com'),
('Rizwan Akbar', 'Sales', '081234567892', 'rizwan.akbar@email.com'),
('Aulia Zahra', 'Marketing', '081234567893', 'aulia.zahra@email.com'),
('Fikri Fajar', 'IT Support', '081234567894', 'fikri.fajar@email.com'),
('Naufal Adrian', 'Developer', '081234567895', 'naufal.adrian@email.com'),
('Farah Nabila', 'Designer', '081234567896', 'farah.nabila@email.com'),
('Daffa Pratama', 'Finance', '081234567897', 'daffa.pratama@email.com'),
('Kayla Anindya', 'Customer Service', '081234567898', 'kayla.anindya@email.com'),
('Zaki Haidar', 'Operational', '081234567899', 'zaki.haidar@email.com');
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
('Alif Rizki', 'Jl. Kebon Jeruk No. 15, Jakarta', '081234567900', 'alif.rizki@email.com'),
('Dinda Maharani', 'Jl. Malioboro No. 22, Yogyakarta', '081234567901', 'dinda.maharani@email.com'),
('Gilang Permana', 'Jl. Braga No. 30, Bandung', '081234567902', 'gilang.permana@email.com'),
('Nadia Rahma', 'Jl. Darmo No. 45, Surabaya', '081234567903', 'nadia.rahma@email.com'),
('Fahri Hidayat', 'Jl. Sudirman No. 50, Medan', '081234567904', 'fahri.hidayat@email.com'),
('Intan Sari', 'Jl. Diponegoro No. 60, Semarang', '081234567905', 'intan.sari@email.com'),
('Rangga Pratama', 'Jl. Merdeka No. 70, Makassar', '081234567906', 'rangga.pratama@email.com'),
('Siska Amelia', 'Jl. Panglima Polim No. 80, Malang', '081234567907', 'siska.amelia@email.com'),
('Yoga Saputra', 'Jl. Ahmad Yani No. 90, Denpasar', '081234567908', 'yoga.saputra@email.com'),
('Tasya Dewi', 'Jl. Hasanuddin No. 100, Palembang', '081234567909', 'tasya.dewi@email.com');
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
('Toyota', 'Avanza', 2020, 'Putih', 500000.00, 'Tersedia'),
('Honda', 'Civic', 2019, 'Hitam', 750000.00, 'Tersedia'),
('Suzuki', 'Ertiga', 2021, 'Merah', 550000.00, 'Tersedia'),
('Mitsubishi', 'Pajero', 2018, 'Abu-abu', 1000000.00, 'Tersedia'),
('Daihatsu', 'Xenia', 2020, 'Biru', 500000.00, 'Tersedia'),
('Nissan', 'Juke', 2019, 'Putih', 700000.00, 'Dipinjam'),
('Kia', 'Seltos', 2021, 'Hitam', 800000.00, 'Dipinjam'),
('Hyundai', 'Santa Fe', 2018, 'Merah', 950000.00, 'Dipinjam'),
('Mazda', 'CX-5', 2020, 'Putih', 850000.00, 'Dipinjam'),
('Ford', 'Everest', 2019, 'Hitam', 900000.00, 'Dipinjam');
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
(1, '2024-01-15', 'Penggantian oli mesin', 300000.00),
(2, '2023-02-10', 'Penggantian kampas rem', 250000.00),
(3, '2023-03-05', 'Servis rutin', 500000.00),
(4, '2022-04-20', 'Penggantian ban', 1200000.00),
(5, '2023-05-18', 'Penggantian aki', 800000.00),
(6, '2024-06-25', 'Pembersihan sistem AC', 150000.00),
(7, '2023-07-30', 'Pengecekan rem dan kopling', 200000.00),
(8, '2024-08-22', 'Penggantian filter udara', 100000.00),
(9, '2022-09-14', 'Penggantian wiper', 75000.00),
(10, '2023-10-10', 'Penggantian lampu depan', 180000.00);
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
INSERT INTO transaksi (id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_Selesai, total_biaya, status_transaksi) VALUES
(1, 1, 1, '2024-05-01', '2024-05-03', 1500000.00, 'Selesai'), -- Avanza, 3 hari
(2, 3, 3, '2024-05-02', '2024-05-05', 1650000.00, 'Selesai'), -- Ertiga, 4 hari
(3, 5, 5, '2024-05-03', '2024-05-06', 1500000.00, 'Selesai'), -- Xenia, 3 hari
(4, 7, 7, '2024-05-04', '2024-05-07', 2400000.00, 'Selesai'), -- Seltos, 3 hari
(5, 9, 9, '2024-05-05', '2024-05-07', 1700000.00, 'Selesai'), -- CX-5, 2 hari
(6, 2, 2, '2024-05-06', '2024-05-06', 750000.00, 'Belum Selesai'), -- Civic, 1 hari
(7, 4, 4, '2024-05-07', '2024-05-08', 1000000.00, 'Belum Selesai'), -- Pajero, 1 hari
(8, 6, 6, '2024-05-08', '2024-05-09', 700000.00, 'Belum Selesai'), -- Juke, 1 hari
(9, 8, 8, '2024-05-09', '2024-05-09', 950000.00, 'Belum Selesai'), -- Santa Fe, 1 hari
(10, 10, 10, '2024-05-10', '2024-05-12', 2700000.00, 'Belum Selesai'); -- Everest, 2 hari

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
(1, '2024-05-03', 1500000.00, 'Transfer Bank'),
(2, '2024-05-05', 1650000.00, 'Kartu Kredit'),
(3, '2024-05-06', 1500000.00, 'Tunai'),
(4, '2024-05-07', 2400000.00, 'Transfer Bank'),
(5, '2024-05-07', 1700000.00, 'Kartu Kredit'),
(6, '2024-05-06', 750000.00, 'Tunai'),
(7, '2024-05-07', 1000000.00, 'Transfer Bank'),
(8, '2024-05-08', 700000.00, 'Kartu Debit'),
(9, '2024-05-09', 950000.00, 'Tunai'),
(10, '2024-05-12', 2700000.00, 'Transfer Bank');
SELECT * FROM pembayaran;

-- NOMOR1 after_update_transaksi memperbarui status mobil tersedia saat status transaksi berubah menjadi selesai!--
DELIMITER //
CREATE TRIGGER after_update_transaksi
AFTER UPDATE ON transaksi 
FOR EACH ROW  -- mengatur baris
BEGIN
    IF NEW.status_transaksi = 'Selesai' THEN
        UPDATE mobil
        SET STATUS = 'Tersedia'
        WHERE id_mobil = NEW.id_mobil;
    END IF;
END //
DELIMITER ;
UPDATE transaksi SET status_transaksi='Selesai' WHERE id_transaksi = 10;
SELECT * FROM transaksi;
SELECT * FROM mobil;
drop trigger after_update_transaksi;
show triggers;

-- NOMOR2 after_insert_pembayaran mencatat log pembayaran ke dalam tabel log_pembayaran -- 
-- tabel log pembayaran
CREATE TABLE log_pembayaran (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_pembayaran INT NOT NULL,
    id_transaksi INT NOT NULL,
    tanggal_pembayaran DATE NOT NULL,
    jumlah_pembayaran DECIMAL(10, 2) NOT NULL,
    metode_pembayaran VARCHAR(50) NOT NULL,
    TIMESTAMP TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- mengatur data waktu
);
DESC log_pembayaran;

-- triger after_insert_pembayaran
DELIMITER //
CREATE TRIGGER after_insert_pembayaran
	AFTER INSERT 
	ON pembayaran
	FOR EACH ROW
BEGIN 
	INSERT INTO log_pembayaran (id_pembayaran,id_transaksi,tanggal_pembayaran,jumlah_pembayaran,metode_pembayaran)
	VALUES (new.id_pembayaran,new.id_transaksi,new.tanggal_pembayaran,new.jumlah_pembayaran,new.metode_pembayaran);
END //
DELIMITER ;
INSERT INTO pembayaran (id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran) VALUES 
(11, '2024-05-10', 550000.00, 'tunai');
SELECT * FROM pembayaran;
SELECT * FROM log_pembayaran;

-- NOMOR3 before_insert_transaksi yang akan menghitung total biaya sewa secara otomatis--
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
    SET jumlah_hari = DATEDIFF(new.tanggal_selesai, new.tanggal_mulai); -- update tgl

    -- Menghitung total biaya
    SET new.total_biaya = harga_per_hari * jumlah_hari;
END //
DELIMITER ;
INSERT INTO transaksi (id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, status_transaksi) 
VALUES (10, 1, 7, '2024-05-25', '2024-05-28', 'Belum Selesai');
SELECT * FROM transaksi;
select * from mobil;


-- NOMOR4 before_insert_transaksi yang akan menghitung total biaya sewa secara otomatis--
-- tabel log_hapus_transaksi
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

-- triger after_delete_transaksi
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
 DELETE FROM pembayaran WHERE id_transaksi = 1;
  DELETE FROM transaksi WHERE id_transaksi = 1;
-- cek apakah trigger berjalan 
SELECT * FROM log_hapus_transaksi; 
