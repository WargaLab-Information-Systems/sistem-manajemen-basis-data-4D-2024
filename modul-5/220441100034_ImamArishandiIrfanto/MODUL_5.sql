CREATE DATABASE db_gudang;
USE db_gudang;

CREATE TABLE tb_produk (
  id_produk INT PRIMARY KEY AUTO_INCREMENT,
  nama_produk VARCHAR(100) NOT NULL,
  kategori VARCHAR(50) NOT NULL,
  harga DOUBLE NOT NULL
);

INSERT INTO tb_produk (nama_produk, kategori, harga) VALUES
  ('Kaos Polos', 'Pakaian', 50000),
  ('Kemeja Flanel', 'Pakaian', 100000),
  ('Celana Jeans', 'Pakaian', 150000),
  ('Sepatu Sneakers', 'Sepatu', 200000),
  ('Sandal Jepit', 'Sepatu', 30000),
  ('Topi Baseball', 'Aksesoris', 40000),
  ('Tas Ransel', 'Aksesoris', 100000),
  ('Dompet Kulit', 'Aksesoris', 150000),
  ('Jam Tangan', 'Aksesoris', 200000),
  ('Kacamata Hitam', 'Aksesoris', 300000);


CREATE TABLE tb_supplier (
  id_supplier INT PRIMARY KEY AUTO_INCREMENT,
  nama VARCHAR(100) NOT NULL,
  alamat VARCHAR(255),
  telepon CHAR(15),
  email VARCHAR(100)
);

INSERT INTO tb_supplier (nama, alamat, telepon, email) VALUES
  ('PT. Kaos Murah', 'Jl. Industri No. 1, Bandung', '+6222-5555555', '[alamat email dihapus]'),
  ('CV. Sepatu Sport', 'Jl. Olahraga No. 2, Jakarta', '+6221-6666666', '[alamat email dihapus]'),
  ('UD. Aksesoris Kekinian', 'Jl. Aksesoris No. 3, Surabaya', '+6231-7777777', '[alamat email dihapus]'),
  ('PT. Grosir Pakaian', 'Jl. Grosir No. 4, Semarang', '+6224-8888888', '[alamat email dihapus]'),
  ('CV. Gudang Sandal', 'Jl. Sandal No. 5, Yogyakarta', '+6227-9999999', '[alamat email dihapus]');


CREATE TABLE tb_karyawan (
  id_karyawan INT PRIMARY KEY AUTO_INCREMENT,
  nama VARCHAR(100) NOT NULL,
  alamat VARCHAR(255),
  gaji DOUBLE NOT NULL,
  posisi VARCHAR(50) NOT NULL
);

INSERT INTO tb_karyawan (nama, alamat, gaji, posisi) VALUES
  ('Budi', 'Jl. Karyawan No. 1, Bandung', 3000000, 'Penjaga Toko'),
  ('Ani', 'Jl. Karyawan No. 2, Jakarta', 3500000, 'Kasir'),
  ('Cici', 'Jl. Karyawan No. 3, Surabaya', 4000000, 'Penjaga Gudang'),
  ('Dedi', 'Jl. Karyawan No. 4, Semarang', 3000000, 'Sales'),
  ('Evi', 'Jl. Karyawan No. 5, Yogyakarta', 3500000, 'Marketing'),
  ('Fani', 'Jl. Karyawan No. 6, Bandung', 4000000, 'Supervisor'),
  ('Gani', 'Jl. Karyawan No. 7, Jakarta', 3000000, 'Penjaga Toko'),
  ('Hani', 'Jl. Karyawan No. 8, Surabaya', 3500000, 'Kasir'),
  ('Iki', 'Jl. Karyawan No. 9, Semarang', 4000000, 'Penjaga Gudang'),
  ('Jeni', 'Jl. Karyawan No. 10, Yogyakarta', 3000000, 'Sales');


CREATE TABLE tb_gudang (
  id_gudang INT PRIMARY KEY AUTO_INCREMENT,
  nama VARCHAR(100) NOT NULL,
  alamat VARCHAR(255) NOT NULL
);

INSERT INTO tb_gudang (nama, alamat) VALUES
  ('Gudang Pusat', 'Jl. Gudang Pusat No. 1, Bandung'),
  ('Gudang Cabang', 'Jl. Gudang Cabang No. 1, Surabaya');

CREATE TABLE tb_transaksi (
  id_transaksi INT PRIMARY KEY AUTO_INCREMENT,
  id_karyawan INT NOT NULL,
  id_produk INT NOT NULL,
  id_supplier INT NOT NULL,
  jumlah INT NOT NULL,
  tanggal_transaksi DATETIME NOT NULL,
  total_harga DOUBLE NOT NULL,
  FOREIGN KEY (id_karyawan) REFERENCES tb_karyawan(id_karyawan),
  FOREIGN KEY (id_produk) REFERENCES tb_produk(id_produk),
  FOREIGN KEY (id_supplier) REFERENCES tb_supplier(id_supplier)
);

