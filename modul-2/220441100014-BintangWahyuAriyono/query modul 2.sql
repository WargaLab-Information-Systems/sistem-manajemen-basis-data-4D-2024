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

drop table pesanan;
drop table detail_pesanan;

CREATE TABLE detail_pesanan(
	id_detail INT (11) NOT NULL PRIMARY KEY,
    id_pesanan INT (11) NOT NULL,
    id_produk INT (11) NOT NULL,
    jumlah INT (11) NOT NULL,
    FOREIGN KEY (id_pesanan) REFERENCES pesanan(id_pesanan),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
    );
    
INSERT INTO produk (id_produk, nama_produk, harga, stock) VALUES
    (01, 'kue sus', 5000, 8),
    (02, 'donat kentang', 5000, 7),
    (03, 'pastel', 2000, 5),
    (04, 'risoles', 2500, 6),
    (05, 'macaroni schotel', 5000, 9);
    
INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, email, alamat) VALUES 
	(01, 'Bintang', 'abintangwahyu@email.com', 'Jl. Trunojoyo, Bangkalan'),
	(02, 'Wahyu', 'wahyubintang@email.com', 'Jl. Kamal, Bangkalan'),
	(03, 'Ariyono', 'ariyono.404@email.com', 'Jl. Diponegoro, Sidoarjo'),
	(04, 'khoirotun', 'khoirotun888@email.com', 'Jl. A. Yani, Sidoarjo'),
	(05, 'Eko Pratama', 'eko.pratama@example.com', 'Jl. Gajah Mada, Sidoarjo');
    
INSERT INTO pesanan (id_pesanan, id_pelanggan, tanggal_pesanan, total) VALUES 
	(001, 01, '2024-03-21', 5000),
	(002, 02, '2024-03-22', 8000),
	(003, 03, '2024-03-20', 5000),
	(004, 04, '2024-03-30', 15000),
	(005, 05, '2024-03-31', 10000);

select * from pesanan;
    
INSERT INTO detail_pesanan (id_detail, id_pesanan, id_produk, jumlah) 
VALUES 
(1, 001, 01, 1),
(2, 002, 03, 4),
(3, 003, 04, 2),
(4, 004, 02, 3),
(5, 005, 05, 2);


CREATE VIEW view_total_atas_rata_rata AS
SELECT p.nama_pelanggan, pes.total, pes.tanggal_pesanan
FROM tb_pesanan pes
JOIN tb_pelanggan p ON pes.id_pelanggan = p.id_pelanggan
WHERE pes.total > (SELECT AVG(total) FROM tb_pesanan);

SELECT * FROM view_total_atas_rata_rata;

CREATE VIEW view_produk_terjual AS
SELECT pr.nama_produk, pr.harga AS harga_satuan, dp.jumlah AS jumlah_terjual, pr.harga * dp.jumlah AS total_pendapatan
FROM tb_detail_pesanan dp
JOIN tb_produk pr ON dp.id_produk = pr.id_produk;

SELECT * FROM view_produk_terjual;

CREATE VIEW view_produk_stok_kurang_5 AS
SELECT nama_produk, stock AS jumlah_stok_tersisa
FROM tb_produk
WHERE stock < 5;

SELECT * FROM view_produk_stok_kurang_5;

CREATE VIEW view_total_pesanan_perpelanggan AS
SELECT p.nama_pelanggan, SUM(pes.total) AS total_pesanan
FROM tb_pesanan pes
JOIN tb_pelanggan p ON pes.id_pelanggan = p.id_pelanggan
WHERE pes.tanggal_pesanan >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY p.nama_pelanggan;

SELECT * FROM view_total_pesanan_perpelanggan;