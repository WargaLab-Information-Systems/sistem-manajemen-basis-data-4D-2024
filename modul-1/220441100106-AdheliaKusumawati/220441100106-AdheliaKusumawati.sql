create database db_trunojoyo;
use db_trunojoyo;

create table mahasiswa (nim char (20) not null, 
nama_mhs varchar (100) not null, 
prodi char (20) not null, 
status_mhs ENUM('aktif', 'berhenti', 'cuti', 'lulus'),   
primary key(nim));

create table dosen (nip char (20)  not null,
nama_dosen varchar (100) not null, 
alamat char (50) not null, 
primary key(nip));

create table matakuliah (id_matakuliah char (20),
matakuliah char (45) not null, 
sks int not null,
nip char (20) not null, 
primary key(id_matakuliah),
foreign key(nip) references dosen(nip));

create table kuliah (nim CHAR (20) not null,
id_matakuliah char (20) not null,
tahun year not null, 
semester char (2) not null, 
nilai char (3) not null,
foreign key(nim) references mahasiswa(nim),
foreign key(id_matakuliah) references matakuliah(id_matakuliah));

create table ukt (id_ukt int not null,
nim CHAR (20) not null,
semester INT not null,
tahun_ajaran year not null,
tanggal_bayar DATE not null,
jumlah_bayar INT,
primary key(id_ukt),
foreign key(nim) references mahasiswa(nim));

create table tagihan (id_tagihan INT not null,
  jenis_tagihan CHAR(50) not null,
  jumlah_tagihan INT not null,
  tanggal_bayar DATE,
  primary key(id_tagihan));
  
create table gajidosen (id_gaji int,
nip char (20) not null,
  tanggal_gaji date not null,
  gaji_pokok INT not null,
  primary key(id_gaji),
  foreign key(nip) references dosen(nip));
  
  
  create table pembelian (id_pembelian INT,
  tanggal_pembelian DATE not null,
  nama_barang varchar(100) not null,
  jumlah INT not null,
  harga_satuan INT not null,
  total_harga INT not null,
  primary key(id_pembelian));
  
  INSERT INTO mahasiswa (nim, nama_mhs, prodi, status_mhs) VALUES
('220441100101', 'adhelia', 'sistem informasi', 'aktif'),
('220441100102', 'fitri', 'agroteknologi', 'aktif'),
('220441100103', 'nisa', 'agribisnis', 'aktif'),
('220441100104', 'firda', 'informatika', 'aktif'),
('220441100105', 'maul', 'ekonomi', 'aktif'),
('220441100106', 'muksin', 'akuntansi', 'lulus'),
('220441100107', 'afifah', 'manajemen', 'lulus'),
('220441100108', 'dinda', 'hukum', 'berhenti'),
('220441100109', 'diana', 'sastra jawa', 'cuti'),
('220441100110', 'megan', 'sastra inggris', 'cuti');

insert into dosen (nip, nama_dosen, alamat) values
('2700001210', 'budi S.Kom', 'surabaya'),
('2700001211', 'bondan S.Ak', 'gresik'),
('2700001212', 'kusuma S.T', 'bangkalan'),
('2700001213', 'firliana S.Psi', 'sampang'),
('2700001214', 'vindiani S.Pd', 'kediri'),
('2700001215', 'ajak S.E', 'nganjuk'),
('2700001216', 'yakin S.Sos', 'tulungagung'),
('2700001217', 'eko S.E', 'jombang'),
('2700001218', 'endang S.Kom M.Kom', 'lamongan'),
('2700001219', 'jaujin S.Ak', 'sidoarjo');

insert into matakuliah (id_matakuliah, matakuliah, sks, nip) values
('303400899', 'ecom', '3', '2700001210'),
('303400900', 'pengantar basis data', '4', '2700001211'),
('303400901', 'data mining', '4', '2700001212'),
('303400902', 'pai', '3', '2700001213'),
('303400903', 'bahasa inggris', '2', '2700001214'),
('303400904', 'bahasa indonesia', '2', '2700001215'),
('303400905', 'bahasa jawa', '2', '2700001216'),
('303400906', 'e-goverment', '2', '2700001217'),
('303400907', 'arsitektur', '3', '2700001218'),
('303400908', 'adsi', '3', '2700001219');

insert into kuliah (nim, id_matakuliah, tahun, semester, nilai) values
('220441100101', '303400899', '2023', '3', '90'),
('220441100102', '303400900', '2023', '3', '89'),
('220441100103', '303400901', '2023', '3', '88'),
('220441100104', '303400902', '2023', '3', '90'),
('220441100105', '303400903', '2023', '3', '78'),
('220441100106', '303400904', '2023', '3', '79'),
('220441100107', '303400905', '2023', '3', '80'),
('220441100108', '303400906', '2022', '3', '84'),
('220441100109', '303400907', '2022', '3', '92'),
('220441100110', '303400907', '2022', '3', '92');

