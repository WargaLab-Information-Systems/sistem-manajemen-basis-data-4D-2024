CREATE DATABASE db_Univ;
USE db_Univ;

CREATE TABLE Status(
id_Status int(10) NOT NULL,
Deskripsi varchar(50)NOT NULL,
primary key(id_Status)
);

CREATE TABLE Mahasiswa(
    id_Mahasiswa INT(10) NOT NULL, 
    Nama VARCHAR(50) NOT NULL, 
    NIM INT(11) NOT NULL, 
    ProgramStudi VARCHAR(30) NOT NULL,
    TanggalMulai date ,
    TanggalLulus date ,
    id_Status INT(10) NOT NULL,
    primary key(id_Mahasiswa),
    FOREIGN KEY(id_Status) REFERENCES Status(id_Status)
);


CREATE TABLE Dosen(
id_Dosen INT(10)NOT NULL,
Nama varchar(50)NOT NULL,
NIP INT(10)NOT NULL,
ProgramStudi varchar(30)NOT NULL,
primary key(id_Dosen)
);

CREATE TABLE MataKuliah(
id_MataKuliah INT(10)NOT NULL,
Nama varchar(50)NOT NULL,
Kode INT(10)NOT NULL,
primary key(id_MataKuliah)
);

CREATE TABLE KRS(
id_KRS INT(10),
id_Mahasiswa INT(10),
id_MataKuliah INT(10),
semester INT(10),
foreign key(id_Mahasiswa) references Mahasiswa(id_Mahasiswa),
foreign key(id_MataKuliah) references MataKuliah(id_MataKuliah)
);

CREATE TABLE TransaksiUKT(
id_TransaksiUKT INT(10)NOT NULL,
id_Mahasiswa iNT(10)NOT NULL,
Tanggal date,
Jumlah INT(10)NOT NULL,
golongan int(10),
primary key (id_TransaksiUKT),
foreign key(id_Mahasiswa) references Mahasiswa(id_Mahasiswa)
);

CREATE TABLE TransaksiGajiDosen(
id_TransaksiGajiDosen iNT(10)NOT NULL,
id_Dosen INT(10)NOT NULL,
Tanggal date,
Totalharga INT(10)NOT NULL,
primary key(id_TransaksiGajiDosen),
foreign key(id_Dosen) references Dosen(id_Dosen)
);

CREATE TABLE TransaksiPembelian(
id_TransaksiPembelian iNT(10)NOT NULL,
Tanggal date,
Jenis varchar(50)NOT NULL,
Jumlah INT(10)NOT NULL,
Totalharga varchar (20),
primary key(id_TransaksiPembelian)
);

CREATE TABLE TransaksiPembayaranTagihan(
id_TransaksiPembayaranTagihan iNT(10)NOT NULL,
Tanggal date,
Jenis varchar(50)NOT NULL,
Totalharga INT(10)NOT NULL,
primary key(id_TransaksiPembayaranTagihan)
);

CREATE TABLE LaporanKeuangan(
 id_Keuangan int(10) primary key,
 id_TransaksiPembayaranTagihan INT(10) NOT NULL,
 id_TransaksiPembelian INT(10) NOT NULL,
 id_TransaksiGajiDosen INT(10) NOT NULL,
 id_TransaksiUKT INT(10) NOT NULL,
 foreign key(id_TransaksiPembayaranTagihan) references TransaksiPembayaranTagihan(id_TransaksiPembayaranTagihan),
 foreign key(id_TransaksiPembelian) references TransaksiPembelian(id_TransaksiPembelian),
 foreign key(id_TransaksiGajiDosen) references TransaksiGajiDosen(id_TransaksiGajiDosen),
 foreign key(id_TransaksiUKT) references TransaksiUKT(id_TransaksiUKT)
);

create table LaporanMahasiswa(
id_LaporanMahasiswa int(10),
id_Mahasiswa int(10),
foreign key(id_Mahasiswa) references Mahasiswa(id_Mahasiswa)
);

