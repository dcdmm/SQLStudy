create database if not exists tests;


use tests;


drop table if exists book;

create table book
(
    id    int primary key auto_increment,
    bName varchar(20),
    price double
);


insert into book
values (1, 'python', 34), # 顺序与表中列名顺序一致
       (2, 'c++', 51.4),
       (3, 'c#', 51);


select *
from book;


# REPLACE works exactly like INSERT, except that if an old row in the table has the same value as a new row for a PRIMARY KEY or a UNIQUE index, the old row is deleted before the new row is inserted.
replace into book
values (1, 'python', 21),
       (4, 'rust', 100);


select *
from book;
