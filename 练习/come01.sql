use myemployees;

select * from employees;

select * from employees where commission_pct like '%%' and last_name like '%%';

# 两者不一样===>判断的字段有null值