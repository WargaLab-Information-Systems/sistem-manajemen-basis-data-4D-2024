CREATE database tgs_perpustakaan;
USE tgs_perpustakaan;

CREATE TABLE petugas (
    Id_Petugas VARCHAR(10) PRIMARY KEY,
    Username VARCHAR(15) NOT NULL,
    Password VARCHAR(15) NOT NULL,
    Nama VARCHAR(15) NOT NULL
);
INSERT INTO petugas (Id_Petugas, Username, Password, Nama)
VALUES
    ('PTG001', 'agus123', 'agus123aa', 'Agus Santoso'),
    ('PTG002', 'santi456', 'santi456bb', 'Santi Putri'),
    ('PTG003', 'budi789', 'budi789cc', 'Budi Prasetyo'),
    ('PTG004', 'nina010', 'nina010dd', 'Nina Wijaya'),
    ('PTG005', 'faisal011', 'faisal011ee', 'Faisal Rahman'),
    ('PTG006', 'mega012', 'mega012ff', 'Mega Susanti'),
    ('PTG007', 'joko013', 'joko01gg', 'Joko Setiawan'),
    ('PTG008', 'rani014', 'rani014hh', 'Rani Permata'),
    ('PTG009', 'andi015', 'andi015ii', 'Andi Saputra'),
    ('PTG010', 'lisa016', 'lisa016jj', 'Lisa Handayani');

