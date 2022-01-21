use myemployees;


# 内连接:也称为等值连接,返回两张表都满足条件的部分

# 查询名字中包含e的员工名和工种名
select last_name, job_title
from employees e
         # where语句前
         # inner join可以省略为join
         inner join jobs j on e.job_id = j.job_id # on后面为连接条件(结合比较运算符)
where e.last_name like '%e%';

# 查询部门个数>3的城市名和部门个数
select city, count(*)  '部门个数'
from departments d
         inner join locations l
                    on d.`location_id` = l.`location_id`
group by city
having count(*) > 3;

# 查询员工名、部门名、工种名(三表连接)
select last_name, department_name, job_title
from employees e
         join departments d on e.`department_id` = d.`department_id` # 先连接e和d,然后将e,d连接的结果与j相连
         join jobs j on e.`job_id` = j.`job_id`;

# 查询工资级别的个数>20的个数,并且按工资级别降序
select count(*), grade_level
from employees e
         join job_grades g
              on e.`salary` between g.`lowest_sal` and g.`highest_sal`
group by grade_level
having count(*) > 20
order by grade_level desc;
