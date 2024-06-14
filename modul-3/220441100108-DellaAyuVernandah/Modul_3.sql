CREATE DATABASE perpustakaan;
USE perpustakaan;

CREATE TABLE petugas ( 
	idPetugas VARCHAR (10) PRIMARY KEY, 
	Username VARCHAR (15), 
	PASSWORD VARCHAR(15), 
	Nama VARCHAR (25)
    );
    
CREATE TABLE buku ( kode_buku VARCHAR (10) PRIMARY KEY, 
	judul_buku VARCHAR (25), 
	pengarang_buku VARCHAR(30), 
	penerbit_buku VARCHAR (30),
	tahun_buku VARCHAR (10), 
	jumlah_buku VARCHAR (5), 
	status_buku VARCHAR (10), 
	klasifikasi_buku VARCHAR (20)
    );

CREATE TABLE anggota ( 
	idAnggota VARCHAR (10) PRIMARY KEY, 
	nama_anggota VARCHAR (20), 
	angkatan_anggota VARCHAR(6), 
	tempat_lahir_anggota VARCHAR (20),
	tanggal_lahir_anggota DATE, 
	no_telp VARCHAR (12), 
	jenis_kelamin VARCHAR (15), 
	status_pinjam VARCHAR (15)
    );

CREATE TABLE peminjaman( 
	kode_peminjaman VARCHAR (10) PRIMARY KEY, 
	idAnggota VARCHAR (10),
	idPetugas VARCHAR (10), 
	tanggal_pinjam DATE, 
	tanggal_kembali DATE, 
	kode_buku VARCHAR (10), 
	FOREIGN KEY (idAnggota) REFERENCES anggota(idAnggota),
	FOREIGN KEY (idPetugas) REFERENCES petugas(idPetugas), 
	FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku)
    );

CREATE TABLE pengembalian( 
	kode_kembali VARCHAR (10) PRIMARY KEY, 
	idAnggota VARCHAR (10), 
	kode_buku VARCHAR (10), 
	idPetugas VARCHAR (10), 
	tgl_pinjam DATE, 
	tgl_kembali DATE, 
	denda VARCHAR (15), 
	FOREIGN KEY (idAnggota) REFERENCES anggota(idAnggota),
	FOREIGN KEY (idPetugas) REFERENCES petugas(idPetugas), 
	FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku)
    );

-- Isi data untuk tabel petugas
INSERT INTO petugas (idPetugas, Username, PASSWORD, Nama) VALUES
('PTG001', 'jokoS', 'joko01', 'Joko Sutarno'),
('PTG002', 'AniW', 'ani02', 'Ani Wulandari'),
('PTG003', 'BudiS', 'budi03', 'Budi Santoso'),
('PTG004', 'sitiR', 'siti04', 'Siti Rahayu'),
('PTG005', 'DewiK', 'dewi05', 'Dewi Kusuma'),
('PTG006', 'AngungP', 'agung06', 'Agung Purnama'),
('PTG007', 'YuniS', 'yuni07', 'Yuni Susanti'),
('PTG008', 'HendriW', 'hendrio08', 'Hendro Wijaya'),
('PTG009', 'NimaP', 'nina09', 'Nina Permata'),
('PTG010', 'WulanS', 'wulan10', 'Wulan Sari');

