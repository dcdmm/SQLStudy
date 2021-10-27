use myemployees;

# 查询表中单个字段
select last_name
from employees;

# 查询表中多个字段
select last_name,
       salary,
       `email` # 着重号;着重号的意义在于明确其中的内容是字段名,尤其是当字段名与关键字重合的情况下
from employees;

# 查询表中所有字段
select *
from employees;