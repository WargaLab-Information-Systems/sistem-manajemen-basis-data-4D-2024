CREATE DATABASE modul5;
USE modul5;
DROP DATABASE modul5;

CREATE TABLE produk(
id_produk INT(11) PRIMARY KEY,
nama_produk VARCHAR(100),
kategori VARCHAR(50),
harga DOUBLE,
berat FLOAT);

INSERT INTO produk(id_produk, nama_produk, kategori, harga, berat)
VALUES
(1, 'Topi Adidas', 'Aksesori Olahraga', 50000, 0.1),
(2, 'Kacamata Anak', 'Aksesori Mode', 80000, 0.15),
(3, 'Puma Running Shoes', 'Sepatu Olahraga', 300000, 0.6),
(4, 'Tas Gucci', 'Tas Mode', 250000, 0.7),
(5, 'Dompet Elegan', 'Aksesori Mode', 150000, 0.2),
(6, 'Jam Tangan Digital', 'Aksesori Elektronik', 120000, 0.3),
(7, 'Scarf Sutra', 'Aksesori Musim Dingin', 70000, 0.25),
(8, 'Celana Pendek Denim', 'Celana Kasual', 150000, 0.4),
(9, 'Kaos Distro', 'Kaos Mode', 100000, 0.3),
(10, 'Jas Formal Pria', 'Jas Resmi', 500000, 1.2);

CREATE TABLE gudang(
id_gudang INT(11) PRIMARY KEY,
nama VARCHAR(100),
alamat VARCHAR(255)
);

INSERT INTO gudang (id_gudang, nama, alamat) 
VALUES
(1, 'Gudang Mega Jaya', 'Jl. Pahlawan No. 123'),
(2, 'Gudang Sejahtera', 'Jl. Raya Indah No. 456'),
(3, 'Gudang Abadi', 'Jl. Merdeka No. 789'),
(4, 'Gudang Mutiara', 'Jl. Budi Luhur No. 321'),
(5, 'Gudang Bahagia', 'Jl. Damai No. 654'),
(6, 'Gudang Sentosa', 'Jl. Sinar Jaya No. 987'),
(7, 'Gudang Harmoni', 'Jl. Sukses No. 135'),
(8, 'Gudang Sejahtera', 'Jl. Makmur No. 246'),
(9, 'Gudang Indah', 'Jl. Bahagia No. 579'),
(10, 'Gudang Berseri', 'Jl. Ceria No. 802');

CREATE TABLE supplier(
id_supplier INT(11) PRIMARY KEY,
nama_supplier VARCHAR(100),
alamat VARCHAR(255),
telepon CHAR(15),
email VARCHAR(100)
);

INSERT INTO supplier (id_supplier, nama_supplier, alamat, telepon, email) 
VALUES
(1, 'PT Abadi Jaya Sentosa', 'Jl. Pahlawan No. 100', '081234567890', 'abadisentosa@abadi.com'),
(2, 'CV Mandiri Bahagia', 'Jl. Surya Makmur No. 22', '085678901234', 'mandiribahagia@cvmb.co.id'),
(3, 'UD Mutiara Indah', 'Jl. Merdeka Barat No. 33', '082345678901', 'mutiaraindah.ud@gmail.com'),
(4, 'PT Sejahtera Makmur', 'Jl. Budi Sejahtera No. 44', '081234567890', 'sejahteramakmur@outlook.com'),
(5, 'CV Sentosa Jaya', 'Jl. Damai Makmur No. 55', '085678901234', 'sentosajaya@yahoo.com'),
(6, 'PT Berkah Bersaudara', 'Jl. Ciliwung No. 60', '082345678901', 'berkahbersaudara@outlook.com'),
(7, 'CV Mode Sentra Utama', 'Jl. Taman Indah No. 70', '081234567890', 'modesentrautama.cv@gmail.com'),
(8, 'PT Sentosa Mandiri', 'Jl. Teuku Umar No. 80', '085678901234', 'sentosamandiri@outlook.com'),
(9, 'UD Makmur Jaya', 'Jl. Bahagia Baru No. 90', '082345678901', 'makmurjaya.ud@yahoo.com'),
(10, 'CV Wijaya Sentosa', 'Jl. Surapati No. 100', '081234567890', 'wijayasentosa.cv@gmail.com');

CREATE TABLE stok(
id_stok INT(11) PRIMARY KEY,
id_produk INT(11),
id_gudang INT(11),
jumlah INT(11),
tanggal_update DATETIME,
FOREIGN KEY(id_produk) REFERENCES produk(id_produk),
FOREIGN KEY(id_gudang) REFERENCES gudang(id_gudang)
);

