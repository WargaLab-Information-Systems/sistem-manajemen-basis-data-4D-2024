CREATE DATABASE rentalmobil;
USE rentalmobil;

CREATE TABLE mobil (
id_mobil INT PRIMARY KEY,
merk VARCHAR (50),
model VARCHAR (50),
tahun INT (11),
warna VARCHAR (20),
harga_sewa DECIMAL (10,2),
STATUS ENUM ('Dipinjam','Tersedia')
);

INSERT INTO mobil (id_mobil, merk, model, tahun, warna, harga_sewa, status) VALUES
(1, 'Toyota', 'Avanza', 2020, 'Putih', 5000000.00, 'Tersedia'),
(2, 'Honda', 'Civic', 2019, 'Hitam', 7500000.00, 'Dipinjam'),
(3, 'Suzuki', 'Ertiga', 2021, 'Merah', 5500000.00, 'Tersedia'),
(4, 'Mitsubishi', 'Pajero', 2018, 'Silver', 10000000.00, 'Dipinjam'),
(5, 'Nissan', 'X-Trail', 2017, 'Abu-Abu', 9000000.00, 'Tersedia'),
(6, 'Daihatsu', 'Terios', 2022, 'Biru', 6000000.00, 'Tersedia'),
(7, 'BMW', 'X5', 2021, 'Putih', 15000000.00, 'Dipinjam'),
(8, 'Mercedes-Benz', 'GLC', 2020, 'Hitam', 20000000.00, 'Tersedia'),
(9, 'Hyundai', 'Santa Fe', 2019, 'Merah', 8500000.00, 'Dipinjam'),
(10, 'Kia', 'Seltos', 2021, 'Kuning', 7000000.00, 'Tersedia');

CREATE TABLE perawatan (
id_perawatan INT (11) PRIMARY KEY,
id_mobil INT (11),
tanggal DATE,
deskripsi TEXT,
biaya DECIMAL (10,2),
FOREIGN KEY (id_mobil)REFERENCES mobil(id_mobil)
);

INSERT INTO perawatan (id_perawatan, id_mobil, tanggal, deskripsi, biaya) VALUES
(11, 1, '2024-01-15', 'Ganti oli mesin', 200000.00),
(12, 2, '2024-02-20', 'Perbaikan rem', 350000.00),
(13, 3, '2024-03-05', 'Servis rutin', 500000.00),
(14, 4, '2024-04-10', 'Ganti ban', 800000.00),
(15, 5, '2024-05-12', 'Perbaikan AC', 400000.00),
(16, 6, '2024-06-17', 'Ganti aki', 250000.00),
(17, 7, '2024-07-22', 'Perbaikan transmisi', 1500000.00),
(18, 8, '2024-08-18', 'Perbaikan suspensi', 600000.00),
(19, 9, '2024-09-25', 'Servis besar', 1000000.00),
(20, 10, '2024-10-30', 'Ganti lampu depan', 150000.00);

CREATE TABLE pelanggan (
id_pelanggan INT (11) PRIMARY KEY,
nama VARCHAR (100),
alamat TEXT,
no_telepon VARCHAR (15),
email VARCHAR (50) 
);

INSERT INTO pelanggan (id_pelanggan, nama, alamat, no_telepon, email) VALUES
(21, 'Ahmad Fauzi', 'Jl. Merdeka No. 123, Jakarta', '081234567890', 'ahmad.fauzi@example.com'),
(22, 'Budi Santoso', 'Jl. Sudirman No. 456, Bandung', '081234567891', 'budi.santoso@example.com'),
(23, 'Citra Lestari', 'Jl. Thamrin No. 789, Surabaya', '081234567892', 'citra.lestari@example.com'),
(24, 'Dewi Sartika', 'Jl. Diponegoro No. 321, Medan', '081234567893', 'dewi.sartika@example.com'),
(25, 'Eko Wijaya', 'Jl. Ahmad Yani No. 654, Yogyakarta', '081234567894', 'eko.wijaya@example.com'),
(26, 'Fajar Hidayat', 'Jl. Gatot Subroto No. 987, Semarang', '081234567895', 'fajar.hidayat@example.com'),
(27, 'Gina Rahmawati', 'Jl. Pemuda No. 147, Malang', '081234567896', 'gina.rahmawati@example.com'),
(28, 'Hendra Saputra', 'Jl. Pahlawan No. 258, Denpasar', '081234567897', 'hendra.saputra@example.com'),
(29, 'Ika Putri', 'Jl. Gajah Mada No. 369, Makassar', '081234567898', 'ika.putri@example.com'),
(30, 'Joko Susilo', 'Jl. Dipatiukur No. 741, Palembang', '081234567899', 'joko.susilo@example.com');

