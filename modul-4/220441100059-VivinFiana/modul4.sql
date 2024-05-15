create database karyawan;
use karyawan;

create table karyawan(
id_karyawan int (11) primary key not null,
nama varchar (100) not null,
posisi varchar (50) not null,
id_atasan int (11) not null
);

insert into karyawan(id_karyawan, nama, posisi, id_atasan) values
(1, 'Jaemin', 'Staf Keuangan',2),
(2, 'Chiko', 'Manager',null),
(3, 'Disa', 'Staf Keuangan', 2),
(4, 'Lisa', 'Staf Keuangan', 2),
(5, 'Yudis', 'Staf Keuangan', 2);

select * from karyawan;
drop table karyawan;

select k1.nama as karyawan, 
       k2.nama as atasan
from karyawan k1
right join karyawan k2 on k1.id_atasan = k2.id_karyawan
order by k2.id_karyawan;