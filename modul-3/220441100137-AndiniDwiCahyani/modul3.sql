CREATE DATABASE perpustakaan;
USE perpustakaan;

CREATE TABLE petugas(
	id_petugas INT NOT NULL PRIMARY KEY,
    username VARCHAR (15) NOT NULL,
    password VARCHAR (15) NOT NULL,
    nama VARCHAR (25) NOT NULL
);
DESC petugas;

CREATE TABLE anggota(
	id_anggota INT NOT NULL PRIMARY KEY,
    nama_anggota VARCHAR (20) NOT NULL,
    angkatan_anggota VARCHAR (6) NOT NULL,
    tempat_lahir_anggota VARCHAR (20) NOT NULL,
    tanggal_lahir_anggota DATE NOT NULL,
    no_telp INT (12) NOT NULL,
    jenis_kelamin VARCHAR (15) NOT NULL,
    status_pinjam VARCHAR (15) NOT NULL
);
DESC anggota;

CREATE TABLE buku(
	kode_buku INT NOT NULL PRIMARY KEY,
    judul_buku VARCHAR (25) NOT NULL,
    pengarang_buku VARCHAR (30) NOT NULL,
    penerbit_buku VARCHAR (30) NOT NULL,
    tahun_buku VARCHAR (10) NOT NULL,
    jumlah_buku VARCHAR (5) NOT NULL,
    status_buku VARCHAR (10) NOT NULL,
    klasifikasi_buku VARCHAR (20) NOT NULL
);
DESC buku;

CREATE TABLE peminjaman(
	kode_peminjaman INT NOT NULL PRIMARY KEY,
    id_anggota INT NOT NULL,
    id_petugas INT NOT NULL,
    tanggal_pinjam DATE NOT NULL,
    tanggal_kembali DATE NOT NULL,
    kode_buku INT NOT NULL,
    FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
    FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
    FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku)
);
DESC peminjaman;

CREATE TABLE pengembalian(
	kode_kembali INT NOT NULL PRIMARY KEY,
    id_anggota INT NOT NULL,
    kode_buku INT NOT NULL,
    id_petugas INT NOT NULL,
    tanggal_pinjam DATE NOT NULL,
    tanggal_kembali DATE NOT NULL,
    denda VARCHAR (15) NOT NULL,
    FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
    FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
	FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);
DESC pengembalian;

INSERT INTO petugas (id_petugas, username, password, nama) VALUES
	(1, 'putri_rahmawati', 'putrirahma01', 'Putri Rahmawati'),
	(2, 'agus_dwi', 'agusdwi02', 'Agus Dwi'),
	(3, 'putra_adam', 'putraadm03', 'Putra Adam'),
	(4, 'sarah_hrdynti', 'sarahaha04', 'Sarah Hardiyanti'),
	(5, 'bagus_putra', 'putraaa05', 'Bagus Putra'),
	(6, 'erika_cahyani', 'erikachyn06', 'Erika Cahyani'),
	(7, 'endang_kusuma', 'kusuma07', 'Endang Kusuma'),
	(8, 'rina_novitasari', 'rinanvts08', 'Rina Novitasari'),
	(9, 'dwi_cahyani', 'dwchyn09', 'Dwi Cahyani'),
	(10, 'ahmad_adista', 'adistaa10', 'Ahmad Adista');
SELECT * FROM petugas;

INSERT INTO anggota (id_anggota, nama_anggota, angkatan_anggota, tempat_lahir_anggota, tanggal_lahir_anggota, no_telp, jenis_kelamin, status_pinjam) VALUES
	(101, 'Andini', '2020', 'Jombang', '2003-09-08', 123456789, 'Perempuan', 'Belum'),
	(102, 'Alifia', '2021', 'Sampang', '2001-08-20', 987654321, 'Perempuan', 'Sudah'),
	(103, 'Farra', '2022', 'Lamongan', '2004-12-10', 555666777, 'Perempuan', 'Belum'),
	(104, 'Shafira', '2023', 'Gresik', '2002-03-25', 999888777, 'Perempuan', 'Sudah'),
	(105, 'Fiana', '2020', 'Pati', '2000-07-05', 333222111, 'Perempuan', 'Belum'),
	(106, 'Nabila', '2021', 'Pamekasan', '2001-01-30', 444555666, 'Perempuan', 'Sudah'),
	(107, 'Husnul', '2023', 'Probolinggo', '2002-09-12', 111222333, 'Perempuan', 'Belum'),
	(108, 'Della', '2022', 'Sumenep', '2002-11-08', 777888999, 'Perempuan', 'Sudah'),
	(109, 'Adista', '2020', 'Mojokerto', '2003-05-24', 666777888, 'Laki-laki', 'Belum'),
	(110, 'Erlangga', '2023', 'Surabaya', '2001-10-22', 222333444, 'Laki-laki', 'Sudah');
