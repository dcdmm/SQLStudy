#进阶7：子查询
/*
含义：
出现在其他语句中的select语句，称为子查询或内查询
外部的查询语句，称为主查询或外查询

分类：
按子查询出现的位置：
	select后面：
		仅仅支持标量子查询

	from后面：
		支持表子查询
	where或having后面：★
		标量子查询（单行） √
		列子查询  （多行） √

		行子查询

	exists后面（相关子查询）
		表子查询
按结果集的行列数不同：
	标量子查询（结果集只有一行一列）
	列子查询（结果集只有一列多行）
	行子查询（结果集有一行多列）
	表子查询（结果集一般为多行多列）
*/
#一、where或having后面
/*
1、标量子查询（单行子查询）
2、列子查询（多行子查询）

3、行子查询（多列多行）

特点：
①子查询放在小括号内
②子查询一般放在条件的右侧
③标量子查询，一般搭配着单行操作符使用
> < >= <= = <>

列子查询，一般搭配着多行操作符使用
in、any/some、all

④子查询的执行优先于主查询执行，主查询的条件用到了子查询的结果
*/


#1.标量子查询★

#案例1：谁的工资比 Abel 高?

use myemployees;
#①查询Abel的工资
SELECT salary
FROM employees
WHERE last_name = 'Abel';

#②查询员工的信息，满足 salary>①结果
SELECT *
FROM employees
WHERE salary > (
    SELECT salary
    FROM employees
    WHERE last_name = 'Abel'
);

#案例2：返回job_id与141号员工相同，salary比143号员工多的员工 姓名，job_id 和工资

#①查询141号员工的job_id
SELECT job_id
FROM employees
WHERE employee_id = 141;

#②查询143号员工的salary
SELECT salary
FROM employees
WHERE employee_id = 143;

#③查询员工的姓名，job_id 和工资，要求job_id=①并且salary>②

SELECT last_name, job_id, salary
FROM employees
WHERE job_id = (
    SELECT job_id
    FROM employees
    WHERE employee_id = 141
)
  AND salary > (
    SELECT salary
    FROM employees
    WHERE employee_id = 143
);

#案例3：返回公司工资最少的员工的last_name,job_id和salary

#①查询公司的 最低工资
SELECT MIN(salary)
FROM employees;

#②查询last_name,job_id和salary，要求salary=①
SELECT last_name, job_id, salary
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);

#案例4：查询最低工资大于50号部门最低工资的部门id和其最低工资

#①查询50号部门的最低工资
SELECT MIN(salary)
FROM employees
WHERE department_id = 50;

#②查询每个部门的最低工资

SELECT MIN(salary), department_id
FROM employees
GROUP BY department_id;


#③ 在②基础上筛选，满足min(salary)>①
SELECT MIN(salary), department_id
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (
    SELECT MIN(salary)
    FROM employees
    WHERE department_id = 50 # 子查询优先于主查询
);


#2.列子查询（多行子查询）★
#案例1：返回location_id是1400或1700的部门中的所有员工姓名

#①查询location_id是1400或1700的部门编号
SELECT DISTINCT department_id
FROM departments
WHERE location_id IN (1400, 1700);

#②查询员工姓名，要求部门号是①列表中的某一个
# IN/NOT IN/ANY|SOME/ALL
SELECT last_name
FROM employees
WHERE department_id in (
    SELECT DISTINCT department_id
    FROM departments
    WHERE location_id IN (1400, 1700)
);


#案例2：返回其它工种中比job_id为‘IT_PROG’工种任一工资低的员工的员工号、姓名、job_id 以及salary

#①查询job_id为‘IT_PROG’部门任一工资

SELECT DISTINCT salary
FROM employees
WHERE job_id = 'IT_PROG';

#②查询员工号、姓名、job_id 以及salary，salary<(①)的任意一个
SELECT last_name, employee_id, job_id, salary
FROM employees
WHERE salary < ANY (
    SELECT DISTINCT salary
    FROM employees
    WHERE job_id = 'IT_PROG'
)
  AND job_id <> 'IT_PROG';
# 其他工种

#或
SELECT last_name, employee_id, job_id, salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
    WHERE job_id = 'IT_PROG'
)
  AND job_id <> 'IT_PROG';

#案例3：返回其它部门中比job_id为‘IT_PROG’部门所有工资都低的员工   的员工号、姓名、job_id 以及salary

SELECT last_name, employee_id, job_id, salary
FROM employees
WHERE salary < ALL (
    SELECT DISTINCT salary
    FROM employees
    WHERE job_id = 'IT_PROG'
)
  AND job_id <> 'IT_PROG';

#或

SELECT last_name, employee_id, job_id, salary
FROM employees
WHERE salary < (
    SELECT MIN(salary)
    FROM employees
    WHERE job_id = 'IT_PROG'
)
  AND job_id <> 'IT_PROG';


#3、行子查询（结果集一行多列或多行多列）

#案例：查询员工编号最小并且工资最高的员工信息

# 行字查询
SELECT *
FROM employees
WHERE (employee_id, salary) = (
    SELECT MIN(employee_id), MAX(salary)
    FROM employees # 一样的操作符去比较
);

#①查询最小的员工编号
SELECT MIN(employee_id)
FROM employees;


#②查询最高工资
SELECT MAX(salary)
FROM employees;


#③查询员工信息
SELECT *
FROM employees
WHERE employee_id = (
    SELECT MIN(employee_id)
    FROM employees
)
  AND salary = (
    SELECT MAX(salary)
    FROM employees
);

# 作业_____________________________________________________________
# 查询和Zlotkey相同部门的员工姓名和工资
# 1. 查询Zlotkey的部门
select department_id
from employees
where last_name = 'Zlotkey';
# 2. 查询部门号=1的姓名和工资
select last_name, salary
from employees
where department_id = (select department_id
                       from employees
                       where last_name = 'Zlotkey');

# 查询各部门中工资比本部门平均工资高的员工的员工号,姓名,工资
# 1.查询各部门的平均工资
select AVG(salary)
from employees
group by department_id;

select employee_id, last_name, salary
from employees e
         inner join (select AVG(salary) ag, department_id
                     from employees
                     group by department_id) ag_dep
                    on e.department_id = ag_dep.department_id
where salary > ag_dep.ag;

# 查询管理者是K_ing的员工姓名和工资
select employee_id
from employees
where last_name = 'K_ing';

select last_name, salary
from employees
where manager_id in (select employee_id
                     from employees
                     where last_name = 'K_ing');


# 查询工资最高的员工的姓名,要求first_name和last_name显示为一列
select MAX(salary)
from employees;

select concat(first_name, last_name) "姓名"
from employees
where salary = (select MAX(salary)
                from employees);