drop database if exists `test`;
create database if not exists `tests`;


use tests;


/*
 Floating-Point Types (Approximate Value) - FLOAT, DOUBLE

 The FLOAT and DOUBLE types represent approximate numeric data values.
 MySQL uses four bytes for single-precision values and eight bytes for double-precision values.
 */


drop table if exists float_test0;
create table float_test0
(
    # 指定(M, D)
    /*
     salary DECIMAL(5,2)
     In this example, 5 is the precision and 2 is the scale.
     The precision represents the number of significant digits that are stored for values, and the scale represents the number of digits that can be stored following the decimal point.

     Standard SQL requires that DECIMAL(5,2) be able to store any value with five digits and two decimals, so values that can be stored in the salary column range from -999.99 to 999.99.
     */
    f  float(6, 2),  # 可以存储的值范围为-9999.99 ~ 9999.99;只保留2位有效数字
    d1 double(8, 4),
    # The DECIMAL and NUMERIC types store exact numeric data values. These types are used when it is important to preserve exact precision, for example with monetary data. I
    d2 decimal(5, 3) # 更进精确
);

desc float_test0;

insert into float_test0(f, d1, d2)
values (123.452, 123.459, 23.531),
       (123.456, 123.456, 13.464),
       (123.412, 123.451, 12.452),
       (15.442, 132.423, 13.4224);

select *
from float_test0;


drop table if exists float_test1;
create table float_test1
(
    # 省略(M, D)
    f  float,  # 根据插入的数值确定精度
    d1 double, # 根据插入的数值确定精度
    d2 decimal # M默认为10,D默认为0(无小数位)
);

desc float_test1;

insert into float_test1(f, d1, d2)
values (123.4523, 123.4523, 123.4523),
       (123.456, 123.456, 123.456),
       (123.4, 123.4, 123.4),
       (1523.4, 1523.4, 1523.4);

select *
from float_test1;