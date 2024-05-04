-- VIEW
-- No 1
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

-- No 2
CREATE VIEW barang_stok_kurang AS
SELECT
  b.nama_barang,
  b.stok_barang
FROM barang AS b
WHERE b.stok_barang < 10;

-- No 3
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






-- STORED PROCEDURE
-- No 1
DELIMITER //
CREATE PROCEDURE barang_dengan_e_dan_stok_lebih_6()
BEGIN
  SELECT
    *
  FROM barang
  WHERE nama_barang LIKE '%e%' AND stok_barang > 6;
END //
DELIMITER ;

-- No 2
DELIMITER //
CREATE PROCEDURE transaksi_april_3hingga9_lebih_1_barang()
BEGIN
  SELECT * FROM transaksi
  WHERE MONTH(tanggal_transaksi) = 4
    AND DAY(tanggal_transaksi) BETWEEN 3 AND 9
    AND jumlah_barang > 1;
END //
DELIMITER ;

-- NO 3 
DELIMITER //
CREATE PROCEDURE total_stock(
	OUT total INT)
BEGIN
	SELECT SUM(stock_barang) INTO total FROM barang;
END //
DELIMITER ;

-- NO 4
DELIMITER //
CREATE PROCEDURE input_data_supplier(
	id INT,
    nama VARCHAR (25),
    alamat VARCHAR (50),
    telepon VARCHAR (15))
BEGIN
	INSERT INTO supplier (supplier_name, supplier_address, supplier_phone)
	VALUES (?, ?, ?);
END //
DELIMITER ;

CALL input_data_pembeli(11,'angga','Perum Kamal','088327188827');

-- NO 5
DELIMITER //
CREATE PROCEDURE updt_pembeli(
	id INT,
    nama VARCHAR (25),
    alamat VARCHAR (50),
    telepon VARCHAR (15))
BEGIN
  UPDATE pembeli
  SET nama = ?, alamat = ?, telepon = ?
  WHERE id = ?;
END //
DELIMITER ;

-- NO 6 
DELIMITER //
CREATE PROCEDURE mengahpus_tabel(
	IN table_name VARCHAR(255)
)
BEGIN
  DECLARE is_deletable BOOLEAN DEFAULT FALSE;
  SELECT 1 INTO is_deletable
  FROM information_schema.tables
  WHERE table_name = ?;

  IF is_deletable THEN
    DROP TABLE ?;
  ELSE
    SIGNAL SQLSTATE '45000' SET MESSAGE = 'Table does not exist';
  END IF;
END;
DELIMITER ;
  