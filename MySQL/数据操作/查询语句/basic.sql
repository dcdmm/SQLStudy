# 常量
select 999;
select 'duanchao';

# 表达式
select 100 * 2;

# 函数
select version();

use myemployees;
# 表
select last_name # 查询表中单个字段
from employees;

select last_name, # 查询表中多个字段
       salary,
       `email`    # 着重号(``)的意义在于明确其中的内容是字段名,尤其是当字段名与关键字重合的情况下
from employees;

select * # 查询表中所有字段
from employees;
