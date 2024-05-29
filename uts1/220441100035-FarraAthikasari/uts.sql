USE db_tokoelektronik;

-- VIEW
-- NOMOR 1
CREATE VIEW lebih_dari_rata_rata AS
SELECT p.nama_pembeli, t.total_harga, t.tanggal_transaksi
FROM pembeli p
JOIN transaksi t;
SELECT AVG(total);
SELECT * FROM lebih_dari_rata_rata;

-- NOMOR 2
CREATE VIEW stok_kurang_dari_10 AS
SELECT nama_barang, stok_barang
FROM barang
WHERE stok < 10;
SELECT * FROM stok_kurang_dari_10;

-- NOMOR 3
CREATE VIEW detail_data_tiap_transaksi AS
SELECT (transaksi_id, tanggal_transaksi, jumlah_barang, total_harga, penjual_id, pembeli_id)
FROM transaksi;
SELECT * FROM detail_data_tiap_transaksi;



-- PROCEDURE\
-- NOMOR 1
CREATE PROCEDURE stok_barang_lebih6 (


-- NOMOR 2
CREATE PROCEDURE transaksi (
	IN tanggal_transaksi,
	IN jumlah_barang(11)
)
BEGIN
INSERT INTO transaksi VALUES ('2024-04-03', 3)
END--
CALL transaksi;


-- NOMOR 3
CREATE PROCEDURE jumlah_total_stok (
OUT stok_barang = stok_barang_baru(11),
	jumlah_stok,
CALL ju 

-- NOMOR 4 
DELIMITTER --
CREATE PROCEDURE memasukkan_data_supplier(
	IN supplier_id (25),
	IN nama_supplier (100),
	IN alamat_supplier (255),
	IN telepon_supplier (20)
)
BEGIN
	INSERT INTO supplier VALUES (11, 'Farra Athikasari', 'Jl. Kadet Soewoko', '081234567157')
END--
DELIMITTER;
CALL memasukkan_data_supplier;

	