create table LaporanDosen(
id_LaporanDosen int(10),
id_Dosen int(10),
foreign key(id_Dosen) references Dosen(id_Dosen)
);

INSERT INTO Status (id_Status, Deskripsi) 
values
(1, 'Lulus'),
(2, 'Tidak Lulus'),
(3, 'Sedang Studi'),
(4, 'Cuti'),
(5, 'DO'),
(6, 'Lulus'),
(7, 'Sedang Studi'),
(8, 'Tidak Lulus'),
(9, 'Lulus'),
(10, 'Lulus');

 INSERT INTO mahasiswa (
 id_Mahasiswa, Nama, NIM, ProgramStudi, TanggalMulai, TanggalLulus, id_Status) 
 VALUES 
 (1, 'Nadia Aprilia Puspitasari', 20441100073, 'Peternakan', '2022-04-20', '2028-04-20', 1),
 (2, 'Herdiyanti', 20441100083, 'Musik', '2023-08-20', '2030-09-24', 2),
 (3, 'Anisyafaah', 20441100105, 'Perikanan', '2024-09-23', '2031-10-15', 3),
 (4, 'Adhelia Kusumawati', 20441100106, 'Tata Boga', '2025-10-02', '2032-11-12', 4),
 (5, 'Firdausi', 20441100133, 'Tata Busana', '2026-11-01', '2033-12-13', 5),
 (6, 'icha', 20441100143, 'PGSD', '2027-12-32', '2034-01-14', 6),
 (7, 'Hasnah', 2041100144, 'Pertambagan', '2028-01-22', '2035-02-06', 7),
 (8, 'Chenle', 2041100145, 'Sastra Inggris', '2029-02-21', '2036-03-07', 8),
 (9, 'Sehun', 2041100146, 'Ilmu Komputer', '2030-03-28', '2037-06-09', 9),
 (10, 'Kai', 2041100147, 'Manajemen', '2031-05-29', '2038-07-08', 10);

INSERT INTO Dosen(
id_Dosen, Nama, NIP, ProgramStudi)
values
(11, '.WAHYUDI SETIAWAN, S.Kom., M.Kom.', '123456789', 'Musik'),
(12, 'BAIN KHUSNUL KHOTIMAH, ST., M.Kom', '234567890', 'Bahasa Korea'),
(13, 'MEIDYA KOESHARDIANTO, S.Si., MT.', '345678901', 'Ekonomi'),
(14, 'FIRLI IRHAMNI, ST., M.Kom.', '456789012', 'Seni Tari'),
(15, 'MUHAMMAD ALI SYAKUR, S.Si., M.T', '567890123', 'Fashion'),
(16, 'Achmad Zain Nur, S.Kom.,M.T.', '678901234', 'Desain Grafis'),
(17, 'D.O.', '789012345', 'Pemasaran'),
(18, 'Kai', '890123456', 'Film dan Drama'),
(19, 'Sehun', '901234567', 'Hubungan Internasional'),
(20, 'Kris', '012345678', 'Kajian Budaya Korea');

INSERT INTO MataKuliah(id_MataKuliah, Nama , Kode)
values
(21, 'SPK', 201),
(22, 'Bahasa Indonesia', 202),
(23, 'Struktur Data', 203),
(24, 'Logika Informatika', 204),
(25, 'Bahasa Pemrograman', 205),
(26, 'Sistem Operasi', 206),
(27, 'Basis Data', 207),
(28, 'Teori Bahasa dan Automata', 208),
(29, 'Jaringan Komputer', 209),
(30, 'Kecerdasan Buatan', 210);

INSERT INTO KRS (id_KRS, id_Mahasiswa, id_MataKuliah, semester)
values
(1, 1, 23, 1),   
(2, 2, 25, 2),   
(3, 3, 27, 3),   
(4, 4, 24, 4),   
(5, 5, 26, 5),  
(6, 6, 28, 6),
(7, 7, 29, 7),   
(8, 8, 22, 8),   
(9, 9, 30, 9),   
(10, 10, 21, 10); 