insert into ukt (id_ukt, nim, semester, tahun_ajaran, tanggal_bayar, jumlah_bayar) values
('23900600', '220441100101', '3', '2023', '2024-03-01', '2000000'),
('23900601', '220441100102', '3', '2023', '2024-03-05', '3000000'),
('23900602', '220441100103', '3', '2023', '2024-03-07', '4000000'),
('23900603', '220441100104', '3', '2023', '2024-03-06', '4000000'),
('23900604', '220441100105', '3', '2023', '2024-03-08', '5000000'),
('23900605', '220441100106', '3', '2023', '2024-03-09', '3000000'),
('23900606', '220441100107', '3', '2023', '2024-03-10', '3000000'),
('23900607', '220441100108', '3', '2023', '2024-03-11', '2000000'),
('23900608', '220441100109', '3', '2023', '2024-03-12', '5000000'),
('23900609', '220441100110', '3', '2023', '2024-03-13', '4000000');

INSERT INTO tagihan (id_tagihan, jenis_tagihan, jumlah_tagihan, tanggal_bayar) VALUES
('2490070', 'listrik', 780000, '2024-03-06'),
('249007', 'air', 550000, '2024-03-08'),
('2490073', 'pajak', 600000, '2024-03-09'),
('2490074', 'wifi', 980000, '2024-03-11'),
('2490075', 'telepon', 980000, '2024-03-11'),
('2490076', 'listrik', 780000, '2024-04-06'),
('2490077', 'air', 550000, '2024-04-08'),
('2490078', 'pajak', 600000, '2024-04-09'),
('2490079', 'wifi', 980000, '2024-04-11'),
('2490080', 'telepon', 980000, '2024-04-11');

insert into gajidosen (id_gaji, nip, tanggal_gaji, gaji_pokok) values
('250248570', '2700001210', '2024-03-25', '5500000'),
('250248571', '2700001211', '2024-03-25', '7500000'),
('250248572', '2700001212', '2024-03-25', '5500000'),
('250248573', '2700001213', '2024-03-25', '5500000'),
('250248574', '2700001214', '2024-03-25', '7500000'),
('250248575', '2700001215', '2024-03-25', '5500000'),
('250248576', '2700001216', '2024-03-25', '5500000'),
('250248577', '2700001217', '2024-03-25', '7500000'),
('250248578', '2700001218', '2024-03-25', '7500000'),
('250248579', '2700001219', '2024-03-25', '5500000');

insert into pembelian (id_pembelian, tanggal_pembelian, nama_barang, jumlah, harga_satuan, total_harga) values
('268247600', '2024-12-09', 'kotak arsip', '1', '15000', '15000'),
('268247601', '2024-11-02', 'rak arsip', '2', '18000', '36000'),
('268247602', '2024-10-09', 'staples', '5', '20000', '100000'),
('268247603', '2024-09-07', 'printer', '6', '3000000', '18000000'),
('268247604', '2024-07-09', 'alat praga', '5', '400000', '2000000'),
('268247605', '2024-12-09', 'pulpen', '20', '12000', '240000'),
('268247606', '2024-09-09', 'hdmi', '9', '20000', '180000'),
('268247607', '2024-01-09', 'papan tulis', '10', '40000', '400000'),
('268247608', '2024-05-09', 'sapu', '2', '25000', '50000'),
('268247609', '2024-11-09', 'proyektor', '5', '1000000', '5000000');

show tables;
select * from mahasiswa;
select * from dosen; 
select nama_mhs, status _mhs from mahasiswa where status_mhs = 'berhenti' or status_mhs = 'lulus';
select * from kuliah;
select * from ukt;
select * from gajidosen;
select * from pembelian;
select * from tagihan;
select count(nama_mhs) from mahasiswa;
select count(nama_dosen) from dosen;
CREATE VIEW laporan AS
SELECT 
    (SELECT SUM(jumlah_tagihan) FROM tagihan) AS total_tagihan,
    (SELECT SUM(gaji_pokok) FROM gajidosen) AS total_gaji_dosen,
    (SELECT SUM(total_harga) FROM pembelian) AS total_pembelian,
    ((SELECT SUM(jumlah_tagihan) FROM tagihan) + 
     (SELECT SUM(gaji_pokok) FROM gajidosen) + 
     (SELECT SUM(total_harga) FROM pembelian)) AS total_semua;
 SELECT * FROM laporan;  



  
  






