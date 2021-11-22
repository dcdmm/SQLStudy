use myemployees;

# 是否为空
select ifnull(commission_pct, 0) as 'dsf', commission_pct
from employees;