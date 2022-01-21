# Return the length of a string in bytes
select length('python');
select length('中国加油');

# Return concatenated string
select concat('My', 'S', 'QL');


use myemployees;


select concat(first_name, ',', last_name)
from employees;

select upper('duanchao'); # 全部转换为大写
select lower('DUANCHAO'); # 全部转换为小写

# Return the substring as specified
# 索引从1开始,而不是0
select substr('duanchao', 3); # 从索引3到结尾
select substr('duanchao', 2, 4); # 从索引2开始截取4个字符

select instr('duanchao', 'chao'); # 返回`chao`在`duanchao`中的第一次出现的索引
select instr('duanchao', '4chao'); # `4chao`不在`duanchao`中,返回0

/*
 LPAD(str,len,padstr)

Returns the string str, left-padded with the string padstr to a length of len characters.
If str is longer than len, the return value is shortened to len characters.
 */
select lpad('duanchao', 10, '*');
select rpad('duanchao', 10, '*'); # 右填充

select trim(' duanchao '); # 去除前后空白字符(默认)
select trim('a1' from 'a1a1a1a1aaaaaaduanchaoaaaaaa1a1a1a1') as s; # 指定去除前后的`a1`

select replace('duanchaoduanchao', 'chao', 'mengmeng'); # 将所有的`chao`替换为'mengmeng'

