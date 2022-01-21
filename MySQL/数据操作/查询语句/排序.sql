use myemployees;


select salary, last_name
from employees
# having语句之后
order by salary desc; # 从高到底

select salary, last_name
from employees
# 从低到高(默认)
order by salary asc;

# 查询员工名,并且按名字的长度降序
select last_name
from employees
order by length(last_name);

# 查询员工信息,要求先按工资降序，再按employee_id升序
select *
from employees
order by salary desc, employee_id asc; # 如果工资一样,然后再按employee_id排序