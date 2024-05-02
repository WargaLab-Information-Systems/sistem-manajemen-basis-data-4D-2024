CREATE DATABASE modul2;
use modul2;

CREATE TABLE produk (
	id_produk INT (11) NOT NULL PRIMARY KEY,
    nama_produk VARCHAR (100) NOT NULL,
    harga INT (11) NOT NULL,
    stock INT (11) NOT NULL
    );
    
CREATE TABLE pelanggan(
	id_pelanggan INT (11) NOT NULL PRIMARY KEY,
    nama_pelanggan VARCHAR (100) NOT NULL,
    email VARCHAR (50) NOT NULL,
    alamat VARCHAR (255) NOT NULL
    );

CREATE TABLE pesanan(
	id_pesanan INT (11) NOT NULL PRIMARY KEY,
    id_pelanggan INT (11) NOT NULL,
    tanggal_pesanan DATE NOT NULL,
    total INT (11) NOT NULL,
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
    );

CREATE TABLE detail_pesanan(
	id_detail INT (11) NOT NULL PRIMARY KEY,
    id_pesanan INT (11) NOT NULL,
    id_produk INT (11) NOT NULL,
    jumlah INT (11) NOT NULL,
    FOREIGN KEY (id_pesanan) REFERENCES pesanan(id_pesanan),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
    );
    
INSERT INTO produk (id_produk, nama_produk, harga, stock) VALUES
    (01, 'risol', 5000, 8),
    (02, 'lemper', 5000, 7),
    (03, 'molen', 2000, 5),
    (04, 'bakwan', 2500, 6),
    (05, 'tahu isi', 5000, 9);
    
INSERT INTO produk (id_produk, nama_produk, harga, stock) VALUES
	(06, 'roti', 5000, 1);
    
INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, email, alamat) VALUES 
	(01, 'Naela', 'naela@email.com', 'Jl. Trunojoyo, Bangkalan'),
	(02, 'Nahdiah', 'nahdiah@email.com', 'Jl. Kamal, Bangkalan'),
	(03, 'Oxa', 'oxa.404@email.com', 'Jl. Diponegoro, Sidoarjo'),
	(04, 'Indi', 'indi@email.com', 'Jl. A. Yani, Sidoarjo'),
	(05, 'Vixzio', 'vixzio@example.com', 'Jl. Gajah Mada, Sidoarjo');
    
INSERT INTO pesanan (id_pesanan, id_pelanggan, tanggal_pesanan, total) VALUES 
	(001, 01, '2024-03-21', 5000),
	(002, 02, '2024-03-22', 8000),
	(003, 03, '2024-03-20', 5000),
	(004, 04, '2024-03-30', 15000),
	(005, 05, '2024-03-31', 10000);

    
INSERT INTO detail_pesanan (id_detail, id_pesanan, id_produk, jumlah) 
VALUES 
(1, 001, 01, 1),
(2, 002, 03, 4),
(3, 003, 04, 2),
(4, 004, 02, 3),
(5, 005, 05, 2);


CREATE VIEW view_total_atas_rata_rata AS
SELECT p.nama_pelanggan, pes.total, pes.tanggal_pesanan, (SELECT AVG(total) FROM pesanan) AS rerata
FROM pesanan pes
JOIN pelanggan p ON pes.id_pelanggan = p.id_pelanggan
WHERE pes.total > (SELECT AVG(total) FROM pesanan);
DROP VIEW view_total_atas_rata_rata;


SELECT * FROM view_total_atas_rata_rata;

CREATE VIEW view_produk_terjual AS
SELECT pr.nama_produk, pr.harga AS harga_satuan, dp.jumlah AS jumlah_terjual, pr.harga * dp.jumlah AS total_pendapatan
FROM detail_pesanan dp
JOIN produk pr ON dp.id_produk = pr.id_produk;

SELECT * FROM view_produk_terjual;

CREATE VIEW view_produk_stok_kurang_5 AS
SELECT nama_produk, stock AS jumlah_stok_tersisa
FROM produk
WHERE stock < 5;

SELECT * FROM view_produk_stok_kurang_5;

CREATE VIEW view_total_pesanan_perpelanggan AS
SELECT p.nama_pelanggan, SUM(pes.total) AS total_pesanan, pes.tanggal_pesanan
FROM pesanan pes
JOIN pelanggan p ON pes.id_pelanggan = p.id_pelanggan
WHERE pes.tanggal_pesanan >= DATE_SUB(CURDATE(), INTERVAL 2 MONTH)
GROUP BY p.nama_pelanggan;

SELECT * FROM view_total_pesanan_perpelanggan;

drop database modul2;