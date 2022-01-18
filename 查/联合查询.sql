# 联合查询

#进阶9：联合查询
/*
union 联合 合并：将多条查询语句的结果合并成一个结果

语法：
查询语句1
union
查询语句2
union
...


应用场景：
要查询的结果来自于多个表，且多个表没有直接的连接关系，但查询的信息一致时

特点：★
1、要求多条查询语句的查询列数是一致的！
2、要求多条查询语句的查询的每一列的类型和顺序最好一致
3、union关键字默认去重，如果使用union all 可以包含重复项
*/


#引入的案例：查询部门编号>90或邮箱包含a的员工信息
use myemployees;
SELECT *
FROM employees
WHERE email LIKE '%a%'
   OR department_id > 90;

# 70row
SELECT *
FROM employees
WHERE email LIKE '%a%'
UNION ALL
SELECT *
FROM employees
WHERE department_id > 90;

# 62row
SELECT *
FROM employees
WHERE email LIKE '%a%';

# 8row
SELECT *
FROM employees
WHERE department_id > 90;