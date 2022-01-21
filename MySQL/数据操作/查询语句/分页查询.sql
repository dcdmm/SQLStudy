use myemployees;


# 查询前五条员工信息
select *
from employees
# order by语句之后
limit 0, 5; # 起始索引为0,显示的行数为5

select *
from employees
limit 5; # 默认起始索引从0开始