use myemployees;

# 查询每个部门的平均工资
select avg(salary)
from employees
group by job_id;


#案例2：查询每个位置的部门个数

SELECT COUNT(*), location_id
FROM departments
GROUP BY location_id;

#2、可以实现分组前的筛选

#案例1：查询邮箱中包含a字符的 每个部门的最高工资

select max(salary), department_id
from employees
where email like '%a%'
group by department_id;

#案例2：查询有奖金的每个领导手下员工的平均工资
select avg(salary)
from employees
where commission_pct is not null
group by manager_id;