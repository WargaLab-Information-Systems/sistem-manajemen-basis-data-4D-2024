use db_tokoelektronik;


create view show_rerata  as
select pembeli.nama_pembeli, transaksi.total_harga, transaksi.tanggal_transaksi
from pembeli natural join transaksi
where transaksi.total_harga > (select avg(total_harga) from transaksi);
select * from show_rerata;

create view show_nama_stok as
select nama_barang, stok from barang
where stok < 10;
select * from show_nama_stok;

 create view detail_data as
 select * from transaksi;
 select * from detail_data;
 
 -- nomor satu
 DELIMITER //
 CREATE PROCEDURE show_data(
 in namanyabarang varchar(50),
 in stoknya int(11)
 )
 begin
 SELECT * from barang 
 where nama_barang like concat("%",namanyabarang) and stok_barang = stoknya;
 end //
 DELIMITER ;
 call show_data('e','>6');
 drop procedure show_data;
 
 
 
 -- nomor dua
 DELIMITER //
 CREATE PROCEDURE transaksi_data(
 in transaksiid int(11),
 in tanggaltransaksi date,
 in jumlahbarang int(11),
 in totalharga double,
 in penjualid int(11),
 in pembelidi int(11)
 )
 begin
  select * from transaksi where jumlah_barang = jumlahbarang >1;
 end //
 DELIMITER ;
 call input_data (111, 'hasna', 'gresik', 034857349857);
 select * from supplier;
 
 -- no tiga
  DELIMITER //
 CREATE PROCEDURE show_data(
 out jumlahtotal int(10)
 )
 begin
 SELECT sum(stok_barang) from barang;
 end //
 DELIMITER ;
 call show_data (@jumlahtotal);
 select @jumlahtotal;
 drop procedure show_data;
 
 -- no empat
 DELIMITER //
 CREATE PROCEDURE input_data(
 in supplier_idnya int(11),
 in namanyasupplier varchar(100),
 in alamatsupplier varchar(225),
 in teleponsupplier varchar(20)
 )
 begin
  insert into supplier
  values (supplier_idnya, namanyasupplier, alamatsupplier, teleponsupplier);
 end //
 DELIMITER ;
 call input_data (12, 'hasna', 'gresik', 034857349857);
 
 --nmoer lima
 DELIMITER //
 CREATE PROCEDURE update_data(
 idpembeli int(11),
 namapembeli varchar(225),
 alamatpembeli varchar(225),
 teleponpembeli varchar(20)
 )
 begin
 update into pembeli
  values (idpembeli, namapembeli, alamatpembeli, teleponpembeli)
  where idpembeli=;
 end //
 DELIMITER ;
 call update_data (11, 'nadia', 'jakarta', 094747727729);
 
 select * from pembeli;
 
 -- no enam
 DELIMITER //
 CREATE PROCEDURE drop_table ()
 begin
drop table supplier;
 end //
 DELIMITER ;
 call drop_table (supplier);