CREATE DATABASE db_Trunojoyo;
USE db_Trunojoyo;
CREATE TABLE Mahasiswa ( nim VARCHAR(15), nama_mhs VARCHAR(45), Prodi VARCHAR(45), tanggal_masuk DATE, tanggal_lulus DATE, StatusMhs VARCHAR(45), PRIMARY KEY(nim));

INSERT INTO Mahasiswa VALUES (220441100148,"Erick firmansyah", "Sistem informasi", "17-08-01", "17-08-01","Aktif");
INSERT INTO Mahasiswa VALUES (220441100149,"Syahrul rahmadani", "Sistem informasi","18-08-01", "17-08-01","Aktif");
INSERT INTO Mahasiswa VALUES (220441100150,"Birrur rijal", "Sistem informasi","18-08-01", "17-08-01","Aktif");
INSERT INTO Mahasiswa VALUES (220441100151,"Nadhif athala", "Sistem informasi","18-08-01", "17-08-01","Aktif");
INSERT INTO Mahasiswa VALUES (220441100152,"Agus Salim", "Sistem informasi","18-08-01", "17-08-01","Lulus");
INSERT INTO Mahasiswa VALUES (220441100153,"Mamat", "Sistem informasi","18-08-01", "17-08-01","Lulus");
INSERT INTO Mahasiswa VALUES (220441100154,"Mustofa", "Sistem informasi", "18-08-01", "17-08-01","Tidak Lulus");
INSERT INTO Mahasiswa VALUES (220441100155,"Embrik Jumri", "Sistem informasi","18-08-01", "17-08-01","Tidak Lulus");
INSERT INTO Mahasiswa VALUES (220441100156,"Udin", "Sistem informasi","18-08-01", "17-08-01","Tidak Lulus");
INSERT INTO Mahasiswa VALUES (220441100157,"Samsu", "Sistem informasi", "18-08-01", "17-08-01","Lulus");
SELECT * FROM mahasiswa;

CREATE TABLE Dosen (nip VARCHAR(15), nama_dosen VARCHAR(45), jabatan VARCHAR(45), tanggal_masuk DATE, tanggal_Keluar DATE, id_matakuliah INT(15), PRIMARY KEY(nip));
DROP TABLE Dosen;
INSERT INTO Dosen VALUES (21001,"Ir. Mohammad Nuriman Thoha", "Dekan","17-08-01", "17-08-01", 101);
INSERT INTO Dosen VALUES (21002,"Prof. Dr. Hartati , M.Pd.","Dosen","17-08-01", "17-08-01", 102);
INSERT INTO Dosen VALUES (21003,"Prof. Dr. Amos Neolaka , M.Pd.","Dosen","17-08-01", "17-08-01", 103);
INSERT INTO Dosen VALUES (21004,"IProf. Dr. Gerardus Polla , M.APP.Sc.","Dosen","17-08-01", "17-08-01", 104);
INSERT INTO Dosen VALUES (21005,"Prof. Dr. Bintang Petrus Sitepu","Dosen","17-08-01", "17-08-01", 105);
INSERT INTO Dosen VALUES (21006,"Prof. Dr. Myrnawati Crie Handini , M.S. PKK","Koorprodi","17-08-01", "17-08-01", 106);
INSERT INTO Dosen VALUES (21007,"Prof. Dr. Nurdin Ibrahim , M.Pd.","Dosen","17-08-01", "17-08-01", 107);
INSERT INTO Dosen VALUES (21008,"Prof. Dr. Martini Jamaris , M.Sc. Ed. MM","Dosen","17-08-01", "17-08-01", 108);
INSERT INTO Dosen VALUES (21009,"Prof. Dr. Maruf Akbar Imanurdin , M.Pd.","Dosen","17-08-01", "17-08-01", 109); 
INSERT INTO Dosen VALUES (21010,"Prof. Dr. Zulfiati , M.Pd.","Dosen","17-08-01", "17-08-01", 110);
SELECT * FROM Dosen;
    
