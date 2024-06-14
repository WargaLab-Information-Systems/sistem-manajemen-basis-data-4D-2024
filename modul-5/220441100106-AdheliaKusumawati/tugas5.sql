create database toko_pakaian;
use toko_pakaian;

CREATE TABLE transaksi (
  id_transaksi INT(11) PRIMARY KEY,
  id_produk INT(11),
  id_supplier INT(11),
  id_karyawan INT(11),
  jumlah INT(11),
  total_harga DOUBLE,
  tanggal_transaksi DATETIME,
  FOREIGN KEY (id_produk) REFERENCES produk (id_produk),
  FOREIGN KEY (id_supplier) REFERENCES supplier (id_supplier),
  FOREIGN KEY (id_karyawan) REFERENCES karyawan (id_karyawan)
);

INSERT INTO transaksi (id_transaksi, id_produk, id_supplier, id_karyawan, jumlah, total_harga, tanggal_transaksi) VALUES
(51, 11, 31, 21, 50, 7500000, '2024-05-09 08:00:00'),
(52, 12, 32, 22, 30, 7500000, '2024-04-09 08:15:00'),
(53, 13, 33, 23, 40, 4800000, '2024-04-09 08:30:00'),
(54, 14, 34, 24, 25, 4500000, '2024-04-09 08:45:00'),
(55, 15, 35, 25, 35, 10500000, '2024-05-09 09:00:00'),
(56, 16, 36, 26, 45, 12600000, '2024-03-09 09:15:00'),
(57, 17, 37, 27, 55, 4125000, '2024-03-09 09:30:00'),
(58, 18, 38, 28, 20, 4000000, '2024-02-09 09:45:00'),
(59, 19, 39, 29, 60, 10200000, '2024-02-09 10:00:00'),
(60, 20, 40, 30, 15, 3300000, '2024-01-09 10:15:00');

update transaksi set total_harga=150000 where id_transaksi= 51;
select * from transaksi;

CREATE TABLE produk (
  id_produk INT(11) PRIMARY KEY,
  nama_produk VARCHAR(100),
  kategori VARCHAR(50),
  harga DOUBLE,
  berat FLOAT
);

INSERT INTO produk (id_produk, nama_produk, kategori, harga, berat) VALUES
(11, 'Kemeja Polos', 'Atasan', 150000, 0.3),
(12, 'Celana Jeans', 'Bawahan', 250000, 0.5),
(13, 'Blouse Motif Bunga', 'Atasan', 120000, 0.25),
(14, 'Rok Panjang', 'Bawahan', 180000, 0.4),
(15, 'Jaket Denim', 'Outer', 300000, 0.7),
(16, 'Dress Satin', 'Atasan', 280000, 0.6),
(17, 'Kaos Oblong', 'Atasan', 75000, 0.2),
(18, 'Celana Jogger', 'Bawahan', 200000, 0.35),
(19, 'Cardigan Rajut', 'Outer', 170000, 0.45),
(20, 'Kemeja Flanel', 'Atasan', 220000, 0.5);

CREATE TABLE karyawan (
  id_karyawan INT(11) PRIMARY KEY,
  id_gudang int (11),
  nama VARCHAR(100),
  alamat VARCHAR(255),
  posisi VARCHAR(50),
  gaji double,
  FOREIGN KEY (id_gudang) REFERENCES gudang (id_gudang)
);

INSERT INTO karyawan (id_karyawan, id_gudang, nama, alamat, posisi, gaji) VALUES
(21, 1, 'Anita Susanto', 'Pontianak', 'Manager', 5000000),
(22, 2, 'Budi Santoso', 'Banjarmasin', 'Supervisor', 3500000),
(23, 3, 'Citra Wijaya', 'Samarinda', 'Staff', 2500000),
(24, 4, 'Dewi Sari', 'Palangka Raya', 'Staff', 2500000),
(25, 5, 'Eko Prabowo', 'Balikpapan', 'Supervisor', 3500000),
(26, 6, 'Fani Putri', 'Tarakan', 'Staff', 2500000),
(27, 7, 'Gita Wijaya', 'Sanggau', 'Staff', 2500000),
(28, 8, 'Hadi Nugroho', 'Tanjung', 'Supervisor', 3500000),
(29, 9, 'Indah Kusuma', 'Bontang', 'Staff', 2500000),
(30, 10, 'Joko Susilo', 'Pangkalan Bun', 'Staff', 2500000);

CREATE TABLE stok (
  id_stok INT(11) PRIMARY KEY,
  id_produk INT(11),
  id_gudang INT(11),
  jumlah INT(11),
  tanggal_update DATETIME,
  FOREIGN KEY (id_gudang) REFERENCES gudang (id_gudang),
  FOREIGN KEY (id_produk) REFERENCES produk (id_produk)
);