INSERT INTO stok (id_stok, id_produk, id_gudang, jumlah, tanggal_update) 
VALUES
(1, 1, 1, 250, '2024-06-10 08:00:00'),
(2, 2, 2, 200, '2024-03-15 09:30:00'),
(3, 3, 3, 150, '2024-02-10 10:45:00'),
(4, 4, 4, 120, '2023-08-05 12:00:00'),
(5, 5, 5, 400, '2023-09-05 13:20:00'),
(6, 6, 6, 70, '2023-10-05 14:40:00'),
(7, 7, 7, 150, '2024-05-10 16:00:00'),
(8, 8, 8, 110, '2024-05-20 17:15:00'),
(9, 9, 9, 180, '2024-05-21 18:30:00'),
(10, 10, 10, 220, '2024-05-22 19:45:00');



CREATE TABLE karyawan(
id_karyawan INT(11) PRIMARY KEY,
id_gudang INT(11),
nama VARCHAR(100),
alamat VARCHAR(255),
posisi VARCHAR(50),
gaji DOUBLE,
FOREIGN KEY(id_gudang) REFERENCES gudang(id_gudang)
);

INSERT INTO karyawan (id_karyawan, id_gudang, nama, alamat, posisi, gaji) VALUES
(1, 1, 'Oxa Indi', 'Jl. Jeruk Purut No. 10', 'Manajer', 12000000),
(2, 2, 'Naela Nahdiah', 'Jl. Melati No. 20', 'Supervisor', 9000000),
(3, 3, 'Bintang Ariyono', 'Jl. Dahlia No. 30', 'Staff', 6000000),
(4, 4, 'Tesa Hutagaol', 'Jl. Anggrek No. 40', 'Staff', 6000000),
(5, 5, 'Irfan Paruk', 'Jl. Mawar No. 50', 'Supervisor', 9000000),
(6, 6, 'Imam Arisandi', 'Jl. Kenanga No. 60', 'Staff', 6000000),
(7, 7, 'Angga Jalasena', 'Jl. Flamboyan No. 70', 'Manajer', 12000000),
(8, 8, 'Dita', 'Jl. Kamboja No.11', 'Manajer', 12000000),
(9, 9, 'Sulthon King Judi', 'Jl. Bougenville No. 80', 'Staff', 6000000),
(10, 10, 'Izud Arafat', 'Jl. Rafflesia No. 90', 'Supervisor', 9000000);


CREATE TABLE transaksi(
id_transaksi INT(11) PRIMARY KEY,
id_produk INT(11),
id_supplier INT(11),
id_karyawan INT(11),
jumlah INT(11),
total_harga DOUBLE,
tanggal_transaksi DATETIME,
FOREIGN KEY(id_produk) REFERENCES produk(id_produk),
FOREIGN KEY(id_supplier) REFERENCES supplier(id_supplier),
FOREIGN KEY(id_karyawan) REFERENCES karyawan(id_karyawan)
);

INSERT INTO transaksi (id_transaksi, id_produk, id_supplier, id_karyawan, jumlah, total_harga, tanggal_transaksi)
VALUES
(1, 1, 1, 1, 70, 105000, '2024-06-15 08:30:00'),
(2, 2, 2, 2, 40, 45000, '2024-05-10 09:45:00'),
(3, 3, 3, 3, 25, 5000000, '2024-03-06 11:00:00'),
(4, 4, 4, 4, 20, 5000000, '2024-02-27 12:30:00'),
(5, 5, 5, 4, 120, 9600000, '2024-02-28 14:00:00'),
(6, 6, 6, 6, 15, 4500000, '2023-07-20 15:15:00'),
(7, 7, 7, 7, 50, 6000000, '2023-10-29 16:45:00'),
(8, 8, 8, 8, 30, 2700000, '2022-09-20 18:00:00'),
(9, 9, 9, 9, 45, 12600000, '2024-05-20 19:30:00'),
(10, 10, 10, 10, 60, 21000000, '2023-10-25 21:45:00');


-- 1 --
DELIMITER //
CREATE PROCEDURE total_transaksi(
IN karyawan INT(11),
OUT harga_transaksi BIGINT(30)
)
BEGIN
SELECT SUM(total_harga) INTO harga_transaksi
FROM transaksi
WHERE karyawan=id_karyawan;
END //
DELIMITER ;

CALL total_transaksi(4,@harga_transaksi);
SELECT @harga_transaksi AS total_transaksi_satu_karyawan;


-- 2 --
DELIMITER //
CREATE PROCEDURE lama_produk()
BEGIN
    SELECT CONCAT('Produk ', id_produk, ' berada di gudang selama ', DATEDIFF(NOW(), tanggal_update), ' hari.') 
    AS lama_produk_digudang
    FROM stok;
END //
DELIMITER ;

CALL lama_produk();

-- 3 --
DELIMITER //
CREATE PROCEDURE hapus_transaksi()
BEGIN
    DELETE FROM transaksi
    WHERE tanggal_transaksi >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    AND total_harga <= 200000;
END //
DELIMITER ;

drop PROCEDURE hapus_transaksi;
CALL hapus_transaksi;
SELECT * FROM transaksi;