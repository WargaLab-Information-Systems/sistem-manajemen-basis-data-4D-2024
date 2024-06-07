create database perpustakaan;
use perpustakaan;

create table petugas (
			id_petugas varchar(10) primary key,
            username varchar(15),
            password varchar(15),
            nama varchar(24));
            
create table anggota(
			idAnggota varchar (10) primary key,
            nama_anggota varchar (20),
            angkatan_anggota varchar (6),
            tempat_lahir_anggota varchar (20),
            tanggal_lahir_anggota date,
            no_telp int (12),
            jenis_kelamin varchar (15),
            status_pinjam varchar (15));
            
create table buku(
			kode_buku varchar (10) primary key,
            judul_buku varchar (25),
            pengarang_buku varchar (30),
            penerbit_buku varchar (30),
            tahun_buku varchar (10),
            jumlah_buku varchar (5),
            status_buku varchar (10),
            klasifikasi_buku varchar (20));
            
CREATE TABLE peminjaman (
			kode_peminjaman VARCHAR (10) primary key, 
			idAnggota VARCHAR (10), 
			id_petugas VARCHAR (10), 
			tanggal_pinjam DATE, 
			tanggal_kembali DATE, 
			kode_buku VARCHAR (10), 
			FOREIGN KEY(id_petugas) REFERENCES petugas(id_petugas), 
			FOREIGN KEY(idAnggota) REFERENCES anggota(idAnggota),
			FOREIGN KEY(kode_buku) REFERENCES buku(kode_buku));
    
CREATE TABLE pengembalian(
	kode_kembali VARCHAR (10) primary key, 
    idAnggota VARCHAR (10), 
    id_petugas VARCHAR (10), 
	tanggal_pinjam DATE, 
    tanggal_kembali DATE, 
    kode_buku VARCHAR (10), 
    denda VARCHAR (15), 
	FOREIGN KEY(id_petugas) REFERENCES petugas(id_petugas), 
    FOREIGN KEY(idAnggota) REFERENCES anggota(idAnggota), 
    FOREIGN KEY(kode_buku) REFERENCES buku(kode_buku)
);

INSERT INTO petugas (id_petugas, username, password, nama) 
VALUES 
('PTG001', 'john_doe', 'password123', 'John Doe'),
('PTG002', 'jane_smith', 'dia', 'Jane Smith'),
('PTG003', 'nuha_afia', 'adminpass', 'nuha'),
('PTG004', 'michael_jackson', 'kamu', 'Michael Jackson'),
('PTG005', 'susan_adams', 'susie123', 'Susan Adams'),
('PTG006', 'yani_yani', 'popo123', 'yani'),
('PTG007', 'linda_jones', 'lindaj', 'Linda Jones'),
('PTG008', 'kevin_lee', 'password123', 'Kevin Lee'),
('PTG009', 'emily_wilson', 'emilyw', 'Emily Wilson'),
('PTG010', 'david_miller', 'davidm', 'David Miller');

select * from petugas;

INSERT INTO anggota (idAnggota, nama_anggota, angkatan_anggota, tempat_lahir_anggota, tanggal_lahir_anggota, no_telp, jenis_kelamin, status_pinjam) 
VALUES 
('A001', 'John Doe', '2018', 'Jakarta', '1995-05-15', 123456, 'Laki-laki', 'pinjam'),
('A002', 'Jane Smith', '2019', 'Surabaya', '1996-08-20', 669988, 'Perempuan', 'pinjam'),
('A003', 'Michael Jackson', '2017', 'Bandung', '1994-11-10', 990077, 'Laki-laki', 'pinjam'),
('A004', 'Susan Adams', '2020', 'Medan', '1997-04-25', 778877, 'Perempuan', 'pinjam'),
('A005', 'Robert Brown', '2016', 'Yogyakarta', '1993-12-05', 675678, 'Laki-laki', 'pinjam'),
('A006', 'Linda Jones', '2021', 'Semarang', '1998-10-30', 098765, 'Perempuan', 'pinjam'),
('A007', 'Kevin Lee', '2015', 'Surakarta', '1992-07-18', 565656, 'Laki-laki', 'pinjam'),
('A008', 'Emily Wilson', '2022', 'Malang', '1999-02-12', 454545, 'Perempuan', 'pinjam'),
('A009', 'David Miller', '2014', 'Bali', '1991-09-08', 876546, 'Laki-laki', 'pinjam'),
('A010', 'Maria Garcia', '2023', 'Bogor', '2000-06-22', 675432, 'Perempuan', 'pinjam');
select*from anggota;