CREATE TABLE Matakuliah (id_matakuliah INT(15), matakuliah VARCHAR(45), sks INT(15), nim VARCHAR(15), nip VARCHAR(15), PRIMARY KEY(id_matakuliah), FOREIGN KEY(nim) REFERENCES Mahasiswa(nim), FOREIGN KEY(nip) REFERENCES Dosen(nip));
DESC Matakuliah;
DROP TABLE Matakuliah;
INSERT INTO Matakuliah VALUES (101,"Pengantar Sistem Informasi", "3", 220441100148, 21001);
INSERT INTO Matakuliah VALUES (102,"Struktur Data dan Algoritma", "4", 220441100149, 21002);
INSERT INTO Matakuliah VALUES (103,"Basis Data", "3", 220441100150, 21003);
INSERT INTO Matakuliah VALUES (104,"Pemrograman Berbasis Objek", "4", 220441100151, 21004);
INSERT INTO Matakuliah VALUES (105,"Rekayasa Perangkat Lunak", "3", 220441100152, 21005);
INSERT INTO Matakuliah VALUES (106,"Sistem Informasi Manajemen", "3", 220441100153, 21006);
INSERT INTO Matakuliah VALUES (107,"Analisis dan Desain Sistem Informasi", "3", 220441100154, 21007);
INSERT INTO Matakuliah VALUES (108,"Jaringan Komputer", "4", 220441100155, 21008);
INSERT INTO Matakuliah VALUES (109,"Keamanan Informasi", "3", 220441100156, 21009);
INSERT INTO Matakuliah VALUES (110,"Manajemen Proyek Perangkat Lunak", "4", 220441100157, 21010);
SELECT * FROM Matakuliah;

CREATE TABLE TransaksiKeuangan (id_transaksi INT(15) PRIMARY KEY, jenisTransaksi VARCHAR(50), Nominal DECIMAL(15, 2), TanggalTransaksi DATE, id_laporan INT(15), FOREIGN KEY(id_laporan) REFERENCES Laporan(id_laporan));
INSERT INTO Transaksikeuangan VALUES (1, 'Pembayaran UKT', 1000000, '2024-03-28', 1);
INSERT INTO Transaksikeuangan VALUES (2, 'Pembayaran Gaji Dosen', 5000000, '2024-03-28', 2);
INSERT INTO Transaksikeuangan VALUES (3, 'Pembelian Peralatan', 2000000, '2024-03-29', 3);
INSERT INTO Transaksikeuangan VALUES (4, 'Pembayaran Listrik', 500000, '2024-03-30', 4);
INSERT INTO Transaksikeuangan VALUES (5, 'Pembayaran UKT', 1200000, '2024-03-30', 5);
INSERT INTO Transaksikeuangan VALUES (6, 'Pembelian Bahan Ajar', 1500000, '2024-03-31', 6);
INSERT INTO Transaksikeuangan VALUES (7, 'Pembayaran Listrik', 480000, '2024-03-31', 7);
INSERT INTO Transaksikeuangan VALUES (8, 'Pembayaran UKT', 1100000, '2024-04-01', 8);
INSERT INTO Transaksikeuangan VALUES (9, 'Pembayaran Gaji Dosen', 5200000, '2024-04-01', 9);
INSERT INTO Transaksikeuangan VALUES (10, 'Pembelian Peralatan', 2500000, '2024-04-02', 10);
SELECT * FROM Transaksikeuangan;


CREATE TABLE Laporan (id_laporan INT(15) PRIMARY KEY, Tipe_Laporan VARCHAR(50), Deskripsi VARCHAR(255), Tanggal_Pembuatan DATE);


INSERT INTO Laporan VALUES (1, 'Laporan Pembayaran UKT', 'Laporan pembayaran UKT oleh mahasiswa', '2024-03-28');
INSERT INTO Laporan VALUES (2, 'Laporan Pembayaran Gaji Dosen', 'Laporan pembayaran gaji dosen bulan Maret 2024', '2024-03-28');
INSERT INTO Laporan VALUES (3, 'Laporan Pembelian Peralatan', 'Laporan pembelian peralatan untuk keperluan pengajaran', '2024-03-29');
INSERT INTO Laporan VALUES (4, 'Laporan Pembayaran Listrik', 'Laporan pembayaran tagihan listrik bulan Maret 2024', '2024-03-30');
INSERT INTO Laporan VALUES (5, 'Laporan Pembayaran UKT', 'Laporan pembayaran UKT oleh mahasiswa', '2024-03-30');
INSERT INTO Laporan VALUES (6, 'Laporan Pembelian Bahan Ajar', 'Laporan pembelian bahan ajar untuk mata kuliah', '2024-03-31');
INSERT INTO Laporan VALUES (7, 'Laporan Pembayaran Listrik', 'Laporan pembayaran tagihan listrik bulan Maret 2024', '2024-03-31');
INSERT INTO Laporan VALUES (8, 'Laporan Pembayaran UKT', 'Laporan pembayaran UKT oleh mahasiswa', '2024-04-01');
INSERT INTO Laporan VALUES (9, 'Laporan Pembayaran Gaji Dosen', 'Laporan pembayaran gaji dosen bulan April 2024', '2024-04-01');
INSERT INTO Laporan VALUES (10, 'Laporan Pembelian Peralatan', 'Laporan pembelian peralatan untuk keperluan pengajaran', '2024-04-02');
SELECT * FROM Laporan;

ALTER 