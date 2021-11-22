/*
 SHOW {DATABASES | SCHEMAS}
    [LIKE 'pattern' | WHERE expr]
 */
# SHOW DATABASES lists the databases on the MySQL server host
show databases;

# 将information_schema作为当前数据库
# 该数据库保持为默认数据库,直到语段的结尾,或者直到遇见另一个不同的USE语句
# 只有使用USE语句来指定某个数据库作为当前数据库之后,才能对该数据库及其存储的数据对象执行操作
use myemployees;

/*
 SHOW [EXTENDED] [FULL] TABLES
    [{FROM | IN} db_name]
    [LIKE 'pattern' | WHERE expr]
 */
# SHOW TABLES lists the non-TEMPORARY tables in a given database
show tables;

# 查看表结构
desc departments;
