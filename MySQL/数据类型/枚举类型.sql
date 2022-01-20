drop database if exists `test`;
create database if not exists `tests`;


use tests;


drop table if exists enum_test;
create table enum_test
(
    # 建议不要将数字作为枚举值
    # An ENUM column can have a maximum of 65,535 distinct elements.
    # An ENUM is a string object with a value chosen from a list of permitted values that are enumerated explicitly in the column specification at table creation time.
    e enum ('a', 'b', 'c')
);

desc enum_test;

insert into enum_test
# 只能是枚举类型中的值
values ('a'),
       ('b'),
       ('c');

select *
from enum_test;