use db_uts;
-- 1 view
create view pesanan_diatas_ratarata as(
select pembeli.nama_pembeli, transaksi.total_harga, transaksi.tanggal_transaksi 
from pembeli join transaksi on pembeli.pembeli_id = transaksi.pembeli_id
where total_harga > (select avg (total_harga))
);
-- 2 view
create view stok as (
select barang.nama_barang, barang.stok_barang
from barang where stok_barang < 10);
-- 3 view
create view detail_data as (
select* from transaksi );

-- 1 sp
delimiter //
create procedure data_barang (
in namabarang varchar(50),
in stokbarang int(10))
begin
	select * from barang
    where nama_barang=namabarang and stok_barang=stokbarang and nama_barang like concat('%','e','%')
    and stok_barang > 6;
end //
delimiter ;
call data_barang('e',9);
-- 2 sp
delimiter //
create procedure tanggal_transaksi(
in tanggaltransaksi date,
in jumlahbarang int(10))
begin
	select * from transaksi
    where tanggal_transaksi=tanggaltransaksi and jumlah_barang=jumlahbarang
    and tanggal_barang='' and jumlah_barang > 1;
end //
delimiter ;
call tanggal_transaksi
-- 3 sp
delimiter //
create procedure jumlah_stok(
out stokbarang)
begin
	select sum(stok_barang) from barang
    where total = sum(stokbarang);
end //
delimiter ;
-- 4 sp
delimiter //
create procedure data_supplier(
in id_supplier int(10),
in namasupplier varchar (100),
in alamatsupplier varchar (100),
in telp_supplier varchar (20))
begin
	insert into supplier (supplier_id, nama_supplier, alamat_supplier, telepon_supplier)
    value (id_supplier, namasupplier, alamatsupplier, telp_supplier);
end //
delimiter ;
call data_supplier (11, 'PT.Indolakto', 'Pasuruan', '0312345678');
select * from data_supplier;
-- 5 sp
delimiter //
create procedure update_data(
in id_pembeli int(10),
in namapembeli varchar (50),
in alamatpembeli varchar (50),
in telp_pembeli varchar (50))
begin
	update pembeli set alamat_pembeli=alamatpembeli where nama_pembeli=namapembeli;
end //
delimiter ;
select * from pembeli;
call update_data('nanda','jl.Kartini');

 