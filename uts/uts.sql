USE db_tokoelektronik


-- stored procedure
-- nomer 3
DELIMITER //
CREATE PROCEDURE GetJumlahBarang(
    OUT total_barang INT
)
BEGIN
    SELECT COUNT(*) INTO total_barang FROM barang;
END //

DELIMITER ;
CALL GetJumlahBarang(@total_barang);
SELECT @total_barang AS Total_Barang;


-- nomer4
DELIMITER //
CREATE PROCEDURE InsertSupplier(
    IN supplier_id INT(11),
    IN nama_supplier VARCHAR(100),
    IN alamat_supplier VARCHAR(255),
    IN telepon_supplier VARCHAR(20)
)
BEGIN
    INSERT INTO supplier (supplier_id, nama_supplier, alamat_supplier, telepon_supplier) 
    VALUES (supplier_id, nama_supplier, alamat_supplier, telepon_supplier);
END //
DELIMITER ;
CALL InsertSupplier('123', 'Alifia', 'Sampang', '1234567');

-- nomer 2
DELIMITER //
CREATE PROCEDURE Gettampilkan(
    IN jmlhbarang VARCHAR(6),
    IN trnsksi DATE
)
BEGIN
    SELECT * FROM transaksi WHERE jumlah_barang = jmlhbarang AND tanggal_transaksi = trnsksi;
END //
DELIMITER ;
CALL Gettampilkan('3', '2024-04-03');

select * from transaksi;

-- nomer 1
DELIMITER //
CREATE PROCEDURE namastok(
    IN nama_barang VARCHAR(100),
    IN stok INT
)
BEGIN
	SELECT namastok WHERE nama_barang like "%e%" AND stok = stok_barang < 6;
END //
DELIMITER ;
CALL nama_danstok (@nama_barang AND @stok_barang);


-- nomer 5
DELIMITER //
CREATE PROCEDURE namastok(
    IN nama_barang VARCHAR(100),
    IN stok INT
)
BEGIN
	SELECT namastok WHERE nama_barang like "%e%" AND stok = stok_barang < 6;
END //
DELIMITER ;
CALL nama_danstok (@nama_barang AND @stok_barang);

-- nomer 6
DELIMITER //
CREATE PROCEDURE namastok(
    IN nama_barang VARCHAR(100),
    IN stok INT
)
BEGIN
	SELECT namastok WHERE nama_barang like "%e%" AND stok = stok_barang < 6;
END //
DELIMITER ;
CALL namastok (@nama_barang AND @stok_barang);


