use uts;

-- nomor 1 
select avg(total_harga) AS rata_rata from transaksi;
create view pesanan_diatas_rata AS
select nama_pembeli AS nama_pelanggan, tanggal_transaksi AS tanggal_pesanan,total_harga AS total_pesanan
from pembeli a join transaksi b on a.pembeli_id = b.pembeli_id
where total_harga > (select avg(total_harga) AS rata_rata from transaksi);
select*from pesanan_diatas_rata;

-- nomor 2
create view jumlah_stok_lebih_sepuluh AS
Select nama_barang, stok_barang AS jumlah_barang
from barang
where stok_barang > 10;
select*from jumlah_stok_lebih_sepuluh;

-- nomor 1
DELIMITER //
CREATE PROCEDURE data_barang(
	IN nama_barang varchar (100),
    IN stok_barang INT
)
BEGIN
	select nama_barang, stok_barang
    from barang 
    where nama_barang LIKE CONCAT('%', nama_barang, '%')
    AND stok_barang > 6;
END //
DELIMITER ;
call data_barang ('e', @stok_barang );
select * from barang;

-- nomor 3
DELIMITER //
CREATE PROCEDURE jumlah_total_barang(
	OUT jumlah_total int 
)
BEGIN
	select COUNT(*) INTO jumlah_total
    from barang
    where stok_barang = jumlah_total;
END //
DELIMITER ;
CALL jumlah_total_barang(@jumlah_total);
select @jumlah_total AS jumlah_total;
select*from barang;
drop procedure jumlah_total_barang;

-- nomor 4
DELIMITER //
CREATE PROCEDURE masukkan_data_suplier(
	 IN supplier_id_baru int (11),
     nama_supplier_baru varchar (100),
     alamat_supplier_baru varchar(255),
     telepon_supplier_baru varchar (20)
)
BEGIN
	insert INTO supplier(supplier_id, nama_supplier, alamat_supplier, telepon_supplier) 
    VALUES (supplier_id_baru, nama_supplier_baru, alamat_supplier_baru, telepon_supplier_baru);
END //
DELIMITER ;
call masukkan_data_suplier(11 , 'sukma', 'bojonegoro', '124');
select*from supplier;

-- no 5
DELIMITER //
CREATE PROCEDURE update_data_pembeli(
	 
)
BEGIN
	
END //
DELIMITER ;
















	



