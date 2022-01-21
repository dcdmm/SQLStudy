drop database if exists tests;
create database if not exists tests;


use tests;


drop table if exists auto_incre;
create table auto_incre
(
    # There can be only one AUTO_INCREMENT column per table, it must be indexed, and it cannot have a DEFAULT value.
    # 默认主键约束
    # 必须是数值类型
    id   double key auto_increment,
    NAME varchar(20)
);

desc auto_incre;

# 通过手动插入值,设置起始值(默认为1)
insert into auto_incre
values (10, 'java');

insert into auto_incre(NAME)
values ('python'),
       ('c++');

# ********************************************
select *
from auto_incre;
# ********************************************

set auto_increment_increment = 3; # 设置步长(默认为1)

insert into auto_incre(NAME)
values ('c#'),
       ('go');