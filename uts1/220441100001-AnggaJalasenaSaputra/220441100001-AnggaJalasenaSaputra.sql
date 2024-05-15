use db_uts;

-- No 1 VIEW --
CREATE VIEW pesanan_diatas_rata AS
SELECT
  p.nama_pembeli,
  t.total_harga,
  t.tanggal_transaksi
FROM transaksi AS t
JOIN pembeli AS p ON t.pembeli_id = p.pembeli_id
WHERE t.total_harga > (
  SELECT AVG(total_harga)
  FROM transaksi
);

-- No 2 VIEW --
CREATE VIEW barang_stok_kurang AS
SELECT
  b.nama_barang,
  b.stok_barang
FROM barang AS b
WHERE b.stok_barang < 10;

-- No 3 VIEW --
CREATE VIEW transaksi_detail AS
SELECT
  t.transaksi_id,
  p.nama_pembeli,
  s.nama_supplier,
  b.nama_barang,
  t.jumlah_barang,
  t.total_harga,
  t.tanggal_transaksi
FROM transaksi AS t
JOIN pembeli AS p ON t.pembeli_id = p.pembeli_id
JOIN supplier AS s ON t.supplier_id = s.supplier_id
JOIN barang AS b ON t.barang_id = b.barang_id;


-- No 1  Stored Procedure --
DELIMITER //
CREATE PROCEDURE barang_dengan_e_dan_stok_lebih_6()
BEGIN
  SELECT
    *
  FROM barang
  WHERE nama_barang LIKE '%e%' AND stok_barang > 6;
END //
DELIMITER ;

-- No 2 Stored Procedure --
DELIMITER //

CREATE PROCEDURE transaksi_april_3hingga9_lebih_1_barang()
BEGIN
  SELECT * FROM transaksi
  WHERE MONTH(tanggal_transaksi) = 4
    AND DAY(tanggal_transaksi) BETWEEN 3 AND 9
    AND jumlah_barang > 1;
END //

DELIMITER ;

-- N0 5 Stored Procedure --
DELIMITER //
CREATE PROCEDURE update_data(
	id int,
    nama varchar (50),
    alamat varchar (50),
    telepon varchar (12))
BEGIN 
	UPDATE pembeli
    SET nama = ?, alamat = ?, telepon=?
    WHERE id = ?;
END//
DELIMITER ;

-- NO 6 STORED PROCEDURE--
DELIMITER //
CREATE PROCEDURE hapus_table(
	namaTabel varchar (20))
BEGIN
	DROP TABLE namaTabel;
END //
DELIMITER ;

CALL hapus_table('barang');


-- NO 4 STORED PROCEDURE--
DELIMITER //
CREATE PROCEDURE input_data(
	id int,
    nama varchar (50),
    alamat varchar (50),
    telepon varchar (12))
BEGIN
	insert into supplier values (id,nama,alamat,telepon);
END //
DELIMITER ;

CALL input_data(11,'Bintang','Darjo','082334543123');

-- N0 3 Stored Procedure --
DELIMITER //
CREATE PROCEDURE get_transaction_details()
AS
BEGIN
  SELECT t.*, p.nama_pelanggan
  FROM transaksi t
  INNER JOIN pembeli p ON t.id_pembeli = p.id_pembeli;
END //
DELIMITER ;



    
