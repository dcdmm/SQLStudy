/*
语法：
select 查询列表
from 表名
【where  筛选条件】
order by 排序的字段或表达式;


特点：
1、asc代表的是升序，可以省略
desc代表的是降序

2、order by子句可以支持 单个字段、别名、表达式、函数、多个字段

3、order by子句在查询语句的最后面，除了limit子句

*/

use myemployees;

#1、按单个字段排序
SELECT *
FROM employees
ORDER BY salary DESC; # 从高到底

SELECT *
FROM employees
ORDER BY salary ASC;
# 从低到高(默认)

#案例：查询部门编号>=90的员工信息，入职时间先后排序

select *
from employees
where department_id >= 90
order by hiredate;

#3、按表达式排序
#案例：查询员工信息 按年薪降序

select *, salary * 12 * (1 + IFNULL(commission_pct, 0)) as '年薪'
from employees
order by salary * 12 * (1 + IFNULL(commission_pct, 0)) DESC;

# 与上等价
select *, salary * 12 * (1 + IFNULL(commission_pct, 0)) as '年薪'
from employees
order by '年薪' DESC;

# 按函数排序
#案例：查询员工名，并且按名字的长度降序
select last_name
from employees
order by length(last_name);

# #案例：查询员工信息，要求先按工资降序，再按employee_id升序
select *
from employees
order by salary, employee_id DESC;  # 如果工资一样,然后再按employee_id排序