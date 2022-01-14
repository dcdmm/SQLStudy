use myemployees;
# #案例1：查询工资z在10000到20000之间的员工名、工资以及奖金

select last_name, salary, commission_pct
from employees
where salary >= 10000
  and salary <= 20000;


#案例2：查询部门编号不是在90到110之间，或者工资高于15000的员工信息

select *
from employees
where department_id<90 or department_id >110 or salary>15000;

select *
from employees
where NOT(department_id>=90 and department_id <=110) or salary>15000; # 通过NOT函数
