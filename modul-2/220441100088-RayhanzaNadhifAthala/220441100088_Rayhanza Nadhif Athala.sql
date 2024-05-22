CREATE DATABASE modultugas2;
use modultugas2;

CREATE TABLE pelanggan (
  id_pelanggan INT(11) PRIMARY KEY AUTO_INCREMENT,
  nama_pelanggan VARCHAR(100) NOT NULL,
  email VARCHAR(50) NOT NULL,
  alamat VARCHAR(255) NOT NULL
);


INSERT INTO Pelanggan (id_pelanggan,nama_pelanggan,email, alamat) VALUES (1, "Fani Kurniyawan", "FaniKur@gmail.com", "Madura"),
(2, "Ryan FIrmansyah", "fRyani@gmail.com", "Madura"),
(3, "Faris M", "Mangparis@gmail.com", "Bangkalan"),
(4, "Makin amin", "amin@gmail.com", "Kalmpis"),
(5, "Anisyafaah", "Anisyaa@gmail.com", "Surabaya"),
(6, "Rayhanza Nadhif Athala", "rayhanzanadhif@gmail.com", "Bangkalan"),
(7, "Birrur Rijaal", "birrurl@gmail.com", "Gresik"),
(8, "Juanzha Nanda Pratama", "juanzha@gmail.com", "Gresik"),
(9, "Affan Maulana", "jAffanmza@gmail.com", "Madura"),
(10, "Chairul ", "jchairul@gmail.com", "Madura");

CREATE TABLE produk (
  id_produk INT(11) PRIMARY KEY AUTO_INCREMENT,
  nama_produk VARCHAR(100) NOT NULL,
  harga INT(11) NOT NULL,
  stok INT(11) NOT NULL
);


 INSERT INTO produk (nama_produk, harga, stok)
VALUES ('Sabun Mandi', 8000, 30),
       ('Shampoo', 10000, 25),
       ('Telur', 20000, 50),
       ('Susu Bubuk', 35000, 15),
       ('Tepung Terigu', 12000, 20),
       ('Saus Tomat', 8000, 40),
       ('Mie Instan', 2500, 50),
       ('Saus Sambel', 5000, 2),
       ('Saus Tomat', 2500, 4),
       ('Saus Tiram', 2500, 3);
       
       
       CREATE TABLE pesanan (
  id_pesanan INT(11) PRIMARY KEY AUTO_INCREMENT,
  id_pelanggan INT(11) NOT NULL,
  tanggal_pesanan DATE NOT NULL,
  total INT(11) NOT NULL,
  FOREIGN KEY (id_pelanggan) REFERENCES pelanggan (id_pelanggan)
);

INSERT INTO pesanan (id_pesanan, id_pelanggan, tanggal_pesanan, total)
VALUES   (1, 1, '2024-04-02', 300),  -- Budi Raharjo (additional order)
       (2, 2, '2024-04-02', 25000), -- Siti Nurhaliza (additional order
		(3, 3, '2024-04-01', 22000),  -- Doni Permana
       (4, 4, '2024-04-01', 38000),  -- Eka Rahmawati
       (5, 5, '2024-04-01', 17000),  -- Fitriana Sari
       (6, 6, '2024-04-01', 15000),  -- Gilang Ramadhan
       (7, 7, '2024-04-01', 40000),  -- Hafizah Nur Aini
       (8, 8, '2024-04-03', 13000),
       (9, 9, '2024-04-01', 13000),
       (10, 10, '2024-04-01', 13000);
     
CREATE TABLE detail_pesanan (
  id_detail INT(11) PRIMARY KEY AUTO_INCREMENT,
  id_pesanan INT(11) NOT NULL,
  id_produk INT(11) NOT NULL,
  jumlah INT(11) NOT NULL,
  FOREIGN KEY (id_pesanan) REFERENCES pesanan (id_pesanan),
  FOREIGN KEY (id_produk) REFERENCES produk (id_produk)
);

DELETE FROM detail_pesanan WHERE id_detail=26;
SELECT * FROM detail_pesanan;

INSERT INTO detail_pesanan (id_detail,id_pesanan, id_produk, jumlah)
VALUES (1,1, 3, 2), 
       (2, 2, 4, 2), 
       (3, 3, 5, 3),
       (4, 4, 1, 3),
       (5, 5, 2, 3),
       (6, 6, 6, 3),
       (7, 7, 8, 3),
       (8, 8, 7, 3),
       (9, 9, 10, 3),
       (10, 10, 9, 3);

       
       select*from pesanan;
CREATE VIEW nomer1 AS
SELECT pelanggan.nama_pelanggan, pesanan.total, pesanan.tanggal_pesanan
FROM pesanan
JOIN pelanggan ON pesanan.id_pelanggan = pelanggan.id_pelanggan
WHERE pesanan.total > (SELECT AVG(total) FROM pesanan);       

CREATE VIEW nomer2 AS
SELECT produk.nama_produk, produk.harga AS harga,
 detail_pesanan.jumlah AS jumlahterjual, (produk.harga * detail_pesanan.jumlah) AS total_pendapatan
FROM detail_pesanan 
JOIN produk  ON detail_pesanan.id_produk = produk.id_produk;

CREATE VIEW nomer3 AS
SELECT produk.nama_produk, produk.stok
FROM produk
WHERE produk.stok < 5;

CREATE VIEW nomer4 AS
SELECT pelanggan.nama_pelanggan, COUNT(pesanan.id_pesanan) AS total_pesanan 
FROM pelanggan 
JOIN pesanan ON pelanggan.id_pelanggan = pesanan.id_pelanggan 
WHERE pesanan.tanggal_pesanan BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH) AND CURRENT_DATE() 
GROUP BY pelanggan.id_pelanggan;
