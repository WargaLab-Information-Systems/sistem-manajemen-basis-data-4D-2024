USE UTS;

SELECT * FROM BARANG;

-- CREATE VIEW

-- nomer 1 create view
CREATE VIEW rata2_pesanan AS
SELECT p.nama_pembeli, t.total_harga,t.jumlah_barang from pembeli p join transaksi t 
on p.pembeli_id = t.pembeli_id 
where t.jumlah_barang > (SELECT AVG(jumlah_barang) from transaksi); 

-- nomer 2 create view
create view barangkurangdari10 AS
SELECT nama_barang, stok_barang from barang	
where stok_barang < 10
;

-- nomer 3 create view
CREATE VIEW detailnomer3 AS
SELECT p.nama_pembeli, t.total_harga,t.jumlah_barang, penj.nama_penjual from pembeli p 
join transaksi t on p.pembeli_id = t.pembeli_id join penjual penj on t.penjual_id = penj.penjual_id group by p.pembeli_id;


-- STORED PROCEDURE
 
-- nomer1 stored procedure
 DELIMITER //
CREATE PROCEDURE namahurufedankurangdari10 (
nama VARCHAR (50),
stok INT (10))
begin 
 SELECT * FROM barang
 where nama_barang LIKE CONCAT('%',nama,'%') AND
stok_barang = stok < 10;
 END //
 DELIMITER //
 drop procedure namahurufedankurangdari10;
 call namahurufedankurangdari10("e",5);
 
--  nomer 3 stored procedure
 DELIMITER //
 CREATE PROCEDURE totalstokbarang (
OUT stok INT (10))
BEGIN
    SELECT SUM(stok)
    FROM barang
    WHERE stok_barang = stok;
END //
 DELIMITER //

-- nomer 4 stored procedure
DELIMITER //
CREATE PROCEDURE masukinkesupplier (
id INT(15),
nama VARCHAR (50),
alamat VARCHAR (50),
telp varchar (50))
begin 
 INSERT INTO SUPPLIER VALUES (id, nama, alamat, telp);
 END //
 DELIMITER //
 
 call masukinkesupplier (11, "nadhif", "nilam", "081330162");
 
--  nomer 5 stored procedure
 create procedure ubahnamapembeli(
 IN id INT (11)
 )
 BEGIN 
 UPDATE FROM pembeli where id
 end // 
 delimiter //
 
 



 
 
 
 
 






