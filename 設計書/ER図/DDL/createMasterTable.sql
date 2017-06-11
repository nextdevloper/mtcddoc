-- Project Name : MTCLOUD
-- Date/Time    : 2014/05/24 19:16:40
-- Author       : minakada
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- �R�[�h�}�X�^
drop table if exists M_Code cascade;

create table M_Code (
  code_kind character varying(20) not null
  , code_kind_nm character varying(20) not null
  , display_no numeric(10) not null
  , code_id character varying(20) not null
  , code_nm character varying(80) not null
  , code_nmr character varying(20) not null
  , text1 character varying(20)
  , text2 character varying(20)
  , text3 character varying(20)
  , value1 numeric(10)
  , value2 numeric(10)
  , value3 numeric(10)
  , note character varying(250)
  , rec_id bigserial not null
  , constraint M_Code_PKC primary key (code_kind,code_id)
) ;

create unique index m_code_idx_001
  on M_Code(code_kind,display_no);

comment on table M_Code is '�R�[�h�}�X�^	 �R�[�h�}�X�^';
comment on column M_Code.code_kind is '�R�[�h���';
comment on column M_Code.code_kind_nm is '�R�[�h��ʖ�';
comment on column M_Code.display_no is '�\����';
comment on column M_Code.code_id is '�R�[�hID';
comment on column M_Code.code_nm is '�R�[�h����';
comment on column M_Code.code_nmr is '�R�[�h������';
comment on column M_Code.text1 is '������1';
comment on column M_Code.text2 is '������2';
comment on column M_Code.text3 is '������3';
comment on column M_Code.value1 is '�l1';
comment on column M_Code.value2 is '�l2';
comment on column M_Code.value3 is '�l3';
comment on column M_Code.note is '���l';
comment on column M_Code.rec_id is '���R�[�hID	 ���R�[�h�ҏW�pID';

