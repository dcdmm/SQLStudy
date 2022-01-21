drop database if exists tests;
create database if not exists tests;


use tests;


drop table if exists major;
create table major
(
    id        int key,
    majorName varchar(20)
);

drop table if exists stuinfo_1;
create table stuinfo_1
(
    id      int key auto_increment,
    stuname varchar(20),
    gender  char(1) not null,
    seat    int unique,
    age     int default 18,
    majorid int references major (id),
    constraint majorid_foreign foreign key (majorid) references major (id)
);

# ********************************************
desc stuinfo_1;

desc stuinfo;
show create table stuinfo;
# ********************************************

# 重命名表明
alter table stuinfo_1 rename stuinfo;

# 增加新的字段
/*
 语法结构:
| ADD [COLUMN] col_name column_definition
    [FIRST | AFTER col_name]
 */
alter table stuinfo
    add `birthday` timestamp;
alter table stuinfo
    add `like` varchar(20) after id;
# 增加字段`like`在字段`id`后
# 增加字段`dislike`为第一个字段
alter table stuinfo
    add `dislike` varchar(20) first;

# 删除字段`dislike`
alter table stuinfo
    drop `dislike`;

# 修改列名与列定义
/*
 语法结构:
| CHANGE [COLUMN] old_col_name new_col_name column_definition
    [FIRST | AFTER col_name]
 */
alter table stuinfo
    change `like` `love` char(20) not null;
# 可通过first/after进行排序

# 修改列定义(列数据类型必填)
/*
 语法结构:
| MODIFY [COLUMN] col_name column_definition
    [FIRST | AFTER col_name]
 */

# 删除自动增加
alter table stuinfo
    modify id int;

# 删除主键约束(必须先删除存在的自动增加)
alter table stuinfo
    drop primary key;

# 删除外键约束
alter table stuinfo drop foreign key majorid_foreign;

# 增加主键约束,自动增加
alter table stuinfo
    modify id int primary key auto_increment;

# 删除唯一约束
alter table stuinfo modify seat int;

# 删除默认约束
alter table stuinfo modify age int;

# 删除非空约束
alter table stuinfo modify gender char(1) ;