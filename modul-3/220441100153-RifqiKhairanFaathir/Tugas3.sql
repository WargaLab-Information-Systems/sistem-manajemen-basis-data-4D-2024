-- Membuat database library
CREATE DATABASE library;
USE library;

-- Membuat tabel anggota
CREATE TABLE anggota (
  IdAnggota varchar(10) PRIMARY KEY,
  NamaAnggota varchar(20) NOT NULL,
  AngkatanAnggota varchar(6) NOT NULL,
  TempatLahirAnggota varchar(20) NOT NULL,
  NoTelp int(12) NOT NULL,
  TanggalLahirAnggota date NOT NULL,
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
  TanggalKembali date,
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

