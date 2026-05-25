drop table if exists users;

create table users
(
    id      serial primary key,
    name    varchar(50) not null,
    profile jsonb
);

insert into users (name, profile)
values ('张三', '{
  "age": 28,
  "city": "北京",
  "vip": true,
  "tags": [
    "java",
    "postgres"
  ],
  "address": {
    "district": "海淀",
    "street": "中关村大街"
  },
  "orders": [
    {
      "id": 1001,
      "amount": 99.5
    },
    {
      "id": 1002,
      "amount": 200.0
    }
  ]
}');

insert into users (name, profile)
values ('李四', '{
  "age": 35,
  "city": "上海",
  "vip": false,
  "tags": [
    "python",
    "ai"
  ],
  "address": {
    "district": "浦东",
    "street": "世纪大道"
  },
  "orders": [
    {
      "id": 2001,
      "amount": 50.0
    }
  ]
}');

insert into users (name, profile)
values ('王五', '{
  "age": 22,
  "city": "北京",
  "vip": true,
  "tags": [
    "go"
  ],
  "address": {
    "district": "朝阳",
    "street": "三里屯"
  },
  "orders": []
}');

insert into users (name, profile)
values ('赵六', '{
  "age": 40,
  "city": "广州",
  "tags": []
}');

insert into users (name, profile)
values ('钱七',
        jsonb_build_object(
                'age', 30,
                'city', '深圳',
                'vip', true,
                'tags', jsonb_build_array('rust', 'wasm')
        ));


select id, name, profile
from users;
