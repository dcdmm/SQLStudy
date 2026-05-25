-- 查询对象的某个键
select name,
       profile - > 'city' as city_jsonb, -- ->:带引号(jsonb):"北京"
       profile ->> 'city' as city_text   -- ->>:纯文本(text):北京
from users;

-- 查询数组的某个元素(下标从0开始,支持负数倒数)
select name,
       profile - > 'tags'       as tags,       -- 整个数组
       profile - > 'tags' - > 0 as first_tag,  -- 第一个元素(jsonb)
       profile - > 'tags' ->> 0 as first_text, -- 第一个元素(text)
    profile -> 'tags' -> -1 as last_tag        -- 最后一个元素
from users;

select name,
       profile - > 'address' - > 'district' as district_jsonb,
       profile - > 'address' ->> 'street' as street_text, profile -> 'orders' -> 0 ->> 'amount' as first_order_amount
from users;

-- 查询嵌套字段(与上等价)
select name,
       profile #> '{address, district}'  as district_jsonb,
       profile #>> '{address, street}'   as street_text,
       profile #>> '{orders, 0, amount}' as first_order_amount
from users;

-- @>: 是否包含某段JSON
select name
from users
-- city为北京且vip为true的用户
where profile @ > '{"city": "北京", "vip": true}';

-- 也可以判断数组是否包含某元素
select name
from users
-- tags包含"java"的用户
where profile - > 'tags' @> '"java"';

-- ?: 是否存在某个键
select name
from users
-- 存在vip字段的用户
where profile ? 'vip';

-- ?|: 存在任意一个键
select name
from users
-- 存在vip或orders 字段的用户
where profile ?| array ['vip', 'orders'];

-- ?&: 同时存在所有键
select name
from users
-- 同时存在vip和orders字段的用户
where profile ?& array ['vip', 'orders'];