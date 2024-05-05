-- Membuat database library
CREATE DATABASE library;
USE library;

-- Membuat tabel anggota
CREATE TABLE anggota (
  IdAnggota varchar(10) PRIMARY KEY,
  NamaAnggota varchar(20) NOT NULL,
  AngkatanAnggota varchar(6) NOT NULL,
  TempatLahirAnggota varchar(20) NOT NULL,
  TanggalLahirAnggota date NOT NULL,
  NoTelp int(12) NOT NULL,
  JenisKelamin varchar(15) NOT NULL,
  StatusPinjam varchar(15) NOT NULL
);

-- Membuat tabel petugas
CREATE TABLE petugas (
  IdPetugas varchar(10) PRIMARY KEY,
  Username varchar(15) NOT NULL,
  Password varchar(15) NOT NULL,
  Nama varchar(25) NOT NULL
);

-- Membuat tabel buku
CREATE TABLE buku (
  KodeBuku varchar(10) PRIMARY KEY,
  JudulBuku varchar(25) NOT NULL,
  PengarangBuku varchar(30) NOT NULL,
  PenerbitBuku varchar(30) NOT NULL,
  TahunBuku varchar(10) NOT NULL,
  JumlahBuku varchar(5) NOT NULL,
  KlasifikasiBuku varchar(20) NOT NULL,
  StatusBuku varchar(10) NOT NULL
);

-- Membuat tabel peminjaman
CREATE TABLE peminjaman (
  KodePeminjaman varchar(10) PRIMARY KEY,
  IdAnggota varchar(10) NOT NULL,
  IdPetugas varchar(10) NOT NULL,
  KodeBuku varchar(10) NOT NULL,
  TanggalPinjam date NOT NULL,
  TanggalKembali date NOT NULL,
  FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota),
  FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas),
  FOREIGN KEY (KodeBuku) REFERENCES buku(KodeBuku)
);

-- Membuat tabel pengembalian
CREATE TABLE pengembalian (
  KodeKembali varchar(10) PRIMARY KEY,
  KodePeminjaman varchar(10) NOT NULL,
  IdPetugas varchar(10) NOT NULL,
  KodeBuku varchar(10) NOT NULL,
  TglPinjam date NOT NULL,
  Denda varchar(15),
  FOREIGN KEY (KodePeminjaman) REFERENCES peminjaman(KodePeminjaman),
  FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas),
  FOREIGN KEY (KodeBuku) REFERENCES buku(KodeBuku)
);

-- isi data tabel petugas
INSERT INTO petugas (IdPetugas, Username, Password, Nama) VALUES
('P001', 'Wido', 'joko01', 'Joko Widodo'),
('P002', 'Anies', 'anies02', 'Anies Wulandari'),
('P003', 'Ganjar', 'ganjar03', 'Ganjar Subianto'),
('P004', 'Mahfud', 'mahfud04', 'Mahfud M'),
('P005', 'Prabowo', 'prabo05', 'Prabowo'),
('P006', 'Agung', 'agung06', 'Agung Mahardika'),
('P007', 'Yono', 'yono07', 'Yono Bakrie'),
('P008', 'Hendra', 'hendrao08', 'Hendra Kusuma'),
('P009', 'Nila', 'nila09', 'Nila Ayu'),
('P010', 'Gibran', 'gibran10', 'Gibran Raka');

-- isi data tabel buku
INSERT INTO buku (KodeBuku, JudulBuku, PengarangBuku, PenerbitBuku, TahunBuku, JumlahBuku, KlasifikasiBuku, StatusBuku)
VALUES
('B001', 'Percakapan Bahasa Inggris', 'Dian Putri', 'Gramedia', '2019', '10', 'Pendidikan', 'Tersedia'),
('B002', 'Pemrograman Java', 'Budi Santoso', 'Andi Publisher', '2020', '8', 'Teknologi', 'Tersedia'),
('B003', 'Sejarah Indonesia Modern', 'Ahmad Rizki', 'Erlangga', '2018', '5', 'Sejarah', 'Tersedia'),
('B004', 'Anatomi Manusia', 'Dewi Susanti', 'Penerbit Lintas', '2021', '15', 'Kedokteran', 'Tersedia'),
('B005', 'Seni Rupa Kontemporer', 'Ivan Surya', 'Bentang Pustaka', '2017', '12', 'Seni', 'Tersedia'),
('B006', 'Aljabar Linear', 'Ahmad Fadil', 'Zamrud Publisher', '2019', '7', 'Matematika', 'Tersedia'),
('B007', 'Kimia Dasar', 'Bambang Wijaya', 'Pustaka Baru', '2020', '10', 'Kimia', 'Tersedia'),
('B008', 'Kisah 25 Nabi', 'Dian Rifky', 'Pustaka Abadi', '2016', '4', 'Agama', 'Tersedia'),
('B009', 'Jaringan Komputer', 'Eko Prasetyo', 'Maju Jaya', '2021', '6', 'Teknologi', 'Tersedia'),
('B010', 'Manajemen Keuangan', 'Indra Cahya', 'Rajawali Press', '2019', '9', 'Ekonomi', 'Tersedia');

