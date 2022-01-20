create database if not exists tests;


use tests;


drop table if exists book;

create table book
(
    id    int PRIMARY KEY auto_increment,
    bName varchar(20),
    price double
);

# 支持同时插入多条语句
insert into book
values (1, 'python', 34), # 顺序与表中列名顺序一致
       (2, 'c++', 51.4),
       (3, 'c#', 51);

insert into book(price, bName)
values (0, 'java'), # 顺序与插入语句中指定的列名顺序一致
       (99, 'go');

# 支持子查询
insert into book
select 6, 'sql', 34;

select *
from book;