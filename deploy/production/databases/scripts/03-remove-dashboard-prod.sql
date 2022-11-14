do $$ declare
    tabname RECORD;

begin
    for tabname in (
select
	tablename
from
	pg_tables
where
	schemaname = 'tableros'
	and tablename not like 'snvs')
loop
    execute 'DROP TABLE IF EXISTS ' || 'tableros.' || quote_ident(tabname.tablename) || ' CASCADE';
end loop;
end $$;

DROP SCHEMA prod_pre_aggregations CASCADE;