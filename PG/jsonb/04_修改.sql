-- 把张三的城市改成"杭州"
update users
set profile = jsonb_set(profile, '{city}', '"杭州"'::jsonb)
where name = '张三';

-- 把张三的年龄+1
update users
set profile = jsonb_set(profile, '{age}',
                        to_jsonb((profile ->> 'age'):: int + 1))
where name = '张三';

-- 把张三第一个订单的金额改成88.8
update users
set profile = jsonb_set(profile, '{orders, 0, amount}', '88.8'::jsonb)
where name = '张三';

-- 新增一个原本不存在的键(给赵六加 vip 字段,第4参数 true 默认创建)
-- 给赵六添加vip字段(键不存在就新建),值为false
update users
set profile = jsonb_set(profile, '{vip}', 'false'::jsonb)
where name = '赵六';

-- 删除(-)赵六的vip键
update users
set profile = profile - 'vip'
where name = '赵六';

-- 删除王五tags数组中第0个元素
update users
set profile = jsonb_set(profile, '{tags}', (profile -> 'tags') - 0)
where name = '王五';

