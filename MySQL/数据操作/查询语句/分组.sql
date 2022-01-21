use myemployees;


# 参考python pandas库groupby函数

# 查询每个部门的平均工资
select avg(salary) # 结合聚合函数
from employees
group by job_id;


# 查询每个位置的部门个数
select count(*), location_id
from departments
group by location_id;

# 查询邮箱中包含a字符的每个部门的最高工资
select max(salary), department_id
from employees
where email like '%a%' # 分组前的筛选
# where语句之后
group by department_id;


# 查询哪个部门的员工个数>2
select count(*)
from employees
group by department_id
# 分组后的筛选;gropu by语句之后
having count(*) > 2;


# 领导编号>102的每个领导手下的最低工资大于5000的领导编号和最低工资
select manager_id, min(salary)
from employees
where manager_id
group by manager_id
having min(salary) > 5000;

# 按员工名字的长度分组,筛选员工个数>5的分组有哪些
select length(last_name)
from employees
group by length(last_name)
having COUNT(*) > 5;

# 查询每个工种每个部门的最低工资,并按最低工资降序
SELECT MIN(salary), job_id, department_id
FROM employees
# 按多个字段分组
GROUP BY department_id, job_id # 调换顺序结果一样
ORDER BY MIN(salary) DESC;
