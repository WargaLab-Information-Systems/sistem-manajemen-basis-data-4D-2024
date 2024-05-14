	CREATE DATABASE toko_modul5
	USE toko_modul5

	CREATE TABLE produk(
	id_produk INT(11) PRIMARY KEY,
	nama_produk VARCHAR(100),
	kategori VARCHAR(50),
	harga DOUBLE,
	berat FLOAT);


	INSERT INTO produk (id_produk, nama_produk, kategori, harga, berat) 
	VALUES
	(1, 'Laptop', 'Elektronik', 8000000, 2.5),
	(2, 'Smartphone', 'Elektronik', 5000000, 0.3),
	(3, 'Mouse', 'Aksesoris Komputer', 50000, 0.1),
	(4, 'Keyboard', 'Aksesoris Komputer', 100000, 0.5),
	(5, 'Baju', 'Fashion', 150000, 0.2),
	(6, 'Celana', 'Fashion', 200000, 0.4),
	(7, 'Kamera', 'Elektronik', 10000000, 1.0),
	(8, 'Printer', 'Elektronik', 1500000, 5.0),
	(9, 'Speaker', 'Elektronik', 300000, 0.8),
	(10, 'Earphone', 'Elektronik', 200000, 0.1),
	(11, 'Meja', 'Furniture', 500000, 10.0);


	CREATE TABLE gudang(
	id_gudang INT(11) PRIMARY KEY,
	nama VARCHAR(100),
	alamat VARCHAR(255)
	);

	INSERT INTO gudang (id_gudang, nama, alamat) 
	VALUES
	(1, 'Gudang Utama', 'Jl. Pahlawan No. 10'),
	(2, 'Gudang Cabang A', 'Jl. Merdeka No. 20'),
	(3, 'Gudang Cabang B', 'Jl. Asia No. 30');




	CREATE TABLE supplier(
	id_supplier INT(11) PRIMARY KEY,
	nama_supplier VARCHAR(100),
	alamat VARCHAR(255),
	telepon CHAR(15),
	email VARCHAR(100)
	);


	INSERT INTO supplier (id_supplier, nama_supplier, alamat, telepon, email) 
	VALUES
	(1, 'Supplier Elektronik', 'Jl. Raya No. 100', '08123456789', 'supplier.elektronik@gmail.com'),
	(2, 'Supplier Fashion', 'Jl. Mandiri No. 200', '08234567890', 'supplier.fashion@gmail.com'),
	(3, 'Supplier Komputer', 'Jl. Bahagia No. 300', '08345678901', 'supplier.komputer@gmail.com');



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
	(1, 1, 1, 50, '2024-05-14 08:00:00'),
	(2, 2, 1, 100, '2024-05-14 08:00:00'),
	(3, 3, 1, 200, '2024-05-14 08:00:00'),
	(4, 4, 1, 150, '2024-05-14 08:00:00'),
	(5, 5, 2, 80, '2024-05-14 08:00:00'),
	(6, 6, 2, 120, '2024-05-14 08:00:00'),
	(7, 7, 2, 30, '2024-05-14 08:00:00'),
	(8, 8, 2, 20, '2024-05-14 08:00:00'),
	(9, 9, 3, 50, '2024-05-14 08:00:00'),
	(10, 10, 3, 100, '2024-05-14 08:00:00'),
	(11, 11, 3, 10, '2024-05-14 08:00:00');

	UPDATE stok SET tanggal_update = '2024-05-10 08:00:00' WHERE id_stok = 1;
	UPDATE stok SET tanggal_update = '2024-05-11 08:00:00' WHERE id_stok = 2;
	UPDATE stok SET tanggal_update = '2024-05-12 08:00:00' WHERE id_stok = 3;
	UPDATE stok SET tanggal_update = '2024-05-13 08:00:00' WHERE id_stok = 4;


	CREATE TABLE karyawan(
	id_karyawan INT(11) PRIMARY KEY,
	id_gudang INT(11),
	nama VARCHAR(100),
	alamat VARCHAR(255),
	posisi VARCHAR(50),
	gaji DOUBLE,
	FOREIGN KEY(id_gudang) REFERENCES gudang(id_gudang)
	);

	INSERT INTO karyawan (id_karyawan, id_gudang, nama, alamat, posisi, gaji) 
	VALUES
	(1, 1, 'Budi', 'Jl. Pahlawan No. 10', 'Manager', 10000000),
	(2, 1, 'Cindy', 'Jl. Pahlawan No. 10', 'Supervisor', 8000000),
	(3, 1, 'Dodi', 'Jl. Pahlawan No. 10', 'Staff', 5000000),
	(4, 2, 'Eva', 'Jl. Merdeka No. 20', 'Manager', 12000000),
	(5, 2, 'Fani', 'Jl. Merdeka No. 20', 'Supervisor', 9000000),
	(6, 2, 'Gina', 'Jl. Merdeka No. 20', 'Staff', 6000000),
	(7, 3, 'Hadi', 'Jl. Asia No. 30', 'Manager', 11000000),
	(8, 3, 'Indra', 'Jl. Asia No. 30', 'Supervisor', 8500000),
	(9, 3, 'Joko', 'Jl. Asia No. 30', 'Staff', 5500000),
	(10, 3, 'Kiki', 'Jl. Asia No. 30', 'Staff', 5500000),
	(11, 3, 'Lina', 'Jl. Asia No. 30', 'Staff', 5500000);



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
	(1, 1, 1, 1, 10, 80000000, '2024-05-14 09:00:00'),
	(2, 2, 1, 2, 20, 100000000, '2024-05-14 09:00:00'),
	(3, 3, 2, 3, 30, 1500000, '2024-05-14 09:00:00'),
	(4, 4, 2, 4, 40, 4000000, '2024-05-14 09:00:00'),
	(5, 5, 3, 5, 50, 7500000, '2024-05-14 09:00:00'),
	(6, 6, 3, 6, 60, 12000000, '2024-05-14 09:00:00'),
	(7, 7, 1, 7, 5, 50000000, '2024-05-14 09:00:00'),
	(8, 8, 1, 8, 8, 12000000, '2024-05-14 09:00:00'),
	(9, 9, 2, 9, 6, 1800000, '2024-05-14 09:00:00'),
	(10, 10, 3, 10, 15, 3000000, '2024-05-14 09:00:00'),
	(11, 11, 1, 11, 1, 500000, '2024-05-14 09:00:00');
	
	UPDATE transaksi SET total_harga = 100000 WHERE id_transaksi= 1;
	
