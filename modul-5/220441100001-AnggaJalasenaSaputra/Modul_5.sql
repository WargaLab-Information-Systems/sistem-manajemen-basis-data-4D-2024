create database logistik_pakaian;
use logistik_pakaian;

create table gudang(
	id_gudang int (11) primary key not null,
    nama varchar (100) not null,
    alamat varchar (255) not null
);

INSERT INTO gudang (id_gudang, nama, alamat) 
VALUES
(1, 'Gudang Sentral', 'Jl. Gatot Subroto No. 100'),
(2, 'Gudang Sentosa', 'Jl. Surya Sumantri No. 200'),
(3, 'Gudang Bersama', 'Jl. Hayam Wuruk No. 300'),
(4, 'Gudang Mandiri', 'Jl. Thamrin No. 400'),
(5, 'Gudang Makmur', 'Jl. Dipatiukur No. 500'),
(6, 'Gudang Jaya', 'Jl. Ciliwung No. 600'),
(7, 'Gudang Baru', 'Jl. Taman Sari No. 700'),
(8, 'Gudang Indah', 'Jl. Teuku Umar No. 800'),
(9, 'Gudang Asri', 'Jl. Dipati Ewang No. 900'),
(10, 'Gudang Sejahtera', 'Jl. Surapati No. 1000');

CREATE TABLE produk(
id_produk INT(11) PRIMARY KEY,
nama_produk VARCHAR(100),
kategori VARCHAR(50),
harga DOUBLE,
berat FLOAT);

INSERT INTO produk(id_produk, nama_produk, kategori, harga, berat)
VALUES
(1, 'Kemeja Flanel Pria', 'Kemeja', 250000, 0.5),
(2, 'Kaos Polos Wanita', 'Kaos', 120000, 0.2),
(3, 'Celana Jeans Pendek', 'Celana', 200000, 0.4),
(4, 'Rok Midi Plisket', 'Rok', 180000, 0.3),
(5, 'Gaun Maxi Brokat', 'Gaun', 400000, 0.7),
(6, 'Sepatu Boots Kulit', 'Sepatu', 350000, 0.8),
(7, 'Sandal Sandal Wanita', 'Sandal', 100000, 0.2),
(8, 'Topi Bucket', 'Aksesoris', 50000, 0.1),
(9, 'Tas Ransel Sekolah', 'Tas', 220000, 0.6),
(10, 'Dompet Kulit Sintetis', 'Aksesoris', 150000, 0.3);


CREATE TABLE supplier(
id_supplier INT(11) PRIMARY KEY,
nama_supplier VARCHAR(100),
alamat VARCHAR(255),
telepon CHAR(15),
email VARCHAR(100)
);

INSERT INTO supplier (id_supplier, nama_supplier, alamat, telepon, email) 
VALUES
(1, 'PT. Prima Jaya Garment', 'Jl. Industri Raya No. 12, Surabaya', '031-5551234', 'prima.jaya@garment.co.id'),
(2, 'CV. Fashion Sentosa', 'Jl. Ahmad Yani No. 56, Malang', '0341-8901234', 'fashion.sentosa@mail.com'),
(3, 'UD. Aneka Busana', 'Jl. Pemuda No. 32, Yogyakarta', '0274-5678901', 'aneka.busana@yahoo.co.id'),
(4, 'PT. Citra Mandiri Apparel', 'Jl. Bandung No. 100, Bandung', '022-4234567', 'citra.mandiri@apparel.com'),
(5, 'CV. Batik Nusantara', 'Jl. Solo No. 21, Semarang', '024-8765432', 'batik.nusantara@batik.co.id'),
(6, 'UD. Jaya Makmur Konveksi', 'Jl. Medan No. 50, Medan', '061-7891011', 'jaya.makmur@konveksi.co.id'),
(7, 'PT. Gaya Baru Fashion', 'Jl. Balikpapan No. 78, Balikpapan', '0542-5678901', 'gayabaru.fashion@gmail.com'),
(8, 'CV. Mitra Jaya Tekstil', 'Jl. Makassar No. 43, Makassar', '0411-8901234', 'mitra.jaya@tekstil.co.id'),
(9, 'UD. Prima Konveksi', 'Jl. Samarinda No. 65, Samarinda', '0541-5678901', 'prima.konveksi@konveksi.co.id'),
(10, 'PT. Citra Mandiri Apparel', 'Jl. Palembang No. 120, Palembang', '0711-4234567', 'citra.mandiri@apparel.com');

CREATE TABLE stok(
id_stok INT(11) PRIMARY KEY,
id_produk INT(11),
id_gudang INT(11),
jumlah INT(11),
tanggal_update DATETIME,
FOREIGN KEY(id_produk) REFERENCES produk(id_produk),
FOREIGN KEY(id_gudang) REFERENCES gudang(id_gudang)
);

INSERT INTO stok (id_stok, id_produk, id_gudang, jumlah, tanggal_update) 
VALUES
(1, 1, 1, 250, '2024-06-10 08:00:00'),
(2, 2, 2, 200, '2024-03-15 09:30:00'),
(3, 3, 3, 150, '2024-02-10 10:45:00'),
(4, 4, 4, 120, '2023-08-05 12:00:00'),
(5, 5, 5, 400, '2023-09-05 13:20:00'),
(6, 6, 6, 70, '2023-10-05 14:40:00'),
(7, 7, 7, 150, '2024-05-10 16:00:00'),
(8, 8, 8, 110, '2024-05-20 17:15:00'),
(9, 9, 9, 180, '2024-05-21 18:30:00'),
(10, 10, 10, 220, '2024-05-22 19:45:00');

