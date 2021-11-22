# 条件表达式:> < = != <> <= >=
# 逻辑表达式:
# 逻辑运算符:and or not
# 模糊查询like between and in is null

# 查询工资>12000的员工信息

use myemployees;

select *
from employees
where salary > 12000;

# 查询部门编码不等于90号的员工名和部门编号

select last_name,
       department_id
from employees
where department_id<>90;  # 不等于90

# 查询过工资10000到20000之间员工名,工资,奖金
select last_name,
       salary,
       commission_pct
from  employees
where salary>=10000 and salary<=20000;

# 部门编号不是在90到110之间,或者工资高于15000的员工信息
select *
from employees
where department_id<90 and department_id<100 or salary>15000;
