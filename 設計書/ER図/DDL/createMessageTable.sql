-- Project Name : MTCLOUD
-- Date/Time    : 2014/07/26 21:19:39
-- Author       : reve
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- ���b�Z�[�W���M�����i���m�点�j
drop table if exists t_msg_send_news cascade;

create table t_msg_send_news (
  acc_id character varying(20) not null
  , acc_id_send character varying(20) not null
  , msg_no bigserial not null
  , msg_title character varying(250) not null
  , msg_note character varying(1024) not null
  , default_locale character varying(20) default 'ja' not null
  , ex_cnt numeric(10) default 1 not null
  , ins_acc character varying(20) not null
  , ins_date timestamp not null
  , upd_acc character varying(20) not null
  , upd_date timestamp not null
  , del_flg character varying(1) default '0' not null
  , rec_id bigserial not null
  , constraint t_msg_send_news_PKC primary key (acc_id,acc_id_send,msg_no)
) ;

-- ���b�Z�[�W���M�����i���ʕ񍐁j
drop table if exists t_msg_send_result cascade;

create table t_msg_send_result (
  acc_id character varying(20) not null
  , acc_id_send character varying(20) not null
  , msg_no bigserial not null
  , msg_title character varying(250) not null
  , msg_note character varying(1024) not null
  , default_locale character varying(20) default 'ja' not null
  , ex_cnt numeric(10) default 1 not null
  , ins_acc character varying(20) not null
  , ins_date timestamp not null
  , upd_acc character varying(20) not null
  , upd_date timestamp not null
  , del_flg character varying(1) default '0' not null
  , rec_id bigserial not null
  , constraint t_msg_send_result_PKC primary key (acc_id,acc_id_send,msg_no)
) ;

-- ���b�Z�[�W���M�����i�ʏ탁�b�Z�[�W�j
drop table if exists t_msg_send_normal cascade;

create table t_msg_send_normal (
  acc_id character varying(20) not null
  , acc_id_send character varying(20) not null
  , msg_no bigserial not null
  , msg_title character varying(250) not null
  , msg_note character varying(1024) not null
  , default_locale character varying(20) default 'ja' not null
  , ex_cnt numeric(10) default 1 not null
  , ins_acc character varying(20) not null
  , ins_date timestamp not null
  , upd_acc character varying(20) not null
  , upd_date timestamp not null
  , del_flg character varying(1) default '0' not null
  , rec_id bigserial not null
  , constraint t_msg_send_normal_PKC primary key (acc_id,acc_id_send,msg_no)
) ;

comment on table t_msg_send_news is '���b�Z�[�W���M�����i���m�点�j	 ���m�点���b�Z�[�W�̑��M����';
comment on column t_msg_send_news.acc_id is '�A�J�E���gID';
comment on column t_msg_send_news.acc_id_send is '�A�J�E���gID�i���M��j	 �A�J�E���gID���w��';
comment on column t_msg_send_news.msg_no is '���b�Z�[�W�ԍ�	 �A��';
comment on column t_msg_send_news.msg_title is '���b�Z�[�W�^�C�g��';
comment on column t_msg_send_news.msg_note is '���b�Z�[�W���e';
comment on column t_msg_send_news.default_locale is '�W�����P�[��ID	 ����R�[�h��ݒ�i���ʂ́A���{�ija�j�Œ�j';
comment on column t_msg_send_news.ex_cnt is '�r������J�E���^	 �o�^����邲�ƂɁ{�P����B';
comment on column t_msg_send_news.ins_acc is '�o�^�A�J�E���g	 �o�^���̃A�J�E���g';
comment on column t_msg_send_news.ins_date is '�o�^����	 �o�^��������';
comment on column t_msg_send_news.upd_acc is '�X�V�A�J�E���g	 �X�V���̃A�J�E���g�i����͓o�^���Ɠ����j';
comment on column t_msg_send_news.upd_date is '�X�V����	 �X�V���������i����͓o�^���Ɠ����j';
comment on column t_msg_send_news.del_flg is '�폜�t���O	 1�ɂȂ�Ƙ_���폜';
comment on column t_msg_send_news.rec_id is '���R�[�hID	 ���R�[�h�ҏW�pID';

comment on table t_msg_send_result is '���b�Z�[�W���M�����i���ʕ񍐁j	 ���ʕ񍐃��b�Z�[�W�̑��M����';
comment on column t_msg_send_result.acc_id is '�A�J�E���gID';
comment on column t_msg_send_result.acc_id_send is '�A�J�E���gID�i���M��j	 �A�J�E���gID���w��';
comment on column t_msg_send_result.msg_no is '���b�Z�[�W�ԍ�	 �A��';
comment on column t_msg_send_result.msg_title is '���b�Z�[�W�^�C�g��';
comment on column t_msg_send_result.msg_note is '���b�Z�[�W���e';
comment on column t_msg_send_result.default_locale is '�W�����P�[��ID	 ����R�[�h��ݒ�i���ʂ́A���{�ija�j�Œ�j';
comment on column t_msg_send_result.ex_cnt is '�r������J�E���^	 �o�^����邲�ƂɁ{�P����B';
comment on column t_msg_send_result.ins_acc is '�o�^�A�J�E���g	 �o�^���̃A�J�E���g';
comment on column t_msg_send_result.ins_date is '�o�^����	 �o�^��������';
comment on column t_msg_send_result.upd_acc is '�X�V�A�J�E���g	 �X�V���̃A�J�E���g�i����͓o�^���Ɠ����j';
comment on column t_msg_send_result.upd_date is '�X�V����	 �X�V���������i����͓o�^���Ɠ����j';
comment on column t_msg_send_result.del_flg is '�폜�t���O	 1�ɂȂ�Ƙ_���폜';
comment on column t_msg_send_result.rec_id is '���R�[�hID	 ���R�[�h�ҏW�pID';

comment on table t_msg_send_normal is '���b�Z�[�W���M�����i�ʏ탁�b�Z�[�W�j	 �ʏ탁�b�Z�[�W�̑��M����';
comment on column t_msg_send_normal.acc_id is '�A�J�E���gID';
comment on column t_msg_send_normal.acc_id_send is '�A�J�E���gID�i���M��j	 �A�J�E���gID���w��';
comment on column t_msg_send_normal.msg_no is '���b�Z�[�W�ԍ�	 �A��';
comment on column t_msg_send_normal.msg_title is '���b�Z�[�W�^�C�g��';
comment on column t_msg_send_normal.msg_note is '���b�Z�[�W���e';
comment on column t_msg_send_normal.default_locale is '�W�����P�[��ID	 ����R�[�h��ݒ�i���ʂ́A���{�ija�j�Œ�j';
comment on column t_msg_send_normal.ex_cnt is '�r������J�E���^	 �o�^����邲�ƂɁ{�P����B';
comment on column t_msg_send_normal.ins_acc is '�o�^�A�J�E���g	 �o�^���̃A�J�E���g';
comment on column t_msg_send_normal.ins_date is '�o�^����	 �o�^��������';
comment on column t_msg_send_normal.upd_acc is '�X�V�A�J�E���g	 �X�V���̃A�J�E���g�i����͓o�^���Ɠ����j';
comment on column t_msg_send_normal.upd_date is '�X�V����	 �X�V���������i����͓o�^���Ɠ����j';
comment on column t_msg_send_normal.del_flg is '�폜�t���O	 1�ɂȂ�Ƙ_���폜';
comment on column t_msg_send_normal.rec_id is '���R�[�hID	 ���R�[�h�ҏW�pID';

