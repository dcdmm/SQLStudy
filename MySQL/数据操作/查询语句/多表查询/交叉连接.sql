use girls;


# 交叉连接(查询结果的笛卡尔积)
select b.*, bo.*
from beauty b
         cross join boys bo;