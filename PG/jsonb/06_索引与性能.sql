-- ============================================================
-- PostgreSQL JSON 学习 06:索引与性能(jsonb 真正的价值所在)
-- ============================================================
-- 前置:先执行 02_存储_建表与插入.sql。
-- 数据量小时怎么查都快;数据量一大,没索引的 JSON 查询会全表扫描。
-- 本文件讲两类索引,以及怎么用 EXPLAIN 验证索引是否生效。
-- ============================================================


-- ------------------------------------------------------------
-- 1. GIN 索引:为 @> ? ?| ?& 这类"包含/键存在"查询加速
-- ------------------------------------------------------------
-- 这是 jsonb 最常用的索引,一个索引覆盖整个 jsonb 文档的所有键值。

-- 默认 GIN(jsonb_ops):支持 @>、?、?|、?&
create index idx_users_profile_gin on users using gin (profile);

-- 现在这类查询就能走索引(数据量大时差别巨大):
select name
from users
where profile @> '{"city": "北京"}';

select name
from users
where profile ? 'vip';


-- jsonb_path_ops:更小更快,但"只"支持 @>(不支持 ? 系列)
-- 如果你只用 @> 查询,选它更省空间:
-- create index idx_users_profile_gin2 on users using gin (profile jsonb_path_ops);


-- ------------------------------------------------------------
-- 2. 表达式 B-tree 索引:为"某个具体字段"的等值/范围查询加速
-- ------------------------------------------------------------
-- GIN 擅长 @>,但不擅长 范围比较(如 age > 30)和 排序。
-- 这时给"提取出来的某个字段"建普通 B-tree 索引更合适。

-- 给 age(强转为 int)建索引,加速范围查询和排序
create index idx_users_age on users (((profile ->> 'age')::int));

-- 走上面这个索引:
select name, (profile ->> 'age')::int as age
from users
where (profile ->> 'age')::int > 30
order by (profile ->> 'age')::int;

-- 给 city 建索引,加速等值查询
create index idx_users_city on users ((profile ->> 'city'));

select name
from users
where profile ->> 'city' = '北京';


-- ------------------------------------------------------------
-- 3. 用 EXPLAIN 确认索引到底有没有用上
-- ------------------------------------------------------------
-- 看执行计划:出现 "Bitmap Index Scan" / "Index Scan" 说明走了索引;
-- 出现 "Seq Scan" 说明全表扫描(没用上索引)。
-- 注意:数据只有几行时 PG 会觉得全表扫更快而"故意不走索引",这是正常的,
-- 真正要看效果需要造大量数据(见下方第 4 节)。

explain
select name
from users
where profile @> '{"city": "北京"}';


-- ------------------------------------------------------------
-- 4. (可选)造 10 万行数据,亲眼看索引效果
-- ------------------------------------------------------------
-- 取消下面注释执行,再对比有无索引时 explain analyze 的耗时。
/*
insert into users (name, profile)
select '用户' || g,
       jsonb_build_object(
           'age', (random() * 60 + 18)::int,
           'city', (array['北京','上海','广州','深圳','杭州'])[ceil(random()*5)],
           'vip', (random() > 0.5)
       )
from generate_series(1, 100000) as g;

-- explain analyze 会真正执行并给出耗时,对比 Seq Scan vs Index Scan:
explain analyze
select name from users where profile @> '{"city": "杭州"}';
*/


-- ------------------------------------------------------------
-- 5. 选型口诀
-- ------------------------------------------------------------
--   要按"是否包含某结构 / 键是否存在"查  -> GIN 索引(配 @> ?)
--   要按"某个固定字段做范围/排序/等值"查 -> 表达式 B-tree 索引
--   两类索引可以同时存在,PG 会自动选最优的那个。
