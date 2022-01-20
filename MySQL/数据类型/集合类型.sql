drop database if exists `test`;
create database if not exists `tests`;


use tests;


drop table if exists set_test;
create table set_test
(
    # A SET is a string object that can have zero or more values, each of which must be chosen from a list of permitted values specified when the table is created.
    # SET column values that consist of multiple set members are specified with members separated by commas (,).
    # A consequence of this is that SET member values should not themselves contain commas.
    s set ('a','b','c','d')
);

insert into set_test
values ('a'),
       ('a,b'),
       ('a,b,c'),
       ('d,c,d'), # 自动去除重复值
       ('c,d,a');

select *
from set_test;