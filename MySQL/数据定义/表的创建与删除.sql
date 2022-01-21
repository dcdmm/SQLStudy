create database if not exists tests;


use tests;


# SHOW TABLES lists the non-TEMPORARY tables in a given database
show tables;

# 删除表
drop table if exists book;

# 创建表
create table book
(
    id       int PRIMARY KEY auto_increment,
    bName    varchar(20),
    price    double,
    authorId int
) engine = InnoDB # Specifies the storage engine for the table(默认InnoDB)
  auto_increment = 10 # 设置自动增加列从10开始自动增加
  default charset = utf8; # pecifies a default character set for the table
;

# 查看表结构
desc book;

# 查看创表语句
show create table book;

insert into book(bName, price, authorId)
values ('python', 34.0, NULL),
       ('c++', 64.5, NUll);

select *
from book;

