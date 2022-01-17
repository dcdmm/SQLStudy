use girls;
/*
含义：又称多表查询，当查询的字段来自于多个表时，就会用到连接查询

笛卡尔乘积现象：表1 有m行，表2有n行，结果=m*n行

发生原因：没有有效的连接条件
如何避免：添加有效的连接条件

分类：

	按年代分类：
	sql92标准:仅仅支持内连接
	sql99标准【推荐】：支持内连接+外连接（左外和右外）+交叉连接

	按功能分类：
		内连接：
			等值连接
			非等值连接
			自连接
		外连接：
			左外连接
			右外连接
			全外连接

		交叉连接


*/
# 多表查询

SELECT *
FROM beauty;

SELECT *
FROM boys;

# 笛卡尔乘积现象
SELECT NAME, boyName
FROM boys,
     beauty; # 没有有效的连接条件

SELECT NAME, boyName
FROM boys,
     beauty
WHERE beauty.boyfriend_id = boys.id;
# 连接条件,指明id

# 等值连接
#案例1：查询女神名和对应的男神名
SELECT NAME, boyName
FROM boys,
     beauty
WHERE beauty.boyfriend_id = boys.id;


#案例2：查询员工名和对应的部门名
select last_name, department_name
from employees,
     departments
where employees.department_id = departments.department_id;

#2、为表起别名
/*
①提高语句的简洁度
②区分多个重名的字段

注意：如果为表起了别名，则查询的字段就不能使用原来的表名去限定

*/
#查询员工名、工种号、工种名
select last_name, employees.job_id, job_title
from employees,
     jobs
where employees.job_id = jobs.job_id;

# 如果起了别名,则不能使用原来的表名
select last_name, e.job_id, job_title
from employees as e, # 给表起别名
     jobs as j
where e.job_id = j.job_id;


#3、两个表的顺序是否可以调换

#查询员工名、工种号、工种名

SELECT e.last_name, e.job_id, j.job_title
FROM jobs j,
     employees e
WHERE e.`job_id` = j.`job_id`;
# 可以调换顺序

#4、可以加筛选


#案例：查询有奖金的员工名、部门名

SELECT last_name, department_name, commission_pct

FROM employees e,
     departments d
WHERE e.`department_id` = d.`department_id`
  AND e.`commission_pct` IS NOT NULL;

#案例2：查询城市名中第二个字符为o的部门名和城市名

SELECT department_name, city
FROM departments d,
     locations l
WHERE d.`location_id` = l.`location_id`
  AND city LIKE '_o%';

#5、可以加分组


#案例1：查询每个城市的部门个数

SELECT COUNT(*) 个数, city
FROM departments d,
     locations l
WHERE d.`location_id` = l.`location_id`
GROUP BY city;


#案例2：查询有奖金的每个部门的部门名和部门的领导编号和该部门的最低工资
SELECT department_name, d.`manager_id`, MIN(salary)
FROM departments d,
     employees e
WHERE d.`department_id` = e.`department_id`
  AND commission_pct IS NOT NULL
GROUP BY department_name, d.`manager_id`;
#6、可以加排序


#案例：查询每个工种的工种名和员工的个数，并且按员工个数降序

SELECT job_title, COUNT(*)
FROM employees e,
     jobs j
WHERE e.`job_id` = j.`job_id`
GROUP BY job_title
ORDER BY COUNT(*) DESC;

#7、可以实现三表连接？

#案例：查询员工名、部门名和所在的城市

SELECT last_name, department_name, city
FROM employees e,
     departments d,
     locations l
WHERE e.`department_id` = d.`department_id`
  AND d.`location_id` = l.`location_id`
  AND city LIKE 's%'
ORDER BY department_name DESC;

