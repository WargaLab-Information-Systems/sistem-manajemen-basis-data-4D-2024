CREATE DATABASE IF NOT EXISTS logistik_pakaian;
USE logistik_pakaian;
CREATE TABLE IF NOT EXISTS supplier (
    id_supplier INT(11) PRIMARY KEY,
    nama_supplier VARCHAR(100),
    alamat VARCHAR(255),
    telepon VARCHAR(15),
    email VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS gudang (
    id_gudang INT(11) PRIMARY KEY,
    nama_gudang VARCHAR(100),
    alamat VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS produk (
    id_produk INT(11) PRIMARY KEY,
    nama_produk VARCHAR(100),
    kategori VARCHAR(50),
    harga DOUBLE(10,2),
    berat float(10,2)
);
CREATE TABLE IF NOT EXISTS stok (
    id_stok INT(11) PRIMARY KEY,
    id_produk INT(11),
    id_gudang INT(11),
    jumlah INT(11),
    tgl_update DATETIME,
    CONSTRAINT fk_produk FOREIGN KEY (id_produk) REFERENCES produk(id_produk),
    CONSTRAINT fk_gudang FOREIGN KEY (id_gudang) REFERENCES gudang(id_gudang)
);
CREATE TABLE IF NOT EXISTS karyawan(
    id_karyawan INT(11) PRIMARY KEY,
    id_gudang INT(11),
    nama VARCHAR(100),
    alamat VARCHAR(255),
    posisi VARCHAR(50),
    gaji DOUBLE(10,2)
);
CREATE TABLE IF NOT EXISTS transaksi(
    id_transaksi INT(11) PRIMARY KEY,
    id_produk INT(11),
    id_supplier INT(11),
    id_karyawan INT(11),
    id_gudang INT(11),
    jumlah INT(11),
    total_harga DOUBLE(10,2),
    tanggal_transaksi DATETIME,
    CONSTRAINT fkt_karyawan FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan),
    CONSTRAINT fkt_produk FOREIGN KEY (id_produk) REFERENCES produk(id_produk),
    CONSTRAINT fkt_supplier FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier),
    CONSTRAINT fkt_gudang FOREIGN KEY (id_gudang) REFERENCES gudang(id_gudang)
);
INSERT INTO supplier (id_supplier, nama_supplier, alamat, telepon, email) VALUES (1, 'Supplier A', 'Alamat A', '1234567890', 'supplierA@example.com'), (2, 'Supplier B', 'Alamat B', '0987654321', 'supplierB@example.com'), (3, 'Supplier C', 'Alamat C', '1112223333', 'supplierC@example.com'), (4, 'Supplier D', 'Alamat D', '4445556666', 'supplierD@example.com'), (5, 'Supplier E', 'Alamat E', '7778889999', 'supplierE@example.com'), (6, 'Supplier F', 'Alamat F', '0001112222', 'supplierF@example.com'), (7, 'Supplier G', 'Alamat G', '3334445555', 'supplierG@example.com'), (8, 'Supplier H', 'Alamat H', '6667778888', 'supplierH@example.com'), (9, 'Supplier I', 'Alamat I', '9990001111', 'supplierI@example.com'), (10, 'Supplier J', 'Alamat J', '2223334444', 'supplierJ@example.com');
INSERT INTO gudang (id_gudang, nama_gudang, alamat) VALUES (1, 'Gudang A', 'Alamat A'), (2, 'Gudang B', 'Alamat B'), (3, 'Gudang C', 'Alamat C'), (4, 'Gudang D', 'Alamat D'), (5, 'Gudang E', 'Alamat E'), (6, 'Gudang F', 'Alamat F'), (7, 'Gudang G', 'Alamat G'), (8, 'Gudang H', 'Alamat H'), (9, 'Gudang I', 'Alamat I'), (10, 'Gudang J', 'Alamat J');
INSERT INTO produk (id_produk, nama_produk, kategori, harga, berat) VALUES (1, 'Produk A', 'Kategori A', 10000.00, 1.00), (2, 'Produk B', 'Kategori B', 20000.00, 2.00), (3, 'Produk C', 'Kategori C', 30000.00, 3.00), (4, 'Produk D', 'Kategori D', 40000.00, 4.00), (5, 'Produk E', 'Kategori E', 50000.00, 5.00), (6, 'Produk F', 'Kategori F', 60000.00, 6.00), (7, 'Produk G', 'Kategori G', 70000.00, 7.00), (8, 'Produk H', 'Kategori H', 80000.00, 8.00), (9, 'Produk I', 'Kategori I', 90000.00, 9.00), (10, 'Produk J', 'Kategori J', 100000.00, 10.00);
INSERT INTO stok (id_stok, id_produk, id_gudang, jumlah, tgl_update) VALUES 
(1, 1, 1, 100, '2022-01-01 00:00:00'),
(2, 2, 2, 200, '2022-01-02 00:00:00'),
(3, 3, 3, 300, '2022-01-03 00:00:00'),
(4, 4, 4, 400, '2022-01-04 00:00:00'),
(5, 5, 5, 500, '2022-01-05 00:00:00'),
(6, 6, 6, 600, '2022-01-06 00:00:00'),
(7, 7, 7, 700, '2022-01-07 00:00:00'),
(8, 8, 8, 800, '2022-01-08 00:00:00'),
(9, 9, 9, 900, '2022-01-09 00:00:00'),
(10, 10, 10, 1000, '2022-01-10 00:00:00');
INSERT INTO karyawan (id_karyawan, id_gudang, nama, alamat, posisi, gaji) VALUES (1, 1, 'Karyawan A', 'Alamat A', 'Posisi A', 1000000.00), (2, 2, 'Karyawan B', 'Alamat B', 'Posisi B', 2000000.00), (3, 3, 'Karyawan C', 'Alamat C', 'Posisi C', 3000000.00), (4, 4, 'Karyawan D', 'Alamat D', 'Posisi D', 4000000.00), (5, 5, 'Karyawan E', 'Alamat E', 'Posisi E', 5000000.00), (6, 6, 'Karyawan F', 'Alamat F', 'Posisi F', 6000000.00), (7, 7, 'Karyawan G', 'Alamat G', 'Posisi G', 7000000.00), (8, 8, 'Karyawan H', 'Alamat H', 'Posisi H', 8000000.00), (9, 9, 'Karyawan I', 'Alamat I', 'Posisi I', 9000000.00), (10, 10, 'Karyawan J', 'Alamat J', 'Posisi J', 10000000.00);
INSERT INTO transaksi (id_transaksi, id_produk, id_supplier, id_karyawan, jumlah, total_harga, tanggal_transaksi) VALUES (1, 1, 1, 1, 10, 100000.00, '2022-01-01 00:00:00'), (2, 2, 2, 2, 20, 400000.00, '2022-01-02 00:00:00'), (3, 3, 3, 3, 30, 900000.00, '2022-01-03 00:00:00'), (4, 4, 4, 4, 40, 1600000.00, '2022-01-04 00:00:00'), (5, 5, 5, 5, 50, 2500000.00, '2022-01-05 00:00:00'), (6, 6, 6, 6, 60, 3600000.00, '2022-01-06 00:00:00'), (7, 7, 7, 7, 70, 4900000.00, '2022-01-07 00:00:00'), (8, 8, 8, 8, 80, 6400000.00, '2022-01-08 00:00:00'), (9, 9, 9, 9, 90, 8100000.00, '2022-01-09 00:00:00'), (10, 10, 10, 10, 100, 10000000.00, '2022-01-10 00:00:00');
INSERT INTO transaksi (id_transaksi, id_produk, id_supplier, id_karyawan, jumlah, total_harga, tanggal_transaksi) VALUES (11, 1, 1, 1, 10, 100000.00, '2022-01-01 00:00:00'), (12, 2, 2, 2, 20, 400000.00, '2022-01-02 00:00:00');

