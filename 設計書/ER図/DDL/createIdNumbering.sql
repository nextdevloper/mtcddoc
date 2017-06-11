-- Project Name : MTCLOUD
-- Date/Time    : 2015/09/05 14:03:08
-- Author       : reve
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- ID採番
drop table if exists id_numbering cascade;

create table id_numbering (
  id_kind character varying(4) not null
  , id_number numeric(20) default 0 not null
  , rec_id bigserial not null
  , constraint id_numbering_PKC primary key (id_kind)
) ;

comment on table id_numbering is 'ID採番	 IDの採番管理テーブル';
comment on column id_numbering.id_kind is 'ID種別	 IDの種別キー　(localeIdなど）';
comment on column id_numbering.id_number is '採番値	 割り振られた値';
comment on column id_numbering.rec_id is 'レコードID	 レコード編集用ID';

