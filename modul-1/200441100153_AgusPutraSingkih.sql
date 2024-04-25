CREATE TABLE pendaftaran_mata_kuliah (
id INT AUTO_INCREMENT PRIMARY KEY,
id_mahasiswa INT,
id_mata_kuliah INT,
tahun_ajaran VARCHAR (20), 
FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id),
FOREIGN KEY (id_mata_kuliah) REFERENCES mata_kuliah(id)
);

ALTER TABLE pendaftaran_mata_kuliah DROP tahun_ajaran

INSERT INTO pendaftaran_mata_kuliah (id_mahasiswa, id_mata_kuliah)VALUES
(1, 3),
(2, 3),
(3, 5);

`pembayaran_ukt`

SELECT *
FROM mahasiswa
WHERE STATUS IN ('Lulus', 'Berhenti');

CREATE TABLE pembayaran_ukt(
id INT AUTO_INCREMENT PRIMARY KEY,
id_mahasiswa INT,
jumlah DECIMAL(10,2),
tanggal DATE,
FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id));

INSERT INTO pembayaran_ukt (id_mahasiswa, jumlah, tanggal)VALUES
('1', 5000000, 2024-03-30);


CREATE TABLE pembelian_peralatan(
id INT AUTO_INCREMENT PRIMARY KEY,
deskripsi VARCHAR(255),
jumlah DECIMAL(10, 2),
tanggal DATE);

CREATE TABLE pembayaran_gaji_dosen (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_dosen INT,
    jumlah DECIMAL(10, 2),
    tanggal DATE,
    FOREIGN KEY (id_dosen) REFERENCES dosen(id)
);

INSERT INTO pembayaran_gaji_dosen (id_dosen, jumlah, tanggal)
VALUES (1, 10000000, '2024-03-30');

INSERT INTO pembayaran_ukt (id_mahasiswa, jumlah, tanggal)
VALUES (1, 5000000, '2024-03-30');

INSERT INTO pembayaran_gaji_dosen (id_dosen, jumlah, tanggal)
VALUES (1, 10000000, '2024-03-30');

INSERT INTO pembelian_peralatan (deskripsi, jumlah, tanggal)
VALUES ('Laptop baru', 15000000, '2024-03-30');

INSERT INTO pembayaran_tagihan (deskripsi, jumlah, tanggal)
VALUES ('Tagihan listrik bulan Februari', 2000000, '2024-03-30');


CREATE TABLE pembelian_peralatan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    deskripsi VARCHAR(255),
    jumlah DECIMAL(10, 2),
    tanggal DATE
);

INSERT INTO pembayaran_tagihan (deskripsi, jumlah, tanggal)
VALUES ('Tagihan listrik bulan Februari', 2000000, '2024-03-30');

CREATE TABLE pembayaran_tagihan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    deskripsi VARCHAR(255),
    jumlah DECIMAL(10, 2),
    tanggal DATE
);

CREATE TABLE laporan_jumlah_mahasiswa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    jumlah_mahasiswa INT,
    tanggal DATE
);

INSERT INTO laporan_jumlah_mahasiswa (jumlah_mahasiswa, tanggal)
SELECT COUNT(*), CURDATE()
FROM mahasiswa;

CREATE TABLE laporan_jumlah_dosen (
id INT AUTO_INCREMENT PRIMARY KEY,
jumlah_dosen INT,
tanggal DATE
);

INSERT INTO laporan_jumlah_dosen(
jumlah_dosen, tanggal)
SELECT COUNT(*),CURDATE()
FROM dosen;


ALTER TABLE laporan_pengeluaran
ADD COLUMN pembelian_peralatan_id INT,
ADD CONSTRAINT fk_pembelian_peralatan
    FOREIGN KEY (pembelian_peralatan_id) 
    REFERENCES pembelian_peralatan(id);
    
    SELECT laporan_pengeluaran.*, pembelian_peralatan.deskripsi AS deskripsi_pembelian
FROM laporan_pengeluaran
JOIN pembelian_peralatan ON laporan_pengeluaran.pembelian_peralatan_id = pembelian_peralatan.id;

ALTER TABLE laporan_jumlah_mahasiswa
ADD COLUMN jurusan VARCHAR(100);

INSERT INTO laporan_jumlah_mahasiswa (jumlah_mahasiswa, tanggal, jurusan)
SELECT COUNT(*), CURDATE(), jurusan FROM mahasiswa
GROUP BY jurusan;

ALTER TABLE laporan_jumlah_mahasiswa
ADD COLUMN dosen_id INT(11) NOT NULL,
ADD CONSTRAINT fk_dosen_id FOREIGN KEY (dosen_id) REFERENCES dosen(id);

ALTER TABLE laporan_jumlah_dosen
ADD COLUMN dosen_id INT(11) NOT NULL,
ADD CONSTRAINT fk_dosen_id FOREIGN KEY (dosen_id) REFERENCES dosen(id);


