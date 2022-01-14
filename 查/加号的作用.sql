select 234 + 2;

# 算术运算符
# +（加）、-（减）、*（乘）、/（除）、%（取模，也就是商）。

# 字符型注释转转换为数字
select "234" + 34;

# 不能转换成功,忽略
select "duan" + 34;

# null + 任何 = null
select null + 324;