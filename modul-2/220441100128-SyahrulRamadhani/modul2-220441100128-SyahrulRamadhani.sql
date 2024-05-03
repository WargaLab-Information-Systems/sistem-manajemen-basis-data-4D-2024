CREATE DATABASE tokobarokah;

DROP DATABASE tokobarokah;

USE tokobarokah; 

CREATE TABLE pelanggan (
id_pelanggan INT PRIMARY KEY,
nama_pelanggan VARCHAR(100),
email VARCHAR(50), alamat VARCHAR(255)
); 

CREATE TABLE pesanan (
id_pesanan INT PRIMARY KEY,
id_pelanggan INT,
tanggal_pesanan DATE,
total INT, 
FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);

CREATE TABLE produk (
id_produk INT PRIMARY KEY,
nama_produk VARCHAR(100),
harga INT,  stok INT 
); 

CREATE TABLE detail_pesanan (
id_detail INT PRIMARY KEY,
id_pesanan INT,
id_produk INT,
jumlah INT, 
FOREIGN KEY (id_pesanan) REFERENCES pesanan(id_pesanan), 
FOREIGN KEY (id_produk) REFERENCES produk(id_produk) 
); 


INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, email, alamat) 
VALUES  
(1, 'budi', 'budi@gmail.com', 'Jl. Pahlawan No. 123'), 
(2, 'indra', 'indra@gmail.com', 'Jl. Merdeka No. 456'), 
(3, 'putri', 'putri@gmail.com', 'Jl. Maju Mundur No. 789'), 
(4, 'alif', 'alif@gmail.com', 'Jl. Damai No. 321'), 
(5, 'tegar', 'tegar@gmail.com', 'Jl. Bahagia No. 654'), 
(6, 'Fahmi', 'fahmi@gmail.com', 'Jl. Jalan No. 987'), 
(7, 'rehan', 'rehan@gmail.com', 'Jl. Kebon No. 1234'), 
(8, 'dani', 'dani@gmail.com', 'Jl. Raya No. 101'), 
(9, 'birrur', 'birrur@gmail.com', 'Jl. Sawah No. 202'), 
(10, 'dika', 'dika@gmail.com', 'Jl. Jembatan No. 303');

INSERT INTO pesanan (id_pesanan, id_pelanggan, tanggal_pesanan, total) 
VALUES  
(1, 1, '2024-03-01', 15000), 
(2, 2, '2024-03-02', 25000), 
(3, 3, '2024-03-03', 10000), 
(4, 4, '2024-03-04', 20000), 
(5, 5, '2024-03-05', 30000), 
(6, 6, '2024-03-06', 35000), 
(7, 7, '2024-03-07', 18000), 
(8, 8, '2024-03-08', 12000), 
(9, 9, '2024-03-09', 18000), 
(10, 10, '2024-03-10', 22000); 


INSERT INTO produk (id_produk, nama_produk, harga, stok) 
VALUES
(1, 'kertas HVS', 10000, 20), 
(2, 'stabilo', 5000, 15), 
(3, 'pensil Warna', 2000, 25),
(4, 'penghapus', 1000, 35), 
(5, 'lem', 3000, 10), 
(6, 'binder', 15000, 5), 
(7, 'stipo', 25000, 8), 
(8, 'pensil', 1500, 3), 
(9, 'buku Tulis', 5000, 4), 
(10, 'spidol', 2000, 2);

INSERT INTO detail_pesanan (id_detail, id_pesanan, id_produk, jumlah) VALUES 
(1, 1, 1, 3), 
(2, 2, 2, 5), 
(3, 3, 3, 2), 
(4, 4, 4, 4), 
(5, 5, 5, 6), 
(6, 6, 6, 3), 
(7, 7, 7, 4), 
(8, 8, 8, 2), 
(9, 9, 9, 3), 
(10, 10, 10, 4); 

select * from pesanan;

CREATE VIEW pesanan_lebih_dari_rata_rata AS
SELECT p.nama_pelanggan, ps.total, ps.tanggal_pesanan
FROM pesanan ps JOIN pelanggan p
ON ps.id_pelanggan = p.id_pelanggan
WHERE ps.total > (SELECT AVG(total) FROM pesanan);

CREATE VIEW detail_penjualantoko AS
SELECT pr.nama_produk, pr.harga AS harga_satuan, dp.jumlah AS jumlah_terjual, (pr.harga * dp.jumlah) AS total_pendapatan
FROM detail_pesanan dp JOIN produk pr
ON dp.id_produk = pr.id_produk;

CREATE VIEW stok_kurang_dari_5 AS
SELECT nama_produk, stok FROM produk
WHERE stok < 5;

CREATE VIEW pesanan_terakhir_satu_bulan AS
SELECT p.nama_pelanggan, ps.tanggal_pesanan, SUM(ps.total) AS total_pesanan
FROM pelanggan p
JOIN pesanan ps ON p.id_pelanggan = ps.id_pelanggan
WHERE ps.tanggal_pesanan >= '2024-04-01' AND ps.tanggal_pesanan <= '2024-04-31'
GROUP BY p.nama_pelanggan, ps.tanggal_pesanan;



SELECT * FROM pesanan_lebih_dari_rata_rata;
SELECT * FROM detail_penjualantoko;
SELECT * FROM stok_kurang_dari_5;
SELECT * FROM pesanan_terakhir_satu_bulan;


