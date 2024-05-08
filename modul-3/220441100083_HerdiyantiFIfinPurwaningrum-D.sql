CREATE DATABASE db_perpustakaan;
USE db_perpustakaan;

CREATE TABLE anggota(
Id_Anggota VARCHAR (10) NOT NULL PRIMARY KEY,
Nama_Anggota VARCHAR (20) NOT NULL,
Angkatan_Anggota VARCHAR (6) NOT NULL,
Tempat_Lahir_Anggota VARCHAR (20) NOT NULL,
Tanggal_Lahir_Anggota DATE NOT NULL, 
No_Telp INT (12) NOT NULL,
Jenis_Kelamin VARCHAR (15) NOT NULL,
Status_Pinjam VARCHAR(15) NOT NULL
);

CREATE TABLE peminjaman(
 Kode_Peminjaman VARCHAR (10) NOT NULL PRIMARY KEY,
 Id_Anggota VARCHAR (10) NOT NULL,
 Id_Petugas VARCHAR (10) NOT NULL,
 Tanggal_Pinjam DATE NOT NULL,
 Tanggal_Kembali DATE NOT NULL,
 Kode_Buku VARCHAR (10) NOT NULL,
 FOREIGN KEY (Id_Anggota) REFERENCES anggota (Id_Anggota),
 FOREIGN KEY (Id_Petugas) REFERENCES petugas (Id_Petugas),
 FOREIGN KEY (Kode_Buku) REFERENCES buku (Kode_Buku)
);

CREATE TABLE buku(
Kode_Buku VARCHAR (10) NOT NULL PRIMARY KEY,
Judul_Buku VARCHAR (25) NOT NULL,
Pengarang_Buku VARCHAR (30) NOT NULL,
Penerbit_Buku VARCHAR (30) NOT NULL,
Tahun_Buku VARCHAR (10) NOT NULL,
Jumlah_Buku VARCHAR (5) NOT NULL,
Status_Buku VARCHAR (10) NOT NULL,
Klasifikasi_Buku VARCHAR (20) NOT NULL
);

CREATE TABLE petugas(
Id_Petugas VARCHAR (10) NOT NULL PRIMARY KEY,
Username VARCHAR (15) NOT NULL,
Sandi VARCHAR (15) NOT NULL,
Nama VARCHAR (25) NOT NULL
);

CREATE TABLE pengembalian(
Kode_Kembali VARCHAR (10) NOT NULL PRIMARY KEY,
Id_Anggota VARCHAR (10) NOT NULL,
Kode_Buku VARCHAR (10) NOT NULL,
Id_Petugas VARCHAR (10) NOT NULL,
Tgl_Pinjam DATE NOT NULL,
Tgl_Kembali DATE NOT NULL,
Denda VARCHAR (15) NOT NULL,
FOREIGN KEY (Id_Anggota) REFERENCES anggota (Id_Anggota),
FOREIGN KEY (Kode_Buku) REFERENCES buku (Kode_Buku),
FOREIGN KEY (Id_Petugas) REFERENCES petugas (Id_Petugas)
);

INSERT INTO anggota VALUES
('A0001', 'Tulus', '2020', 'Surabaya', '2002-01-05',12345, 'Laki-laki', 'Meminjam'),
('A0002', 'Nadin Amizah', '2022', 'Surabaya', '2004-06-28',12345, 'Perempuan', 'Meminjam'),
('A0003', 'Isyana', '2020', 'Nganjuk', '2002-02-22',12345, 'Perempuan', 'Meminjam'),
('A0004', 'Raisa', '2021', 'Gresik', '2002-11-01',12345, 'Perempuan', 'Meminjam'),
('A0005', 'Pamungkas', '2021', 'Malang', '2003-04-19',12345, 'Laki-laki', 'Meminjam'),
('A0006', 'Baskara', '2020', 'Kediri', '2002-03-27',12345, 'Laki-laki', 'Meminjam'),
('A0007', 'Niki', '2023', 'Gresik', '2005-07-01',12345, 'Perempuan', 'Meminjam'),
('A0008', 'Yura Yunita', '2020', 'Malang', '2002-03-29',12345, 'Perempuan', 'Meminjam'),
('A0009', 'Ardhito Pramono', '2021', 'Banyuwangi', '2003-05-19',12345, 'Laki-laki', 'Meminjam'),
('A0010', 'Kunto Aji', '2022', 'Kediri', '2004-06-22',12345, 'Laki-laki', 'Meminjam');

