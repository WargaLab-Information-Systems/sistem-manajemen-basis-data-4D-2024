USE modul5;

ALTER TABLE transaksi
ADD CONSTRAINT FOREIGN KEY (id_produk) REFERENCES produk (id_produk);
ALTER TABLE transaksi
ADD CONSTRAINT FOREIGN KEY (id_supplier) REFERENCES supplier (id_supplier);

ALTER TABLE transaksi
ADD CONSTRAINT FOREIGN KEY (id_karyawan) REFERENCES karyawan (id_karyawan);
ALTER TABLE stok
ADD CONSTRAINT FOREIGN KEY (id_gudang) REFERENCES gudang(id_gudang);
INSERT INTO `modul5`.`gudang` (`nama`, `alamat`) VALUES
('Gudang A', 'Jl. Sudirman No. 123'),
('Gudang B', 'Jl. Gatot Subroto No. 456'),
('Gudang C', 'Jl. Diponegoro No. 789'),
('Gudang D', 'Jl. Pahlawan No. 101'),
('Gudang E', 'Jl. Ahmad Yani No. 202'),
('Gudang F', 'Jl. Majapahit No. 303'),
('Gudang G', 'Jl. Pemuda No. 404'),
('Gudang H', 'Jl. Merdeka No. 505'),
('Gudang I', 'Jl. Asia Afrika No. 606'),
('Gudang J', 'Jl. Hayam Wuruk No. 707');

INSERT INTO `karyawan` (`nama`, `alamat`, `posisi`, `gaji`) VALUES
('John Doe', 'Jl. Merdeka No. 123', 'Manager', 10000000),
('Jane Smith', 'Jl. Jenderal Sudirman No. 456', 'Staff', 7000000),
('Michael Johnson', 'Jl. Thamrin No. 789', 'Staff', 7000000),
('Emily Davis', 'Jl. Gatot Subroto No. 321', 'Assistant', 5000000),
('David Wilson', 'Jl. HR Rasuna Said No. 543', 'Assistant', 5000000),
('Jessica Brown', 'Jl. Diponegoro No. 876', 'Manager', 10000000),
('Christopher Lee', 'Jl. Imam Bonjol No. 234', 'Staff', 7000000),
('Amanda Martinez', 'Jl. MH Thamrin No. 567', 'Manager', 10000000),
('Ryan Taylor', 'Jl. K.H. Mas Mansyur No. 890', 'Staff', 7000000),
('Laura Garcia', 'Jl. S. Parman No. 135', 'Staff', 7000000);

INSERT INTO produk (nama_produk, kategori, harga, berat) VALUES
('Sepatu Nike Air Max', 'Sepatu', 1500000, 0.8),
('Laptop ASUS VivoBook', 'Elektronik', 8000000, 1.5),
('Kemeja Slim Fit', 'Pakaian', 300000, 0.3),
('Kamera Canon EOS', 'Elektronik', 6000000, 0.9),
('Celana Jeans Denim', 'Pakaian', 250000, 0.6),
('Smartphone Samsung Galaxy', 'Elektronik', 4000000, 0.5),
('Jam Tangan Casio G-Shock', 'Aksesoris', 1000000, 0.2),
('Tas Ransel Backpack', 'Aksesoris', 500000, 0.7),
('Kaos Polo Shirt', 'Pakaian', 150000, 0.4),
('Speaker Bluetooth JBL', 'Elektronik', 1200000, 0.8);

INSERT INTO `modul5`.`stok` (`jumlah`, `tanggal_update`) VALUES
(100, '2024-05-13'),
(150, '2024-05-12'),
(200, '2024-05-11'),
(120, '2024-05-10'),
(180, '2024-05-09');


INSERT INTO `supplier` (`nama_supplier`, `alamat`, `telepon`, `email`) 
VALUES 
('Budi Setiawan', 'Jalan Raya No. 123', '081234567890', 'supplierA@example.com'),
('Siti Rahayu', 'Jalan Mangga No. 456', '085678901234', 'supplierB@example.com'),
('Ahmad Hidayat', 'Jalan Anggrek No. 789', '081234567891', 'supplierC@example.com'),
('Dewi Sartika', 'Jalan Melati No. 1011', '081234567892', 'supplierD@example.com'),
('Hendra Pratama', 'Jalan Mawar No. 1213', '081234567893', 'supplierE@example.com');


INSERT INTO transaksi (jumlah, tanggal_transaksi) VALUES
('2', 2024-10-5);

INSERT INTO transaksi (jumlah, tanggal_transaksi) VALUES
('2', 2024-10-5),
('2', 2024-10-5)



UPDATE `transaksi` t
JOIN `produk` p ON t.id_produk = p.id_produk
SET t.total_harga = p.harga * t.jumlah;

ALTER TABLE transaksi
ADD CONSTRAINT FOREIGN KEY (id_atasan) REFERENCES atasan (id_atasan);



SELECT karyawan.nama AS nama_karyawan, atasan.nama AS nama_atasan
FROM karyawan AS atasan
RIGHT JOIN karyawan AS karyawan ON atasan.id_karyawan = karyawan.id_atasan;


-- INNER JOIN
DELIMITER //

CREATE PROCEDURE GetMahasiswaNilai()
BEGIN
    SELECT m.nama AS nama_mahasiswa, n.nilai
    FROM mahasiswa m
    INNER JOIN nilai n ON m.id_mahasiswa = n.id_mahasiswa;
END//

DELIMITER ;

CALL GetMahasiswaNilai

-- LEFT JOIN

DELIMITER //

CREATE PROCEDURE GetMahasiswaNilaiMataKuliah()
BEGIN
    SELECT m.nama AS nama_mahasiswa, mk.nama_mata_kuliah, n.nilai
    FROM mahasiswa m
    INNER JOIN nilai n ON m.id_mahasiswa = n.id_mahasiswa
    LEFT JOIN mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah;
END//

DELIMITER ;

CALL GetMahasiswaNilaiMataKuliah


-- RATA RATA
DELIMITER //

CREATE PROCEDURE GetRataRataKeseluruhan()
BEGIN
    SELECT AVG(CAST(nilai AS DECIMAL(5,2))) AS rata_rata_keseluruhan
    FROM nilai;
END//

DELIMITER ;

CALL GetRataRataKeseluruhan


DELIMITER //

CREATE PROCEDURE soal2()
BEGIN
    SELECT
        m.nama AS nama_mahasiswa,
        m.id_mahasiswa,
        mk.semester,
        AVG(nilai.nilai) AS rata_rata_nilai
    FROM
        nilai
    INNER JOIN
        mahasiswa m ON nilai.id_mahasiswa = m.id_mahasiswa
    INNER JOIN
        mata_kuliah mk ON nilai.id_matakuliah = mk.id_matakuliah
    GROUP BY
        m.nama, mk.semester;
END //

DELIMITER ;
CALL soal2();