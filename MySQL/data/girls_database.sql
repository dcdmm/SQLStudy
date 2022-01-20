drop database if exists `girls`;
create database if not exists `girls`;


use `girls`;


drop database if exists `beauty`;
create table `beauty`
(
    `id`           int(11) not null auto_increment,
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