CREATE TABLE buku (
    kode_buku VARCHAR(10) PRIMARY KEY,
    judul_buku VARCHAR(25) NOT NULL,
    pengarang_buku VARCHAR(30) NOT NULL,
    penerbit_buku VARCHAR(30) NOT NULL,
    tahun_buku VARCHAR(10) NOT NULL,   
    jumlah_buku INT(5) NOT NULL,
    status_buku VARCHAR(10) NOT NULL,
	klasifikasi_buku VARCHAR(20) NOT NULL
);
INSERT INTO buku (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku)
VALUES
    ('BK001', 'Bumi Manusia', 'Pramoedya Ananta Toer', 'Hasta Mitra', '1980', 5, 'Available', 'Fiksi Sejarah'),
    ('BK002', 'Dilan 1990', 'Pidi Baiq', 'Bukune', '2013', 8, 'Available', 'Fiksi Romansa'),
    ('BK003', 'Negeri 5 Menara', 'Ahmad Fuadi', 'Gramedia Pustaka Utama', '2009', 10, 'Available', 'Fiksi Inspiratif'),
    ('BK004', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005', 6, 'Available', 'Fiksi Inspiratif'),
    ('BK005', 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 'Harvill Secker', '2011', 7, 'Available', 'Non-Fiksi Sains'),
    ('BK006', 'Bumi', 'Tere Liye', 'Republika', '2016', 9, 'Available', 'Fiksi Fantasi'),
    ('BK007', 'Metropop: I Love You More Than You Know', 'Anya Geraldine', 'Gagas Media', '2020', 12, 'Available', 'Fiksi Romansa'),
    ('BK008', 'Makna Hidup', 'Viktor E. Frankl', 'Beacon Press', '1946', 8, 'Available', 'Non-Fiksi Psikologi'),
    ('BK009', 'KambingJantan: Sebuah Catatan Harian Pelajar Bodoh', 'Raditya Dika', 'Gagas Media', '2005', 4, 'Available', 'Fiksi Humor'),
    ('BK010', 'Dunia Sophie', 'Jostein Gaarder', 'Farrar, Straus and Giroux', '1991', 3, 'Available', 'Fiksi Filosofi');
    
CREATE TABLE anggota (
    id_anggota VARCHAR(10) PRIMARY KEY,
    nama_anggota VARCHAR(20) NOT NULL,
    angkatan_anggota VARCHAR(6) NOT NULL,
    tempat_lahir_anggota VARCHAR(20) NOT NULL,  
    tanggal_lahir_anggota DATE NOT NULL,
	no_telp INT(12) NOT NULL,
    jenis_kelamin VARCHAR(15) NOT NULL,
    status_pinjam VARCHAR(15) NOT NULL
);
INSERT INTO anggota (id_anggota, nama_anggota, angkatan_anggota, tempat_lahir_anggota, tanggal_lahir_anggota, no_telp, jenis_kelamin, status_pinjam)
VALUES
    ('AGT001', 'Dewi Fitriani', '2019', 'Jakarta', '1998-05-15', 81234567890, 'Perempuan', 'Belum Pinjam'),
    ('AGT002', 'Rizki Pratama', '2020', 'Bandung', '2000-02-20', 81234567891, 'Laki-laki', 'Belum Dikembalikan'),
    ('AGT003', 'Anisa Putri', '2021', 'Surabaya', '2001-07-10', 81234567892, 'Perempuan', 'Belum Dikembalikan'),
    ('AGT004', 'Raka Aditya', '2018', 'Yogyakarta', '1997-12-25', 81234567893, 'Laki-laki', 'Belum Dikembalikan'),
    ('AGT005', 'Siti Rahayu', '2017', 'Semarang', '1996-10-30', 81234567894, 'Perempuan', 'Pinjam'),
    ('AGT006', 'Ahmad Fauzi', '2019', 'Medan', '1998-03-05', 81234567895, 'Laki-laki', 'Belum Dikembalikan'),
    ('AGT007', 'Rina Lestari', '2020', 'Malang', '2000-08-12', 81234567896, 'Perempuan', 'Belum Pinjam'),
    ('AGT008', 'Budi Hartono', '2018', 'Surakarta', '1997-04-18', 81234567897, 'Laki-laki', 'Belum Dikembalikan'),
    ('AGT009', 'Diana Setiawan', '2021', 'Bandar Lampung', '2001-01-22', 81234567898, 'Perempuan', 'Pinjam'),
    ('AGT010', 'Hadi Nugroho', '2017', 'Padang', '1996-09-08', 81234567899, 'Laki-laki', 'Belum Dikembalikan');

CREATE TABLE peminjaman (
    Kode_Peminjaman VARCHAR(10) PRIMARY KEY,
    IdAnggota VARCHAR(10) NOT NULL,
    IdPetugas VARCHAR(10) NOT NULL,
    Tanggal_Pinjam DATE NOT NULL,
    Tanggal_Kembali DATE NOT NULL,
    Kode_Buku VARCHAR(10) NOT NULL,
    FOREIGN KEY (IdPetugas) REFERENCES petugas(Id_Petugas),
    FOREIGN KEY (Kode_Buku) REFERENCES buku(kode_buku),
    FOREIGN KEY (IdAnggota) REFERENCES anggota(id_anggota)
);
INSERT INTO peminjaman (Kode_Peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku)
VALUES
    ('PMJ001', 'AGT001', 'PTG001', '2024-04-01', '2024-04-15', 'BK001'),
    ('PMJ002', 'AGT002', 'PTG002', '2024-04-02', '2024-04-16', 'BK002'),
    ('PMJ003', 'AGT003', 'PTG003', '2024-04-03', '2024-04-17', 'BK003'),
    ('PMJ004', 'AGT004', 'PTG004', '2024-04-04', '2024-04-18', 'BK004'),
    ('PMJ005', 'AGT005', 'PTG005', '2024-04-05', '2024-04-19', 'BK005'),
    ('PMJ006', 'AGT006', 'PTG006', '2024-04-06', '2024-04-20', 'BK006'),
    ('PMJ007', 'AGT007', 'PTG007', '2024-04-07', '2024-04-21', 'BK007'),
    ('PMJ008', 'AGT008', 'PTG008', '2024-04-08', '2024-04-22', 'BK008'),
    ('PMJ009', 'AGT009', 'PTG009', '2024-04-09', '2024-04-23', 'BK009'),
    ('PMJ010', 'AGT010', 'PTG010', '2024-04-10', '2024-04-24', 'BK010');

CREATE TABLE pengembalian (
    kode_kembali VARCHAR(10) PRIMARY KEY,  
    id_anggota VARCHAR(10) NOT NULL,
	kode_buku VARCHAR(10) NOT NULL,
    id_petugas VARCHAR(10) NOT NULL,
    tgl_pinjam DATE NOT NULL,
    tgl_kembali DATE,
    denda VARCHAR(15),
    FOREIGN KEY (id_petugas) REFERENCES petugas(Id_Petugas),
    FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
    FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota)	      
);
INSERT INTO pengembalian (kode_kembali, id_anggota, kode_buku, id_petugas, tgl_pinjam, tgl_kembali, denda)
VALUES
    ('PBG001', 'AGT001', 'BK001', 'PTG001', '2024-04-01', '2024-04-15', '0'),
    ('PBG002', 'AGT002', 'BK002', 'PTG002', '2024-04-02', '2024-04-16', '25000'),
    ('PBG003', 'AGT003', 'BK003', 'PTG003', '2024-04-03', '2024-04-17', '30000'),
    ('PBG004', 'AGT004', 'BK004', 'PTG004', '2024-04-04', '2024-04-18', '25000'),
    ('PBG005', 'AGT005', 'BK005', 'PTG005', '2024-04-05', '2024-04-19', '0'),
    ('PBG006', 'AGT006', 'BK006', 'PTG006', '2024-04-06', '2024-04-20', '25000'),
    ('PBG007', 'AGT007', 'BK007', 'PTG007', '2024-04-07', '2024-04-21', '0'),
    ('PBG008', 'AGT008', 'BK008', 'PTG008', '2024-04-08', '2024-04-22', '20000'),
    ('PBG009', 'AGT009', 'BK009', 'PTG009', '2024-04-09', '2024-04-23', '0'),
    ('PBG010', 'AGT010', 'BK010', 'PTG010', '2024-04-10', '2024-04-24', '25000');

