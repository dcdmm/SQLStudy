create database if not exists tests;


use tests;


drop table if exists book;

create table book
(
    id    int primary key auto_increment,
    bName varchar(20),
    price double
);

insert into book (BNAME, PRICE)
values ('python', 34),
       ('c++', 51.4),
       ('c#', 51),
       ('java', 234);

select *
from book;

# 仅复制表结构
drop table if exists copy_book_1;
create table copy_book_1 like book;
select *
from copy_book_1;

# 复制表结构和表数据
drop table if exists copy_book_2;
create table copy_book_2
select *
from book;

select *
from copy_book_2;

# 复制部分表结构和部分表数据
drop table if exists copy_book_3;
create table copy_book_3
select id, price
from book
where price > 51;

select *
from copy_book_3;