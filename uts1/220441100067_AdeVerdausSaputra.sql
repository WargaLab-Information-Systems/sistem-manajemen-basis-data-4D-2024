use db_tokoelektronik;

-- view
-- 1
create view v_diatas_rata2 as
select 
nama_pembeli,
total_harga,
tanggal_transaksi
from pembeli a join transaksi b on a.pembeli_id = b.pembeli_id
where total_harga > (select avg(total_harga) from transaksi);

select * from v_diatas_rata2;

-- 2
CREATE VIEW v_stok_rendah AS
SELECT
  nama_barang,
  stok_barang
FROM barang 
WHERE stok_barang < 10;

SELECT * FROM v_stok_rendah;

-- 3
create view v_transaksi as
select * from transaksi;

select * from v_transaksi;


-- stored procedure

-- 1

DELIMITER //
CREATE PROCEDURE search_barangg (
in nama_barang  varchar (100),
in stok_barang int(11)
)
begin 
select * from barang where nama_barang like "e'" and stok_barang > 6;
END //
DELIMITER ;

drop procedure search_barangg;
CALL search_barangg(100,11);

-- 2
DELIMITER //
CREATE PROCEDURE search_transaksi(
in tanggal_transaksi  date ,
in jumlah_barang int(11)
)
begin 
select * from transaksi where tanggal_transaksi = 2024-04-03 and tanggal_transaksi = 2024-04-04 and tanggal_transaksi = 2024-04-05 and tanggal_transaksi = 2024-04-06 and tanggal_transaksi = 2024-04-07 and tanggal_transaksi = 2024-04-08 and tanggal_transaksi = 2024-04-09 and jumlah_barang >1;
END //
DELIMITER ;

drop procedure search_transaksi;
CALL search_transaksi(2024-04-04,2);

select * from transaksi where tanggal_transaksi = "2024-04-03" and tanggal_transaksi = "2024-04-04" and jumlah_barang >1;
select * from transaksi;

-- 3
DELIMITER //
CREATE PROCEDURE search_stokbarang(
    OUT jumlah_barang INT
)
BEGIN
    SELECT sum(stok_barang) INTO jumlah_barang FROM barang ;
END //
DELIMITER ;
DROP procedure search_stokbarang;
call search_stokbarang(@jumlah_barang);

select@jumlah_barang;

-- 4
DELIMITER //
CREATE PROCEDURE insert_supplier(
    IN supplier_id int ,
    IN nama_supplier VARCHAR(100),
    IN alamat_supplier VARCHAR(255),
    IN telepon_supplier VARCHAR(20)
)
BEGIN
    INSERT INTO supplier (supplier_id, nama_supplier, alamat_supplier, telepon_supplier) 
    VALUES (supplier_id, nama_supplier, alamat_supplier, telepon_supplier);
END//
DELIMITER ;
drop procedure insert_supplier;

CALL insert_supplier('28', 'CV DIDIKEOMPOT', 'JL. HARDIKO ', "0858303929");

select * from  supplier;
-- 5
DELIMITER //
CREATE PROCEDURE insert_supplier(
    IN supplier_id int ,
    IN nama_supplier VARCHAR(100),
    IN alamat_supplier VARCHAR(255),
    IN telepon_supplier VARCHAR(20)
)
BEGIN
    INSERT INTO supplier (supplier_id, nama_supplier, alamat_supplier, telepon_supplier) 
    VALUES (supplier_id, nama_supplier, alamat_supplier, telepon_supplier);
END//
DELIMITER ;
drop procedure insert_supplier;

CALL insert_supplier('28', 'CV DIDIKEOMPOT', 'JL. HARDIKO ', "0858303929");
-- 6

CREATE PROCEDURE hapus_tabel ( )
begin 
drop table gudang 
END //
DELIMITER ;

CALL hapus_tabel();

