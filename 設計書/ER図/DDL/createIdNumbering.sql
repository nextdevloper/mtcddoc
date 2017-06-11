-- Project Name : MTCLOUD
-- Date/Time    : 2015/09/05 14:03:08
-- Author       : reve
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- ID�̔�
drop table if exists id_numbering cascade;

create table id_numbering (
  id_kind character varying(4) not null
  , id_number numeric(20) default 0 not null
  , rec_id bigserial not null
  , constraint id_numbering_PKC primary key (id_kind)
) ;

comment on table id_numbering is 'ID�̔�	 ID�̍̔ԊǗ��e�[�u��';
comment on column id_numbering.id_kind is 'ID���	 ID�̎�ʃL�[�@(localeId�Ȃǁj';
comment on column id_numbering.id_number is '�̔Ԓl	 ����U��ꂽ�l';
comment on column id_numbering.rec_id is '���R�[�hID	 ���R�[�h�ҏW�pID';

