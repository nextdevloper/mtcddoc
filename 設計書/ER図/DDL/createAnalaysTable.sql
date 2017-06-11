-- Project Name : MTCLOUD
-- Date/Time    : 2014/05/24 19:14:28
-- Author       : minakada
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- ���b�Z�[�W���M����
drop table if exists t_msg_send cascade;

create table t_msg_send (
  acc_id character varying(20) not null
  , acc_id_send character varying(20) not null
  , msg_code character varying(8) not null
  , default_locale character varying(20) default 'ja' not null
  , ex_cnt numeric(10) default 1 not null
  , ins_acc character varying(20) not null
  , ins_date timestamp not null
  , upd_acc character varying(20) not null
  , upd_date timestamp not null
  , del_flg character varying(1) default '0' not null
  , rec_id bigserial not null
  , constraint t_msg_send_PKC primary key (acc_id,acc_id_send,msg_code)
) ;

-- �A�J�E���g�}�X�^�i���M��j
drop table if exists m_account_block_send cascade;

create table m_account_block_send (
  acc_id character varying(20) not null
  , acc_id_send character varying(20) not null
  , default_locale character varying(20) default 'ja' not null
  , ex_cnt numeric(10) default 1 not null
  , ins_acc character varying(20) not null
  , ins_date timestamp not null
  , upd_acc character varying(20) not null
  , upd_date timestamp not null
  , del_flg character varying(1) default '0' not null
  , rec_id bigserial not null
  , constraint m_account_block_send_PKC primary key (acc_id,acc_id_send)
) ;

-- �A�J�E���g�}�X�^�i�u���b�N�j
drop table if exists m_account_block cascade;

create table m_account_block (
  acc_id character varying(20) not null
  , acc_id_block character varying(20) not null
  , default_locale character varying(20) default 'ja' not null
  , ex_cnt numeric(10) default 1 not null
  , ins_acc character varying(20) not null
  , ins_date timestamp not null
  , upd_acc character varying(20) not null
  , upd_date timestamp not null
  , del_flg character varying(1) default '0' not null
  , rec_id bigserial not null
  , constraint m_account_block_PKC primary key (acc_id,acc_id_block)
) ;

-- �R�b�N�s�b�g���i�񋟑��j
drop table if exists dw_cockpit_lender cascade;

create table dw_cockpit_lender (
  acc_id character varying(20) not null
  , cocpit_id character varying(20) not null
  , loc_id character varying(20) not null
  , box_id character varying(20) not null
  , rent_fee_init_amount numeric(20) not null
  , rent_fee_daily_amount numeric(20) not null
  , deposit_usage_amount numeric(20)
  , deposit_lender_amount numeric(20)
  , rent_day character varying(8)
  , rent_term numeric(20)
  , tag_a character varying(256) not null
  , tag_b character varying(256) not null
  , default_locale character varying(20) default 'ja' not null
  , ex_cnt numeric(10) default 1 not null
  , ins_acc character varying(20) not null
  , ins_date timestamp not null
  , upd_acc character varying(20) not null
  , upd_date timestamp not null
  , del_flg character varying(1) default '0' not null
  , rec_id bigserial not null
  , constraint dw_cockpit_lender_PKC primary key (acc_id,cocpit_id,loc_id,box_id)
) ;

-- �R�b�N�s�b�g���i���p���j
drop table if exists dw_cockpit_usage cascade;

create table dw_cockpit_usage (
  acc_id character varying(20) not null
  , cocpit_id character varying(20) not null
  , loc_id character varying(20) not null
  , box_id character varying(20) not null
  , mt_id character varying(20) not null
  , mt_kind1 character varying(4) not null
  , mt_kind2 character varying(4) not null
  , rent_fee_init_amount numeric(20) not null
  , rent_fee_daily_amount numeric(20) not null
  , deposit_usage_amount numeric(20)
  , deposit_lender_amount numeric(20)
  , rent_day character varying(8)
  , rent_term numeric(20)
  , tag_a character varying(256) not null
  , tag_b character varying(256) not null
  , default_locale character varying(20) default 'ja' not null
  , ex_cnt numeric(10) default 1 not null
  , ins_acc character varying(20) not null
  , ins_date timestamp not null
  , upd_acc character varying(20) not null
  , upd_date timestamp not null
  , del_flg character varying(1) default '0' not null
  , rec_id bigserial not null
  , constraint dw_cockpit_usage_PKC primary key (acc_id,cocpit_id,loc_id,box_id,mt_id)
) ;

