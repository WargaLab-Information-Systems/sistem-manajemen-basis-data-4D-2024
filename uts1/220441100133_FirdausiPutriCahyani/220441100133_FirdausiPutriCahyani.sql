USE db_uts;

-- VIEW
-- nomor 1
CREATE VIEW upper_rata AS
SELECT nama_pembeli, total_harga, tanggal_transaksi FROM
	pembeli NATURAL JOIN transaksi
    WHERE total_harga > (SELECT AVG(total_harga));
    
-- nomor 2
CREATE VIEW stok_brg AS
SELECT nama_barang, stok_barang FROM
	barang 
    WHERE stok_barang < 10 ;
    
-- nomor 3
CREATE VIEW detail_transaksi AS
SELECT * FROM transaksi;

-- STORED PROCEDURE
-- nomor 1
DELIMITER //
CREATE PROCEDURE data_barang ()
BEGIN
	SELECT * FROM barang WHERE nama_barang LIKE concat('%e%') AND stok_barang > 7;
END //
DELIMITER ;

CALL data_barang ();

-- nomor 2
DELIMITER //
CREATE PROCEDURE detail_trans (IN tgl_trans VARCHAR (30), IN jml_barang INT (10))
BEGIN
	SELECT * FROM transaksi WHERE tanggal_transaksi = tgl_trans AND jumlah_barang = jml_barang AND jumlah_barang > 1;
END //
DELIMITER ;

CALL detail_trans ()

-- nomor 3
DELIMITER //
CREATE PROCEDURE total_stok (OUT total INT (10))
BEGIN
	SELECT SUM(stok_barang) FROM barang WHERE total = SUM(stok_barang);
END //
DELIMITER ;

CALL total_stok($total);
SELECT $total;

-- nomor 4 
DELIMITER //
CREATE PROCEDURE add_suplier (
	IN id_baru INT(11),
    IN nama_baru VARCHAR(255),
    IN alamat_baru VARCHAR (200),
    IN telepon VARCHAR (100)
)
BEGIN
	INSERT INTO supplier (supplier_id, nama_supplier, alamat_supplier, telepon_supplier)
    VALUES ( id_baru, nama_baru, alamat_baru, telepon);
END //
DELIMITER ;

CALL add_supplier('11','PT Garuda Jaya', 'Jl.Raya Sambiroto', '0856457391111') ;
SELECT * FROM supplier; -- nge cek dah masuk apa belum

-- nomor 5
DELIMITER //
CREATE PROCEDURE update_pembeli (
	IN namapembeli VARCHAR (122),
	IN alamat_baru VARCHAR (200)
)
BEGIN
	UPDATE pembeli SET alamat_pembeli = alamat_baru WHERE nama_pembeli = namapembeli;
END //
DELIMITER ;

SELECT * FROM pembeli;
CALL update_pembeli ('Ahmad', 'Jl.Kenangan');

-- nomor 6
DELIMITER //
CREATE PROCEDURE hapus_tabel ()
BEGIN
	DROP TABLE pembeli;
END //
DELIMITER ;

CALL hapus_tabel;

