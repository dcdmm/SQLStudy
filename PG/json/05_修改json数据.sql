-- ============================================================
-- PostgreSQL JSON 学习 05:修改 JSON 内部的数据
-- ============================================================
-- 前置:先执行 02_存储_建表与插入.sql。
-- 重点:jsonb 是"整体"存储的,改其中一个键也要把新 jsonb 整体写回字段。
-- 套路统一是:UPDATE ... SET profile = 某函数(profile, ...)。
-- ============================================================


-- ------------------------------------------------------------
-- 1. jsonb_set:新增 / 修改某个路径上的值(最常用!)
-- ------------------------------------------------------------
-- jsonb_set(原jsonb, 路径, 新值, [路径不存在时是否创建])
--   路径:文本数组 '{a, b}'
--   新值:必须是 jsonb,所以要 '...'::jsonb 或 to_jsonb(...)
--   第4个参数默认为 true(键不存在就新建)

-- 把张三的城市改成"杭州"
update users
set profile = jsonb_set(profile, '{city}', '"杭州"'::jsonb)
where name = '张三';

-- 把张三的年龄 +1(先取出来转 int 加 1,再 to_jsonb 转回去)
update users
set profile = jsonb_set(profile, '{age}',
                        to_jsonb((profile ->> 'age')::int + 1))
where name = '张三';

-- 修改深层嵌套:把张三第一个订单的金额改成 88.8
update users
set profile = jsonb_set(profile, '{orders, 0, amount}', '88.8'::jsonb)
where name = '张三';

-- 新增一个原本不存在的键(给赵六加 vip 字段,第4参数 true 默认创建)
update users
set profile = jsonb_set(profile, '{vip}', 'false'::jsonb, true)
where name = '赵六';


-- ------------------------------------------------------------
-- 2. || 拼接:合并两个 jsonb(整体打补丁,语法最简洁)
-- ------------------------------------------------------------
-- 右边的键会覆盖左边同名键,左边没有的键会被新增。
-- 一次改多个顶层键时比 jsonb_set 方便。
update users
set profile = profile || '{"city": "成都", "level": "gold"}'::jsonb
where name = '李四';
-- 效果:city 被覆盖成成都,新增 level 字段

-- 注意:|| 只合并顶层,不会递归深层。深层修改还得用 jsonb_set。


-- ------------------------------------------------------------
-- 3. - 与 #-  :删除键 / 删除路径
-- ------------------------------------------------------------
-- -  删顶层键(或数组按下标删元素)
update users
set profile = profile - 'level' -- 删掉刚加的 level
where name = '李四';

-- 删数组元素:删掉王五 tags 里第 0 个
update users
set profile = jsonb_set(profile, '{tags}', (profile -> 'tags') - 0)
where name = '王五';

-- #-  按路径删深层键
update users
set profile = profile #- '{address, street}' -- 删掉 address 下的 street
where name = '李四';


-- ------------------------------------------------------------
-- 4. jsonb_insert:往数组里"插入"新元素(而不是覆盖)
-- ------------------------------------------------------------
-- 给张三的 orders 末尾追加一个新订单。
-- 路径 '{orders, -1}' + 第4参数 true 表示"插在 -1 之后",即追加到末尾。
update users
set profile = jsonb_insert(profile, '{orders, -1}',
                           '{"id": 1003, "amount": 300.0}'::jsonb, true)
where name = '张三';


-- ------------------------------------------------------------
-- 5. 查看所有修改后的结果
-- ------------------------------------------------------------
select name, jsonb_pretty(profile) as profile
from users
order by id;
