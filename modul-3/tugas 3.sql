CREATE DATABASE library;
USE library;

CREATE TABLE peminjaman (
    Kode_Peminjaman VARCHAR(10) PRIMARY KEY,
    IdAnggota VARCHAR(10),
    IdPetugas VARCHAR(10),
    Tanggal_Pinjam DATE,
    Tanggal_Kembali DATE,
    Kode_Buku VARCHAR(10)
);
CREATE TABLE petugas (
    IdPetugas VARCHAR(10) PRIMARY KEY,
    Username VARCHAR(15),
    Password VARCHAR(15),
    Nama VARCHAR(25)
);
CREATE TABLE buku (
    Kode_Buku VARCHAR(10) PRIMARY KEY,
    Judul_Buku VARCHAR(25),
    Pengarang_Buku VARCHAR(30),
    Penerbit_Buku VARCHAR(30),
    Tahun_Buku VARCHAR(10),
    Jumlah_Buku VARCHAR(5),
    Status_Buku VARCHAR(10),
    Klasifikasi_Buku VARCHAR(20)
);
CREATE TABLE anggota (
    IdAnggota VARCHAR(10) PRIMARY KEY,
    Nama_Anggota VARCHAR(20),
    Angkatan_Anggota VARCHAR(6),
    Tempat_Lahir_Anggota VARCHAR(6),
    Tanggal_Lahir_Anggota DATE,
    No_Telp INT(12),
    Jenis_Kelamin VARCHAR(15),
    Status_Pinjam VARCHAR(15)
);

CREATE TABLE pengembalian (
    Kode_Kembali VARCHAR(10) PRIMARY KEY,
    IdAnggota VARCHAR(10),
    Kode_Buku VARCHAR(10),
    IdPetugas VARCHAR(10),
    Tgl_Pinjam DATE,
    Tgl_Kembali DATE,
    Denda VARCHAR(15)
);

ALTER TABLE peminjaman ADD CONSTRAINT fk_peminjaman_anggota FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE peminjaman ADD CONSTRAINT fk_peminjaman_petugas FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE peminjaman ADD CONSTRAINT fk_peminjaman_buku FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE pengembalian ADD CONSTRAINT fk_pengembalian_anggota FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE pengembalian ADD CONSTRAINT fk_pengembalian_buku FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE pengembalian ADD CONSTRAINT fk_pengembalian_petugas FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas) ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku) VALUES ('B001', 'Harry Potter and the Sorcerer's Stone', 'J.K. Rowling', 'Bloomsbury Publishing', '1997', '10', 'Available', 'Fiction'), ('B002', 'To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott & Co.', '1960', '8', 'Available', 'Fiction'), ('B003', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Charles Scribner's Sons', '1925', '5', 'Available', 'Fiction'), ('B004', 'Pride and Prejudice', 'Jane Austen', 'T. Egerton, Whitehall', '1813', '12', 'Available', 'Fiction'), ('B005', '1984', 'George Orwell', 'Secker & Warburg', '1949', '6', 'Available', 'Fiction'), ('B006', 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', '1951', '9', 'Available', 'Fiction'), ('B007', 'To the Lighthouse', 'Virginia Woolf', 'Hogarth Press', '1927', '3', 'Available', 'Fiction'), ('B008', 'Moby-Dick', 'Herman Melville', 'Harper & Brothers', '1851', '7', 'Available', 'Fiction'), ('B009', 'The Lord of the Rings', 'J.R.R. Tolkien', 'George Allen & Unwin', '1954', '11', 'Available', 'Fiction'), ('B010', 'The Chronicles of Narnia', 'C.S. Lewis', 'Geoffrey Bles', '1950', '4', 'Available', 'Fiction');
INSERT INTO petugas (IdPetugas, Username, Password, Nama) VALUES ('P001', 'johnsmith', 'password123', 'John Smith'), ('P002', 'janedoe', 'pass456', 'Jane Doe'), ('P003', 'mikebrown', 'secret', 'Mike Brown'), ('P004', 'sarahjones', 'sarah123', 'Sarah Jones'), ('P005', 'davidwilson', 'davidpass', 'David Wilson'), ('P006', 'emilythomas', 'emily456', 'Emily Thomas'), ('P007', 'robertlee', 'robertpass', 'Robert Lee'), ('P008', 'laurasmith', 'laura123', 'Laura Smith'), ('P009', 'williamjackson', 'williampass', 'William Jackson'), ('P010', 'olivertaylor', 'oliver456', 'Oliver Taylor');
INSERT INTO anggota (IdAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam) VALUES ('A001', 'John Doe', '2022', 'Jakarta', '2000-01-01', 1234567890, 'Male', 'Aktif'), ('A002', 'Jane Smith', '2021', 'Surabaya', '1999-02-02', 9876543210, 'Female', 'Aktif'), ('A003', 'Mike Johnson', '2023', 'Bandung', '2001-03-03', 1112223334, 'Male', 'Aktif'), ('A004', 'Sarah Brown', '2022', 'Medan', '2000-04-04', 5556667778, 'Female', 'Aktif'), ('A005', 'David Wilson', '2021', 'Yogyakarta', '1999-05-05', 9990001112, 'Male', 'Aktif'), ('A006', 'Emily Thomas', '2023', 'Semarang', '2001-06-06', 3334445556, 'Female', 'Aktif'), ('A007', 'Robert Lee', '2022', 'Malang', '2000-07-07', 7778889990, 'Male', 'Aktif'), ('A008', 'Laura Smith', '2021', 'Denpasar', '1999-08-08', 2223334445, 'Female', 'Aktif'), ('A009', 'William Jackson', '2023', 'Makassar', '2001-09-09', 6667778889, 'Male', 'Aktif'), ('A010', 'Oliver Taylor', '2022', 'Palembang', '2000-10-10', 4445556667, 'Male', 'Aktif');