comment on table t_msg_send is '���b�Z�[�W���M����	 ���b�Z�[�W���M�̗���';
comment on column t_msg_send.acc_id is '�A�J�E���gID';
comment on column t_msg_send.acc_id_send is '�A�J�E���gID�i���M��j	 �A�J�E���gID���w��';
comment on column t_msg_send.msg_code is '���b�Z�[�W�R�[�h';
comment on column t_msg_send.default_locale is '�W�����P�[��ID	 ����R�[�h��ݒ�i���ʂ́A���{�ija�j�Œ�j';
comment on column t_msg_send.ex_cnt is '�r������J�E���^	 �o�^����邲�ƂɁ{�P����B';
comment on column t_msg_send.ins_acc is '�o�^�A�J�E���g	 �o�^���̃A�J�E���g';
comment on column t_msg_send.ins_date is '�o�^����	 �o�^��������';
comment on column t_msg_send.upd_acc is '�X�V�A�J�E���g	 �X�V���̃A�J�E���g�i����͓o�^���Ɠ����j';
comment on column t_msg_send.upd_date is '�X�V����	 �X�V���������i����͓o�^���Ɠ����j';
comment on column t_msg_send.del_flg is '�폜�t���O	 1�ɂȂ�Ƙ_���폜';
comment on column t_msg_send.rec_id is '���R�[�hID	 ���R�[�h�ҏW�pID';

comment on table m_account_block_send is '�A�J�E���g�}�X�^�i���M��j	 ���݂̏�Ԃ��m�F�ł��镪�͗p�̏��';
comment on column m_account_block_send.acc_id is '�A�J�E���gID';
comment on column m_account_block_send.acc_id_send is '�A�J�E���gID�i���M��j	 �A�J�E���gID���w��';
comment on column m_account_block_send.default_locale is '�W�����P�[��ID	 ����R�[�h��ݒ�i���ʂ́A���{�Œ�j';
comment on column m_account_block_send.ex_cnt is '�r������J�E���^	 �o�^����邲�ƂɁ{�P����B';
comment on column m_account_block_send.ins_acc is '�o�^�A�J�E���g	 �o�^���̃A�J�E���g';
comment on column m_account_block_send.ins_date is '�o�^����	 �o�^��������';
comment on column m_account_block_send.upd_acc is '�X�V�A�J�E���g	 �X�V���̃A�J�E���g';
comment on column m_account_block_send.upd_date is '�X�V����	 �X�V��������';
comment on column m_account_block_send.del_flg is '�폜�t���O	 "1"�ɂȂ�Ƙ_���폜';
comment on column m_account_block_send.rec_id is '���R�[�hID	 ���R�[�h�ҏW�pID';

comment on table m_account_block is '�A�J�E���g�}�X�^�i�u���b�N�j	 �A�J�E���g�u���b�N';
comment on column m_account_block.acc_id is '�A�J�E���gID';
comment on column m_account_block.acc_id_block is '�A�J�E���gID�i�u���b�N�j	 �A�J�E���gID���w��';
comment on column m_account_block.default_locale is '�W�����P�[��ID	 ����R�[�h��ݒ�i���ʂ́A���{�Œ�j';
comment on column m_account_block.ex_cnt is '�r������J�E���^	 �o�^����邲�ƂɁ{�P����B';
comment on column m_account_block.ins_acc is '�o�^�A�J�E���g	 �o�^���̃A�J�E���g';
comment on column m_account_block.ins_date is '�o�^����	 �o�^��������';
comment on column m_account_block.upd_acc is '�X�V�A�J�E���g	 �X�V���̃A�J�E���g';
comment on column m_account_block.upd_date is '�X�V����	 �X�V��������';
comment on column m_account_block.del_flg is '�폜�t���O	 "1"�ɂȂ�Ƙ_���폜';
comment on column m_account_block.rec_id is '���R�[�hID	 ���R�[�h�ҏW�pID';

