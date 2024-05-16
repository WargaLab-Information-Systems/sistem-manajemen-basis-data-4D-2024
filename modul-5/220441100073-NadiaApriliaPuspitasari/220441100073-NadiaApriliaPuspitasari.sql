create database logistik_pakaian;
use logistik_pakaian;

create table supplier(
id_supplier int(11) primary key,
nama_supplier varchar(100),
alamat varchar(255),
telepon char(15),
email varchar(100));

create table produk(
id_produk int(11) primary key,
nama_produk varchar(100),
kategori varchar(50),
harga double,
berat float);

create table gudang(
id_gudang int(11) primary key,
nama varchar(100),
alamat varchar(255));

create table stok(
id_stok int(11) primary key,
id_produk int(11),
id_gudang int(11),
jumlah int(11),
tanggal_update datetime,
FOREIGN KEY (id_produk) REFERENCES produk(id_produk),
FOREIGN KEY (id_gudang) REFERENCES gudang(id_gudang)
);

create table karyawan(
id_karyawan int(11) primary key,
id_gudang int(11),
nama varchar(100),
alamat varchar(255),
posisi varchar(255),
gaji double,
FOREIGN KEY (id_gudang) REFERENCES gudang(id_gudang)
);

create table transaksi(
id_transaksi int(11) primary key,
id_produk int(11),
id_supplier int(11),
id_karyawan int(11),
jumlah int(11),
total_harga double,
tanggal_transaksi datetime,
FOREIGN KEY (id_produk) REFERENCES produk(id_produk),
FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier),
FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan));

-- Memasukkan data ke tabel supplier
INSERT INTO supplier (id_supplier, nama_supplier, alamat, telepon, email) VALUES
(1, 'PT. ABC Elektronik', 'Jl. Gatot Subroto No. 123, Jakarta', '021-12345678', 'info@abcelektronik.com'),
(2, 'CV. Dewi Fashion', 'Jl. Pangeran Antasari No. 456, Bandung', '022-87654321', 'contact@dewifashion.com'),
(3, 'UD. Cahaya Stationery', 'Jl. Diponegoro No. 789, Surabaya', '031-45678912', 'hello@cahayastationery.co.id'),
(4, 'PT. Berkah Cosmetic', 'Jl. Asia Afrika No. 101, Bandung', '022-98765432', 'cs@berkahcosmetic.com'),
(5, 'CV. Makmur Food', 'Jl. Sudirman No. 555, Surabaya', '031-23456789', 'info@makmurfood.co.id'),
(6, 'PT. Maju Electronics', 'Jl. Thamrin No. 999, Jakarta', '021-54321678', 'cs@majuelectronics.com'),
(7, 'CV. Sentosa Home', 'Jl. Kebon Sirih No. 111, Bandung', '022-98712345', 'contact@sentosahome.com'),
(8, 'UD. Sejahtera Sports', 'Jl. Merdeka No. 222, Surabaya', '031-65478901', 'hello@sejahterasports.co.id'),
(9, 'PT. Jaya Toys', 'Jl. Asia Afrika No. 333, Jakarta', '021-78901234', 'info@jayatoys.com'),
(10, 'CV. Bahagia Bookstore', 'Jl. Gatot Subroto No. 444, Bandung', '022-32109876', 'contact@bahagiabookstore.co.id');

-- Memasukkan data ke tabel produk
INSERT INTO produk (id_produk, nama_produk, kategori, harga, berat) VALUES
(1, 'Laptop ASUS', 'Elektronik', 8000000, 2.5),
(2, 'Dress Floral Dewi', 'Pakaian', 250000, 0.8),
(3, 'Pensil 2B', 'Alat Tulis', 5000, 0.2),
(4, 'Lipstik Matte', 'Kosmetik', 150000, 0.5),
(5, 'Kerupuk Udang', 'Makanan', 5000, 0.3),
(6, 'Smartphone Samsung', 'Elektronik', 10000000, 3.0),
(7, 'Rice Cooker Panasonic', 'Peralatan Rumah Tangga', 500000, 1.5),
(8, 'Sepatu Lari Nike', 'Alat Olahraga', 800000, 1.0),
(9, 'Action Figure Iron Man', 'Mainan', 2000000, 0.7),
(10, 'Novel Best Seller', 'Buku', 100000, 0.4);

-- Memasukkan data ke tabel gudang
INSERT INTO gudang (id_gudang, nama, alamat) VALUES
(1, 'Gudang Sentral Elektronik', 'Jl. Gatot Subroto No. 123, Jakarta'),
(2, 'Gudang Distribusi Pakaian', 'Jl. Pangeran Antasari No. 456, Bandung'),
(3, 'Gudang Logistik Stationery', 'Jl. Diponegoro No. 789, Surabaya'),
(4, 'Gudang Utama Kosmetik', 'Jl. Asia Afrika No. 101, Bandung'),
(5, 'Gudang Cadangan Makanan', 'Jl. Sudirman No. 555, Surabaya'),
(6, 'Gudang Cabang Elektronik', 'Jl. Thamrin No. 999, Jakarta'),
(7, 'Gudang Cabang Peralatan Rumah Tangga', 'Jl. Kebon Sirih No. 111, Bandung'),
(8, 'Gudang Pusat Alat Olahraga', 'Jl. Merdeka No. 222, Surabaya'),
(9, 'Gudang Sentral Mainan', 'Jl. Asia Afrika No. 333, Jakarta'),
(10, 'Gudang Distribusi Buku', 'Jl. Gatot Subroto No. 444, Bandung');

