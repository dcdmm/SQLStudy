drop database if exists `test`;
create database if not exists `tests`;


use tests;


drop table if exists int_test0;
create table int_test0
(
    i1 int,
    i2 int unsigned # unsigned:无符号位
);

desc int_test0;


drop table if exists int_test1;
create table int_test1
(
    t1 int,
    # 长度10代表了显示的最大宽度
    # 左侧空格用0填充(通过ZEROFILL关键字)
    t2 int(10) zerofill # 直接变成无符号
);

desc int_test1;

insert into int_test1
values (-123456, 2456),
       (214748, 429496),
       (123, 123);

select *
from int_test1;