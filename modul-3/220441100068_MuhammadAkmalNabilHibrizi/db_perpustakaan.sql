CREATE DATABASE db_perpustakaan;
use db_perpustakaan;

CREATE TABLE petugas (
  id_petugas VARCHAR(10) PRIMARY KEY,
  username VARCHAR(15) NOT NULL UNIQUE,
  password VARCHAR(15) NOT NULL,
  nama VARCHAR(25) NOT NULL
);

CREATE TABLE anggota (
  id_anggota VARCHAR(10) PRIMARY KEY,
  nama_anggota VARCHAR(20) NOT NULL,
  angkatan_anggota VARCHAR(6) NOT NULL,
  tempat_lahir_anggota VARCHAR(20) NOT NULL,
  tanggal_lahir_anggota DATE NOT NULL,
  no_telp VARCHAR(12) NOT NULL,
  jenis_kelamin VARCHAR(15) NOT NULL,
  status_pinjam VARCHAR(15) NOT NULL
);

CREATE TABLE buku (
  kode_buku VARCHAR(10) PRIMARY KEY,
  judul_buku VARCHAR(25) NOT NULL,
  pengarang_buku VARCHAR(30) NOT NULL,
  penerbit_buku VARCHAR(30) NOT NULL,
  tahun_buku VARCHAR(10) NOT NULL,
  jumlah_buku VARCHAR(5) NOT NULL,
  status_buku VARCHAR(10) NOT NULL,
  klasifikasi_buku VARCHAR(20) NOT NULL
);

CREATE TABLE peminjaman (
  kode_peminjaman VARCHAR(10) PRIMARY KEY,
  id_anggota VARCHAR(10) NOT NULL,
  id_petugas VARCHAR(10) NOT NULL,
  tanggal_pinjam DATE NOT NULL,
  tanggal_kembali DATE DEFAULT NULL,
  kode_buku VARCHAR(10) NOT NULL,
  FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
  FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
  FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);

CREATE TABLE pengembalian (
  kode_pengembalian VARCHAR(10) PRIMARY KEY,
  id_anggota VARCHAR(10) NOT NULL,
  kode_buku VARCHAR(10) NOT NULL,
  id_petugas VARCHAR(10) NOT NULL,
  tanggal_pinjam DATE NOT NULL,
  tanggal_kembali DATE NOT NULL,
  denda VARCHAR(15) NOT NULL,
  FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
  FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
  FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku)
);

INSERT INTO petugas (id_petugas, username, password, nama) VALUES
('P001', 'user1', 'pass123', 'Hartono Yanto'),
('P002', 'user2', 'pass456', 'Ani Susanti'),
('P003', 'user3', 'pass789', 'Joko Wibowo'),
('P004', 'user4', 'pass1234', 'Siti Rahayu'),
('P005', 'user5', 'pass5678', 'Ahmad Yani'),
('P006', 'user6', 'pass9012', 'Dian Permata'),
('P007', 'user7', 'pass3456', 'Rina Wulandari'),
('P008', 'user8', 'pass7890', 'Eko Prabowo'),
('P009', 'user9', 'pass2345', 'Maya Sari'),
('P010', 'user10', 'pass6789', 'Bambang Sudirman');
  

INSERT INTO anggota (id_anggota, nama_anggota, angkatan_anggota, tempat_lahir_anggota, tanggal_lahir_anggota, no_telp, jenis_kelamin, status_pinjam) VALUES
('A001', 'Agus Setiawan', '2018', 'Jakarta', '1995-02-15', '0812345678', 'Laki-Laki', 'Aktif'),
('A002', 'Siti Rahma', '2017', 'Bandung', '1996-08-20', '0823456789', 'Perempuan', 'Aktif'),
('A003', 'Bambang Wijaya', '2019', 'Surabaya', '1994-04-10', '0834567890', 'Laki-Laki', 'Aktif'),
('A004', 'Dewi Lestari', '2016', 'Yogyakarta', '1997-11-05', '0845678901', 'Perempuan', 'Aktif'),
('A005', 'Eko Pratama', '2020', 'Malang', '1993-06-30', '0856789012', 'Laki-Laki', 'Aktif'),
('A006', 'Fitri Indah', '2019', 'Medan', '1998-03-25', '0867890123', 'Perempuan', 'Aktif'),
('A007', 'Galih Putra', '2017', 'Semarang', '1996-09-15', '0878901234', 'Laki-Laki', 'Aktif'),
('A008', 'Hasanah Hidayah', '2018', 'Surabaya', '1995-04-12', '0889012345', 'Perempuan', 'Aktif'),
('A009', 'Irfan Pratama', '2021', 'Bandung', '1992-12-20', '0890123456', 'Laki-Laki', 'Aktif'),
('A010', 'Joko Suryono', '2019', 'Jakarta', '1994-08-08', '0891234567', 'Laki-Laki', 'Aktif');