-- Memasukkan data ke tabel stok
INSERT INTO stok (id_stok, id_produk, id_gudang, jumlah, tanggal_update) VALUES
(1, 1, 1, 100, '2023-08-13 09:00:00'),
(2, 2, 2, 200, '2024-04-10 09:00:00'),
(3, 3, 3, 150, '2023-12-13 09:00:00'),
(4, 4, 4, 120, '2024-01-19 09:00:00'),
(5, 5, 5, 300, '2023-02-03 09:00:00'),
(6, 6, 6, 80, '2024-03-16 09:00:00'),
(7, 7, 7, 50, '2024-01-27 09:00:00'),
(8, 8, 8, 180, '2023-12-04 09:00:00'),
(9, 9, 9, 90, '2023-12-12 09:00:00'),
(10, 10, 10, 110, '2024-04-01 09:00:00');

-- Memasukkan data ke tabel karyawan
INSERT INTO karyawan (id_karyawan, id_gudang, nama, alamat, posisi, gaji) VALUES
(1, 1, 'Andi Saputra', 'Jl. Gatot Subroto No. 123, Jakarta', 'Staff', 5000000),
(2, 2, 'Budi Pratama', 'Jl. Pangeran Antasari No. 456, Bandung', 'Supervisor', 7500000),
(3, 3, 'Citra Lestari', 'Jl. Diponegoro No. 789, Surabaya', 'Manager', 10000000),
(4, 4, 'Dewi Wulandari', 'Jl. Asia Afrika No. 101, Bandung', 'Staff', 5000000),
(5, 5, 'Eko Santoso', 'Jl. Sudirman No. 555, Surabaya', 'Supervisor', 7500000),
(6, 6, 'Fani Indah', 'Jl. Thamrin No. 999, Jakarta', 'Manager', 10000000),
(7, 7, 'Galih Rizki', 'Jl. Kebon Sirih No. 111, Bandung', 'Staff', 5000000),
(8, 8, 'Hani Fitri', 'Jl. Merdeka No. 222, Surabaya', 'Supervisor', 7500000),
(9, 9, 'Ivan Permana', 'Jl. Asia Afrika No. 333, Jakarta', 'Manager', 10000000),
(10, 10, 'Joko Surya', 'Jl. Gatot Subroto No. 444, Bandung', 'Staff', 5000000);

-- Memasukkan data ke tabel transaksi
INSERT INTO transaksi (id_transaksi, id_produk, id_supplier, id_karyawan, jumlah, total_harga, tanggal_transaksi) VALUES
(1, 1, 1, 1, 10, 50000000, '2024-05-13 10:00:00'),
(2, 2, 2, 2, 20, 4000000, '2024-05-13 10:30:00'),
(3, 3, 3, 3, 15, 750000, '2024-05-13 11:00:00'),
(4, 4, 4, 4, 12, 1200000, '2024-05-13 11:30:00'),
(5, 5, 5, 5, 30, 750000, '2024-05-13 12:00:00'),
(6, 6, 6, 6, 8, 6000000, '2024-05-13 12:30:00'),
(7, 7, 7, 7, 5, 7500000, '2024-05-13 13:00:00'),
(8, 8, 8, 8, 18, 5400000, '2024-05-13 13:30:00'),
(9, 9, 9, 9, 9, 900000, '2024-05-13 14:00:00'),
(10, 10, 10, 10, 11, 825000, '2024-05-13 14:30:00');


-- 1. Buatlah Stored Procedure untuk menghitung total harga dari semua transaksi yang
-- dilakukan oleh seorang karyawan tertentu. Procedure harus menerapkan parameter IN
-- dan parameter OUT.
DELIMITER //
CREATE PROCEDURE totalharga(
    IN input_karyawan_id INT,
    OUT totalharga DOUBLE
)
BEGIN
    SELECT SUM(total_harga) INTO totalharga
    FROM transaksi
    WHERE id_karyawan = input_karyawan_id;
END//
DELIMITER ;
CALL totalharga(3, @totalharga);
SELECT @totalharga;

-- 2. Buatkanlah procedure untuk mengetahui berapa lama(hari) setiap produk berada
-- digudang sejak tanggal masuk produk.
DELIMITER //
CREATE PROCEDURE Lama_Produk()
BEGIN
    SELECT p.nama_produk, g.nama, DATEDIFF(CURDATE(), s.tanggal_update) AS lama_di_gudang
    FROM produk p
    JOIN stok s ON p.id_produk = s.id_produk
    JOIN gudang g ON s.id_gudang = g.id_gudang;
END //
DELIMITER ;
CALL Lama_Produk();

-- 3. Buatkan procedure untuk menghapus transaksi pada 1 bulan terakhir, tetapi jika total harga nya lebih dari 200 ribu maka tidak dapat di hapus.
DELIMITER //
CREATE PROCEDURE hapus_transaksi()
BEGIN
    DELETE FROM transaksi
    WHERE tanggal_transaksi >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    AND total_harga <= 200000;
END //
DELIMITER ;
CALL hapus_transaksi();
SELECT * FROM transaksi;

drop database logistik_pakaian;