-- Isi data untuk tabel buku
INSERT INTO buku (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku) VALUES
('BK001', 'Pulang', 'Tere Liye', 'Gramedia', '2016', '50', 'Tersedia', 'Fiksi'),
('BK002', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005', '30', 'Tersedia', 'Fiksi'),
('BK003', 'Bumi Manusia', 'Pramoedya Ananta Toer', 'Hasta Mitra', '1980', '20', 'Tersedia', 'Sastra'),
('BK004', 'Ayat-Ayat Cinta', 'Habiburrahman El Shirazy', 'Republika', '2004', '40', 'Tersedia', 'Romantis'),
('BK005', 'Harry Potter dan Batu Bertuah', 'J.K. Rowling', 'Scholastic', '1997', '25', 'Tersedia', 'Fantasi'),
('BK006', 'Dilan 1990', 'Pidi Baiq', 'Milea', '2014', '35', 'Tersedia', 'Romantis'),
('BK007', 'Matilda', 'Roald Dahl', 'Puffin', '1988', '15', 'Tersedia', 'Anak-anak'),
('BK008', 'Sherlock Holmes: The Complete Novels and Stories', 'Arthur Conan Doyle', 'Gramedia Pustaka Utama', '1892', '10', 'Tersedia', 'Detektif'),
('BK009', 'The Hunger Games', 'Suzanne Collins', 'Scholastic Press', '2008', '45', 'Tersedia', 'Fiksi'),
('BK010', '1984', 'George Orwell', 'Gramedia Pustaka Utama', '1949', '20', 'Tersedia', 'Fiksi Ilmiah');

-- Isi data untuk tabel anggota
INSERT INTO anggota (idAnggota, nama_anggota, angkatan_anggota, tempat_lahir_anggota, tanggal_lahir_anggota, no_telp, jenis_kelamin, status_pinjam) VALUES
('AGT001', 'Linda Sari', '2019', 'Jakarta', '2001-05-15', '081234567890', 'Perempuan', 'Nonaktif'),
('AGT002', 'Ahmad Fadil', '2020', 'Sidoarjo', '2002-02-20', '082345678901', 'Laki-laki', 'Aktif'),
('AGT003', 'Rina Nurhayati', '2022', 'Surabaya', '2004-03-10', '083456789012', 'Perempuan', 'Aktif'),
('AGT004', 'Muhammad Ali', '2021', 'Surabaya', '2002-11-25', '084567890123', 'Laki-laki', 'Aktif'),
('AGT005', 'Dewi Lestari', '2022', 'Gersik', '2003-09-05', '085678901234', 'Perempuan', 'Aktif'),
('AGT006', 'Putra Pratama', '2022', 'Kediri', '2004-01-30', '086789012345', 'Laki-laki', 'Aktif'),
('AGT007', 'Siti Nurjanah', '2020', 'Malang', '2001-12-10', '087890123456', 'Perempuan', 'Nonaktif'),
('AGT008', 'Adi Wijaya', '2020', 'Jombang', '2005-08-20', '088901234567', 'Laki-laki', 'Aktif'),
('AGT009', 'Ruli Wilandra', '2019', 'Mojokerto', '1999-06-18', '089012345678', 'Laki-laki', 'Nonaktif'),
('AGT010', 'Rika Indah', '2022', 'Batu', '2004-04-12', '089123456789', 'Perempuan', 'Aktif');

-- Isi data untuk tabel peminjaman
INSERT INTO peminjaman (kode_peminjaman, idAnggota, idPetugas, tanggal_pinjam, tanggal_kembali, kode_buku) VALUES
('PINJ001', 'AGT001', 'PTG001', '2021-04-01', '2021-04-20', 'BK001'),
('PINJ002', 'AGT002', 'PTG002', '2021-06-21', '2021-06-25', 'BK002'),
('PINJ003', 'AGT003', 'PTG003', '2020-05-03', '2020-05-10', 'BK003'),
('PINJ004', 'AGT004', 'PTG004', '2022-10-11', '2022-10-24', 'BK004'),
('PINJ005', 'AGT005', 'PTG005', '2019-04-15', '2019-04-23', 'BK005'),
('PINJ006', 'AGT006', 'PTG006', '2023-07-06', '2023-07-11', 'BK006'),
('PINJ007', 'AGT007', 'PTG007', '2023-10-10', '2023-10-14', 'BK007'),
('PINJ008', 'AGT008', 'PTG008', '2024-03-08', '2024-03-15', 'BK008'),
('PINJ009', 'AGT009', 'PTG009', '2020-05-29', '2020-06-06', 'BK009'),
('PINJ010', 'AGT010', 'PTG010', '2024-03-10', '2024-03-15', 'BK010');

-- Isi data untuk tabel pengembalian
INSERT INTO pengembalian (kode_kembali, idAnggota, kode_buku, idPetugas, tgl_pinjam, tgl_kembali, denda) VALUES
('KEM001', 'AGT001', 'BK001', 'PTG001', '2021-04-01', '2021-04-20', '15000'),
('KEM002', 'AGT002', 'BK002', 'PTG002', '2021-06-21', '2021-06-25', '0'),
('KEM003', 'AGT003', 'BK003', 'PTG003', '2020-05-03', '2020-05-10', '0'),
('KEM004', 'AGT004', 'BK004', 'PTG004', '2022-10-11', '2022-10-24', '30000'),
('KEM005', 'AGT005', 'BK005', 'PTG005', '2019-04-15', '2019-04-23', '5000'),
('KEM006', 'AGT006', 'BK006', 'PTG006', '2023-07-06', '2023-07-11', '0'),
('KEM007', 'AGT007', 'BK007', 'PTG007', '2023-10-10', '2023-10-14', '0'),
('KEM008', 'AGT008', 'BK008', 'PTG008', '2024-03-08', '2024-03-15', '0'),
('KEM009', 'AGT009', 'BK009', 'PTG009', '2020-05-29', '2020-06-11', '25000'),
('KEM010', 'AGT010', 'BK010', 'PTG010', '2024-03-10', '2024-03-15', '0');

-- 1. parameter IN default 
DELIMITER //
CREATE PROCEDURE search_anggota(anggota_id VARCHAR(10))
BEGIN
    SELECT * FROM anggota WHERE idAnggota = anggota_id;
END //
DELIMITER ;
CALL search_anggota('AGT002');

-- 2. data pada table berdasarkan pada salah satu field yaitu kode buku
DELIMITER //
CREATE PROCEDURE GetDatabuku(IN buku_kode VARCHAR(10))
BEGIN
    SELECT * FROM buku WHERE Kode_Buku LIKE concat('%', buku_kode, '%');
END//
DELIMITER ;

CALL GetDatabuku ('BK');
drop procedure GetDatabuku;

-- 3. data pada table anggota berdasarkan dua field yaitu angkatan dan jenis kelamin.
DELIMITER //
CREATE PROCEDURE TampilkanAnggota(
IN angkatan VARCHAR(6), 
IN jenis_kelamin_anggota VARCHAR(15))
BEGIN
    SELECT * FROM anggota WHERE angkatan_anggota = angkatan AND jenis_kelamin = jenis_kelamin_anggota;
END //
DELIMITER ;
CALL TampilkanAnggota('2022', 'Perempuan');

-- 4. data pada table buku berdasarkan pada 3 field yaitu pengarang, penerbit dan tahun terbit.
DELIMITER //
CREATE PROCEDURE databuku(
    IN nama_pengarang VARCHAR(30),
    IN nama_penerbit VARCHAR(30),
    IN tahun_terbit VARCHAR(10))
BEGIN
    SELECT * FROM buku
    WHERE pengarang_buku = nama_pengarang
    AND penerbit_buku = nama_penerbit
    AND tahun_buku = tahun_terbit;
END //
DELIMITER ;
CALL databuku('Tere Liye', 'Gramedia', '2016');

-- 5. memasukkan data pada table buku.
DELIMITER //
CREATE PROCEDURE input_buku(
IN kode VARCHAR(10), 
IN judul VARCHAR(25), 
IN pengarang VARCHAR(30), 
IN penerbit VARCHAR(30),
IN tahun VARCHAR(10), 
IN jumlah VARCHAR(5), 
IN STATUS VARCHAR(10), 
IN klasifikasi VARCHAR(20))
BEGIN
    INSERT INTO buku VALUES (kode, judul, pengarang, penerbit, tahun, jumlah, STATUS, klasifikasi); 
END //
DELIMITER ;
CALL input_buku('BK011', 'Matahari', 'Tere Liye', 'Gramedia', '2020', '30', 'Tersedia', 'Fiksi');
SELECT * FROM buku

-- 6. mengetahui data jumlah buku menggunakan parameter OUT.
DELIMITER //
CREATE PROCEDURE GetJumlahBuku(OUT jumlah_buku_out INT)
BEGIN
    SELECT SUM(jumlah_buku) INTO jumlah_buku_out FROM buku;
END //
DELIMITER ;
CALL GetJumlahBuku(@jumlah);
SELECT @jumlah

-- 7. mengetahui data jumlah anggota berdasarkan angkatan dan jenis kelaminnya menggunakan parameter INOUT.
DELIMITER //
CREATE PROCEDURE Jumlahanggota(
        IN angkatan VARCHAR(6),
    IN jenis_kelamin_anggota VARCHAR(15),
    OUT jumlah_anggota INT)
BEGIN
    SELECT COUNT(*) INTO jumlah_anggota
    FROM anggota
    WHERE angkatan_anggota = angkatan AND jenis_kelamin = jenis_kelamin_anggota;
END //
DELIMITER ;

DROP procedure Jumlahanggota;
CALL Jumlahanggota('2022', 'Perempuan', @jumlah_anggota);
SELECT @jumlah_anggota AS 'Jumlah_Anggota';