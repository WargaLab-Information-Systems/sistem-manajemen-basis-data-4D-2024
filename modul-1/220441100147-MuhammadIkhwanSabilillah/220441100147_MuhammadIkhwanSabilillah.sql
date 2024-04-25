CREATE DATABASE UniversitasTrunojoyo;
SHOW DATABASES;
USE UniversitasTrunojoyo;
CREATE TABLE mhs (nim INT (11), nama VARCHAR (50));
show tables;
CREATE TABLE status_mhs (id_status INT (11), status VARCHAR (50));
CREATE TABLE pembayaran (id_pembayaran INT (11), nim INT (11), jumlah_biaya VARCHAR (50), tgl date);
ALTER TABLE mhs 
	ADD COLUMN id_status int (11) NOT NULL AFTER nama;
show tables;

ALTER TABLE mhs 
	ADD COLUMN alamat varchar (25) NOT NULL AFTER nama;
show tables;

create table dosen (nrp int(11), nama_dosen varchar(50), alamat varchar(50));
create table gaji_dosen (id_gaji int(11), nrp int(11), jumlah_gaji  varchar (50), tgl_pembayaran date);
create table matkul(id_matkul int(11), nama_matkul varchar(50));
create table tagihan(id_tagihan int(11), jenis_tagihan varchar(50), jumlah_bayar varchar(50), tgl_byr date);
create table pembelian(id_pembelian int(11), jumlah_pembelian varchar(50), tgl_pembelian date, keterangan varchar (50));
create table ambil_matkul(id_ambil_matkul int(11), nim int(11), id_matkul int(11));
create table tagihan(id_tagihan int(11), jumlah_bayar int(10), jenis_tagihan varchar(50), tanggal_tagihan date, primary key(id_tagihan));

alter table status_mhs add primary key (id_status);
alter table pembayaran add primary key (id_pembayaran);
alter table dosen add primary key (nrp);
alter table gaji_dosen add primary key (id_gaji);
alter table matkul add primary key (id_matkul);
alter table matkul add primary key (id_matkul);
alter table ambil_matkul add primary key (id_ambil_matkul);
alter table tagihan add primary key (id_tagihan);
alter table pembelian add primary key (id_pembelian);
alter table mhs add constraint id_status foreign key (id_status) references status_mhs(id_status);
alter table gaji_dosen add constraint nrp foreign key (nrp) references dosen(nrp);
alter table pembayaran add constraint nim foreign key (nim) references mhs(nim);
drop table ambil_matkul;
create table ambil_matkul(id_ambil_matkul int(11), nim int (11), id_matkul int(11), primary key(id_ambil_matkul));
alter table ambil_matkul add constraint fk_nim foreign key (nim) references mhs(nim);
alter table ambil_matkul add constraint id_matkul foreign key (id_matkul) references matkul(id_matkul);

insert into status_mhs (id_status, status) values 
(101, "Lulus"),(102, "Aktif"), (103, "Cuti");

insert into mhs (nim, nama, alamat, id_status) values
(2201, "Vigo", "Surabaya", 102),
(2202, "Nasikh", "Lamongan", 102),
(2203, "Sabil", "Gresik", 102),
(2204, "Endra", "Bangkalan", 103),
(2205, "Faril", "Tulungangung", 103),
(2206, "Rizky", "Sidoarjo", 102),
(2207, "Dani", "Pekalongan", 102),
(2208, "Erick", "Mojokerto", 102),
(2209, "Rijal", "Gresik", 101),
(2210, "Rafi", "Surabaya", 101);

insert into pembayaran (id_Pembayaran, nim, jumlah_biaya, tgl) values
(1, 2201, 3000000 , "2024-03-26" ),
(2, 2202, 1500000 , "2024-03-24" ),
(3, 2203, 3000000 , "2024-03-26" ),
(4, 2204, 500000 , "2024-03-23" ),
(5, 2205, 3000000 , "2024-03-26" ),
(6, 2206, 1500000 , "2024-03-22" ),
(7, 2207, 3000000 , "2024-03-23" ),
(8, 2208, 1500000 , "2024-03-26" ),
(9, 2209, 2000000 , "2024-03-21" ),
(10, 2210, 500000 , "2024-03-21" );

insert into dosen (nrp, nama_dosen, alamat) values
(1901, "wisnu wardana", "Surabaya"),
(1902, "nasikh zainal", "sampang"),
(1903, "risky kurniawan", "Sidoarjo"),
(1904, "andi pratama", "bangkalan"),
(1905, "dodik setiawan", "Surabaya"),
(1906, "taufik hidayat", "lumajang"),
(1907, "ahmad rozi", "bangkalan"),
(1908, "abid maulana", "Surabaya"),
(1909, "sadil ramdhani", "Surabaya"),
(1910, "putra singkih", "Sidoarjo");

