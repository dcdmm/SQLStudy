-- ============================================================
-- PostgreSQL JSON 学习 04:常用函数(展开 / 聚合 / 转换)
-- ============================================================
-- 前置:先执行 02_存储_建表与插入.sql。
-- 操作符负责"取一个值",函数负责"展开成多行""统计""互相转换"。
-- ============================================================


-- ------------------------------------------------------------
-- 1. jsonb_array_elements:把 JSON 数组炸成多行(最常用!)
-- ------------------------------------------------------------
-- 类比:一个用户有多个订单,想把每个订单变成一行来分析。
-- 用法:在 FROM 里把数组横向展开成多行,每行一个元素。

-- 把张三的订单一行一个展开
select u.name,
       elem ->> 'id'     as order_id,
       (elem ->> 'amount')::numeric as amount
from users u,
     jsonb_array_elements(u.profile -> 'orders') as elem -- elem 是每个订单对象
where u.name = '张三';

-- jsonb_array_elements_text:直接展开成 text(适合纯字符串数组,如 tags)
select u.name, tag
from users u,
     jsonb_array_elements_text(u.profile -> 'tags') as tag;


-- ------------------------------------------------------------
-- 2. 展开后就能用普通 SQL 做统计了
-- ------------------------------------------------------------
-- 经典需求:统计每个用户的订单总金额。
-- 思路:先展开订单,再 group by 用户求和。
select u.name,
       coalesce(sum((elem ->> 'amount')::numeric), 0) as total_amount
from users u
         left join lateral -- left join lateral 保证没订单的用户也保留
                   jsonb_array_elements(u.profile -> 'orders') as elem on true
group by u.name
order by total_amount desc;

-- 统计每个标签被多少用户用到(标签热度排行)
select tag, count(*) as user_count
from users u,
     jsonb_array_elements_text(u.profile -> 'tags') as tag
group by tag
order by user_count desc;


-- ------------------------------------------------------------
-- 3. jsonb_each:把对象的 键/值 拆成多行
-- ------------------------------------------------------------
-- 适合"我不知道有哪些键,想全部遍历"的场景。
select u.name, key, value
from users u,
     jsonb_each(u.profile) as kv(key, value)
where u.name = '赵六';


-- ------------------------------------------------------------
-- 4. 实用工具函数
-- ------------------------------------------------------------
-- jsonb_object_keys:列出对象顶层所有键
select jsonb_object_keys(profile) as keys
from users
where name = '张三';

-- jsonb_array_length:数组长度(比如订单数量)
select name, jsonb_array_length(profile -> 'tags') as tag_count
from users;

-- jsonb_typeof:判断某个值是什么类型(object/array/string/number/boolean/null)
select name,
       jsonb_typeof(profile -> 'tags')    as tags_type, -- array
       jsonb_typeof(profile -> 'age')     as age_type,  -- number
       jsonb_typeof(profile -> 'address') as addr_type  -- object
from users;

-- jsonb_pretty:把 JSON 美化成多行缩进格式(调试时看着舒服)
select jsonb_pretty(profile)
from users
where name = '张三';


-- ------------------------------------------------------------
-- 5. 行 <-> JSON 互转
-- ------------------------------------------------------------
-- to_jsonb / row_to_json:把查询结果的行变成 JSON
select to_jsonb(u) as row_json
from users u
where name = '李四';

-- jsonb_agg:把多行聚合成一个 JSON 数组(和 group by 配合)
select profile ->> 'city'        as city,
       jsonb_agg(name)           as users_in_city -- 同城用户名拼成数组
from users
group by profile ->> 'city';