INSERT INTO buku (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku) VALUES
('B001', 'Alam Bambu', 'Ananda Guritno', 'Bumi Pustaka', '2010', '20', 'Tersedia', 'Sains'),
('B002', 'Hujan Bulan Juni', 'Sapardi Djoko Damono', 'Gramedia Pustaka Utama', '2001', '15', 'Tersedia', 'Fiksi'),
('B003', 'Bulan Tak Bermadu', 'Ahmad Tohari', 'Bentang Pustaka', '1998', '12', 'Tersedia', 'Fiksi'),
('B004', 'Manusia Setengah Salmon', 'Raditya Dika', 'Gagas Media', '2012', '18', 'Tersedia', 'Fiksi Komedi'),
('B005', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005', '25', 'Tersedia', 'Fiksi'),
('B006', 'Ayat-ayat Cinta', 'Habiburrahman El Shirazy', 'Republika', '2004', '22', 'Tersedia', 'Fiksi Romantis'),
('B007', 'Negeri 5 Menara', 'Ahmad Fuadi', 'Gramedia Pustaka Utama', '2009', '19', 'Tersedia', 'Fiksi'),
('B008', 'Tere Liye', 'Hafizah Noor', 'Mizan Pustaka', '2001', '30', 'Tersedia', 'Fiksi'),
('B009', 'Supernova', 'Dee Lestari', 'Bentang Pustaka', '2004', '14', 'Tersedia', 'Fiksi'),
('B010', '5cm', 'Donny Dhirgantoro', 'Grasindo', '2011', '16', 'Tersedia', 'Fiksi');


INSERT INTO peminjaman (kode_peminjaman, id_anggota, id_petugas, tanggal_pinjam, tanggal_kembali, kode_buku) VALUES
('P001', 'A001', 'P001', '2024-04-25', '2024-05-02', 'B001'),
('P002', 'A002', 'P002', '2024-04-26', '2024-05-03', 'B002'),
('P003', 'A003', 'P003', '2024-04-27', '2024-05-04', 'B003'),
('P004', 'A004', 'P004', '2024-04-28', '2024-05-05', 'B004'),
('P005', 'A005', 'P005', '2024-04-29', '2024-05-06', 'B005'),
('P006', 'A006', 'P006', '2024-04-30', '2024-05-07', 'B006'),
('P007', 'A007', 'P007', '2024-05-01', '2024-05-08', 'B007'),
('P008', 'A008', 'P008', '2024-05-02', '2024-05-09', 'B008'),
('P009', 'A009', 'P009', '2024-05-03', '2024-05-10', 'B009'),
('P010', 'A010', 'P010', '2024-05-04', '2024-05-11', 'B010');

INSERT INTO peminjaman (kode_peminjaman, id_anggota, id_petugas, tanggal_pinjam, tanggal_kembali, kode_buku) VALUES
('P011', 'A004', 'P004', '2024-04-28', '2024-05-05', 'B004');
 

INSERT INTO pengembalian (kode_pengembalian, id_anggota,kode_buku, id_petugas,tanggal_pinjam, tanggal_kembali, denda) VALUES
('K001', 'A001', 'B001', 'P001', '2024-04-25', '2024-05-02', 'Rp 0'),
('K002', 'A002', 'B002', 'P002', '2024-04-26', '2024-05-03', 'Rp 10000'),
('K003', 'A003', 'B003', 'P003', '2024-04-27', '2024-05-04', 'Rp 5000'),
('K004', 'A004', 'B004', 'P004', '2024-04-28', '2024-05-05', 'Rp 7500'),
('K005', 'A005', 'B005', 'P005', '2024-04-29', '2024-05-06', 'Rp 0'),
('K006', 'A006', 'B006', 'P006', '2024-04-30', '2024-05-07', 'Rp 20000'),
('K007', 'A007', 'B007', 'P007', '2024-05-01', '2024-05-08', 'Rp 0'),
('K008', 'A008', 'B008', 'P008', '2024-05-02', '2024-05-09', 'Rp 0'),
('K009', 'A009', 'B009', 'P009', '2024-05-03', '2024-05-10', 'Rp 30000'),
('K010', 'A010', 'B010', 'P010', '2024-05-04', '2024-05-11', 'Rp 15000');


DELIMITER //
CREATE PROCEDURE soal1(IdAnggota VARCHAR(10))
	BEGIN
	SELECT * FROM anggota
	WHERE id_anggota = IdAnggota;
	END //
DELIMITER ;

CALL soal1('A001');


DELIMITER //
CREATE PROCEDURE soal2(IN namaAnggota VARCHAR(20))
	BEGIN
	  SELECT *
	  FROM anggota
	  WHERE nama_anggota LIKE CONCAT('%' , namaAnggota,'%');
	END //
DELIMITER ;
drop procedure soal2;
CALL soal2('Galih');


DELIMITER //
CREATE PROCEDURE soal3(
  IN statusBuku VARCHAR(10),
  IN klasifikasiBuku VARCHAR(20)
)
	BEGIN
	  SELECT *
	  FROM buku
	  WHERE status_buku = statusBuku AND klasifikasi_buku = klasifikasiBuku;
	END //
DELIMITER ;

CALL soal3('Tersedia', 'Fiksi');


DELIMITER //
CREATE PROCEDURE soal4(
  idAnggota VARCHAR(15),
  tanggalPinjam DATE,
  kodeBuku VARCHAR(10)
)
BEGIN
   SELECT *
    FROM peminjaman
    WHERE id_anggota = idAnggota
    AND tanggal_pinjam = tanggalPinjam
    AND kode_buku = kodeBuku;
END //
DELIMITER ;

CALL soal4('A004', '2024-04-28', 'B004');


DELIMITER //
CREATE PROCEDURE soal5(
  idPetugas VARCHAR(15),
  usernamePetugas VARCHAR(20),
  passwordPetugas VARCHAR(25),
  namaPetugas VARCHAR(50)
)
	BEGIN
	  INSERT INTO petugas (
		id_petugas,
		username,
		password,
		nama
	  )
	  VALUES (
		idPetugas,
		usernamePetugas,
		passwordPetugas,
        namaPetugas
	  );
	END //
DELIMITER ;

CALL soal5('P012', 'user12', 'pass5699', 'nama saya');

select * from petugas;


DELIMITER //
CREATE PROCEDURE soal6(
    OUT totalpeminjam INT
)
BEGIN
    SELECT COUNT(id_anggota) INTO totalpeminjam FROM peminjaman;
END//
DELIMITER ;

drop procedure soal6;

call soal6(@totalpeminjam);
SELECT @totalpeminjam AS Total;

DELETE from peminjaman WHERE kode_peminjaman = 10;

select * from peminjaman;


DELIMITER //
CREATE PROCEDURE soal7(
    IN tgl_pinjam DATE,
    IN buku_kode VARCHAR(10),
    OUT jml_peminjam INT
)
BEGIN
    SELECT COUNT(*) INTO jml_peminjam
    FROM peminjaman
    WHERE tanggal_pinjam = tgl_pinjam
    AND kode_buku = buku_kode;
END //
DELIMITER ;

CALL soal7('2024-04-28', 'B004', @jumlah);



SELECT @jumlah AS Jumlah_Peminjam;