SELECT * FROM anggota;

INSERT INTO buku (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku) VALUES
	(111, 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005', '10', 'Tersedia', 'Fiksi'),
	(112, 'Ayat-Ayat Cinta', 'Habiburrahman El Shirazy', 'Pustaka Aksara', '2004', '8', 'Tersedia', 'Fiksi'),
	(113, 'Perahu Kertas', 'Dee Lestari', 'Bentang Pustaka', '2009', '6', 'Tersedia', 'Fiksi'),
	(114, 'Bumi Manusia', 'Pramoedya Ananta Toer', 'Hasta Mitra', '1980', '12', 'Tersedia', 'Fiksi'),
	(115, 'Sang Pemimpi', 'Andrea Hirata', 'Bentang Pustaka', '2006', '9', 'Tersedia', 'Fiksi'),
	(116, 'Improbable Nation', 'Elizabeth Pisani', 'W. W. Norton & Company', '2014', '7', 'Tersedia', 'Nonfiksi'),
	(117, 'A Brief History', 'Yuval Noah Harari', 'Harper', '2014', '11', 'Tersedia', 'Nonfiksi'),
	(118, 'Garis Waktu', 'Fiersa Besari', 'Media Kita', '2017', '10', 'Tersedia', 'Nonfiksi'),
	(119, 'Sejarah dan Budaya', 'Fadjar I. Thufail', 'Kompas', '2010', '8', 'Tersedia', 'Nonfiksi'),
	(120, 'Kisah Sang Penyair Tua', 'Sapardi Djoko Damono', 'Gramedia Pustaka Utama', '2018', '6', 'Tersedia', 'Fiksi');
SELECT * FROM buku;

INSERT INTO peminjaman (kode_peminjaman, id_anggota, id_petugas, tanggal_pinjam, tanggal_kembali, kode_buku) VALUES
	(201, 101, 1, '2024-04-01', '2024-04-08', 111),
	(202, 102, 2, '2024-04-02', '2024-04-09', 112),
	(203, 103, 3, '2024-04-03', '2024-04-10', 113),
	(204, 104, 4, '2024-04-04', '2024-04-11', 114),
	(205, 105, 5, '2024-04-05', '2024-04-12', 115),
	(206, 106, 6, '2024-04-06', '2024-04-13', 116),
	(207, 107, 7, '2024-04-07', '2024-04-14', 117),
	(208, 108, 8, '2024-04-08', '2024-04-15', 118),
	(209, 109, 9, '2024-04-09', '2024-04-16', 119),
	(210, 110, 10, '2024-04-10', '2024-04-17', 120);
SELECT * FROM peminjaman;

INSERT INTO pengembalian (kode_kembali, id_anggota, kode_buku, id_petugas, tanggal_pinjam, tanggal_kembali, denda) VALUES
    (301, 101, 111, 1, '2024-04-08', '2024-04-15', '20000'),
    (302, 102, 112, 2, '2024-04-09', '2024-04-16', '15000'),
    (303, 103, 113, 3, '2024-04-10', '2024-04-17', '10000'),
    (304, 104, 114, 4, '2024-04-11', '2024-04-18', '25000'),
    (305, 105, 115, 5, '2024-04-12', '2024-04-19', '30000'),
    (306, 106, 116, 6, '2024-04-13', '2024-04-20', '5000'),
    (307, 107, 117, 7, '2024-04-14', '2024-04-21', '10000'),
    (308, 108, 118, 8, '2024-04-15', '2024-04-22', '20000'),
    (309, 109, 119, 9, '2024-04-16', '2024-04-23', '25000'),
    (310, 110, 120, 10, '2024-04-17', '2024-04-24', '15000');
SELECT * FROM pengembalian;


-- nomer1-- 
DELIMITER //
CREATE PROCEDURE anggota(
	IN nama VARCHAR(30))
BEGIN
    SELECT * FROM anggota
    WHERE nama_anggota = nama;
END //
DELIMITER ;
CALL anggota('Alifia');


-- nomer 2-- 
DELIMITER //
CREATE PROCEDURE AmbilBukuBerdasarkanPenerbit(IN nama_penerbit VARCHAR(30))
BEGIN
    SELECT * FROM buku WHERE penerbit_buku = nama_penerbit;
END //
DELIMITER ;
CALL AmbilBukuBerdasarkanPenerbit('Bentang Pustaka');


-- nomer3-- 
DELIMITER //
CREATE PROCEDURE CariPeminjaman(
	IN tanggal_pinjam_buku DATE, 
    IN kode_bukuku INT)
BEGIN
    SELECT * FROM peminjaman 
    WHERE tanggal_pinjam = tanggal_pinjam_buku AND kode_buku = kode_bukuku;
END //
DELIMITER ;
CALL CariPeminjaman('2024-04-03', 113);


-- nomer4-- 
DELIMITER //
CREATE PROCEDURE CariAnggota(
	IN angkatan_param VARCHAR(6), 
    IN tempat_lahir_param VARCHAR(20), 
    IN jenis_kelamin_param VARCHAR(15))
BEGIN
    SELECT * FROM anggota 
    WHERE angkatan_anggota = angkatan_param 
    AND tempat_lahir_anggota = tempat_lahir_param 
    AND jenis_kelamin = jenis_kelamin_param;
END //
DELIMITER ;
CALL CariAnggota('2021', 'Jombang', 'Perempuan');


-- nomer5-- 
DELIMITER //
CREATE PROCEDURE TambahAnggota(
    IN id_anggota_param INT,
    IN nama_anggota_param VARCHAR(20),
    IN angkatan_anggota_param VARCHAR(6),
    IN tempat_lahir_anggota_param VARCHAR(20),
    IN tanggal_lahir_anggota_param DATE,
    IN no_telp_param INT,
    IN jenis_kelamin_param VARCHAR(15),
    IN status_pinjam_param VARCHAR(15)
)
BEGIN
    INSERT INTO anggota (
        id_anggota, 
        nama_anggota, 
        angkatan_anggota, 
        tempat_lahir_anggota, 
        tanggal_lahir_anggota, 
        no_telp, 
        jenis_kelamin, 
        status_pinjam
    ) VALUES (
        id_anggota_param, 
        nama_anggota_param, 
        angkatan_anggota_param, 
        tempat_lahir_anggota_param, 
        tanggal_lahir_anggota_param, 
        no_telp_param, 
        jenis_kelamin_param, 
        status_pinjam_param
    );
END //
DELIMITER ;
CALL TambahAnggota(112, 'Anisa', '2024', 'Malang', '2003-05-10', 123456789, 'Perempuan', 'Belum');
SELECT * FROM anggota;


-- nomer6-- 
DELIMITER //
CREATE PROCEDURE JumlahAnggota(OUT jumlah_anggota INT)
BEGIN
    SELECT COUNT(*) INTO jumlah_anggota FROM anggota;
END //
DELIMITER ;
CALL JumlahAnggota(@jumlah_anggota);
SELECT @jumlah_anggota;


-- nomer7--
DELIMITER //
CREATE PROCEDURE JumlahBukuByPengarangTahun(
    IN pengarang_param VARCHAR(30),
    IN tahun_param VARCHAR(10),
    OUT jumlah_bukuku INT
)
BEGIN
    SELECT jumlah_buku INTO  jumlah_bukuku
    FROM buku
    WHERE pengarang_buku = pengarang_param AND tahun_buku = tahun_param;
END //
DELIMITER ;
CALL JumlahBukuByPengarangTahun('Andrea Hirata', '2004', @jumlah_bukuku);
SELECT @jumlah_bukuku;
DROP PROCEDURE JumlahBukuByPengarangTahun;






 


    