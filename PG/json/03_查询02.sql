-- 把JSON字段当作查询条件
select name, profile ->> 'city' as city
from users
where profile ->> 'city' = '北京'; -- 查询city等于北京的用户

select name, (profile ->> 'age')::int as age
from users
where (profile ->> 'age')::int > 30; --查询age(->>取出来的是text类型,::int强制转换为整数)大于30的用户

select name
from users
where (profile ->> 'vip')::boolean = true; -- 查询vip(与上同理)等于true的用户

select name
from users
where profile #>> '{address,district}' = '海淀'; -- 查询address下district等于海淀的用户

select name, profile ->> 'city' as city, (profile ->> 'age')::int as age
from users
where profile ->> 'city' = '北京'                -- city等于北京
  and (profile ->> 'vip')::boolean = true        -- vip等于true
  and (profile ->> 'age')::int between 25 and 35 -- age在25到35之间
  and profile #>> '{address,district}' = '海淀'  -- caddress下district等于海淀
  and profile -> 'tags' ? 'postgres';            -- tags中含有postgres(?:判断数组中是否存在某元素)