comment on table dw_cockpit_lender is '�R�b�N�s�b�g���i�񋟑��j	 ���݂̏�Ԃ��m�F�ł��镪�͗p�̏��';
comment on column dw_cockpit_lender.acc_id is '�A�J�E���gID';
comment on column dw_cockpit_lender.cocpit_id is '�R�b�N�s�b�gID';
comment on column dw_cockpit_lender.loc_id is '���P�[�V����ID';
comment on column dw_cockpit_lender.box_id is '�{�b�N�XID';
comment on column dw_cockpit_lender.rent_fee_init_amount is '�ꏊ�񋟗��i����j	 1���';
comment on column dw_cockpit_lender.rent_fee_daily_amount is '�ꏊ�񋟗��i���z�j';
comment on column dw_cockpit_lender.deposit_usage_amount is '���p���ۏؗ�';
comment on column dw_cockpit_lender.deposit_lender_amount is '�񋟑��ۏؗ�';
comment on column dw_cockpit_lender.rent_day is '�a����J�n��';
comment on column dw_cockpit_lender.rent_term is '�a�������	 �������w��';
comment on column dw_cockpit_lender.tag_a is '�ǉ��^�OA';
comment on column dw_cockpit_lender.tag_b is '�ǉ��^�OB';
comment on column dw_cockpit_lender.default_locale is '�W�����P�[��ID	 ����R�[�h��ݒ�i���ʂ́A���{�ija�j�Œ�j';
comment on column dw_cockpit_lender.ex_cnt is '�r������J�E���^	 �o�^����邲�ƂɁ{�P����B';
comment on column dw_cockpit_lender.ins_acc is '�o�^�A�J�E���g	 �o�^���̃A�J�E���g';
comment on column dw_cockpit_lender.ins_date is '�o�^����	 �o�^��������															
�X�V���̃A�J�E���g�i����͓o�^���Ɠ����j';
comment on column dw_cockpit_lender.upd_acc is '�X�V�A�J�E���g	 �X�V���̃A�J�E���g�i����͓o�^���Ɠ����j';
comment on column dw_cockpit_lender.upd_date is '�X�V����	 �X�V���������i����͓o�^���Ɠ����j';
comment on column dw_cockpit_lender.del_flg is '�폜�t���O	 1�ɂȂ�Ƙ_���폜';
comment on column dw_cockpit_lender.rec_id is '���R�[�hID	 ���R�[�h�ҏW�pID';

comment on table dw_cockpit_usage is '�R�b�N�s�b�g���i���p���j	 ���݂̏�Ԃ��m�F�ł��镪�͗p�̏��';
comment on column dw_cockpit_usage.acc_id is '�A�J�E���gID';
comment on column dw_cockpit_usage.cocpit_id is '�R�b�N�s�b�gID';
comment on column dw_cockpit_usage.loc_id is '���P�[�V����ID';
comment on column dw_cockpit_usage.box_id is '�{�b�N�XID';
comment on column dw_cockpit_usage.mt_id is '�}�e���A��ID';
comment on column dw_cockpit_usage.mt_kind1 is '�}�e���A����ʂP	 �p�u���b�N/�v���C�x�[�g';
comment on column dw_cockpit_usage.mt_kind2 is '�}�e���A����ʂQ	 �{/CD/DVD/���̑�';
comment on column dw_cockpit_usage.rent_fee_init_amount is '�ꏊ�񋟗��i����j	 1���';
comment on column dw_cockpit_usage.rent_fee_daily_amount is '�ꏊ�񋟗��i���z�j';
comment on column dw_cockpit_usage.deposit_usage_amount is '���p���ۏؗ�';
comment on column dw_cockpit_usage.deposit_lender_amount is '�񋟑��ۏؗ�';
comment on column dw_cockpit_usage.rent_day is '�a����J�n��';
comment on column dw_cockpit_usage.rent_term is '�a�������	 �������w��';
comment on column dw_cockpit_usage.tag_a is '�ǉ��^�OA';
comment on column dw_cockpit_usage.tag_b is '�ǉ��^�OB';
comment on column dw_cockpit_usage.default_locale is '�W�����P�[��ID	 ����R�[�h��ݒ�i���ʂ́A���{�ija�j�Œ�j';
comment on column dw_cockpit_usage.ex_cnt is '�r������J�E���^	 �o�^����邲�ƂɁ{�P����B';
comment on column dw_cockpit_usage.ins_acc is '�o�^�A�J�E���g	 �o�^���̃A�J�E���g';
comment on column dw_cockpit_usage.ins_date is '�o�^����	 �o�^��������															
�X�V���̃A�J�E���g�i����͓o�^���Ɠ����j';
comment on column dw_cockpit_usage.upd_acc is '�X�V�A�J�E���g	 �X�V���̃A�J�E���g�i����͓o�^���Ɠ����j';
comment on column dw_cockpit_usage.upd_date is '�X�V����	 �X�V���������i����͓o�^���Ɠ����j';
comment on column dw_cockpit_usage.del_flg is '�폜�t���O	 1�ɂȂ�Ƙ_���폜';
comment on column dw_cockpit_usage.rec_id is '���R�[�hID	 ���R�[�h�ҏW�pID';