INSERT INTO TransaksiUKT (id_TransaksiUKT, id_Mahasiswa, Tanggal, Jumlah,golongan) 
values
(1, 1, '2024-03-25', 5000000,1),
(2, 2, '2024-03-26', 4500000,2),
(3, 3, '2024-03-27', 4800000,3),
(4, 4, '2024-03-28', 5100000,4),
(5, 5, '2024-03-29', 4900000,5),
(6, 6, '2024-03-30', 5200000,6),
(7, 7, '2024-03-31', 4700000,1),
(8, 8, '2024-04-01', 4900000,2),
(9, 9, '2024-04-02', 5300000,3),
(10, 10, '2024-04-03', 4800000,4);

INSERT INTO TransaksiGajiDosen (id_TransaksiGajiDosen, id_Dosen, Tanggal, Totalharga) 
values
(1, 11, '2024-04-10', 7000000),
(2, 12, '2024-04-11', 7500000),
(3, 13, '2024-04-12', 6800000),
(4, 14, '2024-04-13', 7200000),
(5, 15, '2024-04-14', 7100000),
(6, 16, '2024-04-15', 7400000),
(7, 17, '2024-04-16', 6900000),
(8, 18, '2024-04-17', 7300000),
(9, 19, '2024-04-18', 7700000),
(0, 20, '2024-04-19', 7600000);

INSERT INTO TransaksiPembelian (id_TransaksiPembelian, Tanggal, Deskripsi, Jumlah, Totalharga) 
values
(1, '2024-04-30', 'Buku-buku referensi', 2,'1500000'),
(2, '2024-05-01', 'Spidol dan papan tulis',3, '500000'),
(3, '2024-05-02', 'Alat praktikum Kimia', 4,'2000000'),
(4, '2024-05-03', 'Peralatan Laboratorium Fisika',5,'2500000'),
(5, '2024-05-04', 'Laptop untuk presentasi',6, '7000000'),
(6, '2024-05-05', 'Papan proyektor',7, '3000000'),
(7, '2024-05-06', 'Printer dan kertas',8, '4000000'),
(8, '2024-05-07', 'Mikroskop biologi', 9,'3500000'),
(9, '2024-05-08', 'Bahan ajar digital',10, '1000000'),
(10, '2024-05-09', 'Software aplikasi pendidikan',11, '2000000');

INSERT INTO TransaksiPembayaranTagihan (id_TransaksiPembayaranTagihan, Tanggal, Deskripsi, Totalharga)
values
(1, '2024-04-01', 'Pembayaran Listrik', 500000),
(2, '2024-04-05', 'Pembayaran Air', 300000),
(3, '2024-04-10', 'Pembayaran Internet', 200000),
(4, '2024-04-15', 'Pembayaran Sewa Tempat', 1000000),
(5, '2024-04-20', 'Pembayaran Gaji Karyawan', 5000000),
(6, '2024-04-25', 'Pembayaran Pajak', 1500000),
(7, '2024-04-30', 'Pembayaran Asuransi', 800000),
(8, '2024-05-05', 'Pembayaran Pemeliharaan', 1200000),
(9, '2024-05-10', 'Pembayaran Bahan Baku', 2500000),
(10, '2024-05-15', 'Pembayaran Layanan Jasa', 1800000);

INSERT INTO LaporanMahasiswa (id_LaporanMahasiswa, id_Mahasiswa)
VALUES
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4), 
(5, 5), 
(6, 6), 
(7, 7), 
(8, 8), 
(9, 9), 
(10, 10); 

INSERT INTO LaporanDosen (id_LaporanDosen, id_Dosen)
VALUES
(1, 11), 
(2, 12), 
(3, 13), 
(4, 14), 
(5, 15), 
(6, 16), 
(7, 17), 
(8, 18),
(9, 19), 
(10, 20); 