CREATE TABLE pegawai(
id_pegawai INT (11) PRIMARY KEY,
nama VARCHAR (50),
jabatan VARCHAR (50),
no_telepon VARCHAR (15),
email VARCHAR (50)
);

INSERT INTO pegawai (id_pegawai, nama, jabatan, no_telepon, email) VALUES
(31, 'Andi Wijaya', 'Manager', '081234567900', 'andi.wijaya@example.com'),
(32, 'Budi Prasetyo', 'Supervisor', '081234567901', 'budi.prasetyo@example.com'),
(33, 'Cindy Lestari', 'Admin', '081234567902', 'cindy.lestari@example.com'),
(34, 'Dani Ramadhan', 'Staff', '081234567903', 'dani.ramadhan@example.com'),
(35, 'Eka Putra', 'Staff', '081234567904', 'eka.putra@example.com'),
(36, 'Fifi Amelia', 'HRD', '081234567905', 'fifi.amelia@example.com'),
(37, 'Gilang Mahendra', 'Marketing', '081234567906', 'gilang.mahendra@example.com'),
(38, 'Hana Sari', 'Finance', '081234567907', 'hana.sari@example.com'),
(39, 'Indra Kurniawan', 'IT Support', '081234567908', 'indra.kurniawan@example.com'),
(40, 'Joko Nugroho', 'Driver', '081234567909', 'joko.nugroho@example.com');

CREATE TABLE transaksi (
id_transaksi INT (11) PRIMARY KEY,
id_pelanggan INT (11),
id_mobil INT (11),
id_pegawai INT (11),
tanggal_mulai DATE,
tanggal_Selesai DATE,
total_biaya DECIMAL (10,2),
status_transaksi ENUM ('Belum Selesai','Selesai'),
FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
FOREIGN KEY (id_mobil) REFERENCES mobil(id_mobil),
FOREIGN KEY (id_pegawai) REFERENCES pegawai(id_pegawai)
);

INSERT INTO transaksi (id_transaksi, id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, total_biaya, status_transaksi) VALUES
(41, 21, 1, 31, '2024-01-01', '2024-01-05', 2000000.00, 'Belum Selesai'),
(42, 22, 2, 32, '2024-01-10', '2024-01-15', 3750000.00, 'Belum Selesai'),
(43, 23, 3, 33, '2024-01-20', '2024-01-25', 2750000.00, 'Selesai'),
(44, 24, 4, 34, '2024-02-01', '2024-02-05', 5000000.00, 'Selesai'),
(45, 25, 5, 35, '2024-02-10', '2024-02-15', 4500000.00, 'Selesai'),
(46, 26, 6, 36, '2024-02-20', '2024-02-25', 3000000.00, 'Selesai'),
(47, 27, 7, 37, '2024-03-01', '2024-03-05', 7500000.00, 'Belum Selesai'),
(48, 28, 8, 38, '2024-03-10', '2024-03-15', 10000000.00, 'Belum Selesai'),
(49, 29, 9, 39, '2024-03-20', '2024-03-25', 4250000.00, 'Selesai'),
(50, 30, 10, 40, '2024-04-01', '2024-04-05', 3500000.00, 'Selesai');
 drop table transaksi;
 drop table pembayaran;
CREATE TABLE pembayaran (
id_pembayaran INT (11) PRIMARY KEY,
id_transaksi INT(11),
tanggal_pembayaran DATE,
jumlah_pembayaran DECIMAL (10,2),
metode_pembayaran VARCHAR (50),
FOREIGN KEY (id_transaksi) REFERENCES transaksi (id_transaksi)
);

INSERT INTO pembayaran (id_pembayaran, id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran) VALUES
(51, 41, '2024-01-01', 2000000.00, 'Transfer Bank'),
(52, 42, '2024-01-10', 3750000.00, 'Kartu Kredit'),
(53, 43, '2024-01-20', 2750000.00, 'Transfer Bank'),
(54, 44, '2024-02-01', 5000000.00, 'Kartu Kredit'),
(55, 45, '2024-02-10', 4500000.00, 'Transfer Bank'),
(56, 46, '2024-02-20', 3000000.00, 'Kartu Debit'),
(57, 47, '2024-03-01', 7500000.00, 'Transfer Bank'),
(58, 48, '2024-03-10', 10000000.00, 'Kartu Kredit'),
(59, 49, '2024-03-20', 4250000.00, 'Kartu Debit'),
(60, 50, '2024-04-01', 3500000.00, 'Transfer Bank');

