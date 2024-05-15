CREATE DATABASE IF NOT EXISTS perpustakaan;
USE perpustakaan;
CREATE TABLE Pengembalian (
  Kode_Kembali varchar(10) PRIMARY KEY NOT NULL,
  Id_Anggota varchar(10) NOT NULL,
  Kode_Buku varchar(10) NOT NULL,
  Id_Petugas varchar(10) NOT NULL,
  Tgl_Pinjam date NOT NULL,
  Tgl_Kembali date NOT NULL,
  Denda varchar(15) NOT NULL,
  FOREIGN KEY (Kode_Buku) REFERENCES Buku(Kode_Buku),
  FOREIGN KEY (Id_Anggota) REFERENCES Anggota(Id_Anggota),
  FOREIGN KEY (Id_Petugas) REFERENCES Petugas(IdPetugas)
);
INSERT INTO Pengembalian (
  Kode_Kembali,
  Id_Anggota,
  Kode_Buku,
  Id_Petugas,
  Tgl_Pinjam,
  Tgl_Kembali,
  Denda
)
VALUES
  ('PK001', 'AG001', 'BK001', 'PT001', '2024-02-10', '2024-05-01', '5000'),
  ('PK002', 'AG002', 'BK002', 'PT002', '2024-03-05', '2024-04-25', '0'),
  ('PK003', 'AG003', 'BK003', 'PT003', '2024-04-12', '2024-05-01', '10000'),
  ('PK004', 'AG004', 'BK004', 'PT001', '2024-02-20', '2024-04-30', '2000'),
  ('PK005', 'AG005', 'BK005', 'PT002', '2024-03-15', '2024-05-02', '0'),
  ('PK006', 'AG001', 'BK006', 'PT003', '2024-04-05', '2024-05-01', '8000'),
  ('PK007', 'AG002', 'BK001', 'PT001', '2024-02-25', '2024-05-01', '5000'),
  ('PK008', 'AG003', 'BK002', 'PT002', '2024-03-20', '2024-04-28', '0'),
  ('PK009', 'AG004', 'BK007', 'PT003', '2024-04-10', '2024-05-01', '12000'),
  ('PK010', 'AG005', 'BK005', 'PT001', '2024-02-12', '2024-05-02', '0');

CREATE TABLE Anggota (
  Id_Anggota varchar(10) PRIMARY KEY,
  Nama_Anggota varchar(20) NOT NULL,
  Angkatan_Anggota varchar(6) NOT NULL,
  Tempat_Lahir_Anggota varchar(20) NOT NULL,
  Tanggal_Lahir_Anggota date NOT NULL,
  No_Telp int(12) NOT NULL,
  Jenis_Kelamin varchar(15) NOT NULL,
  Status_Pinjam varchar(15) NOT NULL
);
INSERT INTO Anggota (
  Id_Anggota,
  Nama_Anggota,
  Angkatan_Anggota,
  Tempat_Lahir_Anggota,
  Tanggal_Lahir_Anggota,
  No_Telp,
  Jenis_Kelamin,
  Status_Pinjam
)
VALUES
  ('AG001', 'Andi', '2022', 'Surabaya', '2000-01-01', 0812345678, 'Laki-Laki', 'Meminjam'),
  ('AG002', 'Budi', '2023', 'Malang', '2001-02-02', 0898765432, 'Laki-Laki', 'Meminjam'),
  ('AG003', 'Cici', '2022', 'Sidoarjo', '2002-03-03', 08567891011, 'Perempuan', 'Tidak Meminjam'),
  ('AG004', 'Dedi', '2024', 'Gresik', '2003-04-04', 08213456789, 'Laki-Laki', 'Meminjam'),
  ('AG005', 'Evi', '2023', 'Lamongan', '2004-05-05', 08123456780, 'Perempuan', 'Tidak Meminjam'),
  ('AG006', 'Fani', '2022', 'Mojokerto', '2005-06-06', 08987654321, 'Perempuan', 'Meminjam'),
  ('AG007', 'Gani', '2024', 'Jember', '2006-07-07', 08567891012, 'Laki-Laki', 'Tidak Meminjam'),
  ('AG008', 'Hani', '2023', 'Probolinggo', '2007-08-08', 08213456781, 'Perempuan', 'Meminjam'),
  ('AG009', 'Iki', '2022', 'Pasuruan', '2008-09-09', 08123456782, 'Laki-Laki', 'Tidak Meminjam'),
  ('AG010', 'Joni', '2024', 'Lumajang', '2009-10-10', 08987654323, 'Perempuan', 'Meminjam');
  
