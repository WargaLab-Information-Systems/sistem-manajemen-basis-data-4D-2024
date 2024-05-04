USE db_tokoelektronik;

-- view
-- nomor 1
create view vw_tampil1 as
	select pb.nama_pembeli, ts.total_harga, ts.tanggal_transaksi
    from pembeli as pb,
    transaksi as ts
    where ts.total_harga;
select * from vw_tampil1;
    
-- nomor 2
create view vw_tampil2 as
	select nama_barang, stok_barang
    from barang
    where stok_barang < 10;
select * from vw_tampil2;

-- nomor 3
create view vw_tampil3 as
	select  transaksi_id, tanggal_transaksi, jumlah_barang, total_harga, penjual_id, pembeli_id
    from transaksi;
select * from vw_tampil3;

-- stored procedure
-- nomor 1
DELIMITER //
create procedure pc_tampil1
    select * from barang
    where nama_barang = 'e' and
    stok_barang > 6;
DELIMITER ;

-- nomor 2
DELIMITER //
create procedure pc_tampil2(
	select * from transaksi
    where tanggal_transaksi('2024-04-03') and jumlah_barang > 1;
) 
DELIMITER ;
select * from pc_tampil2;

-- nomor 3 
DELIMITER //
create procedure pc_tampil3 
DELIMITER ; 
    
-- nomor 4 
DELIMITER //
create procedure pc_tampil4 (
	Idsupplier INT(4),
    nama_sp VARCHAR(100),
    alamat_sp VARCHAR(255),
    telepon_sp VARCHAR(20))
    select * from supplier
	where (supplier_id = Idsupplier,
    nama_supplier = nama_sp,
    alamat_supplier = alamat_sp,
    telepon_supplier = telepon_sp);
end //
DELIMITER ;
drop procedure pc_tampil4;
insert into pc_tampil4 value (11, 'bunga Electronics', 'Jl. jalan No. 21', '08124444222');
select * from supplier;

-- nomor 5
DELIMITER //
create procedure pc_tampil5 (
	Idpembeli INT,
    nama_pb VARCHAR(100),
    alamat_pb VARCHAR(255),
    telepon_pb VARCHAR(20))
    select * from pembeli
    where (Idpembeli = pembeli_id, 
    nama_pb = nama_pembeli,
    alamat_pb = alamat_pembeli,
    telepon_pb = telepon_pembeli
    );
end //
DELIMITER ;
select * from pembeli;

-- nomor 6
 DELIMITER //
 create procedure pc_tampil6
	
 DELIMITER ;

    
    