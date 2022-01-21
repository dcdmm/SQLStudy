use myemployees;


# 查询部门编号>90或邮箱包含a的员工信息
select *
from employees
where email like '%a%'
   or department_id > 90;

# 与上等价
select *
from employees
where email like '%a%'
# UNION combines the result from multiple SELECT statements into a single result set
# Selected columns listed in corresponding positions of each SELECT statement should have the same data type.
# By default, duplicate rows are removed from UNION results.
# The optional DISTINCT keyword has the same effect but makes it explicit.
# With the optional ALL keyword, duplicate-row removal does not occur and the result includes all matching rows from all the SELECT statements.
union
select *
from employees
where department_id > 90;