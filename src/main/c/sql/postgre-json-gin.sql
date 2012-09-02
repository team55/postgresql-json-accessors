set client_min_messages to 'error';
drop extension if exists "postgre-json-functions";
create extension "postgre-json-functions";
set client_min_messages to 'notice';

\t on
\pset format unaligned

-- t
select array['foo', 'bar', 'baz'] @> array['foo'];
-- t
select array['foo', 'bar', 'baz'] @> array['foo', 'bar'];
-- t
select array['foo', 'bar', 'baz'] @> array['baz', 'foo'];
-- f
select array['foo', 'bar', 'baz'] @> array['qux'];
-- t
select array['foo', 'bar', 'baz'] @> array[]::text[];
-- t
select array[]::text[] @> array[]::text[];
-- f
select array[]::text[] @> array['qux'];

-- t
select array['foo', 'bar', 'baz'] @@> array['foo'];
-- t
select array['foo', 'bar', 'baz'] @@> array['foo', 'bar'];
-- t
select array['foo', 'bar', 'baz'] @@> array['baz', 'foo'];
-- f
select array['foo', 'bar', 'baz'] @@> array['qux'];
-- t
select array['foo', 'bar', 'baz'] @@> array[]::text[];
-- t
select array[]::text[] @> array[]::text[];
-- f
select array[]::text[] @> array['qux'];

-- t
select array['foo', 'bar', 'baz'] @@> array['fo'];
-- t
select array['foo', 'bar', 'baz'] @@> array['ba'];
-- t
select array['foo', 'bar', 'baz'] @@> array['b'];
-- t
select array['foo', 'bar', 'baz'] @@> array[''];
-- f
select array['foo', 'bar', 'baz'] @@> array['baq'];
-- t
select array['foo', 'foobar', 'baz'] @@> array['foo'];

\t off
\pset format aligned
