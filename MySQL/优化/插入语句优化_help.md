If you are inserting many rows from the same client at the same time, use INSERT statements with multiple VALUES lists
to insert several rows at a time. This is considerably faster (many times faster in some cases) than using separate
single-row INSERT statements.

```mysql
insert into example_table(id, age, name)
values ('1', 12, 'dc');
insert into example_table(id, age, name)
values ('2', 22, 'dmmm');
insert into example_table(id, age, name)
values ('3', 32, 'dcdmm');
insert into example_table(id, age, name)
values ('4', 42, 'dcdmmcomeon');

# 加快插入速度
insert into example_table(id, age, name)
values ('1', 12, 'dc'),
       ('2', 22, 'dmmm'),
       ('3', 32, 'dcdmm'),
       ('4', 42, 'dcdmmcomeon');
```