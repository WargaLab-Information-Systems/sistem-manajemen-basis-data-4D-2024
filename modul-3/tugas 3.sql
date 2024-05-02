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