INSERT INTO stok (id_stok, id_produk, id_gudang, jumlah, tanggal_update) VALUES
(41, 11, 1, 100, '2024-05-10 08:00:00'),
(42, 12, 1, 80, '2024-05-10 08:15:00'),
(43, 13, 2, 120, '2024-05-10 08:30:00'),
(44, 14, 2, 90, '2024-05-10 08:45:00'),
(45, 15, 3, 70, '2024-05-10 09:00:00'),
(46, 16, 3, 110, '2024-05-10 09:15:00'),
(47, 17, 4, 130, '2024-05-10 09:30:00'),
(48, 18, 4, 60, '2024-05-10 09:45:00'),
(49, 19, 5, 150, '2024-05-10 10:00:00'),
(50, 20, 5, 40, '2024-05-10 10:15:00');

CREATE TABLE gudang (
  id_gudang INT(11) PRIMARY KEY,
  nama varchar (100),
  alamat varchar (255)
);

INSERT INTO gudang (id_gudang, nama, alamat) VALUES
(1, 'Gudang A', 'Pontianak'),
(2, 'Gudang B', 'Banjarmasin'),
(3, 'Gudang C', 'Samarinda'),
(4, 'Gudang D', 'Palangka Raya'),
(5, 'Gudang E', 'Balikpapan'),
(6, 'Gudang F', 'Tarakan'),
(7, 'Gudang G', 'Sanggau'),
(8, 'Gudang H', 'Tanjung'),
(9, 'Gudang I', 'Bontang'),
(10, 'Gudang J', 'Pangkalan Bun');

CREATE TABLE supplier (
  id_supplier INT(11) PRIMARY KEY,
  nama_supplier VARCHAR(100),
  alamat VARCHAR(255),
  telepon CHAR(15),
  email VARCHAR(100)
);

INSERT INTO supplier (id_supplier, nama_supplier, alamat, telepon, email) VALUES
(31, 'Budi Santoso', 'Jakarta', '081234567890', 'budi.santoso@example.com'),
(32, 'Siti Rahayu', 'Bandung', '082345678901', 'siti.rahayu@example.com'),
(33, 'Ahmad Hidayat', 'Surabaya', '083456789012', 'ahmad.hidayat@example.com'),
(34, 'Dewi Sari', 'Medan', '084567890123', 'dewi.sari@example.com'),
(35, 'Nurul Fitri', 'Semarang', '085678901234', 'nurul.fitri@example.com'),
(36, 'Agus Setiawan', 'Makassar', '086789012345', 'agus.setiawan@example.com'),
(37, 'Anita Susanti', 'Palembang', '087890123456', 'anita.susanti@example.com'),
(38, 'Fajar Pratama', 'Bandar Lampung', '088901234567', 'fajar.pratama@example.com'),
(39, 'Rina Amelia', 'Bekasi', '089012345678', 'rina.amelia@example.com'),
(40, 'Hendri Wijaya', 'Yogyakarta', '089123456789', 'hendri.wijaya@example.com');

-- Buatlah Stored Procedure untuk menghitung total harga dari semua transaksi yang dilakukan oleh seorang karyawan tertentu. Procedure harus menerapkan parameter IN dan parameter OUT.
DELIMITER //
CREATE PROCEDURE hitung_total_harga(
	IN karyawan_id INT (11),
	OUT TotalTransaksi INT (10))
    BEGIN
		SELECT SUM(total_harga) INTO TotalTransaksi FROM transaksi
        where id_karyawan = karyawan_id;
	END //
DELIMITER ;
    
CALL hitung_total_harga(22, @TotalTransaksi);
SELECT @TotalTransaksi;

drop procedure hitung_total_harga;

-- Buatkanlah procedure untuk mengetahui berapa lama(hari) setiap produk berada digudang sejak tanggal masuk produk.
DELIMITER //
CREATE PROCEDURE lama_produk_di_gudang()
BEGIN
    SELECT produk.nama_produk, gudang.nama, DATEDIFF(CURDATE(), stok.tanggal_update) AS lama_di_gudang
    FROM produk
    JOIN stok ON produk .id_produk = stok.id_produk
    JOIN gudang ON stok.id_gudang = gudang.id_gudang;
END //
DELIMITER ;
CALL lama_produk_di_gudang();

-- Buatkan procedure untuk menghapus transaksi pada 1 bulan terakhir, tetapi jika total harga nya lebih dari 200 ribu maka tidak dapat di hapus.
DELIMITER //
CREATE PROCEDURE HapusTransaksiTerakhir()
BEGIN
    DELETE FROM transaksi
    WHERE tanggal_transaksi BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE()
    AND total_harga <= 200000;
END //
DELIMITER ;
call HapusTransaksiTerakhir();
select * from transaksi;
DROP PROCEDURE HapusTransaksiTerakhir;
DELIMITER ;






