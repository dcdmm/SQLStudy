# SHOW DATABASES lists the databases on the MySQL server host
show databases;

# 创建数据库
create database if not exists tests;

# 选择数据库
use test;

# 更改数据库字符集
alter database tests character set gbk;

# 删除数据库
drop database if exists tests;


