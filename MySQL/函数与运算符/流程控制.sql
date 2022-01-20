/*
Name	    Description
CASE	    Case operator
IF()	    If/else construct
IFNULL()	Null if/else construct
NULLIF()	Return NULL if expr1 = expr2
 */

select case 1
           when 1 then 'one' # 若1=1
           when 2 then 'two' # 若1=2
           else 'more' # 其他
           end as 'result';

select case 1
           when 1 > 0 then '正数' # 1>0?
           when 1 < 0 then '负数' # 1<0?
           else '0' # else
           end as 'result';


use myemployees;


select salary,
       department_id,
       case department_id
           when 30 then salary * 1.1
           when 40 then salary * 1.2
           when 50 then salary * 1.3
           ELSE salary
           end AS `new salary`
from employees;


select salary,
       case
           when salary > 20000 then 'A'
           when salary > 15000 then 'B'
           when salary > 10000 then 'C'
           else 'D'
           end as 'salary degree'
FROM employees;

select if(1 < 2, 'yes', 'no') as `result`;

# IFNULL(expr1, expr2)
# If expr1 is not NULL, IFNULL() returns expr1; otherwise it returns expr2.
select ifnull(1, 0);
select ifnull(NULL, 10);
select ifnull(1/0,'yes')