INSERT INTO tb_transaksi (id_karyawan, id_produk, id_supplier, jumlah, tanggal_transaksi, total_harga) VALUES
  (1, 1, 1, 10, '2024-05-12 10:00:00', 500000),
  (2, 2, 2, 5, '2024-05-12 11:00:00', 500000),
  (3, 3, 1, 8, '2024-05-12 12:00:00', 1200000),
  (4, 4, 2, 2, '2024-05-12 13:00:00', 400000),
  (5, 5, 3, 4, '2024-05-12 14:00:00', 120000),
  (6, 6, 1, 6, '2024-05-12 15:00:00', 240000),
  (7, 7, 2, 3, '2024-05-12 16:00:00', 300000),
  (8, 8, 3, 2, '2024-05-12 17:00:00', 300000),
  (9, 9, 1, 1, '2024-05-12 18:00:00', 200000),
  (10, 10, 2, 4, '2024-05-12 19:00:00', 120000);
  
  SELECT * FROM tb_transaksi;

CREATE TABLE tb_stok (
  id_stok INT PRIMARY KEY AUTO_INCREMENT,
  id_gudang INT NOT NULL,
  id_produk INT NOT NULL,
  jumlah INT NOT NULL,
  tanggal_update DATETIME NOT NULL,
  FOREIGN KEY (id_gudang) REFERENCES tb_gudang(id_gudang),
  FOREIGN KEY (id_produk) REFERENCES tb_produk(id_produk)
);

INSERT INTO tb_stok (id_gudang, id_produk, jumlah, tanggal_update) VALUES
  (1, 1, 50, '2024-05-01'),
  (1, 2, 30, '2024-05-01'),
  (1, 3, 20, '2024-05-01'),
  (1, 4, 15, '2024-05-03'),
  (1, 5, 10, '2024-05-03'),
  (1, 6, 8, '2024-05-03'),
  (1, 7, 6, '2024-05-03'),
  (1, 8, 4, '2024-05-04'),
  (1, 9, 2, '2024-05-04'),
  (1, 10, 1, '2024-05-05'),
  (2, 1, 25, '2024-05-05'),
  (2, 2, 15, '2024-05-05'),
  (2, 3, 10, '2024-05-05'),
  (2, 4, 8, '2024-05-06'),
  (2, 5, 5, '2024-05-06'),
  (2, 6, 4, '2024-05-07'),
  (2, 7, 3, '2024-05-08'),
  (2, 8, 2, '2024-05-09'),
  (2, 9, 1, '2024-05-11'),
  (2, 10, 0, '2024-05-12');
  
  -- NO 1 -- 
DELIMITER //
	CREATE PROCEDURE total_harga_transaksi_karyawan(
	  IN karyawan_id INT,
      OUT total DOUBLE)
	BEGIN
	  DECLARE total DOUBLE DEFAULT 0;

	  SELECT SUM(total_harga) INTO total
	  FROM tb_transaksi
	  WHERE id_karyawan = karyawan_id;

	  SELECT CONCAT('Total harga transaksi karyawan ', karyawan_id, ' : ', total) AS Total_Harga;
	END //
DELIMITER ;

SET @total = 0;
CALL total_harga_transaksi_karyawan(3,@total);

 -- NO 2 --
DELIMITER //
	CREATE PROCEDURE lama_produk_di_gudang(
	  IN produk_id INT,
	  IN gudang_id INT)
	BEGIN
	  DECLARE tanggal_masuk DATETIME;
	  DECLARE tanggal_cek DATETIME;
	  DECLARE lama_hari INT;

	  SELECT tanggal_update INTO tanggal_masuk
	  FROM tb_stok
	  WHERE id_produk = produk_id AND id_gudang = gudang_id
	  ORDER BY tanggal_update LIMIT 1;

	  SET tanggal_cek = CURRENT_TIMESTAMP();

	  SELECT DATEDIFF(tanggal_cek, tanggal_masuk) INTO lama_hari;

	  SELECT CONCAT('Lama produk ', produk_id, ' di gudang ', gudang_id, ' : ', lama_hari, ' hari') AS Lama_Barang;
	END //
DELIMITER ;
 
 CALL lama_produk_di_gudang(10,1);
 
 -- NO 3 -- 
DELIMITER //
	CREATE PROCEDURE hapus_transaksi_tertentu(
	  IN transaksi_id INT)
	BEGIN
	  DECLARE harga_total DOUBLE;
	  DECLARE is_deleted INT;

	  -- Menggunakan SUM() untuk mengambil total harga transaksi
	  SELECT SUM(total_harga) INTO harga_total
	  FROM tb_transaksi
	  WHERE id_transaksi = transaksi_id;

	  -- Memastikan bahwa hanya satu nilai total harga yang diambil
	  IF harga_total > 200000 THEN
		SET is_deleted = 0;
		SELECT CONCAT('Transaksi ', transaksi_id, ' tidak dapat dihapus karena total harga lebih dari Rp200.000') AS Hapus_Transaksi;
	  ELSE
		DELETE FROM tb_transaksi
		WHERE id_transaksi = transaksi_id;

		SET is_deleted = 1;
		SELECT CONCAT('Transaksi ', transaksi_id, ' berhasil dihapus') AS Hapus_Transaksi;
	  END IF;
	END //
DELIMITER ;


CALL hapus_transaksi_tertentu(1);