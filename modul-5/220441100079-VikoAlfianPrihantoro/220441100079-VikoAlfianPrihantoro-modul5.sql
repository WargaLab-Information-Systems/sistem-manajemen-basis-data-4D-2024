CREATE DATABASE db_modul53;

USE db_modul53;

CREATE TABLE logistik_pakaian_produk (
  id_produk INT(11) PRIMARY KEY AUTO_INCREMENT,
  nama_produk VARCHAR(100) NOT NULL,
  kategori VARCHAR(50) NOT NULL,
  harga DOUBLE NOT NULL,
  berat FLOAT NOT NULL
);

INSERT INTO logistik_pakaian_produk (nama_produk, kategori, harga, berat)
VALUES
  ('Kaos Polos', 'Pakaian Pria', 50000, 0.25),
  ('Kemeja Flanel', 'Pakaian Pria', 75000, 0.5),
  ('Gaun Maxi', 'Pakaian Wanita', 120000, 0.75),
  ('Celana Jeans', 'Pakaian Pria', 60000, 0.5),
  ('Rok Pensil', 'Pakaian Wanita', 80000, 0.4);


CREATE TABLE logistik_pakaian_stok (
  id_stok INT(11) PRIMARY KEY AUTO_INCREMENT,
  id_produk INT(11) NOT NULL,
  id_gudang INT (11) NOT NULL,
  jumlah INT (20) NOT NULL,
  tanggal_update DATETIME,
  FOREIGN KEY (id_gudang) REFERENCES logistik_pakaian_gudang(id_gudang),
  FOREIGN KEY (id_produk) REFERENCES logistik_pakaian_produk(id_produk)
);

DROP TABLE logistik_pakaian_stok;

INSERT INTO logistik_pakaian_stok (id_produk, id_gudang, jumlah, tanggal_update)
VALUES
  (1, 1, 50, '2024-05-14 08:51:00'),
  (2, 2, 20, '2024-05-13 15:23:56'),
  (3, 3, 10, '2024-05-12 10:45:12'),
  (4, 1, 25, '2024-05-11 18:00:00'),
  (5, 2, 35, '2024-05-10 12:34:56');


CREATE TABLE logistik_pakaian_transaksi (
  id_transaksi INT(11) PRIMARY KEY AUTO_INCREMENT,
  id_produk INT(11) NOT NULL,
  FOREIGN KEY (id_produk) REFERENCES logistik_pakaian_produk(id_produk),
  id_karyawan INT(11) NOT NULL,
  FOREIGN KEY (id_karyawan) REFERENCES logistik_pakaian_karyawan(id_karyawan),
  id_supplier INT(11) NOT NULL,
  FOREIGN KEY (id_supplier) REFERENCES logistik_pakaian_supplier(id_supplier),
  jumlah INT(11) NOT NULL,
  total_harga DOUBLE NOT NULL,
  tanggal_transaksi DATETIME NOT NULL
);

INSERT INTO logistik_pakaian_transaksi (id_produk, id_karyawan, id_supplier, jumlah, total_harga, tanggal_transaksi)
VALUES
  (1, 1, 1, 10, 500000, '2024-05-14 08:51:00'),
  (2, 2, 2, 20, 1500000, '2024-05-13 15:23:56'),
  (3, 3, 3, 30, 2700000, '2024-05-12 10:45:12'),
  (4, 1, 1, 15, 900000, '2024-05-11 18:00:00'),
  (5, 2, 2, 25, 1250000, '2024-05-10 12:34:56');

CREATE TABLE logistik_pakaian_supplier (
  id_supplier INT(11) PRIMARY KEY AUTO_INCREMENT,
  nama_supplier VARCHAR(100) NOT NULL,
  alamat VARCHAR(255) NOT NULL,
  telepon CHAR(15) NOT NULL,
  email VARCHAR(100) NOT NULL
);

