// SUKMA AYU MAHARANI
// 220441100077
//SISTEM MANAJEMEN BASIS DATA - 4D

create database db_gudang;
use db_gudang;

create table supplier(
	id_supplier int (11) primary key,
    nama_supplier varchar (100),
    alamat varchar (255),
    telepon char (15),
    email varchar (100)
);

create table gudang(
	id_gudang int (11) primary key,
    nama varchar (100),
    alamat varchar (255)
);

create table karyawan(
	id_karyawan int (11) primary key,
    id_gudang int (11),
    foreign key (id_gudang) references gudang(id_gudang),
    nama varchar (100),
    alamat varchar (255),
    posisi varchar (50),
    gaji double
);

create table produk(
	id_produk int (11) primary key,
    nama_produk varchar (100),
    kategori varchar (50),
    harga double,
    berat float
);

create table stok(
	id_stok int (11) primary key,
    id_produk int (11),
    foreign key (id_produk) references produk(id_produk),
    id_gudang int (11),
    foreign key (id_gudang) references gudang(id_gudang),
    jumlah int (11),
    tanggal_update datetime
);

create table transaksi(
	id_transaksi int (11) primary key,
    id_produk int (11),
    foreign key (id_produk) references produk(id_produk),
    id_supplier int (11),
    foreign key (id_supplier) references supplier(id_supplier),
    id_karyawan int (11),
    foreign key (id_karyawan) references karyawan(id_karyawan),
    jumlah int (11),
    total_harga double,
    tanggal_transaksi datetime
);

INSERT INTO supplier (id_supplier, nama_supplier, alamat, telepon, email) VALUES
(1, 'PT Cahaya', 'Jl. Raya No. 123', '08123456789', 'info@ptcahaya.com'),
(2, 'CV Terang', 'Jl. Merdeka No. 45', '08134567890', 'info@cvterang.com'),
(3, 'UD Sinar Jaya', 'Jl. Kebun Raya No. 67', '08145678901', 'info@udsinarjaya.com'),
(4, 'PT Maju Bersama', 'Jl. Jendral Sudirman No. 89', '08156789012', 'info@ptmajubersama.com'),
(5, 'CV Jaya Baru', 'Jl. Gatot Subroto No. 101', '08167890123', 'info@cvjayabaru.com');

INSERT INTO gudang (id_gudang, nama, alamat) VALUES
(1, 'Gudang Utama', 'Jl. Ahmad Yani No. 10'),
(2, 'Gudang Sentral', 'Jl. Pahlawan No. 20'),
(3, 'Gudang Baru', 'Jl. Diponegoro No. 30'),
(4, 'Gudang Jaya', 'Jl. Asia Afrika No. 40'),
(5, 'Gudang Sejahtera', 'Jl. Sudirman No. 50');

INSERT INTO karyawan (id_karyawan, id_gudang, nama, alamat, posisi, gaji) VALUES
(1, 1, 'Budi', 'Jl. Diponegoro No. 15', 'Manager', 10000000),
(2, 2, 'Citra', 'Jl. Asia Afrika No. 25', 'Supervisor', 8000000),
(3, 3, 'Dewi', 'Jl. Sudirman No. 35', 'Staf', 6000000),
(4, 4, 'Eka', 'Jl. Ahmad Yani No. 45', 'Staf', 6000000),
(5, 5, 'Fajar', 'Jl. Pahlawan No. 55', 'Staf', 6000000);

INSERT INTO produk (id_produk, nama_produk, kategori, harga, berat) VALUES
(1, 'Beras', 'Makanan', 15000, 1),
(2, 'Gula', 'Makanan', 12000, 0.5),
(3, 'Minyak Goreng', 'Makanan', 25000, 1),
(4, 'Sabun Mandi', 'Peralatan Mandi', 5000, 0.2),
(5, 'Sikat Gigi', 'Peralatan Mandi', 3000, 0.1);

INSERT INTO stok (id_stok, id_produk, id_gudang, jumlah, tanggal_update) VALUES
(1, 1, 1, 500, '2024-05-10 08:00:00'),
(2, 2, 2, 700, '2024-05-10 09:00:00'),
(3, 3, 3, 400, '2024-05-10 10:00:00'),
(4, 4, 4, 1000, '2024-05-10 11:00:00'),
(5, 5, 5, 800, '2024-05-10 12:00:00');

update stok set tanggal_update = '2024-05-05 12:00:00' where id_stok = 5;

INSERT INTO transaksi (id_transaksi, id_produk, id_supplier, id_karyawan, jumlah, total_harga, tanggal_transaksi) VALUES
(1, 1, 1, 1, 50, 750000, '2024-05-10 08:30:00'),
(2, 2, 2, 2, 60, 720000, '2024-05-10 09:30:00'),
(3, 3, 3, 3, 30, 750000, '2024-05-10 10:30:00'),
(4, 4, 4, 4, 80, 400000, '2024-05-10 11:30:00'),
(5, 5, 5, 5, 40, 120000, '2024-05-10 12:30:00');


DELIMITER //
CREATE PROCEDURE HitungTotalTransaksiKaryawan(
	IN id_karyawan_baru INT, 
    OUT total_harga_baru DOUBLE
)
BEGIN
    SELECT SUM(total_harga) INTO total_harga_baru 
    FROM transaksi
    WHERE id_karyawan = id_karyawan_baru;
END //
DELIMITER ;
CALL HitungTotalTransaksiKaryawan(2, @total_harga);
SELECT @total_harga AS total_harga;
select * from transaksi;


DELIMITER $$
CREATE PROCEDURE HitungLamaStokDiGudang()
BEGIN
    SELECT 
        s.id_produk,
        p.nama_produk,
        s.id_gudang,
        g.nama AS nama_gudang,
        DATEDIFF(CURDATE(), s.tanggal_update) AS lama_hari 
    FROM 
        stok s
    INNER JOIN 
        produk p ON s.id_produk = p.id_produk
    INNER JOIN 
        gudang g ON s.id_gudang = g.id_gudang;
END$$
DELIMITER ;
CALL HitungLamaStokDiGudang();



DELIMITER //
CREATE PROCEDURE HapusTransaksiBulanTerakhir()
BEGIN
    DECLARE tanggal_awal DATE;
    SET tanggal_awal = DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

    DELETE FROM transaksi
    WHERE tanggal_transaksi >= tanggal_awal
    AND total_harga <= 200000
    AND id_transaksi > 0; 

    SELECT 'Data berhasil di hapus';
END //
DELIMITER ;
CALL HapusTransaksiBulanTerakhir();
select*from transaksi;
drop procedure HapusTransaksiBulanTerakhir;