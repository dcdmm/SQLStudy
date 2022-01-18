use myemployees;

# 查询工资最低的员工信息:last_name,salary
select min(salary)
from employees;

select *
from employees
where salary = (select min(salary)
                from employees);

# 查询工资最低的部门信息
select avg(salary)
from employees
group by department_id;

select department_id
from employees
group by department_id
order by avg(salary)
limit 1;

select *
from departments
where department_id = (select department_id
                       from employees
                       group by department_id
                       order by avg(salary)
                       limit 1);

# 查询平均工资最高的job信息
select avg(salary), job_id
from employees
group by job_id;

select avg(salary), job_id
from employees
group by job_id
order by avg(salary) desc
limit 1;

select *
from jobs
where job_id = (select job_id
                from employees
                group by job_id
                order by avg(salary) desc
                limit 1);

# 查询平均工资高于公司平均工资的部门有哪些?
select avg(salary)
from employees
group by department_id;

select avg(salary), department_id
from employees
group by department_id
having avg(salary) > (select avg(salary)
                      from employees);

# 查询出公司中所有manager的详细信息
select distinct manager_id
from employees;

select *
from employees
where employee_id in (select distinct manager_id
                      from employees);
# 各个部门中,最高工资中最低的那个部门,最低工资是多少
select max(salary), department_id # department_id就一条信息
from employees
group by department_id
order by max(salary)
limit 1;
# 查询哪个部门的最高=1
select min(salary)
from employees
where department_id = (select department_id
                       from employees
                       group by department_id
                       order by max(salary)
                       limit 1);