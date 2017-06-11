-- Project Name : MTCLOUD
-- Date/Time    : 2014/05/24 18:46:18
-- Author       : minakada
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- �|�C���g�c�����
drop table if exists b_pointbalance cascade;

create table b_pointbalance (
  acc_id character varying(20) not null
  , point_kind character varying(4) not null
  , point_balance numeric(20) not null
  , default_locale character varying(20) default 'ja' not null
  , ex_cnt numeric(10) default 1 not null
  , ins_acc character varying(20) not null
  , ins_date timestamp not null
  , upd_acc character varying(20) not null
  , upd_date timestamp not null
  , del_flg character varying(1) default '0' not null
  , rec_id bigserial not null
  , constraint b_pointbalance_PKC primary key (acc_id,point_kind)
) ;

-- �g�D�����}�X�^
drop table if exists m_r_strctacc cascade;

create table m_r_strctacc (
  strct_id character varying(20) not null
  , acc_id character varying(20) not null
  , admin_flg character varying(1) default 0 not null
  , note character varying(250)
  , default_locale character varying(20) default 'ja' not null
  , ex_cnt numeric(10) default 1 not null
  , ins_acc character varying(20) not null
  , ins_date timestamp not null
  , upd_acc character varying(20) not null
  , upd_date timestamp not null
  , del_flg character varying(1) default '0' not null
  , rec_id bigserial not null
  , constraint m_r_strctacc_PKC primary key (strct_id,acc_id,admin_flg)
) ;

-- �g�D���}�X�^
drop table if exists m_structure cascade;

create table m_structure (
  strct_id character varying(20) not null
  , struct_kind character varying(4) not null
  , struct_stat character varying(4) not null
  , struct_nm character varying(80)
  , struct_nm_kana character varying(80)
  , struct_nm_nick character varying(80)
  , mailaddress character varying(256) not null
  , password character varying(80) not null
  , tel1 character varying(20)
  , tel2 character varying(20)
  , note character varying(250)
  , default_locale character varying(20) default 'ja' not null
  , ex_cnt numeric(10) default 1 not null
  , ins_acc character varying(20) not null
  , ins_date timestamp not null
  , upd_acc character varying(20) not null
  , upd_date timestamp not null
  , del_flg character varying(1) default '0' not null
  , rec_id bigserial not null
  , constraint m_structure_PKC primary key (strct_id)
) ;

-- �A�J�E���g�}�X�^
drop table if exists m_account cascade;

create table m_account (
  acc_id character varying(20) not null
  , acc_kind character varying(4) not null
  , acc_stat character varying(4) not null
  , acc_nm character varying(80)
  , acc_nm_kana character varying(80)
  , acc_nm_nick character varying(80)
  , mailaddress character varying(256) not null
  , password character varying(80) not null
  , gender character varying(4) not null
  , birthdate character varying(8) not null
  , tel1 character varying(20)
  , tel2 character varying(20)
  , note character varying(250)
  , tag_a character varying(256)
  , tag_b character varying(256)
  , default_locale character varying(20) default 'ja' not null
  , ex_cnt numeric(10) default 1 not null
  , ins_acc character varying(20) not null
  , ins_date timestamp not null
  , upd_acc character varying(20) not null
  , upd_date timestamp not null
  , del_flg character varying(1) default '0' not null
  , rec_id bigserial not null
  , constraint m_account_PKC primary key (acc_id)
) ;

comment on table b_pointbalance is '�|�C���g�c�����	 �|�C���g�����`����B';
comment on column b_pointbalance.acc_id is '�A�J�E���gID';
comment on column b_pointbalance.point_kind is '�|�C���g���	 �L���b�V���|�C���g/�g���[�h�|�C���g';
comment on column b_pointbalance.point_balance is '�|�C���g�c��';
comment on column b_pointbalance.default_locale is '�W�����P�[��ID	 ����R�[�h��ݒ�i���ʂ́A���{�Œ�j';
comment on column b_pointbalance.ex_cnt is '�r������J�E���^	 �o�^����邲�ƂɁ{�P����B';
comment on column b_pointbalance.ins_acc is '�o�^�A�J�E���g	 �o�^���̃A�J�E���g';
comment on column b_pointbalance.ins_date is '�o�^����	 �o�^��������';
comment on column b_pointbalance.upd_acc is '�X�V�A�J�E���g	 �X�V���̃A�J�E���g';
comment on column b_pointbalance.upd_date is '�X�V����	 �X�V��������';
comment on column b_pointbalance.del_flg is '�폜�t���O	 "1"�ɂȂ�Ƙ_���폜';
comment on column b_pointbalance.rec_id is '���R�[�hID	 ���R�[�h�ҏW�pID';

comment on table m_r_strctacc is '�g�D�����}�X�^	 �g�D���ɏ�������A�J�E���g���`����B';
comment on column m_r_strctacc.strct_id is '�g�DID';
comment on column m_r_strctacc.acc_id is '�A�J�E���gID';
comment on column m_r_strctacc.admin_flg is '�Ǘ��҃t���O	 1:�Ǘ���';
comment on column m_r_strctacc.note is '���l';
comment on column m_r_strctacc.default_locale is '�W�����P�[��ID	 ����R�[�h��ݒ�i���ʂ́A���{�Œ�j';
comment on column m_r_strctacc.ex_cnt is '�r������J�E���^	 �o�^����邲�ƂɁ{�P����B';
comment on column m_r_strctacc.ins_acc is '�o�^�A�J�E���g	 �o�^���̃A�J�E���g';
comment on column m_r_strctacc.ins_date is '�o�^����	 �o�^��������';
comment on column m_r_strctacc.upd_acc is '�X�V�A�J�E���g	 �X�V���̃A�J�E���g';
comment on column m_r_strctacc.upd_date is '�X�V����	 �X�V��������';
comment on column m_r_strctacc.del_flg is '�폜�t���O	 "1"�ɂȂ�Ƙ_���폜';
comment on column m_r_strctacc.rec_id is '���R�[�hID	 ���R�[�h�ҏW�pID';

