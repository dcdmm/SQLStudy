select concat("a", "b", "c");

select concat(1, 2, 3) as 'ffff';  # 类型为字符型

use myemployees;

# 连接字符串
select concat(last_name, first_name) as "姓名" from employees;
