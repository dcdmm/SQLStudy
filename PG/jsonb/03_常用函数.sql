-- 1. name等于张三
-- 2. u.profile -> 'orders': 取出profile里的orders字段(数组)
-- 3. jsonb_array_elements(...): 将数组内容展开为多行
select u.name,
       elem ->> 'id'                as order_id,
       (elem ->> 'amount')::numeric as amount
from users u,
     jsonb_array_elements(u.profile -> 'orders') as elem -- elem 是每个订单对象
where u.name = '张三';

-- jsonb_typeof: get the type of a jsonb value
select name,
       jsonb_typeof(profile -> 'tags')    as tags_type, -- array
       jsonb_typeof(profile -> 'age')     as age_type,  -- number
       jsonb_typeof(profile -> 'address') as addr_type  -- object
from users;
