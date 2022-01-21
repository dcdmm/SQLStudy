use myemployees;

# 左连接:取左边的表的全部,右边的表根据连接条件,符合的显示,不符合则显示null
# 右连接:取右边的表的全部,左边的表根据连接条件,符合的显示,不符合则显示null

select *
from departments;

select d.*, e.employee_id
from departments d
         left outer join employees e # 左外连接;departments表为主表
                         on d.`department_id` = e.`department_id`;

# 与上等价
select d.*, e.employee_id
from employees e
         right outer join departments d # 右外连接;departments表为主表
                          on d.`department_id` = e.`department_id`;
