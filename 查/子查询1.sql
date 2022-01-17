#二、select后面
/*
仅仅支持标量子查询
*/

#案例：查询每个部门的员工个数
use myemployees;

SELECT d.*,
       (
           SELECT COUNT(*)
           FROM employees e
           WHERE e.department_id = d.`department_id`
       ) 个数
FROM departments d;


#案例2：查询员工号=102的部门名
SELECT (
           SELECT department_name
           FROM departments d
                    INNER JOIN employees e
                               ON d.department_id = e.department_id
           WHERE e.employee_id = 102
       ) 部门名;



#三、from后面
/*
将子查询结果充当一张表，要求必须起别名
*/

#案例：查询每个部门的平均工资的工资等级
#①查询每个部门的平均工资
SELECT AVG(salary), department_id
FROM employees
GROUP BY department_id;


SELECT *
FROM job_grades;


#②连接①的结果集和job_grades表，筛选条件平均工资 between lowest_sal and highest_sal

SELECT ag_dep.*, g.`grade_level`
FROM (
         SELECT AVG(salary) ag, department_id
         FROM employees
         GROUP BY department_id
     ) ag_dep
         INNER JOIN job_grades g
                    ON ag_dep.ag BETWEEN lowest_sal AND highest_sal;


#四、exists后面（相关子查询）

/*
语法：
exists(完整的查询语句)
结果：
1或0



*/
# 子查询的值有没有值
SELECT EXISTS(SELECT employee_id FROM employees); # 存在结果为1
SELECT EXISTS(SELECT employee_id FROM employees WHERE salary = 300000);
# 不存在结果为0

#案例1：查询有员工的部门名
#in
SELECT department_name
FROM departments d
WHERE d.`department_id` IN (
    SELECT department_id
    FROM employees
);

#exists

# 相关子查询
SELECT department_name
FROM departments d
WHERE EXISTS(
              SELECT *
              FROM employees e
              WHERE d.`department_id` = e.`department_id`
          );


#案例2：查询没有女朋友的男神信息

#in

use girls;
SELECT bo.*
FROM boys bo
WHERE bo.id NOT IN (
    SELECT boyfriend_id
    FROM beauty
);

#exists
SELECT bo.*
FROM boys bo
WHERE NOT EXISTS(
        SELECT boyfriend_id
        FROM beauty b
        WHERE bo.`id` = b.`boyfriend_id`
    );