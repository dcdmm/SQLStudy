/*
like



between and
in
is null|is not null

like 的使用:
①一般和通配符搭配使用
	通配符：
	% 任意多个字符,包含0个字符
	_ 任意单个字符
*/
use myemployees;
# 案例1：查询员工名中包含字符a的员工信息
select *
from employees
where last_name like '%a%';

#案例2：查询员工名中第三个字符为n，第五个字符为l的员工名和工资

select last_name, salary
from employees
where last_name like '__n_l%';

# #案例3：查询员工名中第二个字符为_的员工名

select last_name
from employees
where last_name like '_\_%';
# 通过'\'转义_

# 与上等价
select last_name
from employees
where last_name like '_$_%' escape '$';
# 通过转移符号为'$'

select * from employees where department_id like '1__'; # like可以用在数值型中


/*
 ①使用between and 可以提高语句的简洁度
②包含临界值
③两个临界值不要调换顺序
 */
#案例1：查询员工编号在100到120之间的员工信息
select *
from employees
where employee_id between 100 and 120;
# 表示[100, 120]


/*
含义：判断某字段的值是否属于in列表中的某一项
特点：
	①使用in提高语句简洁度
	②in列表的值类型必须一致或兼容
	③in列表中不支持通配符
*/
#案例：查询员工的工种编号是 IT_PROG、AD_VP、AD_PRES中的一个员工名和工种编号
select *
from employees
where job_id in ('IF_PROG', 'AD_VP', 'AD_PRES');


/*
=或<>不能用于判断null值
is null或is not null 可以判断null值
*/

#案例1：查询没有奖金的员工名和奖金率

select *
from employees where commission_pct IS NULL;  # 判断是否为null

select * from employees where commission_pct is not null;


#安全等于  <=>
# #案例1：查询没有奖金的员工名和奖金率
SELECT last_name,
       commission_pct
FROM employees
WHERE commission_pct <=> NULL; # 判断NULL值

#案例2：查询工资为12000的员工信息
SELECT last_name,
       salary
FROM employees
WHERE salary <=> 12000; # 还可以判断普通类型的值


#is null pk <=>

# IS NULL:仅仅可以判断NULL值，可读性较高，建议使用
# <=>    :既可以判断NULL值，又可以判断普通的数值，可读性较低


