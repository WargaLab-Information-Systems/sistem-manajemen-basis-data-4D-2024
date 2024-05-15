use uts;

-- soal 1
CREATE OR REPLACE VIEW info_pesanan AS
SELECT pembeli.nama_pembeli, transaksi.total_harga, transaksi.tanggal_transaksi
FROM pembeli JOIN transaksi ON pembeli.pembeli_id = transaksi.pembeli_id
WHERE transaksi.total_harga > AVG(transaksi.total_harga);

-- soal 2
CREATE OR REPLACE VIEW stok AS
SELECT barang.nama_barang, barang.stok_barang
FROM barang
WHERE stok_barang < 10;
SELECT * FROM stok;

-- soal 3
CREATE OR REPLACE VIEW detail_transaksi AS
SELECT * FROM transaksi;
SELECT * FROM detail_transaksi;


-- soal 1
DELIMITER //
CREATE PROCEDURE data_barang (
    IN nama_barang VARCHAR (100),
    IN stok_barang INT)
    BEGIN
		SELECT * FROM barang
		WHERE nama_barang = '%e%'
		AND stok_barang > 6;
    END //
DELIMITER ;
CALL data_barang ('Kamera Mirrorless', 7);

select * from barang;

-- soal 2
DELIMITER //
CREATE PROCEDURE data_transaksi (
    IN tanggal_transaksi DATE,
    IN jumlah_barang INT(11))
    BEGIN
		SELECT * FROM transaksi WHERE tanggal_transaksi = '2024-04-09'
        AND jumlah_barang > 1;
	END //
DELIMITER ;

-- soal 3
DELIMITER //
CREATE PROCEDURE jumlah_stok (
	OUT jumlah_stok INT)
    BEGIN
    SELECT SUM(stok_barang) INTO jumlah_stok FROM barang;
    END //
DELIMITER ;
CALL jumlah_stok (@jumlah_stok);

-- soal 4
DELIMITER //
CREATE PROCEDURE insert_supplier (
	IN supplier_id INT (11),
    IN nama_supplier VARCHAR (255),
    IN alamat_supplier VARCHAR (30),
    IN telepon_supplier VARCHAR(10))
	BEGIN
		INSERT insert_supplier VALUES (supplier_id, nama_supplier, alamat_supplier, telepon_supplier) ;
	END//
DELIMITER ;

CALL insert_supplier (11, 'Matahari', 'Jl.Trunojoyo', '0812376');
SELECT * FROM supplier;

-- soal 5
DELIMITER //
CREATE PROCEDURE update_data (
	IN pembeli_id INT (11),
    IN nama_pembeli VARCHAR (255),
    IN alamat_pembeli VARCHAR (30),
    IN telepon_pembeli VARCHAR(10))
	BEGIN
		UPDATE pembeli INTO VALUES (pembeli_id, nama_pembeli, alamat_pembeli, telepon_pembeli);
	END//
DELIMITER ;

-- soal 6
DELIMITER //
CREATE PROCEDURE hapus_tabel (
	IN gudang_id INT (11),
    IN penjual_id INT (11),
    IN barang_id INT (11))
	BEGIN
		DELETE pembeli (pembeli_id, nama_pembeli, alamat_pembeli, telepon_pembeli);
	END//
DELIMITER ;