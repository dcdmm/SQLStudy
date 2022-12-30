use myemployees;

# sum/avg/min/max/min计算时自动忽略NULL值

# Return the sum
# If there are no matching rows, SUM() returns NULL.
# SUM([DISTINCT] expr) [over_clause]
select sum(salary)
from employees;
# Return the average value of the argument
# If there are no matching rows, AVG() returns NULL.
# AVG([DISTINCT] expr) [over_clause]
select avg(salary)
from employees;
# Return the minimum value
# If there are no matching rows, MIN() returns NULL.
# MIN([DISTINCT] expr) [over_clause]
select min(salary)
from employees;
# Return the maximum value
# If there are no matching rows, MAX() returns NULL.
# MAX([DISTINCT] expr) [over_clause]
select max(salary)
from employees;

# Return a count of the number of rows returned
select count(salary)
from employees;

# it returns a count of the number of rows retrieved, whether or not they contain NULL values.
# InnoDB handles select COUNT(*) and select COUNT(1) operations in the same way. There is no performance difference.
select count(*)
from employees; # 统计个数
select count(1)
from employees; # 统计个数