CREATE TABLE Peminjaman (
  Kode_Peminjaman varchar(10) PRIMARY KEY,
  Kode_Buku varchar(10) NOT NULL,
  Id_Anggota varchar(10) NOT NULL,
  Id_Petugas varchar(10) NOT NULL,
  Tgl_Pinjam date NOT NULL,
  Tgl_Kembali date NOT NULL,
  FOREIGN KEY (Kode_Buku) REFERENCES Buku(Kode_Buku),
  FOREIGN KEY (Id_Anggota) REFERENCES Anggota(Id_Anggota),
  FOREIGN KEY (Id_Petugas) REFERENCES Petugas(IdPetugas)
);
INSERT INTO Peminjaman (
  Kode_Peminjaman,
  Kode_Buku,
  Id_Anggota,
  Id_Petugas,
  Tgl_Pinjam,
  Tgl_Kembali
)
VALUES
  ('PM001', 'BK001', 'AG001', 'PT001', '2024-02-10', '2024-05-01'),
  ('PM002', 'BK002', 'AG002', 'PT002', '2024-03-05', '2024-04-25'),
  ('PM003', 'BK003', 'AG003', 'PT003', '2024-04-12', '2024-05-01'),
  ('PM004', 'BK004', 'AG004', 'PT001', '2024-02-20', '2024-04-30'),
  ('PM005', 'BK005', 'AG005', 'PT002', '2024-03-15', '2024-05-02'),
  ('PM006', 'BK006', 'AG001', 'PT003', '2024-04-05', '2024-05-01'),
  ('PM007', 'BK001', 'AG002', 'PT001', '2024-02-25', '2024-05-01'),
  ('PM008', 'BK002', 'AG003', 'PT002', '2024-03-20', '2024-04-28'),
  ('PM009', 'BK007', 'AG004', 'PT003', '2024-04-10', '2024-05-01'),
  ('PM010', 'BK005', 'AG005', 'PT001', '2024-02-12', '2024-05-02');

CREATE TABLE Petugas (
  IdPetugas varchar(10) PRIMARY KEY,
  Username varchar(15) NOT NULL,
  Password varchar(15) NOT NULL,
  Nama varchar(25) NOT NULL
);
INSERT INTO Petugas (
  IdPetugas,
  Username,
  Password,
  Nama
)
VALUES
  ('PT001', 'petugas1', 'rahasia1', 'Bambang'),
  ('PT002', 'petugas2', 'rahasia2', 'Cici'),
  ('PT003', 'petugas3', 'rahasia3', 'Doni'),
  ('PT004', 'petugas4', 'rahasia4', 'Edi'),
  ('PT005', 'petugas5', 'rahasia5', 'Fani'),
  ('PT006', 'petugas6', 'rahasia6', 'Gani'),
  ('PT007', 'petugas7', 'rahasia7', 'Hani'),
  ('PT008', 'petugas8', 'rahasia8', 'Iki'),
  ('PT009', 'petugas9', 'rahasia9', 'Joni'),
  ('PT010', 'petugas10', 'rahasia10', 'Lina');
  
CREATE TABLE Buku (
  Kode_Buku varchar(10) PRIMARY KEY,
  Judul_Buku varchar(25) NOT NULL,
  Pengarang_Buku varchar(30) NOT NULL,
  Penerbit_Buku varchar(30) NOT NULL,
  Tahun_Buku varchar(10) NOT NULL,
  Jumlah_Buku varchar(5) NOT NULL,
  Status_Buku varchar(10) NOT NULL,
  Klasifikasi_Buku varchar(20) NOT NULL
);
INSERT INTO Buku (
  Kode_Buku,
  Judul_Buku,
  Pengarang_Buku,
  Penerbit_Buku,
  Tahun_Buku,
  Jumlah_Buku,
  Status_Buku,
  Klasifikasi_Buku
)
VALUES
  ('BK001', 'Buku Pemrograman 1', 'Andi', 'Informatika Media', '2023', '10', 'Tersedia', 'Pemrograman'),
  ('BK002', 'Algoritma dan Struktur Data', 'Budi', 'Gramedia', '2022', '8', 'Dipinjam', 'Algoritma'),
  ('BK003', 'Matematika Diskrit', 'Cici', 'Erlangga', '2021', '15', 'Tersedia', 'Matematika'),
  ('BK004', 'Desain Grafis', 'Doni', 'Andi Offset', '2020', '6', 'Dipinjam', 'Desain'),
  ('BK005', 'Jaringan Komputer', 'Edi', 'Informatika Media', '2024', '12', 'Tersedia', 'Jaringan'),
  ('BK006', 'Basis Data', 'Fani', 'Gramedia', '2022', '18', 'Dipinjam', 'Database'),
  ('BK007', 'Sistem Operasi', 'Gani', 'Erlangga', '2021', '10', 'Tersedia', 'Sistem Operasi'),
  ('BK008', 'Bahasa Inggris untuk Pemula', 'Hani', 'Andi Offset', '2020', '5', 'Dipinjam', 'Bahasa'),
  ('BK009', 'Ekonomi Dasar', 'Iki', 'Informatika Media', '2024', '12', 'Tersedia', 'Ekonomi'),
  ('BK010', 'Kewirausahaan', 'Joni', 'Gramedia', '2022', '8', 'Dipinjam', 'Kewirausahaan');

