# Return the current date and time
select now();

# Return the year
select year(now());

# Return the month from the date passed
select month(now());

# Return the day of the month (0-31)
select day(now());

select hour(now()); # 时
select minute(now()); # 分
select second(now()); # 秒

/*
Specifier	Description
%a	Abbreviated weekday name (Sun..Sat)
%b	Abbreviated month name (Jan..Dec)
%c	Month, numeric (0..12)
%D	Day of the month with English suffix (0th, 1st, 2nd, 3rd, …)
%d	Day of the month, numeric (00..31)
%e	Day of the month, numeric (0..31)
%f	Microseconds (000000..999999)
%H	Hour (00..23)
%h	Hour (01..12)
%I	Hour (01..12)
%i	Minutes, numeric (00..59)
%j	Day of year (001..366)
%k	Hour (0..23)
%l	Hour (1..12)
%M	Month name (January..December)
%m	Month, numeric (00..12)
%p	AM or PM
%r	Time, 12-hour (hh:mm:ss followed by AM or PM)
%S	Seconds (00..59)
%s	Seconds (00..59)
%T	Time, 24-hour (hh:mm:ss)
%U	Week (00..53), where Sunday is the first day of the week; WEEK() mode 0
%u	Week (00..53), where Monday is the first day of the week; WEEK() mode 1
%V	Week (01..53), where Sunday is the first day of the week; WEEK() mode 2; used with %X
%v	Week (01..53), where Monday is the first day of the week; WEEK() mode 3; used with %x
%W	Weekday name (Sunday..Saturday)
%w	Day of the week (0=Sunday..6=Saturday)
%X	Year for the week where Sunday is the first day of the week, numeric, four digits; used with %V
%x	Year for the week, where Monday is the first day of the week, numeric, four digits; used with %v
%Y	Year, numeric, four digits
%y	Year, numeric (two digits)
 */
# Convert a string to a date
select str_to_date('1998-3-2', '%Y-%c-%d') as out_put;

select str_to_date('1998-3-2 12:43:34', '%Y-%c-%d %h:%i:%s') as out_put;

select str_to_date('2022-01-17 17:25:48.549389', '%Y-%c-%d %H:%i:%s.%f');

# Format date as specified
select date_format(now(), '%y年%m月%d日') as out_put;

# Add time values (intervals) to a date value
select date_add('2022-01-17 17:25:48.549389', interval 1 second); # 后一秒
select date_add('2022-01-17 17:25:48.549389', interval -1 second); # 前一秒
select date_add('2022-01-17 17:25:48.549389', interval 1 minute); # 后一分钟
select date_add('2022-01-17 17:25:48.549389', interval -1 minute); # 前一分钟
select date_add('2022-01-17 17:25:48.549389', interval 1 hour);
select date_add('2022-01-17 17:25:48.549389', interval 1 day);
select date_add('2022-01-17 17:25:48.549389', interval 1 month);
select date_add('2022-01-17 17:25:48.549389', interval 1 year);

# 更为推荐(先转换字符串为日期)
select date_add(str_to_date('2022-03-01 00:00:00.000001', '%Y-%c-%d %H:%i:%s.%f'), interval 1 year) as end_time;