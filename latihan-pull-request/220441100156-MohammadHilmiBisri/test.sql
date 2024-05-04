-- Tabel Siswa
CREATE TABLE Siswa (
    id INT PRIMARY KEY,
    nama VARCHAR(50),
    alamat VARCHAR(100),
    tanggal_lahir DATE,
    jenis_kelamin ENUM('Laki-laki', 'Perempuan'),
    kelas_id INT,
    FOREIGN KEY (kelas_id) REFERENCES Kelas(id)
);

-- Tabel Kelas
CREATE TABLE Kelas (
    id INT PRIMARY KEY,
    nama VARCHAR(20),
    tingkat ENUM('X', 'XI', 'XII')
);

-- Tabel Guru
CREATE TABLE Guru (
    id INT PRIMARY KEY,
    nama VARCHAR(50),
    alamat VARCHAR(100),
    tanggal_lahir DATE,
    jenis_kelamin ENUM('Laki-laki', 'Perempuan'),
    mata_pelajaran_id INT,
    FOREIGN KEY (mata_pelajaran_id) REFERENCES MataPelajaran(id)
);

-- Tabel Mata Pelajaran
CREATE TABLE MataPelajaran (
    id INT PRIMARY KEY,
    nama VARCHAR(50),
    kelas_id INT,
    FOREIGN KEY (kelas_id) REFERENCES Kelas(id)
);

-- Tabel Nilai
CREATE TABLE Nilai (
    id INT PRIMARY KEY,
    siswa_id INT,
    mata_pelajaran_id INT,
    nilai INT,
    FOREIGN KEY (siswa_id) REFERENCES Siswa(id),
    FOREIGN KEY (mata_pelajaran_id) REFERENCES MataPelajaran(id)
);

-- Tabel Absensi
CREATE TABLE Absensi (
    id INT PRIMARY KEY,
    siswa_id INT,
    tanggal DATE,
    FOREIGN KEY (siswa_id) REFERENCES Siswa(id)
);

-- Tabel Jadwal Pelajaran
CREATE TABLE JadwalPelajaran (
    id INT PRIMARY KEY,
    hari ENUM('Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat'),
    jam_mulai TIME,
    jam_selesai TIME,
    mata_pelajaran_id INT,
    kelas_id INT,
    FOREIGN KEY (mata_pelajaran_id) REFERENCES MataPelajaran(id),
    FOREIGN KEY (kelas_id) REFERENCES Kelas(id)
);

-- Tabel Ekstrakurikuler
CREATE TABLE Ekstrakurikuler (
    id INT PRIMARY KEY,
    nama VARCHAR(50),
    kelas_id INT,
    FOREIGN KEY (kelas_id) REFERENCES Kelas(id)
);

-- Tabel Prestasi
CREATE TABLE Prestasi (
    id INT PRIMARY KEY,
    siswa_id INT,
    jenis_prestasi VARCHAR(50),
    FOREIGN KEY (siswa_id) REFERENCES Siswa(id)
);

-- Tabel Pembayaran
CREATE TABLE Pembayaran (
    id INT PRIMARY KEY,
    siswa_id INT,
    tanggal DATE,
    jumlah DECIMAL(10, 2),
    FOREIGN KEY (siswa_id) REFERENCES Siswa(id)
);
--M syahrul abidin