show tables;

-- Buatlah sebuah trigger bernama after_update_transaksi yang akan memperbarui status mobil menjadi tersedia setiap kali status transaksi berubah menjadi selesai!
DELIMITER //
CREATE TRIGGER after_update_transaksi
after UPDATE on transaksi
for each row
begin
	if status_transaksi = 'selesai' then
    update mobil set status = 'tersedia' where id_mobil = id_mobil;
    end if;
end //
DELIMITER ;

update transaksi set status_transaksi = 'selesai' where id_transaksi = 41;
select * from transaksi;
select * from mobil ;
drop trigger after_update_transaksi;

-- Buatlah sebuah trigger bernama after_insert_pembayaran yang akan mencatat log pembayaran ke dalam tabel log_pembayaran 
-- setiap kali ada pembayaran baru yang ditambahkan ke tabel pembayaran. Sebelum membuat trigger, 
-- buatlah terlebih dahulu tabel log_pembayaran yang akan digunakan untuk menyimpan log tersebut!
CREATE TABLE log_pembayaran (
	id_log INT PRIMARY KEY auto_increment,
    id_pembayaran INT,
    id_transaksi INT,
    tanggal_pembayaran DATE,
    jumlah_pembayaran DECIMAL(10,2),
    metode_pembayaran VARCHAR(50),
    timestamps TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
drop table log_pembayaran;

DELIMITER //
CREATE TRIGGER after_insert_pembayaran
after INSERT on pembayaran
for each row
begin
	insert into log_pembayaran (id_pembayaran, id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran)
    values (NEW.id_pembayaran, NEW.id_transaksi, NEW.tanggal_pembayaran, NEW.jumlah_pembayaran, NEW.metode_pembayaran);
end //
DELIMITER ;

insert into pembayaran (id_pembayaran, id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran) VALUES
(62, 49, '2024-06-06', 8000000, 'Transfer Bank');

select * from log_pembayaran; 
select * from pembayaran;


drop trigger after_insert_pembayaran;

-- Buatlah sebuah trigger bernama before_insert_transaksi yang akan menghitung total biaya sewa secara otomatis 
-- sebelum transaksi baru dimasukkan ke dalam tabel transaksi. Total biaya dihitung berdasarkan harga sewa per hari 
-- dari tabel mobil dikalikan dengan jumlah hari sewa (tanggal_selesai - tanggal_mulai). soal 3
DELIMITER //
CREATE TRIGGER before_insert_transaksi
before INSERT on transaksi
for each row
begin
	declare jumlah_harga_per_hari decimal(10,2);
    declare jumlah_hari int;
    
    select harga_sewa into jumlah_harga_per_hari from mobil where id_mobil = new.id_mobil;
    set jumlah_hari = datediff(new.tanggal_selesai, new.tanggal_mulai);
    set new.total_transaksi = jumlah_harga_per_hari * jumlah_hari;
end //
DELIMITER ;

INSERT INTO transaksi (id_transaksi, id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, status_transaksi)
VALUES (100, 21, 1, 31, '2024-06-09', '2024-06-11', 'Belum Selesai');


SELECT * FROM transaksi;

-- Buatlah sebuah trigger bernama after_delete_transaksi yang akan mencatat log setiap kali ada transaksi yang dihapus dari tabel transaksi. Log ini harus mencatat id_transaksi, id_pelanggan, id_mobil, tanggal_mulai, tanggal_selesai, total_biaya, dan timestamp penghapusan. Ketentuan tabel log_hapus_transaksi:
-- SOAL 4

CREATE TABLE log_hapus_transaksi (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_transaksi INT,
    id_pelanggan INT,
    id_mobil INT,
    tanggal_mulai DATE,
    tanggal_selesai DATE,
    total_biaya DECIMAL(10, 2),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER //

CREATE TRIGGER after_delete_transaksi
AFTER DELETE ON transaksi
FOR EACH ROW
BEGIN
    INSERT INTO log_hapus_transaksi (id_transaksi, id_pelanggan, id_mobil, tanggal_mulai, tanggal_selesai, total_biaya)
    VALUES (OLD.id_transaksi, OLD.id_pelanggan, OLD.id_mobil, OLD.tanggal_mulai, OLD.tanggal_selesai, OLD.total_biaya);
END //

DELIMITER ;

DELETE FROM transaksi WHERE id_transaksi = 100;
SELECT * FROM log_hapus_transaksi;
select * from transaksi;