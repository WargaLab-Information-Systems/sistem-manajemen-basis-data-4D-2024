USE db_elektronik;

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

CREATE VIEW barang_stok_kurang AS
SELECT
  b.nama_barang,
  b.stok_barang
FROM barang AS b
WHERE b.stok_barang < 10;

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

DELIMITER //

CREATE PROCEDURE barang_dengan_e_dan_stok_lebih_6()
BEGIN
  SELECT
    *
  FROM barang
  WHERE nama_barang LIKE '%e%' AND stok_barang > 6;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE transaksi_april_3_9_lebih_1_barang()
BEGIN
  SELECT
    *
  FROM transaksi
  WHERE MONTH(tanggal_transaksi) = 4
    AND DAY(tanggal_transaksi) BETWEEN 3 AND 9
    AND jumlah_barang > 1;
END $$

DELIMITER ;

DELIMITER //

CREATE PROCEDURE total_stok_barang(OUT total_stok INT)
BEGIN
  SET total_stok = (SELECT SUM(stok_barang) FROM barang);

  SELECT @total_stok AS total_stok;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE insert_supplier(
  IN nama_supplier VARCHAR(100),
  IN alamat_supplier VARCHAR(255),
  IN telepon_supplier VARCHAR(20)
)
BEGIN
  INSERT INTO supplier (
    nama_supplier,
    alamat_supplier,
    telepon_supplier
  )
  VALUES (
    nama_supplier,
    alamat_supplier,
    telepon_supplier
  );
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE update_pembeli(
  IN pembeli_id INT(11),
  IN nama_pembeli VARCHAR(100),
  IN alamat_pembeli VARCHAR(255),
  IN telepon_pembeli VARCHAR(20)
)
BEGIN
  UPDATE pembeli
  SET
    nama_pembeli = nama_pembeli,
    alamat_pembeli = alamat_pembeli,
    telepon_pembeli = telepon_pembeli
  WHERE pembeli_id = pembeli_id;
END //

DELIMITER ;