INSERT INTO buku (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku) 
VALUES 
('B001', 'Harry Potter', 'Rowling', 'Bloomsbury', '1997', '10', 'Tersedia', 'Fantasi'),
('B002', 'To Kill', 'Harper', 'Lippincott', '1960', '5', 'Tersedia', 'Fiksi'),
('B003', 'The Great', 'Fitzgerald', 'Charles', '1925', '8', 'Tidak', 'Klasik'),
('B004', 'The Catcher', 'Salinger', 'Little', '1951', '6', 'Tersedia', 'Fiksi'),
('B005', 'laskar pelangi', 'George Orwell', 'Secker', '1949', '7', 'Tersedia', 'Fiksi'),
('B006', 'langit', 'Jane Austen', 'Whitehall', '1813', '3', 'Tidak', 'Klasik'),
('B007', 'The Hobbit', 'Tolkien', 'Allen & Unwin', '1937', '9', 'Tersedia', 'Fantasi'),
('B008', 'bumi', 'Tolkien', 'Allen & Unwin', '1954', '4', 'Tersedia', 'Fantasi'),
('B009', 'bumi', 'Dan Brown', 'Doubleday', '2003', '12', 'Tersedia', 'Thriller'),
('B010', 'dua garis', 'Suzanne', 'Scholastic', '2008', '11', 'Tidak', 'Fiksi');

INSERT INTO peminjaman (kode_peminjaman, idAnggota, id_petugas, tanggal_pinjam, tanggal_kembali, kode_buku) 
VALUES 
('PJ001', 'A001', 'PTG001', '2024-04-01', '2024-04-08', 'B001'),
('PJ002', 'A002', 'PTG002', '2024-04-02', '2024-04-09', 'B002'),
('PJ003', 'A003', 'PTG003', '2024-04-03', '2024-04-10', 'B003'),
('PJ004', 'A004', 'PTG001', '2024-04-04', '2024-04-11', 'B004'),
('PJ005', 'A005', 'PTG002', '2024-04-05', '2024-04-12', 'B005'),
('PJ006', 'A006', 'PTG003', '2024-04-06', '2024-04-13', 'B006'),
('PJ007', 'A007', 'PTG001', '2024-04-07', '2024-04-14', 'B007'),
('PJ008', 'A008', 'PTG002', '2024-04-08', '2024-04-15', 'B008'),
('PJ009', 'A009', 'PTG003', '2024-04-09', '2024-04-16', 'B009'),
('PJ010', 'A010', 'PTG001', '2024-04-10', '2024-04-17', 'B010');

INSERT INTO pengembalian (kode_kembali, idAnggota, id_petugas, tanggal_pinjam, tanggal_kembali, kode_buku, denda) 
VALUES 
('PK001', 'A001', 'PTG001', '2024-04-01', '2024-04-08', 'B001', '0'),
('PK002', 'A002', 'PTG002', '2024-04-02', '2024-04-09', 'B002', '0'),
('PK003', 'A003', 'PTG003', '2024-04-03', '2024-04-10', 'B003', '0'),
('PK004', 'A004', 'PTG001', '2024-04-04', '2024-04-11', 'B004', '0'),
('PK005', 'A005', 'PTG002', '2024-04-05', '2024-04-12', 'B005', '0'),
('PK006', 'A006', 'PTG003', '2024-04-06', '2024-04-13', 'B006', '0'),
('PK007', 'A007', 'PTG001', '2024-04-07', '2024-04-14', 'B007', '0'),
('PK008', 'A008', 'PTG002', '2024-04-08', '2024-04-15', 'B008', '0'),
('PK009', 'A009', 'PTG003', '2024-04-09', '2024-04-16', 'B009', '0'),
('PK010', 'A010', 'PTG001', '2024-04-10', '2024-04-17', 'B010', '0');

-- soal-- 

DELIMITER //

