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

select substr('duanchao', 2, 4); # 从2开始,截取4个字符长度

# instr

select instr('duanchao', 'chao'); # 返回chao在duanchao中的第一次出现的索引

select instr('duanchao', '4chao'); # 4chao不在duanchao中,返回0

select trim(' duanchao '); # 去除前后空白字符

select trim('a' from 'aaaaaaaaaaaduanchaoaaaaaaaaa') as s; # 去除前后的字符a

select lpad('duanchao', 20, '*'); # 用'*'左填充指定长度字符

select rpad('duanchao', 20, '*'); # 用'*'右填充指定长度字符

select replace('duanchao', 'chao', 'mengmeng'); # 所有的chao替换为'mengmeng'

# 数学函数