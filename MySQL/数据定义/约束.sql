drop database if exists tests;
create database if not exists tests;


use tests;


drop table if exists major;
create table major
(
    id        int key, # key:普通索引(不带约束)
    majorName varchar(20)
);


drop table if exists stuinfo;
# 列级约束
create table stuinfo
(
    # 主键约束
    # A table can have only one PRIMARY KEY
    # A unique index where all key columns must be defined as NOT NULL
    id      int primary key,
    # 非空约束
    # If neither NULL nor NOT NULL is specified, the column is treated as though NULL had been specified.
    stuName varchar(20) not null,
    gender  char(1),
    # 唯一约束
    # A UNIQUE index creates a constraint such that all values in the index must be distinct.
    seat    int unique, # 可以有多个;可以组合多列
    # 默认约束
    # Specifies a default value for a column.
    age     int default 18,
    majorId int
);

desc stuinfo;

drop table if exists stuinfo_1;
# 表级约束:支持主键约束、唯一约束、外键约束
# 可以给约束命名
create table stuinfo_1
(
    id      int,
    stuname varchar(20),
    gender  char(1),
    seat    int,
    age     int,
    majorid int,

    # A PRIMARY KEY can be a multiple-column index.
    constraint pk primary key (id, stuname), # 两列共同作为主键列
    constraint uq unique (seat),             # 唯一约束
    # 外键约束
    # Parent and child tables must use the same storage engine, and they cannot be defined as temporary tables.
    # Corresponding columns in the foreign key and the referenced key must have similar data types.
    # MySQL requires indexes on foreign keys and referenced keys so that foreign key checks can be fast and not require a table scan.
    constraint fk_stuinfo_major foreign key (majorid) references major (id)
);

desc stuinfo_1;

show create table stuinfo_1;