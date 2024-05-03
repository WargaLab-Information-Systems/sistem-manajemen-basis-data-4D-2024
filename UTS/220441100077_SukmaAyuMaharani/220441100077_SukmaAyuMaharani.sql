// SUKMA AYU MAHARANI
// 220441100077
//SISTEM MANAJEMEN BASIS DATA - 4D
UTS 

use wawaaaawwww;
-- nomer 1
select avg(total_harga) as rata_pesanan from transaksi;
create view pesanan_lebihrata as
select nama_pembeli

-- stored procedure nomer 1
DELIMITER//
create procedure tampil_barang(
    nama_barang varchar (100),
    stok_barang int(11)
    
begin
	select nama_barang, stok_barang
    from barang
    where nama_barang like concat('%' nama_barang, '%')
    and stok_barang > 6 
end //
DELIMITER//


-- nomor 4
DELIMITER //

create procedure input_supplier(
	supplier_id_a int(11),
    nama_supplier_a varchar(100),
    alamat_supplier_a varchar(255),
    telepon_supplier_a varchar (20))
begin
	insert into supplier (supplier_id, nama_supplier,alamat_supplier,telepon_supplier)
    values (supplier_id_a, nama_supplier_a,alamat_supplier_a,telepon_supplier_a);
END //
DELIMITER //
call input_supplier (11, 'sukma', 'bjn', 082232465558);
select * from supplier

-- nomer 3
create procedure jumlah_total(
	OUT jumlah_total int,
    out stok_barang int)
begin
	select count(*) into jumlah_total
    from barang 
    where stok_barang = jumlah_total;
END //
DELIMITER //
call jumlah_total




