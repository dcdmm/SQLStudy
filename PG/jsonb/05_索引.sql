-- 创建GIN索引(支持: @>、?、?|、?&等操作符)
create index idx_users_profile on users using gin (profile);

select name
from users
where profile @> '{"city": "北京", "vip": true}';

select name
from users
where profile ? 'vip';


explain
select name
from users
where profile @> '{"city": "北京"}';

select indexname
from pg_indexes
where tablename = 'users';
