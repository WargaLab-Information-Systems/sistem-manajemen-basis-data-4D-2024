-- nomor 1 view 
CREATE VIEW rata_rata_pesanan AS 
SELECT pembeli.nama_pembeli, COUNT(transaksi.transaksi_id) as total_transaksi , tanggal_transaksi FROM transaksi JOIN pembeli ON pembeli.pembeli_id = transaksi.pembeli.id WHERE total_transaksi > (SELECT AVG(transaksi_id) FROM transaksi);

-- Nomor 2 View
CREATE VIEW stokbarang AS 
SELECT nama_barang, stok_barang FROM barang WHERE stok_barang < 10;
-- Nomor 3 View 
CREATE VIEW detailtransaksi AS
SELECT * FROM transaksi JOIN pembayaran ON transaksi.transaksi_id = pembayaran.transaksi_id;

-- Nomor 1 Procedure
DELIMITER //
CREATE PROCEDURE databarang()
BEGIN
SELECT * FROM barang WHERE nama_barang = "%e%" AND stok_barang > 6;
END //
DELIMITER ;
-- Nomor 2 Procedure
 DELIMITER //
CREATE PROCEDURE datatransaksi()
BEGIN
SELECT * FROM transaksi WHERE tanggal_transaksi BETWEEN "03-04-2024" AND "09-04-2024";
END //
DELIMITER ;
-- Nomor 6 Procedure
 DELIMITER //
CREATE PROCEDURE hapustabel()
BEGIN
DROP TABLE transaksi;
END //
DELIMITER ;
-- Nomor 5 Procedure
 DELIMITER //
CREATE PROCEDURE updatepembeli(IN ppembeli_id INT(11), IN pnama_pembeli VARCHAR(100), IN palamat_pembeli VARCHAR(255), ptelepon_pembeli VARCHAR(20))
BEGIN
UPDATE pembeli SET nama_pembeli = pnama_pembeli, alamat_pembeli = palamat_pembeli, telepon_pembeli = ptelepon_pembeli WHERE pembeli_id = ppembeli_id ;
END //
DELIMITER ;
DELIMITER ;
-- Nomor 4 Procedure
 DELIMITER //
CREATE PROCEDURE inputsuplier(IN psupplier_id INT(11), IN pnama_supplier VARCHAR(100), IN palamat_supplier VARCHAR(255), ptelepon_supplier VARCHAR(20))
BEGIN
INSERT INTO pembeli (supplier_id, nama_supplier, alamat_supplier, telepon_supplier) VALUES (psupplier_id, pnama_supplier, palamat_supplier, ptelepon_supplier)  ;
END //
DELIMITER ;
-- Nomor 3 Procedure
 DELIMITER //
CREATE PROCEDURE jumlahstoks(OUT stocks INT(10))
BEGIN
SELECT SUM(stok_barang) INTO stocks FROM barang;
END //
DELIMITER ;