-- soal 1
DELIMITER $$
CREATE PROCEDURE Anggota(IN id VARCHAR(100))
BEGIN
SELECT * FROM Anggota
WHERE id = Id_Anggota;
END$$
DELIMITER ;
CALL anggota('A009');
select * from anggota;


-- soal 2
DELIMITER //

CREATE PROCEDURE GetPengembalianByKodeBuku (
    IN p_KodeBuku varchar(10)
)
BEGIN
    SELECT * FROM Pengembalian WHERE Kode_Buku = p_KodeBuku;
END //

DELIMITER ;
CALL GetPengembalianByKodeBuku('BK001');

-- soal 3
DELIMITER //

CREATE PROCEDURE GetAnggotaByAngkatanJenisKelamin (
    IN p_Angkatan varchar(6),
    IN p_JenisKelamin varchar(15)
)
BEGIN
    SELECT * FROM Anggota 
    WHERE Angkatan_Anggota = p_Angkatan AND Jenis_Kelamin = p_JenisKelamin;
END //

DELIMITER ;
CALL GetAnggotaByAngkatanJenisKelamin('2022', 'perempuan');

-- soal 4
DELIMITER //

CREATE PROCEDURE GetBukuByPengarangPenerbitTahunTerbit (
    IN p_Pengarang varchar(30),
    IN p_Penerbit varchar(30),
    IN p_TahunTerbit varchar(10)
)
BEGIN
    SELECT * FROM Buku 
    WHERE Pengarang_Buku = p_Pengarang AND Penerbit_Buku = p_Penerbit AND Tahun_Buku = p_TahunTerbit;
END //

DELIMITER ;
CALL GetBukuByPengarangPenerbitTahunTerbit('Andi', 'Informatika Media', '2023');

-- soal 5
DELIMITER //
CREATE PROCEDURE InsertBuku (
    IN p_Kode_Buku varchar(10),
    IN p_Judul_Buku varchar(25),
    IN p_Pengarang_Buku varchar(30),
    IN p_Penerbit_Buku varchar(30),
    IN p_Tahun_Buku varchar(10),
    IN p_Jumlah_Buku varchar(5),
    IN p_Status_Buku varchar(10),
    IN p_Klasifikasi_Buku varchar(20)
)
BEGIN
    INSERT INTO Buku (
        Kode_Buku,
        Judul_Buku,
        Pengarang_Buku,
        Penerbit_Buku,
        Tahun_Buku,
        Jumlah_Buku,
        Status_Buku,
        Klasifikasi_Buku
    ) VALUES (
        p_Kode_Buku,
        p_Judul_Buku,
        p_Pengarang_Buku,
        p_Penerbit_Buku,
        p_Tahun_Buku,
        p_Jumlah_Buku,
        p_Status_Buku,
        p_Klasifikasi_Buku
    );
END //

DELIMITER ;
CALL InsertBuku('BK011', 'Pemrograman Lanjut', 'Joko', 'Erlangga', '2025', '15', 'Tersedia', 'Pemrograman');
select * from buku;

--  soal 6
DELIMITER //

CREATE PROCEDURE GetTotalPeminjamanByAnggotaId (
    IN p_Id_Anggota varchar(10),
    OUT p_Total_Peminjaman INT
)
BEGIN
    SELECT COUNT(*) INTO p_Total_Peminjaman 
    FROM Peminjaman 
    WHERE Id_Anggota = p_Id_Anggota;
END //

DELIMITER ;
CALL GetTotalPeminjamanByAnggotaId('AG001', @total_peminjaman);
SELECT @total_peminjaman AS Total_Peminjaman_Anggota_AG001;

-- soal 7
DELIMITER //
CREATE PROCEDURE GetAnggotaByAngkatanGender (
    IN p_Angkatan varchar(6),
    IN p_Jenis_Kelamin varchar(15),
    OUT p_Jumlah_Anggota INT
)
BEGIN
    SELECT COUNT(*) INTO p_Jumlah_Anggota
    FROM Anggota
    WHERE Angkatan_Anggota = p_Angkatan AND Jenis_Kelamin = p_Jenis_Kelamin;
END //

DELIMITER ;
SET @angkatan='2022';
SET @jenkel = 'perempuan';
CALL GetJumlahAnggotaByAngkatanJenis_Kelamin(@angkatan, @nama, @jumlahAnggota);
SELECT @angkatan,@jenkel,@jumlahAnggota AS Jumlah_Anggota;











