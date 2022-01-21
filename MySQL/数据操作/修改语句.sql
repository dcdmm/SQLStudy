drop database if exists `tests`;
create database if not exists `tests`;


use `tests`;


drop database if exists `beauty`;
create table `beauty`
(
    `id`           int(11)     not null auto_increment,
    `name`         varchar(50) not null,
    `sex`          char(1)  default '女',
    `borndate`     datetime default '1987-01-01 00:00:00',
    `phone`        varchar(11) not null,
    `photo`        blob,
    `boyfriend_id` int(11)  default null, # 男朋友id
    primary key (`id`)
) engine = InnoDB
  auto_increment = 13
  default charset = utf8;

insert into `beauty`(`id`, `name`, `sex`, `borndate`, `phone`, `photo`, `boyfriend_id`)
values (1, '柳岩', '女', '1988-02-03 00:00:00', '18209876577', NULL, 8),
       (2, '苍老师', '女', '1987-12-30 00:00:00', '18219876577', NULL, 9),
       (3, 'Angelababy', '女', '1989-02-03 00:00:00', '18209876567', NULL, 3),
       (4, '热巴', '女', '1993-02-03 00:00:00', '18209876579', NULL, 2),
       (5, '周冬雨', '女', '1992-02-03 00:00:00', '18209179577', NULL, 9),
       (6, '周芷若', '女', '1988-02-03 00:00:00', '18209876577', NULL, 1),
       (7, '岳灵珊', '女', '1987-12-30 00:00:00', '18219876577', NULL, 9),
       (8, '小昭', '女', '1989-02-03 00:00:00', '18209876567', NULL, 1),
       (9, '双儿', '女', '1993-02-03 00:00:00', '18209876579', NULL, 9),
       (10, '王语嫣', '女', '1992-02-03 00:00:00', '18209179577', NULL, 4),
       (11, '夏雪', '女', '1993-02-03 00:00:00', '18209876579', NULL, 9),
       (12, '赵敏', '女', '1992-02-03 00:00:00', '18209179577', NULL, 1);


drop table if exists `boys`;
create table `boys`
(
    `id`      int(11) not null auto_increment,
    `boyName` varchar(20) default null,
    `userCP`  int(11)     default null,
    primary key (`id`)
) engine = InnoDB
  auto_increment = 5
  default charset = utf8;

insert into `boys`(`id`, `boyName`, `userCP`)
values (1, '张无忌', 100),
       (2, '鹿晗', 800),
       (3, '黄晓明', 50),
       (4, '段誉', 300);

# *****************************************
select *
from beauty;

select *
from boys;
# *****************************************

# Single-table syntax:
# 修改beauty表中姓小的女生的电话为9999999999
update beauty
set phone = '9999999999'
where NAME like '小%'
limit 1; # 单行语法可搭配limit关键字

# 修改boys表中id号为2的姓名为张飞,魅力值为10
update boys
set boyname='张飞',
    usercp=10
where id = 2;

# Multiple-table syntax:
# 删除黄晓明的信息以及他女朋友的信息为:'黄晓明_x','Angelababy_x'
update beauty b
    inner join boys bo on b.`boyfriend_id` = bo.`id`
set bo.boyName = '黄晓明_x', b.name = 'Angelababy_x' # 多表字段更新
where bo.`boyName` = '黄晓明';