CREATE TABLE karyawan(
id_karyawan INT(11) PRIMARY KEY,
id_gudang INT(11),
nama VARCHAR(100),
alamat VARCHAR(255),
posisi VARCHAR(50),
gaji DOUBLE,
FOREIGN KEY(id_gudang) REFERENCES gudang(id_gudang)
);

INSERT INTO karyawan (id_karyawan, id_gudang, nama, alamat, posisi, gaji) VALUES
(1, 1, 'Budi Setiawan', 'Jl. Merdeka No. 12, Surabaya', 'Kepala Gudang', 5000000),
(2, 1, 'Ani Lestari', 'Jl. Majapahit No. 23, Surabaya', 'Staff Gudang', 3500000),
(3, 2, 'Candra Permana', 'Jl. Pahlawan No. 34, Malang', 'Kepala Gudang', 5500000),
(4, 2, 'Dini Puspita', 'Jl. Kertanegara No. 45, Malang', 'Staff Gudang', 3000000),
(5, 3, 'Edi Susanto', 'Jl. Diponegoro No. 56, Semarang', 'Kepala Gudang', 6000000),
(6, 3, 'Fitriana Dewi', 'Jl. Gajah Mada No. 67, Semarang', 'Staff Gudang', 4000000),
(7, 4, 'Gito Raharjo', 'Jl. Mataram No. 78, Yogyakarta', 'Kepala Gudang', 5200000),
(8, 4, 'Hani Rahmawati', 'Jl. Malioboro No. 89, Yogyakarta', 'Staff Gudang', 3200000),
(9, 5, 'Iwan Setiawan', 'Jl. Sudirman No. 90, Bandung', 'Kepala Gudang', 5700000),
(10, 5, 'Janti Dwi Astuti', 'Jl. Braga No. 101, Bandung', 'Staff Gudang', 3700000);

CREATE TABLE transaksi(
id_transaksi INT(11) PRIMARY KEY,
id_produk INT(11),
id_supplier INT(11),
id_karyawan INT(11),
jumlah INT(11),
total_harga DOUBLE,
tanggal_transaksi DATETIME,
FOREIGN KEY(id_produk) REFERENCES produk(id_produk),
FOREIGN KEY(id_supplier) REFERENCES supplier(id_supplier),
FOREIGN KEY(id_karyawan) REFERENCES karyawan(id_karyawan)
);

INSERT INTO transaksi (id_transaksi, id_produk, id_supplier, id_karyawan, jumlah, total_harga, tanggal_transaksi)
VALUES
(1, 1, 1, 1, 70, 105000, '2024-03-15 08:30:00'),
(2, 2, 2, 2, 40, 48000, '2024-04-10 09:45:00'),
(3, 3, 3, 3, 25, 5000000, '2024-03-06 11:00:00'),
(4, 4, 4, 4, 20, 5000000, '2024-02-27 12:30:00'),
(5, 5, 5, 4, 120, 9600000, '2024-02-28 14:00:00'),
(6, 6, 6, 6, 15, 4500000, '2023-04-20 15:15:00'),
(7, 7, 7, 7, 50, 6000000, '2023-03-29 16:45:00'),
(8, 8, 8, 8, 30, 2700000, '2022-09-20 18:00:00'),
(9, 9, 9, 9, 45, 12600000, '2024-05-20 19:30:00'),
(10, 10, 10, 10, 60, 21000000, '2023-04-25 21:45:00');

DROP TABLE transaksi;

-- 1. Buatlah Stored Procedure untuk menghitung total harga dari semua transaksi yang
-- dilakukan oleh seorang karyawan tertentu. Procedure harus menerapkan parameter IN
-- dan parameter OUT.

DELIMITER //
CREATE PROCEDURE total_transaksi(
IN karyawan INT(11),
OUT harga_transaksi BIGINT(30)
)
BEGIN
SELECT SUM(total_harga) INTO harga_transaksi
FROM transaksi
WHERE karyawan=id_karyawan;
END //
DELIMITER ;

CALL total_transaksi(2,@harga_transaksi);
SELECT @harga_transaksi AS total_transaksi_satu_karyawan;


-- 2. Buatkanlah procedure untuk mengetahui berapa lama(hari) setiap produk berada
-- digudang sejak tanggal masuk produk.

DELIMITER //
CREATE PROCEDURE lama_produk()
BEGIN
    SELECT CONCAT('Produk ', id_produk, ' berada di gudang selama ', DATEDIFF(NOW(), tanggal_update), ' hari.') 
    AS lama_produk_digudang
    FROM stok;
END //
DELIMITER ;

CALL lama_produk();
DROP PROCEDURE lama_produk;

-- 3. Buatkan procedure untuk menghapus transaksi pada 1 bulan terakhir, tetapi jika total
-- harga nya lebih dari 200 ribu maka tidak dapat di hapus.

DELIMITER //
CREATE PROCEDURE hapus_transaksi()
BEGIN
    DELETE FROM transaksi
    WHERE tanggal_transaksi >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    AND total_harga <= 200000;
END //
DELIMITER ;

CALL hapus_transaksi;
SELECT * FROM transaksi;
