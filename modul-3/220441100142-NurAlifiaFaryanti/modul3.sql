
CREATE DATABASE library;
USE library;

DROP DATABASE library;

-- Buat tabel anggota
CREATE TABLE anggota (
    id_anggota VARCHAR(10) PRIMARY KEY,
    nama_anggota VARCHAR(20),
    angkt_anggota VARCHAR(6),
    tempat_lahir_anggota VARCHAR(20),
    tanggal_lahir_anggota DATE,
    no_telp INT(12),
    jenis_kelamin VARCHAR(15),
    status_pinjam VARCHAR(15)
);

-- Buat tabel peminjaman
CREATE TABLE peminjaman (
    kode_peminjaman VARCHAR(10) PRIMARY KEY,
    id_anggota VARCHAR(10),
    id_petugas VARCHAR(10),
    tanggal_pinjam DATE,
    tanggal_kembali DATE,
    kode_buku VARCHAR(10),
    FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
    FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
    FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);

-- Buat tabel petugas
CREATE TABLE petugas (
    id_petugas VARCHAR(10) PRIMARY KEY,
    username VARCHAR(15),
    sandi VARCHAR(15),
    nama VARCHAR(25)
);

-- Buat tabel buku
CREATE TABLE buku (
    kode_buku VARCHAR(10) PRIMARY KEY,
    judul_buku VARCHAR(25),
    pengarang_buku VARCHAR(30),
    penerbit_buku VARCHAR(30),
    tahun_buku VARCHAR(10),
    jumlah_buku VARCHAR(5),
    status_buku VARCHAR(10),
    klasifikasi_buku VARCHAR(20)
);

-- Buat tabel pengembalian
CREATE TABLE pengembalian (
    kode_kembali VARCHAR(10) PRIMARY KEY,
    id_anggota VARCHAR(10),
    kode_buku VARCHAR(10),
    id_petugas VARCHAR(10),
    tgl_pinjam DATE,
    tgl_kembali DATE,
    denda VARCHAR(5),
    FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
    FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
    FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);

INSERT INTO anggota (id_anggota, nama_anggota, angkt_anggota, tempat_lahir_anggota, tanggal_lahir_anggota, no_telp, jenis_kelamin, status_pinjam) 
VALUES 
('A001', 'Halima', '2018', 'Jakarta', '1990-05-15', 2147483647, 'Perempuan', 'Aktif'),
('A002', 'Wahyuni', '2017', 'Bandung', '1992-09-20', 2147483647, 'Perempuan', 'Aktif'),
('A003', 'Alifia', '2019', 'Surabaya', '1988-03-10', 2147483647, 'Perempuan', 'Aktif'),
('A004', 'Chaeunwoo', '2018', 'Medan', '1995-11-28', 2147483647, 'laki-laki', 'Aktif'),
('A005', 'Haechan', '2020', 'Semarang', '1993-07-02', 08901234675, 'Laki-laki', 'Tidak Aktif'),
('A006', 'Andini', '2016', 'Yogyakarta', '1991-01-18', 2147483647, 'Perempuan', 'Aktif'),
('A007', 'Jaemin', '2019', 'Palembang', '1987-08-30', 2147483647, 'Laki-laki', 'Aktif'),
('A008', 'Marklee','2022', 'Lampung', '1994-04-25', 2147483647, 'Laki-laki', 'Aktif'),
('A009', 'Fiana', '2020', 'Bekasi', '1990-12-12', 2147483647, 'Perempuan', 'Tidak Aktif'),
('A010', 'Rafael', '2018', 'Tangerang', '1996-06-05', 838542314, 'Laki-laki', 'Aktif');

select * from anggota;



