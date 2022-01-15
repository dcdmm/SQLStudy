#进阶4：常见函数

/*

概念：类似于java的方法，将一组逻辑语句封装在方法体中，对外暴露方法名
好处：1、隐藏了实现细节  2、提高代码的重用性
调用：select 函数名(实参列表) 【from 表】;
特点：
	①叫什么（函数名）
	②干什么（函数功能）

分类：
	1、单行函数
	如 concat、length、ifnull等
	2、分组函数

	功能：做统计使用，又称为统计函数、聚合函数、组函数

常见函数：
	一、单行函数
	字符函数：
	length:获取字节个数(utf-8一个汉字代表3个字节,gbk为2个字节)
	concat
	substr
	instr
	trim
	upper
	lower
	lpad
	rpad
	replace

	数学函数：
	round
	ceil
	floor
	truncate
	mod

	日期函数：
	now
	curdate
	curtime
	year
	month
	monthname
	day
	hour
	minute
	second
	str_to_date
	date_format
	其他函数：
	version
	database
	user
	控制函数
	if
	case
*/

use myemployees;

# 字符函数
select length("hello world");

show variables like "%char%";

# 中文在UTF中3个
select length("中国"); # 字节个数(只有这个地方是字节)

select CONCAT(first_name, ',', last_name)
from employees;

# upper,lower
select upper("duanchao"); # 大写
select lower("DUANCHAO");
# 小写

# substr或substring
select substr('duanchao', 3); # 索引从1开始,而不是0;3到结尾

select substr('duanchao', 2, 4);
# 从2开始,截取4个字符长度

# instr

select instr('duanchao', 'chao'); # 返回chao在duanchao中的第一次出现的索引

select instr('duanchao', '4chao'); # 4chao不在duanchao中,返回0

select trim(' duanchao '); # 去除前后空白字符

select trim('a' from 'aaaaaaaaaaaduanchaoaaaaaaaaa') as s; # 去除前后的字符a

select lpad('duanchao', 20, '*'); # 用'*'左填充指定长度字符

select rpad('duanchao', 20, '*'); # 用'*'右填充指定长度字符

select replace('duanchao', 'chao', 'mengmeng');
# 所有的chao替换为'mengmeng'

# 数学函数
select ROUND(3.1234); # 四舍五入
SELECT round(23.41324, 2); # 保留两位

select ceil(2.1234); # 向上取整
select floor(1.234234); # 向下取整

select truncate(1.2999, 2); # 截断保留2位

SELECT 10 % 3;
select MOD(10, 3);
# 取余,与上等价


# 日期函数
#curdate 返回当前系统日期，不包含时间
SELECT CURDATE();

#curtime 返回当前时间，不包含日期
SELECT CURTIME();

SELECT YEAR(NOW());
select YEAR('2002-1-2');

SELECT YEAR(hiredate)
FROM employees;


SELECT MONTH(NOW());
SELECT MONTHNAME(NOW()); # 英文月
select MONTH('2021-01-2');

SELECT DAY(NOW());
SELECT HOUR(NOW());
SELECT MINUTE(NOW());
SELECT SECOND(NOW());


/*
%Y四位的年份
%y2位的年份
%m月份（01,02…11,12）
%c月份（1,2,…11,12）
%d日（01,02,…）
%H小时（24小时制）
%h小时（12小时制）
%i分钟（00,01…59）
%s秒（00,01,…59）
 */
# #str_to_date 将字符通过指定的格式转换成日期
SELECT STR_TO_DATE('1998-3-2', '%Y-%c-%d') AS out_put;

#查询入职日期为1992--4-3的员工信息
SELECT *
FROM employees
WHERE hiredate = STR_TO_DATE('4-3 1992', '%c-%d %Y');

#date_format 将日期转换成字符
SELECT DATE_FORMAT(NOW(), '%y年%m月%d日') AS out_put;


#查询有奖金的员工名和入职日期(xx月/xx日 xx年)
SELECT last_name, DATE_FORMAT(hiredate, '%m月/%d日 %y年') 入职日期
FROM employees
WHERE commission_pct IS NOT NULL;

# 其他函数

SELECT VERSION();
SELECT DATABASE(); # 当前数据库
SELECT USER();
# 当前用户

# 流程控制函数

#1.if函数： if else 的效果


SELECT IF(10 < 5, '大', '小'); #满足==>大,不满足==>小

select last_name, commission_pct, if(commission_pct is null, 'aa', 'bb')
from employees;

/*
java中
switch(变量或表达式){
	case 常量1：语句1;break;
	...
	default:语句n;break;


}

mysql中

case 要判断的字段或表达式
when 常量1 then 要显示的值1或语句1;
when 常量2 then 要显示的值2或语句2;
...
else 要显示的值n或语句n;
end
*/

/*案例：查询员工的工资，要求

部门号=30，显示的工资为1.1倍
部门号=40，显示的工资为1.2倍
部门号=50，显示的工资为1.3倍
其他部门，显示的工资为原工资

*/

SELECT salary AS 原始工资,
       department_id,
       CASE department_id
           WHEN 30 THEN salary * 1.1
           WHEN 40 THEN salary * 1.2
           WHEN 50 THEN salary * 1.3
           ELSE salary
           END AS 新工资
FROM employees;

#3.case 函数的使用二：类似于 多重if
/*
java中：
if(条件1){
	语句1；
}else if(条件2){
	语句2；
}
...
else{
	语句n;
}

mysql中：

case
when 条件1 then 要显示的值1或语句1
when 条件2 then 要显示的值2或语句2
。。。
else 要显示的值n或语句n
end
*/

#案例：查询员工的工资的情况
/*
 如果工资>20000,显示A级别
如果工资>15000,显示B级别
如果工资>10000，显示C级别
否则，显示D级别
 */



SELECT salary,
CASE
WHEN salary>20000 THEN 'A'
WHEN salary>15000 THEN 'B'
WHEN salary>10000 THEN 'C'
ELSE 'D'
END AS 工资级别
FROM employees;