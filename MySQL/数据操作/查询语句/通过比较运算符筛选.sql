use myemployees;

# 查询工资>12000的员工信息
select *
from employees
where salary > 12000;

# 查询部门编码不等于90号的员工名和部门编号
select last_name,
       department_id
from employees
where department_id <> 90;

# 查询工资在10000到20000之间的员工名、工资以及奖金
select last_name, salary, commission_pct
from employees
where salary >= 10000
  and salary <= 20000;

# 查询部门编号不是在90到110之间,或者工资高于15000的员工信息
select *
from employees
where !(department_id >= 90 and department_id <= 110)
   or salary > 15000;

# 查询没有奖金的员工名和奖金率
select *
from employees
where commission_pct IS NULL;

# 查询员工的工种编号是 IT_PROG、AD_VP、AD_PRES中的一个员工名和工种编号
select *
from employees
where job_id in ('IF_PROG', 'AD_VP', 'AD_PRES');

# 查询员工名中包含字符a的员工信息
select *
from employees
where last_name like '%a%';