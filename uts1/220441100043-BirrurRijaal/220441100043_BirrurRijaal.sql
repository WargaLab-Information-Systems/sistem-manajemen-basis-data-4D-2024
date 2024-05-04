use utssmbd;

-- view no1
create view pesanan_lebihdari_ratarata as
select a.nama_pembeli, b. total_harga, 	b.tanggal_transaksi, (select avg(total_harga) from transaksi) as rata_rata
from transaksi b	
join pembeli a on b.transaksi_id=a.pembeli_id
where b.total_harga > (select avg(total_harga) from transaksi);

-- view no2
CREATE VIEW stok_kurangdari_sepuluh AS
SELECT a.nama_barang, a.stok_barang
FROM barang a
WHERE a.stok_barang <10;

-- view no3
CREATE VIEW detail_transaksi AS
SELECT transaksi_id, tanggal_transaksi, jumlah_barang, total_harga, penjual_id, pembeli_id
FROM transaksi;

-- procedure no1
DELIMITER //
CREATE PROCEDURE sp1(
    IN nama_barang varchar(10),
    IN stok_barang int(11)
)
BEGIN
    SELECT *
    FROM barang
	WHERE nama_barang = nama_barang
    AND stok_barang = stok_barang;
END //
DELIMITER ;

CALL sp1('e', '6');

-- procedure no3
DELIMITER //
CREATE PROCEDURE sp3(
    OUT barang_id int(10),
    OUT stok_barang int(11)
)
BEGIN
    SELECT *
    FROM barang
	WHERE barang_id = barang_id
    AND stok_barang = stok_barang;
END //
DELIMITER ;

CALL sp3;

-- procedure no4
DELIMITER //
CREATE PROCEDURE sp4(
    IN supplier_id int(10),
    IN nama_supplier varchar(50),
    IN alamat_supplier varchar(50),
    IN telepon_supplier varchar(20)
)
BEGIN
    SELECT *
    FROM supplier;
END //
DELIMITER ;

CALL sp4(insert ('122', 'budi', 'telang', '0853276522' ));
select * from supplier;

-- procedure no6
DELIMITER //
CREATE PROCEDURE sp6(
    OUT supplier_id int(10),
    OUT nama_supplier varchar(50),
    OUT alamat_supplier varchar(50),
    OUT telepon_supplier varchar(20)
)
BEGIN
    SELECT *
    FROM supplier;
END //
DELIMITER ;

CALL sp6('1');
select * from supplier;
