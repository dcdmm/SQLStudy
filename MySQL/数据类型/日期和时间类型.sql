drop database if exists `test`;
create database if not exists `tests`;


use tests;


drop table if exists test_time;
create table test_time
(
    t1 datetime,
    t2 timestamp  # 根据设置的时区变化而变化
);

insert into test_time
values (now(), now());

desc test_time;

select *
from test_time;