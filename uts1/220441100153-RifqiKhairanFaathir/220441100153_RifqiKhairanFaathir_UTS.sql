use db_tokoelektronik;

-- soal no 1 view
create view pesanan_diatas_rerata as
select p.nama_pembeli as nama_pelanggan, tr.total_harga as total, tr.tanggal_transaksi as tanggal_pesanan
from pembeli p join transaksi tr on p.pembeli_id = tr.pembeli_id
where tr.total_harga > (select avg(tr.total_harga) from transaksi);

-- soal no 2 view 
create view stok_gudang as
select nama_barang, stok_barang as jmlh_stok from barang
where stok_barang < 10;

-- soal no 3 view
create view detail_transaksi as 
select * from transaksi;


-- soal no 1 procedure
DELIMITER //
create procedure dataBarang ()
    BEGIN 
    select * from barang
    where nama_barang LIKE '%e%' AND stok_barang > 6;
    END //
DELIMITER ;

-- soal no 2 procedure
DELIMITER //
create procedure dataTransaksi()	
    BEGIN
    select * from transaksi
    where month(tanggal_transaksi) = 4 and day(tanggal_transaksi)
    between 3 and 9 
    AND jumlah_barang > 1;
    END //
DELIMITER ;

-- soal no 3 procedure 
DELIMITER //
create procedure jmlhTotal (out total_stok INT)
	BEGIN
	SET total_stok = (select SUM(stok_barang) from barang);
    
    select @total_stok as total_stok;
    END //
DELIMITER ;

-- soal no 4 procedure 
DELIMITER //
create procedure addDataSuplier (
	in nama_supplier varchar (100),
    in alamat_supplier varchar (225),
    in telepon_supplier varchar (20)
)
	BEGIN
	insert into supplier (nama_supplier,alamat_supplier,telepon_supplier) 
    values (nama_supplier,alamat_supplier,telepon_supplier);
	END //
DELIMITER ;

-- soal no 5 procedure 
DELIMITER //
create procedure updateDataPembeli (
	in pembeli_id int (11),
    in nama_pembeli varchar (100),
    in alamat_pembeli varchar (225),
    in telepon_pembeli varchar (20)
)
	BEGIN
	update pembeli 
    SET 
		nama_pembeli = nama_pembeli,
        alamat_pembeli = alamat_pembeli,
        telepon_pembeli = telepon_pembeli
		where pembeli_id = pembeli_id;
	END //
DELIMITER ;

-- soal no 6 procedure 
DELIMITER //

DELIMITER ;