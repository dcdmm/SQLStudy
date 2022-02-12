/*
>	    Greater than operator
>=	    Greater than or equal operator
<	    Less than operator
<>, !=	Not equal operator
<=      Less than or equal operator
<=>	    NULL-safe equal to operator
=	    Equal operator
BETWEEN ... AND ...     Whether a value is within a range of values
IN()                    Whether a value is within a set of values
NOT IN()	            Whether a value is not within a set of values
IS NOT NULL             NOT NULL value test
IS NULL                 NULL value test
LIKE	                Simple pattern matching
 */

select 1 = NULL; # 不能比较NULL
select 1 = 0; # 0(False)

# 时间类型比较
select str_to_date('1998-3-2', '%Y-%c-%d') > str_to_date('1998-3-1', '%Y-%c-%d');

select 1 is null, 0 is null, NULL is null;

# 可以比较NULL值的`=`
select 1 <=> 1, NULL <=> NULL, 1 <=> NULL;

# expr BETWEEN min AND max
# This is equivalent to the expression (min <= expr AND expr <= max)
select 2 between 1 and 3;

select 2 in (0, 3, 5, 7);
select 'wefwf' in ('wee', 'wefwf', 'weg');
# IN() can be used to compare row constructors:
select (3, 4) in ((1, 2), (3, 4));

/*
通配符:
    %:任意多个字符,包含0个字符
	_:任意单个字符
 */
# Simple pattern matching(搭配通配符使用)
select 'duanchao' like '%ch%';
select 'dmm' like '_m_';









