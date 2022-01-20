use myemployees;

# sum/avg/min/max/min计算时自动忽略NULL值

# Return the sum
# If there are no matching rows, SUM() returns NULL.
# SUM([DISTINCT] expr) [over_clause]
SELECT sum(salary)
FROM employees;
# Return the average value of the argument
# If there are no matching rows, AVG() returns NULL.
# AVG([DISTINCT] expr) [over_clause]
SELECT avg(salary)
FROM employees;
# Return the minimum value
# If there are no matching rows, MIN() returns NULL.
# MIN([DISTINCT] expr) [over_clause]
SELECT min(salary)
FROM employees;
# Return the maximum value
# If there are no matching rows, MAX() returns NULL.
# MAX([DISTINCT] expr) [over_clause]
SELECT max(salary)
FROM employees;

# Return a count of the number of rows returned
SELECT count(salary)
FROM employees;


# it returns a count of the number of rows retrieved, whether or not they contain NULL values.
# InnoDB handles SELECT COUNT(*) and SELECT COUNT(1) operations in the same way. There is no performance difference.
select count(*)
from employees; # 统计个数
select count(1)
from employees; # 统计个数