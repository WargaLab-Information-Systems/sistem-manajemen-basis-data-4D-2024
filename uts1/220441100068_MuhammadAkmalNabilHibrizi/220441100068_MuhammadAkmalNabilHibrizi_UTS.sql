use wawaaaawwww;
-- view
-- 1
CREATE VIEW view_pesaan AS
SELECT nama_pelanggan, total, tanggal AS jumlah
FROM transaksi
WHERE total > (SELECT * from jumlah_barang);

select * from transaksi;

-- 2
CREATE VIEW view_stok AS
SELECT nama_barang
FROM barang
WHERE stok_barang < 10;

select * from view_stok;
select * from barang;
-- 3
CREATE VIEW view_detail AS
SELECT *
FROM transaksi;

select * from view_detail;

-- stored_procedure

-- 6
drop procedure barang;

-- 4
DELIMITER //
CREATE PROCEDURE empat(
  idsupplier VARCHAR(15),
  namasupplier VARCHAR(20),
  alamatsupplier VARCHAR(25),
  telponsupplier VARCHAR(50)
)
	BEGIN
	  INSERT INTO supplier (
		supplier_id,
		nama_supplier,
		alamat_supplier,
		telepon_supplier
	  )
	  VALUES (
		idsupplier,
		namasupplier,
		alamatsupplier,
        telponsupplier
	  );
	END //
DELIMITER ;
CALL empat('11', 'yanti', 'telang', '085999999999');
select * from supplier;

-- 3 
DELIMITER //
CREATE PROCEDURE tiga(
    OUT jml INT
)
BEGIN
    SELECT COUNT(*) INTO jml
    FROM barang;
END //
DELIMITER ;

CALL tiga();
select * from barang;