-- SOAL 1. prosedur parameter IN =====================
DELIMITER //
CREATE PROCEDURE input_petugas(
    IN Id_Petugas VARCHAR(10),
    IN Username VARCHAR(15),
    IN Password VARCHAR(15),
    IN Nama VARCHAR(15)
)
BEGIN 
    INSERT INTO petugas (Id_Petugas, Username, Password, Nama)
    VALUES (Id_Petugas, Username, Password, Nama);
END //
DELIMITER ;
CALL input_petugas('PTG011', 'feri11', 'feri11kk', 'Feri Putra');
 SELECT * FROM petugas;

-- SOAL 2. Stored Procedure untuk Menampilkan Data Peminjaman Berdasarkan Tanggal Pinjam dan Kode Buku:
DELIMITER //
CREATE PROCEDURE buku_by_penerbit(
    IN penerbit VARCHAR(30)
)
BEGIN 
    SELECT * FROM buku WHERE penerbit_buku = penerbit;
END //
DELIMITER ;
CALL buku_by_penerbit('Gramedia Pustaka Utama');
select * from buku;

-- SOAL 3. Stored Procedure peminjaman dua field tanggal pinjam dan kode buku.
DELIMITER //
CREATE PROCEDURE peminjaman_by_tanggal_dan_kode(
    IN tanggal_pinjam DATE,
    IN kode_buku VARCHAR(10)
)
BEGIN 
    SELECT * FROM peminjaman 
    WHERE Tanggal_Pinjam = tanggal_pinjam 
    AND Kode_Buku = kode_buku LIMIT 1;
END //
DELIMITER ;
CALL peminjaman_by_tanggal_dan_kode('2024-04-01', 'BK002');

select * from peminjaman;

-- 4. Stored Procedure data table anggota pada 3 field yaitu angkatan, tampat lahir dan jenis kelamin.
DELIMITER //
CREATE PROCEDURE anggota_by_kriteria(
    IN angkatan VARCHAR(6),
    IN tempat_lahir VARCHAR(20),
    IN jenis_kelamin VARCHAR(15)
)
BEGIN 
    SELECT * FROM anggota 
    WHERE angkatan_anggota = angkatan 
    AND tempat_lahir_anggota = tempat_lahir 
    AND jenis_kelamin = jenis_kelamin ;
END //
DELIMITER ;
CALL anggota_by_kriteria('2020', 'bandung', 'Laki-laki');

select *from anggota;

-- 5. stored procedure memasukkan data table anggota.
DELIMITER //
CREATE PROCEDURE insert_anggota(
    IN id_anggota VARCHAR(10),
    IN nama_anggota VARCHAR(20),
    IN angkatan_anggota VARCHAR(6),
    IN tempat_lahir_anggota VARCHAR(20),
    IN tanggal_lahir_anggota DATE,
    IN no_telp INT(12),
    IN jenis_kelamin VARCHAR(15),
    IN status_pinjam VARCHAR(15)
)
BEGIN 
    INSERT INTO anggota (id_anggota, nama_anggota, angkatan_anggota, tempat_lahir_anggota,
    tanggal_lahir_anggota, no_telp, jenis_kelamin, status_pinjam)
    VALUES (id_anggota, nama_anggota, angkatan_anggota, tempat_lahir_anggota, 
    tanggal_lahir_anggota, no_telp, jenis_kelamin, status_pinjam);
END //
DELIMITER ;
CALL insert_anggota('AGT015', 'sinta putri', '2022', 'Jakarta','2001-05-12', 81234564545, 'Perempuan', 'Pinjam');
select*FROM anggota;

-- 6. stored procedure data jumlah anggota dengan (OUT)
DELIMITER //
CREATE PROCEDURE jumlah_anggota(
    OUT jumlah_anggota INT
)
BEGIN
    SELECT COUNT(*) INTO jumlah_anggota FROM anggota;
END //
DELIMITER ;
CALL jumlah_anggota(@jumlahE);
SELECT @jumlahE AS 'Total Anggota';

-- 7. stored procedure data jumlah buku berdasarkan pengarang dan tahun terbitnya (INOUT)
DELIMITER //
CREATE PROCEDURE jumlah_buku_pengarang_dan_tahun(
    IN author_name VARCHAR(30),
    IN publication_year VARCHAR(10),
    OUT book_count INT
)
BEGIN
    SELECT jumlah_buku INTO book_count FROM buku 
    WHERE pengarang_buku = author_name AND tahun_buku = publication_year;
END //
DELIMITER ;
SET @nama_pengarang = 'Pramoedya Ananta Toer';
select * from buku;
SET @tahun_terbit = '1980';
CALL jumlah_buku_pengarang_dan_tahun(@nama_pengarang, @tahun_terbit, @jumlah_buku);

SELECT @nama_pengarang,@jumlah_buku,@tahun_terbit;