comment on table m_structure is '�g�D���}�X�^	 �g�D�����`����B';
comment on column m_structure.strct_id is '�g�DID';
comment on column m_structure.struct_kind is '�g�D���	 �l/�@�l/�q�ɋƎ�/�^���Ǝ�/�A�g�V�X�e��';
comment on column m_structure.struct_stat is '�g�D�X�e�[�^�X	 �p�u���b�N�A�v���C�x�[�g';
comment on column m_structure.struct_nm is '�g�D���i���́j	 ���A�~�h���l�[���A���̊Ԃ́A���p�X�y�[�X������B';
comment on column m_structure.struct_nm_kana is '�g�D���i���ȁj	 ���A�~�h���l�[���A���̊Ԃ́A���p�X�y�[�X������B';
comment on column m_structure.struct_nm_nick is '�g�D���i�ʏ́j	 ���A�~�h���l�[���A���̊Ԃ́A���p�X�y�[�X������B';
comment on column m_structure.mailaddress is '���[���A�h���X	 ���݂��Ȃ��ꍇ�i�V�X�e���A�J�E���g���j�́unone�v�Œ�';
comment on column m_structure.password is '�p�X���[�h';
comment on column m_structure.tel1 is '�d�b�ԍ��i�Œ�j	 XXX-XXXX-XXXX';
comment on column m_structure.tel2 is '�d�b�ԍ��i�g�сj	 XXX-XXXX-XXXX';
comment on column m_structure.note is '���l';
comment on column m_structure.default_locale is '�W�����P�[��ID	 ����R�[�h��ݒ�i���ʂ́A���{�Œ�j';
comment on column m_structure.ex_cnt is '�r������J�E���^	 �o�^����邲�ƂɁ{�P����B';
comment on column m_structure.ins_acc is '�o�^�A�J�E���g	 �o�^���̃A�J�E���g';
comment on column m_structure.ins_date is '�o�^����	 �o�^��������';
comment on column m_structure.upd_acc is '�X�V�A�J�E���g	 �X�V���̃A�J�E���g';
comment on column m_structure.upd_date is '�X�V����	 �X�V��������';
comment on column m_structure.del_flg is '�폜�t���O	 "1"�ɂȂ�Ƙ_���폜';
comment on column m_structure.rec_id is '���R�[�hID	 ���R�[�h�ҏW�pID';

comment on table m_account is '�A�J�E���g�}�X�^	 �A�J�E���g�����`����B���A�A�J�E���g�ɂ́A�^�c�A�J�E���g���܂ށB';
comment on column m_account.acc_id is '�A�J�E���gID';
comment on column m_account.acc_kind is '�A�J�E���g���	 �l/�@�l/�q�ɋƎ�/�^���Ǝ�/�A�g�V�X�e��';
comment on column m_account.acc_stat is '�A�J�E���g�X�e�[�^�X	 �p�u���b�N�A�v���C�x�[�g';
comment on column m_account.acc_nm is '�A�J�E���g���i���́j	 ���A�~�h���l�[���A���̊Ԃ́A���p�X�y�[�X������B';
comment on column m_account.acc_nm_kana is '�A�J�E���g���i���ȁj	 ���A�~�h���l�[���A���̊Ԃ́A���p�X�y�[�X������B';
comment on column m_account.acc_nm_nick is '�A�J�E���g���i�j�b�N�l�[���j	 ���A�~�h���l�[���A���̊Ԃ́A���p�X�y�[�X������B';
comment on column m_account.mailaddress is '���[���A�h���X	 ���݂��Ȃ��ꍇ�i�V�X�e���A�J�E���g���j�́unone�v�Œ�';
comment on column m_account.password is '�p�X���[�h';
comment on column m_account.gender is '����	 �j���A�����A���̑�';
comment on column m_account.birthdate is '���N����	 ���݂��Ȃ��ꍇ�i�V�X�e���A�J�E���g���j�́u00000000�v�Œ�';
comment on column m_account.tel1 is '�d�b�ԍ��i�Œ�j	 XXX-XXXX-XXXX';
comment on column m_account.tel2 is '�d�b�ԍ��i�g�сj	 XXX-XXXX-XXXX';
comment on column m_account.note is '���l';
comment on column m_account.default_locale is '�W�����P�[��ID	 ����R�[�h��ݒ�i���ʂ́A���{�Œ�j';
comment on column m_account.ex_cnt is '�r������J�E���^	 �o�^����邲�ƂɁ{�P����B';
comment on column m_account.ins_acc is '�o�^�A�J�E���g	 �o�^���̃A�J�E���g';
comment on column m_account.ins_date is '�o�^����	 �o�^��������';
comment on column m_account.upd_acc is '�X�V�A�J�E���g	 �X�V���̃A�J�E���g';
comment on column m_account.upd_date is '�X�V����	 �X�V��������';
comment on column m_account.del_flg is '�폜�t���O	 "1"�ɂȂ�Ƙ_���폜';
comment on column m_account.rec_id is '���R�[�hID	 ���R�[�h�ҏW�pID';