INSERT INTO peminjaman (kode_peminjaman, id_anggota, id_petugas, tanggal_pinjam, tanggal_kembali, kode_buku) 
VALUES 
('K001', 'A001', 'P001', '2023-04-10', '2023-09-10', 'B001'),
('K002', 'A002', 'P002', '2023-04-15', '2023-10-15', 'B002'),
('K003', 'A003', 'P003', '2023-04-20', '2023-11-20', 'B003'),
('K004', 'A004', 'P001', '2023-04-25', '2023-09-25', 'B004'),
('K005', 'A005', 'P002', '2023-05-01', '2023-10-01', 'B005'),
('K006', 'A006', 'P003', '2023-05-05', '2023-09-05', 'B006'),
('K007', 'A007', 'P001', '2023-05-10', '2023-11-10', 'B007'),
('K008', 'A008', 'P002', '2023-05-15', '2023-09-15', 'B008'),
('K009', 'A009', 'P003', '2023-05-20', '2023-09-20', 'B009'),
('K010', 'A010', 'P001', '2023-05-25', '2023-10-25', 'B010');


INSERT INTO petugas (id_petugas, username, sandi, nama) 
VALUES 
('P001', 'admin1', 'password1', 'Malia Malik'),
('P002', 'admin2', 'password2', 'Zayyan Fachri'),
('P003', 'admin3', 'password3', 'Leo Akbar'),
('P004', 'admin4', 'password4', 'Lia Maghfiroh'),
('P005', 'admin5', 'password5', 'Rini Maidatul'),
('P006', 'admin6', 'password6', 'Vava Efa'),
('P007', 'admin7', 'password7', 'Asep Sanusi'),
('P008', 'admin8', 'password8', 'Rambo Mizar'),
('P009', 'admin9', 'password9', 'Sobahul'),
('P010', 'admin10', 'password10', 'Olivia');