ALTER TABLE supplier ADD CONSTRAINT fk_supplier FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE gudang ADD CONSTRAINT fk_gudang FOREIGN KEY (id_gudang) REFERENCES gudang(id_gudang) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE produk ADD CONSTRAINT fk_produk FOREIGN KEY (id_produk) REFERENCES produk(id_produk) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE stok ADD CONSTRAINT fk_produk FOREIGN KEY (id_produk) REFERENCES produk(id_produk) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE stok ADD CONSTRAINT fk_gudang FOREIGN KEY (id_gudang) REFERENCES gudang(id_gudang) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE transaksi ADD CONSTRAINT fk_karyawan FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE transaksi ADD CONSTRAINT fk_produk FOREIGN KEY (id_produk) REFERENCES produk(id_produk) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE transaksi ADD CONSTRAINT fk_supplier FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE transaksi ADD CONSTRAINT fkt_gudang FOREIGN KEY (id_gudang) REFERENCES gudang(id_gudang) ON DELETE CASCADE ON UPDATE CASCADE;

DELIMITER //
DELIMITER //

CREATE OR REPLACE PROCEDURE  totals_harga(
    IN pkaryawan_id INT,
    OUT ptotal_harga DOUBLE(10,2)
)
BEGIN
    SELECT SUM(total_harga) INTO ptotal_harga
    FROM transaksi
    WHERE id_karyawan = pkaryawan_id;
END //

DELIMITER ;

DELIMITER //
CREATE OR REPLACE PROCEDURE lama_produkberada(
    IN pproduk_id INT,
    OUT plama_berada INT
)
BEGIN
    SELECT DATEDIFF(CURDATE(), tgl_update) INTO plama_berada
    FROM stok
    WHERE id_produk = pproduk_id
    ORDER BY tgl_update ASC
    LIMIT 1;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE deletetransaksi()
BEGIN
    DELETE FROM transaksi
    WHERE tanggal_transaksi BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE()
    AND total_harga <= 200000;
END //
DELIMITER ;
call lama_produkberada(1 ,@plama_berada);
SELECT @plama_berada;
USE logistik_pakaian;
    SELECT DATEDIFF(CURDATE(), tgl_update) 
    FROM stok
    WHERE id_produk = 3
    ORDER BY tgl_update ASC;
    --anzacs