INSERT INTO logistik_pakaian_supplier (nama_supplier, alamat, telepon, email)
VALUES
  ('Konveksi ABC', 'Jl. Industri No. 10, Surabaya', '031-12345678', 'konveksiabc@gmail.com'),
  ('Garment XYZ', 'Jl. Pahlawan No. 50, Malang', '034-87654321', 'garmentxyz@mail.com'),
  ('Toko Online Mbak Yuli', 'Jl. Raya Solo No. 88, Sidoarjo', '0856-99998888', 'mbakyuli.olshop@yahoo.com'),
  (' grosir Baju Murah', 'Jl. Pasar Turi No. 32, Surabaya', '031-22221111', 'grosirbاجورmurah@gmx.net'),
  ('Fashion House', 'Jl. Raya Darmo No. 168, Surabaya', '031-55554444', 'fashionhouse.surabaya@outlook.com');

CREATE TABLE logistik_pakaian_gudang (
  id_gudang INT(11) PRIMARY KEY AUTO_INCREMENT,
  nama VARCHAR(100) NOT NULL,
  alamat VARCHAR(255) NOT NULL
);

INSERT INTO logistik_pakaian_gudang (nama, alamat)
VALUES
  ('Gudang Pusat Surabaya', 'Jl. Industri No. 20, Surabaya'),
  ('Gudang Malang', 'Jl. Pahlawan No. 60, Malang'),
  ('Gudang Sidoarjo', 'Jl. Raya Solo No. 99, Sidoarjo'),
  ('Gudang Gresik', 'Jl. Dr. Wahidin Sudirohusodo No. 123, Gresik'),
  ('Gudang Lamongan', 'Jl. Basuki Rachmat No. 456, Lamongan');

CREATE TABLE logistik_pakaian_karyawan (
  id_karyawan INT(11) PRIMARY KEY AUTO_INCREMENT,
  id_gudang INT(11) NOT NULL,
  FOREIGN KEY (id_gudang) REFERENCES logistik_pakaian_gudang(id_gudang),
  nama VARCHAR(100) NOT NULL,
  alamat VARCHAR(255) NOT NULL,
  posisi VARCHAR(50) NOT NULL,
  gaji DOUBLE NOT NULL
);

INSERT INTO logistik_pakaian_karyawan (id_gudang, nama, alamat, posisi, gaji) VALUES
(1, 'Budi Setiawan', 'Jl. Sudirman No. 12 Surabaya', 'Manajer', 5000000),
(2, 'Ani Lestari', 'Jl. Pemuda No. 34 Surabaya', 'Supervisor', 4000000),
(3, 'Cici Wijaya', 'Jl. Diponegoro No. 56 Surabaya', 'Programmer', 3500000),
(4, 'Dinda Sari', 'Jl. Pahlawan No. 78 Surabaya', 'Designer', 3000000),
(5, 'Eko Susanto', 'Jl. Majapahit No. 90 Surabaya', 'Tester', 2500000);


-- 5.1
DELIMITER //

CREATE PROCEDURE hitung_total_harga_transaksi_karyawan(
    IN id_karyawan INT,
    OUT total_harga DOUBLE
)
BEGIN

    DECLARE total_harga_sementara DOUBLE;

    SET total_harga_sementara = 0;

    SELECT SUM(t.jumlah * p.harga) INTO total_harga_sementara
    FROM logistik_pakaian_transaksi t
    INNER JOIN logistik_pakaian_produk p ON t.id_produk = p.id_produk
    WHERE t.id_karyawan = id_karyawan;

    SET total_harga = total_harga_sementara;

END //

DELIMITER ;

CALL hitung_total_harga_transaksi_karyawan(2, @total_harga);

SELECT @total_harga;


-- 5.2
DELIMITER //

CREATE PROCEDURE lama_produk_digudang()
BEGIN
    SELECT p.nama_produk, g.nama AS nama_gudang, DATEDIFF(NOW(), s.tanggal_update) AS lama_hari
    FROM logistik_pakaian_stok s
    JOIN logistik_pakaian_produk p ON s.id_produk = p.id_produk
    JOIN logistik_pakaian_gudang g ON s.id_gudang = g.id_gudang;
END //

DELIMITER ;

CALL lama_produk_digudang();

-- 5.3
DELIMITER //

CREATE PROCEDURE hapus_transaksi_bulan_terakhir()
BEGIN
    DELETE FROM logistik_pakaian_transaksi
    WHERE total_harga <= 200000 
    AND tanggal_transaksi >= DATE_SUB(NOW(), INTERVAL 1 MONTH);
END //

DELIMITER ;

CALL hapus_transaksi_bulan_terakhir();
SELECT * FROM logistik_pakaian_transaksi;