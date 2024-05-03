
-- SOAL NOMER 1
CREATE VIEW pesanan_rata_rata AS
SELECT p.nama_pembeli, t.total_harga, t.jumlah_barang
FROM pembeli p JOIN transaksi t
ON p.pembeli_id = t.pembeli_id
WHERE t.jumlah_barang > (SELECT AVG(jumlah_barang) FROM transaksi);

select * from pesanan_rata_rata;

-- SOAL NOMER 2
CREATE VIEW stok AS
SELECT p.nama_barang
FROM barang p
WHERE stok_barang <10;

select * from stok;

-- SOAL NOMER 3
CREATE VIEW detail_pesanan AS
SELECT p.pembeli_id,p.nama_pembeli,  t.jumlah_barang,t.total_harga,pj.nama_penjual
FROM pembeli p JOIN transaksi t
ON p.pembeli_id = t.pembeli_id JOIN penjual pj
ON  t.penjual_id=pj.penjual_id
GROUP BY p.pembeli_id;

select * from detail_pesanan;


-- SOAL NOMER 1 PROCEDURE
DELIMITER // 
CREATE PROCEDURE huruf(
nama VARCHAR(20),
stok INT(3))
BEGIN 
SELECT * FROM barang
where nama_barang LIKE CONCAT('%',nama,'%') AND stok_barang=stok;
END //
DELIMITER //

-- SOAL NOMER 3 PROCEDURE
DELIMITER // 
CREATE PROCEDURE stok(
OUT stok INT(3)

)
BEGIN 
SELECT sum(stok) FROM barang
where stok_barang=stok;
END //
DELIMITER //

-- SOAL NOMER 4 PROCEDURE
DELIMITER // 
CREATE PROCEDURE data_supplier(
id INT(5),
nama VARCHAR(20),
alamat VARCHAR(30),
telp INT(11))
BEGIN
INSERT INTO supplier values (id,nama,alamat,telp);
END //
DELIMITER //








