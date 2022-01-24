use myemployees;

# 将子查询结果充当一张表(要求必须起别名)

# 查询每个部门的平均工资的工资等级
select ag_dep.*, g.`grade_level`
from (
         select avg(salary) ag, department_id
         from employees
         group by department_id
     ) as ag_dep # 别名
         join job_grades g
                    on ag_dep.ag between lowest_sal and highest_sal;
