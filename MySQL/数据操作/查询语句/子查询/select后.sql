use myemployees;


# 仅支持标量子查询(结果集只有一行一列)

# 查询每个部门的员工个数
select d.department_id,
       (
           select count(*)
           from employees e
           where e.department_id = d.department_id
       ) '个数'
from departments d;

# 查询员工号=102的部门名
select (
           select department_name
           from departments d
                    join employees e
                         on d.department_id = e.department_id
           where e.employee_id = 102
       ) '部门名';