-- 1. Buatlah sebuah prosedur dengan menggunakan parameter IN default
CREATE PROCEDURE GetAnggotaByStatus(IN status VARCHAR(15) DEFAULT 'Aktif')
BEGIN
    SELECT * FROM anggota WHERE Status_Pinjam = status;
END;

-- 2. Buatlah stored procedure untuk mengetahui data pada table buku berdasarkan penerbit buku.
CREATE PROCEDURE GetBukuByPenerbit(IN penerbit VARCHAR(30))
BEGIN
    SELECT * FROM buku WHERE Penerbit_Buku = penerbit;
END;

-- 3. Buatlah stored procedure untuk mengetahui data pada table peminjaman berdasarkan tanggal pinjam dan kode buku.
CREATE PROCEDURE GetPeminjamanByTanggalAndKode(IN tanggal DATE, IN kode VARCHAR(10))
BEGIN
    SELECT * FROM peminjaman WHERE Tanggal_Pinjam = tanggal AND Kode_Buku = kode;
END;

-- 4. Buatlah stored procedure untuk mengetahui data pada table anggota berdasarkan angkatan, tempat lahir, dan jenis kelamin.
CREATE PROCEDURE GetAnggotaByAngkatanTempatLahirJenisKelamin(IN angkatan VARCHAR(6), IN tempat_lahir VARCHAR(6), IN jenis_kelamin VARCHAR(15))
BEGIN
    SELECT * FROM anggota WHERE Angkatan_Anggota = angkatan AND Tempat_Lahir_Anggota = tempat_lahir AND Jenis_Kelamin = jenis_kelamin;
END;

-- 5. Definisikan stored procedure untuk memasukkan data pada table anggota.
CREATE PROCEDURE InsertAnggota(IN id_anggota VARCHAR(10), IN nama_anggota VARCHAR(20), IN angkatan_anggota VARCHAR(6), IN tempat_lahir_anggota VARCHAR(6), IN tanggal_lahir_anggota DATE, IN no_telp INT(12), IN jenis_kelamin VARCHAR(15), IN status_pinjam VARCHAR(15))
BEGIN
    INSERT INTO anggota (IdAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam)
    VALUES (id_anggota, nama_anggota, angkatan_anggota, tempat_lahir_anggota, tanggal_lahir_anggota, no_telp, jenis_kelamin, status_pinjam);
END;

-- 6. Definisikan stored procedure untuk mengetahui data jumlah anggota menggunakan parameter OUT.
CREATE PROCEDURE GetJumlahAnggota(OUT jumlah_anggota INT)
BEGIN
    SELECT COUNT(*) INTO jumlah_anggota FROM anggota;
END;

-- 7. Definisikan stored procedure untuk mengetahui data jumlah buku berdasarkan pengarang dan tahun terbitnya menggunakan parameter INOUT.
CREATE PROCEDURE GetJumlahBukuByPengarangTahun(INOUT pengarang VARCHAR(30), INOUT tahun VARCHAR(10), OUT jumlah_buku INT)
BEGIN
    SELECT COUNT(*) INTO jumlah_buku FROM buku WHERE Pengarang_Buku = pengarang AND Tahun_Buku = tahun;
END;