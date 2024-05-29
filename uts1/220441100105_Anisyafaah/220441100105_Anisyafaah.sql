USE uts;

-- View
-- Nomor 1
CREATE VIEW LihatPembeli AS 
SELECT nama_pembeli, total_harga AS total , tanggal_transaksi AS tanggal_pesanan 
FROM pembeli JOIN transaksi ON pembeli.pembeli_id = transaksi.pembeli_id WHERE total > AVG(total_harga);

-- Nomor 2
CREATE VIEW totalStok AS
SELECT nama_barang, stok_barang AS jumlah_stok
FROM barang 
WHERE stok_barang < 10;

-- Nomor 3
CREATE VIEW detailData AS 
SELECT transaksi_id AS id_transaksi, tanggal_transaksi, jumlah_barang, total_harga, penjual_id, pembeli_id FROM transaksi;

-- Stored Procedure
-- Nomor 1
DELIMITER //
CREATE PROCEDURE DataBarang (NamaBarang VARCHAR (100), StokBarang INT(11))
BEGIN
	SELECT * FROM barang
    WHERE nama_barang LIKE '%e%'
    AND stok_barang > 6;
END //
DELIMITER ;

CALL DataBarang("Mesin Cuci ", "6");

-- Nomor 2
DELIMITER //
CREATE PROCEDURE DataTransaksi (TglTransaksi DATE, JmlBarang INT(11))
BEGIN
	SELECT * FROM transaksi
    WHERE tanggal_transaksi >= "2024-04-03"
    AND tanggal_transaksi <= "2024-04-09"
    AND jumlah_barang > 1;
END //
DELIMITER ;

CALL DataTransaksi ("2024-04-03", 1);

-- Nomor 3
DELIMITER //
CREATE PROCEDURE JmlTotal (OUT JmlStok INT(11))
BEGIN
	SELECT COUNT(nama_barang)
    INTO JmlStok
    FROM barang;
END //
DELIMITER ;

CALL JmlTotal(@JmlStok);
SELECT @JmlStok;

-- Nomor 4
DELIMITER //
CREATE PROCEDURE TambahSupplier (
	id_supplier INT(11),
    namasupplier VARCHAR(100),
    alamatsupplier VARCHAR(255),
    telpsupplier VARCHAR(20))
BEGIN
	INSERT INTO supplier VALUES (supplier_id, nama_supplier, alamat_supplier, telepon_supplier);
END //
DELIMITER ;

CALL TambahSupplier ("11", "Phone Electronik", "Telang Indah Gg. 2", "081230592478")

-- Nomor 5
DELIMITER //
CREATE PROCEDURE UpdateData (
	id_pembeli INT(11), 
    namapembeli VARCHAR (100),
    alamatpembeli VARCHAR(255),
    telppembeli VARCHAR(20))
BEGIN
	UPDATE pembeli SET pembeli_id = id_pembeli, nama_pembeli = namapembeli, alamat_pembeli = alamatpembeli, telepon_pembeli = telppembeli
    WHERE pembeli_id = id_pembeli 
    AND nama_pembeli = namapembeli
    AND alamat_pembeli = alamatpembeli
    AND telepon_pembeli = telppembeli;
END //
DELIMITER ;

CALL UpdateData(2, "Anisa", "Telang", "082141432565");

-- Nomor 6
DELIMITER //
CREATE PROCEDURE HapusTabel (nama_tabel VARCHAR(100))
BEGIN
	DROP TABLE nama_tabel;
END //
DELIMITER ;

CALL HapusTabel (pembeli);