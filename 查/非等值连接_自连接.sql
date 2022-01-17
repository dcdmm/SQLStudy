use myemployees;

#查询员工的工资级别

# 非等职连接
SELECT salary, grade_level
FROM employees e
         JOIN job_grades g
              ON e.`salary` BETWEEN g.`lowest_sal` AND g.`highest_sal`; # 不是等于

# 与上等价
SELECT salary, grade_level
FROM employees e,
     job_grades g
where e.`salary` BETWEEN g.`lowest_sal` AND g.`highest_sal`;


#3、自连接


#案例：查询 员工名和上级的名称

SELECT e.employee_id, e.last_name, m.employee_id, m.last_name
FROM employees e,
     employees m
WHERE e.`manager_id` = m.`employee_id`;