-- isi data tabel anggota
INSERT INTO anggota (IdAnggota, NamaAnggota, AngkatanAnggota, TempatLahirAnggota, TanggalLahirAnggota, NoTelp, JenisKelamin, StatusPinjam) VALUES
('A001', 'Linda Sari', '2019', 'Jakarta', '2001-05-15', '081234567890', 'Perempuan', 'Nonaktif'),
('A002', 'Ahmad Fadil', '2020', 'Sidoarjo', '2002-02-20', '082345678901', 'Laki-laki', 'Aktif'),
('A003', 'Rina Nurhayati', '2022', 'Surabaya', '2004-03-10', '083456789012', 'Perempuan', 'Aktif'),
('A004', 'Muhammad Ali', '2021', 'Surabaya', '2002-11-25', '084567890123', 'Laki-laki', 'Aktif'),
('A005', 'Dewi Lestari', '2022', 'Gersik', '2003-09-05', '085678901234', 'Perempuan', 'Aktif'),
('A006', 'Putra Pratama', '2022', 'Kediri', '2004-01-30', '086789012345', 'Laki-laki', 'Aktif'),
('A007', 'Siti Nurjanah', '2020', 'Malang', '2001-12-10', '087890123456', 'Perempuan', 'Nonaktif'),
('A008', 'Adi Wijaya', '2020', 'Jombang', '2005-08-20', '088901234567', 'Laki-laki', 'Aktif'),
('A009', 'Ruli Wilandra', '2019', 'Mojokerto', '1999-06-18', '089012345678', 'Laki-laki', 'Nonaktif'),
('A010', 'Rika Indah', '2022', 'Batu', '2004-04-12', '089123456789', 'Perempuan', 'Aktif');

-- isi data tabel peminjaman
INSERT INTO peminjaman (KodePeminjaman, IdAnggota, IdPetugas, KodeBuku, TanggalPinjam, TanggalKembaliu) VALUES
('PJ001', 'A001', 'P001', 'B001','2021-04-01', '2021-04-20'),
('PJ002', 'A002', 'P002', 'B002','2021-06-21', '2021-06-25'),
('PJ003', 'A003', 'P003', 'B003','2020-05-03', '2020-05-10'),
('PJ004', 'A004', 'P004', 'B004','2022-10-11', '2022-10-24'),
('PJ005', 'A005', 'P005', 'B005','2019-04-15', '2019-04-23'),
('PJ006', 'A006', 'P006', 'B006','2023-07-06', '2023-07-11'),
('PJ007', 'A007', 'P007', 'B007','2023-10-10', '2023-10-14'),
('PJ008', 'A008', 'P008', 'B008','2024-03-08', '2024-03-15'),
('PJ009', 'A009', 'P009', 'B009','2020-05-29', '2020-06-06'),
('PJ010', 'A010', 'P010', 'B010','2024-03-10', '2024-03-15');

-- isi data tabel pengembalian
INSERT INTO pengembalian (kode_kembali, idAnggota, kode_buku, idPetugas, tgl_pinjam, tgl_kembali, denda) VALUES
('KM001', 'A001', 'B001', 'P001', '2021-04-01', '2021-04-20', '10000'),
('KM002', 'A002', 'B002', 'P002', '2021-06-21', '2021-06-25', '0'),
('KM003', 'A003', 'B003', 'P003', '2020-05-03', '2020-05-10', '0'),
('KM004', 'A004', 'B004', 'P004', '2022-10-11', '2022-10-24', '10000'),
('KM005', 'A005', 'B005', 'P005', '2019-04-15', '2019-04-23', '20000'),
('KM006', 'A006', 'B006', 'P006', '2023-07-06', '2023-07-11', '0'),
('KM007', 'A007', 'B007', 'P007', '2023-10-10', '2023-10-14', '10000'),
('KM008', 'A008', 'B008', 'P008', '2024-03-08', '2024-03-15', '0'),
('KM009', 'A009', 'B009', 'P009', '2020-05-29', '2020-06-11', '20000'),
('KM010', 'A010', 'B010', 'P010', '2024-03-10', '2024-03-15', '0');
