use myemployees;

# 查询员工和其上级的名称
SELECT e.employee_id,
       e.last_name,
       m.employee_id,
       m.last_name
# 把一张表当成两张表来使用,然后再做"多表查询"
FROM employees e,
     employees m
WHERE e.`manager_id` = m.`employee_id`;