INSERT INTO buku (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku) 
VALUES 
('B001', 'Sang Pemimpi', 'Andrea Hirata', 'Bentang Pustaka', '2006', '10', 'Tersedia', 'Fiksi'),
('B002', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005', '15', 'Tersedia', 'Fiksi'),
('B003', 'Ayat-Ayat Cinta', 'Habiburrahman El Shirazy', 'Pustaka Al Kautsar', '2004', '8', 'Tersedia', 'Fiksi'),
('B004', 'Perahu Kertas', 'Dee Lestari', 'Bentang Pustaka', '2008', '12', 'Tersedia', 'Fiksi'),
('B005', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005', '9', 'Tersedia', 'Fiksi'),
('B006', 'Tenggelamnya Kapal Van Der Wijck', 'Hamka', 'Pustaka Al Kautsar', '1939', '7', 'Tersedia', 'Fiksi'),
('B007', 'The Hunger Games', 'Suzanne Collins', 'Scholastic Corporation', '2008', '16', 'Tersedia', 'Fiksi'),
('B008', 'Tentang Kamu', 'Tere Liye', 'Gramedia Pustaka Utama', '2011', '13', 'Tersedia', 'Romansa'),
('B009', '5 cm', 'Donny Dhirgantoro', 'Grasindo', '2005', '14', 'Tersedia', 'Fiksi'),
('B010', 'Bumi Manusia', 'Pramoedya Ananta Toer', 'Hasta Mitra', '1980', '16', 'Tersedia', 'Sejarah');

SELECT * FROM buku;

INSERT INTO pengembalian (kode_kembali, id_anggota, kode_buku, id_petugas, tgl_pinjam, tgl_kembali, denda) 
VALUES 
('C001', 'A001', 'B001', 'P001', '2023-04-10', '2023-05-10', '0'),
('C002', 'A002', 'B002', 'P002', '2023-04-15', '2023-05-15', '0'),
('C003', 'A003', 'B003', 'P003', '2023-04-20', '2023-05-20', '10000'),
('C004', 'A004', 'B004', 'P001', '2023-04-25', '2023-05-25', '0'),
('C005', 'A005', 'B005', 'P002', '2023-05-01', '2023-06-01', '20000'),
('C006', 'A006', 'B006', 'P003', '2023-05-05', '2023-06-05', '10000'),
('C007', 'A007', 'B007', 'P001', '2023-05-10', '2023-06-10', '0'),
('C008', 'A008', 'B008', 'P002', '2023-05-15', '2023-06-15', '20000'),
('C009', 'A009', 'B009', 'P003', '2023-05-20', '2023-06-20', '0'),
('C010', 'A010', 'B010', 'P001', '2023-05-25', '2023-06-25', '0');


-- nomer 1
DELIMITER //

CREATE PROCEDURE defaultin(
    IN angkatan VARCHAR(6),
    IN gender VARCHAR(15),
    IN status_pinjam VARCHAR(15)
)
BEGIN
    SELECT * FROM anggota WHERE angkt_anggota = angkatan AND jenis_kelamin = gender AND status_pinjam = status_pinjam;
END //

DELIMITER ;
CALL defaultin('2018', 'Perempuan', 'Aktif');



-- nomer 2
DELIMITER //

CREATE PROCEDURE GetPengembalianByKodeBuku(IN kode_buku_param VARCHAR(10))
BEGIN
    SELECT * FROM pengembalian WHERE kode_buku = kode_buku_param;
END//

DELIMITER ;
CALL GetPengembalianByKodeBuku('B001');


-- nomer 3
DELIMITER //
CREATE PROCEDURE GetAnggotaByAngkatanAndGender(
    IN angkatan VARCHAR(6),
    IN gender VARCHAR(15)
)
BEGIN
    SELECT * FROM anggota WHERE angkt_anggota = angkatan AND jenis_kelamin = gender;
END //
DELIMITER ;
CALL GetAnggotaByAngkatanAndGender('2019', 'Perempuan');


-- nomer 4
DELIMITER //
CREATE PROCEDURE GetBukudanperintilan(
    IN pengarang VARCHAR(30),
    IN penerbit VARCHAR(30),
    IN tahun_terbit VARCHAR(10)
)
BEGIN
    SELECT * FROM buku WHERE pengarang_buku = pengarang AND penerbit_buku = penerbit AND tahun_buku = tahun_terbit;
END //
DELIMITER ;
CALL GetBukudanperintilan('Andrea Hirata', 'Bentang Pustaka', '2005');



-- nomer5
DELIMITER //
CREATE PROCEDURE InsertBuku(
    IN kode_buku VARCHAR(10),
    IN judul_buku VARCHAR(25),
    IN pengarang_buku VARCHAR(30),
    IN penerbit_buku VARCHAR(30),
    IN tahun_buku VARCHAR(10),
    IN jumlah_buku VARCHAR(5),
    IN status_buku VARCHAR(10),
    IN klasifikasi_buku VARCHAR(20)
)
BEGIN
    INSERT INTO buku (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku) 
    VALUES (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku);
END //
DELIMITER ;
CALL InsertBuku('B014', 'Hujan', 'Tere Liye', 'Gramedia Pustaka Utama', '2016', '20', 'Tersedia', 'Fiksi');

-- nomer 6
DELIMITER //
CREATE PROCEDURE GetJumlahBuku(
    OUT total_buku INT
)
BEGIN
    SELECT COUNT(*) INTO total_buku FROM buku;
END //

DELIMITER ;
CALL GetJumlahBuku(@total_buku);
SELECT @total_buku AS Total_Buku;


-- nomer7
DELIMITER //
CREATE PROCEDURE GetJumlahAnggotaByAngkatanAndGender(
    IN angkatan VARCHAR(6),
    INOUT gender VARCHAR(15),
    OUT total_anggota INT
)
BEGIN
    SELECT COUNT(*) INTO total_anggota FROM anggota WHERE angkt_anggota = angkatan AND jenis_kelamin = gender;
END //
DELIMITER ;
SET @gender = 'Perempuan';
CALL GetJumlahAnggotaByAngkatanAndGender('2018', @gender, @total_anggota);
SELECT @total_anggota AS Total_Anggota, @gender AS Gender;