--1--

DELIMITER //

CREATE PROCEDURE hitung_total_harga_transaksi(
    IN idKaryawan INT,
    OUT totalHarga DOUBLE
)
BEGIN
    SELECT SUM(total_harga) INTO totalHarga
    FROM transaksi
    WHERE id_karyawan = idKaryawan;
END //

DELIMITER ;

SET @totalHarga = 0;
CALL hitung_total_harga_transaksi(4, @totalHarga);


SELECT @totalHarga AS Total_Harga;



--2--


DELIMITER //

CREATE PROCEDURE lama_produk_digudang()
BEGIN
    SELECT p.nama_produk, g.nama AS nama_gudang, DATEDIFF(NOW(), s.tanggal_update) AS lama_hari
    FROM stok s
    JOIN produk p ON s.id_produk = p.id_produk
    JOIN gudang g ON s.id_gudang = g.id_gudang;
END //

DELIMITER ;


CALL lama_produk_digudang();

--3--
DELIMITER //

CREATE PROCEDURE hapus_transaksi_bulan_terakhir()
BEGIN
    DELETE FROM transaksi
    WHERE total_harga <= 200000 
    AND tanggal_transaksi >= DATE_SUB(NOW(), INTERVAL 1 MONTH);
END //

DELIMITER ;

CALL hapus_transaksi_bulan_terakhir()
SELECT*FROM transaksi

