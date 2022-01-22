use myemployees;


# 支持标量子查询、列子查询、表子查询

# 谁的工资比Abel高?
# A. 查询Abel的工资
# 查询结果为标量
select salary
from employees
where last_name = 'Abel';

# B. 查询员工的信息,满足 salary>`A`的结果
# 标量子查询:结果集只有一行一列
select last_name
from employees
where salary > (select salary
                from employees
                where last_name = 'Abel');

# 返回job_id与141号员工相同,salary比143号员工多的员工的姓名、job_id、和工资
# A. 查询141号员工的job_id
select job_id
from employees
where employee_id = 141;

# B. 查询143号员工的salary
select salary
from employees
where employee_id = 143;

# C. 查询员工的姓名、job_id和工资,要求job_id=`A`并且salary>`B`
select last_name, job_id, salary
from employees
where job_id = (select job_id
                from employees
                where employee_id = 141)
  and salary = (select salary
                from employees
                where employee_id = 143);

# 查询最低工资大于50号部门最低工资的部门id和其最低工资
# A. 查询50号部门的最低工资
select min(salary)
from employees
where department_id = 50;

# B. 查询每个部门的最低工资
select min(salary), department_id
from employees
group by department_id;

# C. 在`B`基础上筛选,满足min(salary)>`A'
select min(salary), department_id
from employees
group by department_id
having min(salary) > (select min(salary)
                      from employees
                      where department_id = 50);

# 查询员工编号最小并且工资最高的员工信息
# 行子查询:结果集有一行多列
select *
from employees
where (employee_id, salary) = (
    select min(employee_id), max(salary)
    from employees
);

# 查询各部门中工资比本部门平均工资高的员工的员工号、姓名、工资
# A. 查询各部门的平均工资
select avg(salary)
from employees
group by department_id;

# 行子查询:结果集有一行多列
select employee_id, last_name, salary
from employees e
         inner join (select avg(salary) ag, department_id
                     from employees
                     group by department_id) ag_dep
                    on e.department_id = ag_dep.department_id
where salary > ag_dep.ag;