CREATE PROCEDURE input_buku(
    IN kode_buku VARCHAR(10),
    IN judul_buku VARCHAR(25),
    IN pengarang_buku VARCHAR(30),
    IN penerbit_buku VARCHAR(30),
    IN tahun_buku VARCHAR (10),
    IN jumlah_buku VARCHAR(5),
    IN status_buku VARCHAR(10),
    IN klasifikasi_buku VARCHAR(20)
)
BEGIN
    INSERT INTO buku VALUES (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku);
END //

DELIMITER ; 
CALL input_buku('B011', 'Laut Bercerita', 'Leilia', 'Gramedia', '2020', '5', 'Tersedia', 'Sastra');

select * from buku;
drop procedure input_buku;
DELETE FROM buku 
WHERE kode_buku = 'B011' AND judul_buku = 'Laut Bercerita';

DELIMITER //


DELIMITER //

CREATE PROCEDURE cari_anggota_berdasarkan_nama(
    IN nama_anggota_in VARCHAR(20)
)
BEGIN
    SELECT *
    FROM anggota
    WHERE nama_anggota = nama_anggota_in;
END //

DELIMITER ;
call cari_anggota_berdasarkan_nama
	('John Doe');

DELIMITER //

CREATE PROCEDURE cari_buku_berdasarkan_status_dan_klasifikasi(
    IN status_buku_in VARCHAR(10),
    IN klasifikasi_buku_in VARCHAR(20)
)
BEGIN
    SELECT *
    FROM buku
    WHERE status_buku = status_buku_in AND klasifikasi_buku = klasifikasi_buku_in;
END //

DELIMITER ;
call cari_buku_berdasarkan_status_dan_klasifikasi
	('Tersedia', 'Klasik');


DELIMITER //

CREATE PROCEDURE cari_peminjaman_berdasarkan_kriteria(
    IN anggota_id VARCHAR(10),
    IN tanggal_pinjam DATE,
    IN buku_kode VARCHAR(10)
)
BEGIN
    SELECT *
    FROM peminjaman
    WHERE idAnggota = anggota_id 
    AND tanggal_pinjam = tanggal_pinjam 
    AND kode_buku = buku_kode;
END //

DELIMITER ;

drop procedure tampilkan_data_peminjaman;
CALL cari_peminjaman_berdasarkan_kriteria('A001', '2024-04-01', 'B001');        

DELIMITER //

DELIMITER //

DELIMITER //
-- pembenaran-- 
DELIMITER //

CREATE PROCEDURE InsertPetugas(
    IN petugas_id VARCHAR(10),
    IN petugas_username VARCHAR(15),
    IN petugas_password VARCHAR(15),
    IN petugas_nama VARCHAR(24)
)
BEGIN
    INSERT INTO petugas (id_petugas, username, password, nama) 
    VALUES (petugas_id, petugas_username, petugas_password, petugas_nama);
END//

DELIMITER ;
CALL InsertPetugas('PTG011', 'mark_smith', 'markpass', 'Mark Smith');
select * from petugas;

DELIMITER //

DELIMITER //

CREATE PROCEDURE hitung_jumlah_peminjam(
    OUT jumlah_peminjam INT
)
BEGIN
    SELECT COUNT(DISTINCT idAnggota) INTO jumlah_peminjam FROM peminjaman;
END //

DELIMITER ;
CALL hitung_jumlah_peminjam(@jumlah);
SELECT @jumlah AS jumlah_peminjam;

DELIMITER //

CREATE PROCEDURE hitung_jumlah_peminjam_berdasarkan_tanggal_dan_buku(
    INOUT tanggal_pinjam_param DATE,
    IN kode_buku_param VARCHAR(10),
    OUT jumlah_peminjam INT
)
BEGIN
    SELECT COUNT(*) INTO jumlah_peminjam 
    FROM peminjaman 
    WHERE tanggal_pinjam = tanggal_pinjam_param AND kode_buku = kode_buku_param;
END //

DELIMITER ;

SET @tanggal_pinjam = '2024-04-01'; 
SET @kode_buku = 'B001';
CALL hitung_jumlah_peminjam_berdasarkan_tanggal_dan_buku(@tanggal_pinjam, @kode_buku, @jumlah);
SELECT @tanggal_pinjam AS tanggal_pinjam_param , @jumlah AS jumlah_peminjam;