insert into matkul (id_matkul, nama_matkul) values
(111,"algoritma pemrograman"),
(112,"pemrograman bergerak"),
(113,"data mining"),
(114,"rekayasa perangkat lunak"),
(115,"sistem pendukung keputusan"),
(116,"sistem manjemen basis data"),
(117,"logika enginering"),
(118,"bahasa indonesia"),
(119,"bahasa inggris"),
(120,"pendidikan agama islam");

INSERT INTO tagihan (id_tagihan, jenis_tagihan, jumlah_bayar, tanggal_tagihan) 
VALUES 
    (1, 'SPP Semester 1', 5000000, '2024-01-01'),
    (2, 'SPP Semester 2', 5000000, '2024-06-01'),
    (3, 'Uang Kuliah Tunggal', 7500000, '2024-09-01'),
    (4, 'Uang Pangkal', 10000000, '2024-01-15'),
    (5, 'Uang Praktikum', 2000000, '2024-03-01'),
    (6, 'Biaya Pendaftaran', 1000000, '2024-01-10'),
    (7, 'Uang Gedung', 3000000, '2024-01-20'),
    (8, 'Uang Seminar', 500000, '2024-02-05'),
    (9, 'Uang Buku', 1500000, '2024-01-05'),
    (10, 'Biaya Kesehatan', 1000000, '2024-03-10');

INSERT INTO pembelian (id_pembelian, jumlah_pembelian, tgl_pembelian, keterangan) 
VALUES 
    (1, 5000000, '2024-01-05', 'Pembelian proyektor untuk ruang kuliah'),
    (2, 3000000, '2024-02-10', 'Pembelian buku teks untuk mata kuliah X'),
    (3, 2000000, '2024-03-15', 'Pembelian mikroskop untuk laboratorium'),
    (4, 1500000, '2024-04-20', 'Pembelian alat tulis untuk dosen'),
    (5, 10000000, '2024-05-25', 'Pembelian komputer untuk laboratorium komputer'),
    (6, 500000, '2024-06-30', 'Pembelian alat musik untuk keperluan seni'),
    (7, 8000000, '2024-07-05', 'Pembelian printer untuk pusat cetak'),
    (8, 2500000, '2024-08-10', 'Pembelian perangkat lunak untuk laboratorium'),
    (9, 4000000, '2024-09-15', 'Pembelian peralatan olahraga untuk keperluan fisik'),
    (10, 6000000, '2024-10-20', 'Pembelian alat eksperimen untuk laboratorium sains');

alter table gaji_dosen change column tgl_pembayaran tgl_gaji date;
INSERT INTO gaji_dosen (id_gaji, nrp, jumlah_gaji, tgl_gaji) 
VALUES 
    (1, 1901, 8000000, '2024-01-01'),
    (2, 1902, 8500000, '2024-02-01'),
    (3, 1903, 9000000, '2024-03-01'),
    (4, 1904, 9500000, '2024-04-01'),
    (5, 1905, 10000000, '2024-05-01'),
    (6, 1906, 10500000, '2024-06-01'),
    (7, 1907, 11000000, '2024-07-01'),
    (8, 1908, 11500000, '2024-08-01'),
    (9, 1909, 12000000, '2024-09-01'),
    (10, 1910, 12500000, '2024-10-01');

INSERT INTO ambil_matkul (id_ambil_matkul, nim, id_matkul) VALUES
(301, 2201, 111), 
(302, 2201, 112), 
(303, 2201, 113),
(304, 2202, 114),
(305, 2202, 115),
(306, 2202, 116),
(307, 2203, 117),
(308, 2203, 118),
(309, 2203, 119),
(310, 2206, 120),
(311, 2206, 111), 
(312, 2206, 112),
(313, 2207, 113),
(314, 2207, 114),
(315, 2207, 115),
(316, 2208, 116),
(317, 2208, 117), 
(318, 2208, 118); 

select * from ambil_matkul;
select nama_dosen,jumlah_gaji from gaji_dosen a join dosen b on a.nrp= b.nrp;


select nama, status from mhs a join status_mhs b on a.id_status=b.id_status where status = "Aktif";
select * from status_mhs;

select * from pembayaran;

UPDATE mhs SET alamat = 'Jakarta' WHERE nim = 2203;

