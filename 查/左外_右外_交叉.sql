/*
 应用场景：用于查询一个表中有，另一个表没有的记录

 特点：
 1、外连接的查询结果为主表中的所有记录
	如果从表中有和它匹配的，则显示匹配的值
	如果从表中没有和它匹配的，则显示null
	外连接查询结果=内连接结果+主表中有而从表没有的记录
 2、左外连接，left join左边的是主表
    右外连接，right join右边的是主表
 3、左外和右外交换两个表的顺序，可以实现同样的效果
 4、全外连接=内连接的结果+表1中有但表2没有的+表2中有但表1没有的
 */
#引入：查询男朋友 不在男神表的的女神名

use myemployees;

#案例1：查询哪个部门没有员工
#左外
SELECT d.*, e.employee_id
FROM departments d
         LEFT OUTER JOIN employees e
                         ON d.`department_id` = e.`department_id`
WHERE e.`employee_id` IS NULL;


#右外

SELECT d.*, e.employee_id
FROM employees e
         RIGHT OUTER JOIN departments d
                          ON d.`department_id` = e.`department_id`
WHERE e.`employee_id` IS NULL;


#交叉连接

SELECT b.*, bo.*
FROM beauty b
         CROSS JOIN boys bo;
# 笛卡尔乘积

# 与上等价
select b.*, bo.*
from beauty b,
     boys bo;

# 查询哪个城市没有部门
use myemployees;
select city, d.*
from departments d
         right outer join locations l on l.location_id = d.location_id
where d.department_id is null;

# 查询部门名为SAL或IT的员工信息
select e.*, d.department_name
from departments d
         left join employees e on d.department_id = e.department_id
where d.department_name in ('SAL', 'IT');