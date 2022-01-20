/*
| name  | description                     |
|-------|---------------------------------|
| %,MOD | Modulo operator                 |
| +     | Addition operator               |
| -     | Minus operator                  |
| /     | Division operator               |
| *     | Multiplication operator         |
| -     | Change the sign of the argument |
ROUND()	| Round the argument              |
 */

select 2 + 2; # 2 + 2 = 4

# 可转为数值类型的字符串
select '2' + 3; # 2 + 3 = 5
select '1.3' + 1; # 1.3 + 1 = 2.3

# 不能转为数值类型的字符串
select 'duan' + 34; # 34(忽略'duan')

select 2 - 3; # 2 - 3 = -1
select - 2 * 3; # (-2) * 3 = -6