INSERT INTO buku VALUES
('B001', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005', '2', 'Dipinjam', 'Novel Remaja'),
('B002', 'Filosofi Kopi', 'Dewi Lestari', 'Gramedia Pustaka Utama', '2006', '3', 'Dipinjam', 'Novel Remaja'),
('B003', 'Bumi', 'Tere Liye', 'Penerbit Mizan', '2014', '5', 'Dipinjam', 'Novel Fiksi'),
('B004', 'Attack on Titan', 'Hajime Isayama', 'Kodansha', '2009', '4', 'Tersedia', 'Komik'),
('B005', 'Negeri Para Bedebah', 'Tere Liye', 'Penerbit Mizan', '2013', '3', 'Tersedia', 'Novel Fiksi'),
('B006', 'Sejarah Indonesia', 'Sartono Kartodirdjo', 'Yayasan Obor', '2008', '2', 'Dipinjam', 'Bibliografi'),
('B007', 'One Piece', 'Eiichiro Oda', 'Shonen Jump', '1997', '4', 'Dipinjam', 'Komik'),
('B008', 'Bumi Manusia', 'Pramoedya Ananta Toer', 'Hasta Mitra', '1980', '2', 'Dipinjam', 'Novel Fiksi'),
('B009', 'Rindu', 'Tere Liye', 'Gramedia Pustaka Utama', '2009', '5', 'Tersedia', 'Novel Remaja'),
('B010', 'Kamus Hukum Indonesia', 'Mahfud MD', 'PT Refika Aditama', '2019', '2', 'Dipinjam', 'Bibliografi');

INSERT INTO petugas VALUES
('P001', 'AdminAdhel', 'Adminad01', 'Adhelia'),
('P002', 'AdminIcha', 'Adminich02', 'Anisa Icha'),
('P003', 'AdminAlfin', 'Adminalf03', 'Alfin Maulana'),
('P004', 'AdminAnisa', 'Adminani04', 'Anisyafaah'),
('P005', 'AdminFauzan', 'Adminfauz05', 'Fauzan Eksando'),
('P006', 'AdminPutri', 'Adminput06', 'Putri Cahyani'),
('P007', 'AdminNadia', 'Adminnad07', 'Nadia Aprilia'),
('P008', 'AdminErlangga', 'Adminerl08', 'Erlangga Azzam'),
('P009', 'AdminHasnah', 'Admin09', 'Hasnah Insita'),
('P010', 'AdminLaytsa', 'Adminlay10', 'Laytsa Abdillah');

INSERT INTO peminjaman VALUES
('PJ001', 'A0001', 'P001', '2024-04-01', '2024-04-03', 'B010'),
('PJ002', 'A0002', 'P003', '2024-04-06', '2024-04-08', 'B001'),
('PJ003', 'A0003', 'P002', '2024-04-06', '2024-04-08', 'B008'),
('PJ004', 'A0004', 'P006', '2024-04-08', '2024-04-10', 'B003'),
('PJ005', 'A0005', 'P004', '2024-04-10', '2024-04-12', 'B002'),
('PJ006', 'A0006', 'P007', '2024-04-10', '2024-04-12', 'B006'),
('PJ007', 'A0007', 'P005', '2024-04-13', '2024-04-15', 'B007'),
('PJ008', 'A0008', 'P008', '2024-04-14', '2024-04-16', 'B008'),
('PJ009', 'A0009', 'P010', '2024-04-14', '2024-04-16', 'B007'),
('PJ010', 'A0010', 'P009', '2024-04-15', '2024-04-17', 'B002');

INSERT INTO pengembalian VALUES
('PK001', 'A0001', 'B010', 'P001', '2024-04-01', '2024-04-03', 'Rp.0'),
('PK002', 'A0002', 'B001', 'P003', '2024-04-06', '2024-04-09', 'Rp.1.000'),
('PK003', 'A0003', 'B008', 'P002', '2024-04-06', '2024-04-10', 'Rp.2.000'),
('PK004', 'A0004', 'B003', 'P006', '2024-04-08', '2024-04-10', 'Rp.0'),
('PK005', 'A0005', 'B002', 'P004', '2024-04-10', '2024-04-12', 'Rp.0'),
('PK006', 'A0006', 'B006', 'P007', '2024-04-10', '2024-04-13', 'Rp.1.000'),
('PK007', 'A0007', 'B007', 'P005', '2024-04-13', '2024-04-18', 'Rp.3.000'),
('PK008', 'A0008', 'B008', 'P008', '2024-04-14', '2024-04-16', 'Rp.0'),
('PK009', 'A0009', 'B007', 'P010', '2024-04-14', '2024-04-18', 'Rp.2.000'),
('PK010', 'A0010', 'B002', 'P009', '2024-04-15', '2024-04-17', 'Rp.0');

-- 1. Buatlah sebuah prosedur dengan menggunakan parameter IN default
DELIMITER //
CREATE PROCEDURE searchbuku(KodeBuku VARCHAR(10))
BEGIN 
     SELECT * FROM buku
     WHERE Kode_Buku = KodeBuku;
END //
DELIMITER ;
CALL searchbuku  ('B003');

-- 2. Buatlah stored procedure untuk mengetahui data pada table anggota berdasarakan pada salah satu field yaitu nama
DELIMITER //
CREATE PROCEDURE searchanggota(IN NamaAnggota VARCHAR(10))
BEGIN 
     SELECT * FROM anggota
     WHERE Nama_Anggota = NamaAnggota;
END //
DELIMITER ;
CALL searchanggota ('Tulus');

3. Buatlah stored procedure untuk mengetahui data pada table buku berdasarkan dua field yaitu status dan klasifikasi buku
DELIMITER //
CREATE PROCEDURE databuku(
IN StatusBuku VARCHAR(15),
IN KlasifikasiBuku VARCHAR(50)
)
BEGIN 
     SELECT * FROM buku
     WHERE Status_Buku = StatusBuku AND Klasifikasi_Buku = KlasifikasiBuku;
END //
DELIMITER ;
CALL databuku ('Dipinjam', 'Novel Remaja');

-- 4. Buatlah stored procedure untuk mengetahui data peminjam pada table peminjaman berdasarkan pada 3 field yaitu anggota, tanggal pinjam, dan kode buku
DELIMITER //
CREATE PROCEDURE datapeminjaman(
IN IdAnggota VARCHAR(15),
IN TglPinjam DATE,
IN KodeBuku VARCHAR(10)
)
BEGIN 
     SELECT * FROM peminjaman
     WHERE Id_Anggota = IdAnggota AND Tanggal_Pinjam = TglPinjam AND Kode_Buku = KodeBuku;
END //
DELIMITER ;
CALL datapeminjaman ('A0001', '2024-04-01', 'B010');

-- 5. Definisikan stored procedure untuk memasukkan data pada table petugas
DELIMITER //
CREATE PROCEDURE input_petugas(
IN IdPetugas varchar(15),
IN PetugasUsername VARCHAR(15),
IN SandiPetugas VARCHAR(15),
IN NamaPetugas VARCHAR(15)
)
BEGIN 
     INSERT INTO petugas
     VALUES (IdPetugas, PetugasUsername, SandiPetugas, NamaPetugas);
END //
DELIMITER ;
CALL input_petugas ('P011', "AdminNanda", "Adminnan11", "Yulia Nanda");
SELECT * FROM petugas;

-- 6. Definisikan stored procedure untuk mengetahui data jumlah peminjaman menggunakan parameter OUT
DELIMITER //
CREATE PROCEDURE jumlah_pinjam( OUT jumlahpeminjam INT)
BEGIN 
     SELECT COUNT(Kode_Peminjaman) INTO jumlahpeminjam FROM peminjaman;
END //
DELIMITER ;
CALL jumlah_pinjam(@jumlahpeminjam);
SELECT @jumlahpeminjam;

-- 7. Definisikan stored procedure untuk mengetahui data jumlah peminjaman berdasarkan tanggal pinjam dan kode buku menggunakan parameter INOUT
DELIMITER //
CREATE PROCEDURE jumlah_datapinjam(
IN tanggal_pinjaman DATE,
IN kode_setiap_buku VARCHAR(10),
OUT jumlah_peminjaman INT
)
BEGIN
     SELECT COUNT(Kode_Buku) INTO jumlah_peminjaman
     FROM peminjaman WHERE Tanggal_Pinjam = tanggal_pinjaman AND Kode_Buku = kode_setiap_buku;
END//
DELIMITER ;

CALL jumlah_datapinjam('2024-04-01', 'B010', @jumlah_peminjaman);
SELECT @jumlah_peminjaman;

