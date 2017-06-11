-- Project Name : MTCLOUD
-- Date/Time    : 2014/05/24 19:12:04
-- Author       : minakada
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2


-- �{�b�N�X�_�������i���P�[�V�����񋟁j
drop table if exists t_box_cntrct_rent cascade;

create table t_box_cntrct_rent (
  trade_id character varying(20) not null
  , cntrct_id character varying(20) not null
  , contrct_stat character varying(4) not null
  , rent_fee_init_stat character varying(4) not null
  , rent_fee_daily_stat character varying(4) not null
  , deposit_usage_stat character varying(4) not null
  , deposit_lender_stat character varying(4) not null
  , default_locale character varying(4) default 'ja' not null
  , ex_cnt numeric(10) default 1 not null
  , ins_acc character varying(20) not null
  , ins_date timestamp not null
  , upd_acc character varying(20) not null
  , upd_date timestamp not null
  , del_flg character varying(1) default '0' not null
  , rec_id bigserial not null
  , constraint t_box_cntrct_rent_PKC primary key (trade_id)
) ;

-- �|�C���g���x�����
drop table if exists t_pointsettlement cascade;

create table t_pointsettlement (
  setle_id character varying(20) not null
  , trade_id character varying(20) not null
  , acc_id_pay character varying(20) not null
  , acc_id_income character varying(20) not null
  , point_kind character varying(4) not null
  , trade_date character varying(8) not null
  , trade_amount numeric(20) not null
  , default_locale character varying(20) default 'ja' not null
  , ex_cnt numeric(10) default 1 not null
  , ins_acc character varying(20) not null
  , ins_date timestamp not null
  , upd_acc character varying(20) not null
  , upd_date timestamp not null
  , del_flg character varying(1) default '0' not null
  , rec_id bigserial not null
  , constraint t_pointsettlement_PKC primary key (setle_id)
) ;

-- �{�b�N�X�_�������i���P�[�V�����Ԉړ��j
drop table if exists t_box_cntrct_move cascade;

create table t_box_cntrct_move (
  trade_id character varying(20) not null
  , cntrct_id character varying(20) not null
  , contrct_stat character varying(4) not null
  , move_fee_stat character varying(4) not null
  , default_locale character varying(20) default 'ja' not null
  , ex_cnt numeric(10) default 1 not null
  , ins_acc character varying(20) not null
  , ins_date timestamp not null
  , upd_acc character varying(20) not null
  , upd_date timestamp not null
  , del_flg character varying(1) not null
  , rec_id bigserial not null
  , constraint t_box_cntrct_move_PKC primary key (trade_id)
) ;

comment on table t_box_cntrct_rent is '�{�b�N�X�_�������i���P�[�V�����񋟁j	 �{�b�N�X�������P�[�V�����񋟌_���������i�[����B';
comment on column t_box_cntrct_rent.trade_id is '���ID';
comment on column t_box_cntrct_rent.cntrct_id is '�_��ID';
comment on column t_box_cntrct_rent.contrct_stat is '�_����	 ���_��/�_��/�_��I��';
comment on column t_box_cntrct_rent.rent_fee_init_stat is '�x����-�ꏊ�񋟗��i����j	 ��/��';
comment on column t_box_cntrct_rent.rent_fee_daily_stat is '�x����-�ꏊ�񋟗��i���z�j	 ��/��';
comment on column t_box_cntrct_rent.deposit_usage_stat is '�x����-���p���ۏؗ�	 ��/��';
comment on column t_box_cntrct_rent.deposit_lender_stat is '�x����-�񋟑��ۏؗ�	 ��/��';
comment on column t_box_cntrct_rent.default_locale is '�W�����P�[��ID	 ����R�[�h��ݒ�i���ʂ́A���{�Œ�j';
comment on column t_box_cntrct_rent.ex_cnt is '�r������J�E���^	 �o�^����邲�ƂɁ{�P����B';
comment on column t_box_cntrct_rent.ins_acc is '�o�^�A�J�E���g	 �o�^���̃A�J�E���g';
comment on column t_box_cntrct_rent.ins_date is '�o�^����	 �o�^��������';
comment on column t_box_cntrct_rent.upd_acc is '�X�V�A�J�E���g	 �X�V���̃A�J�E���g';
comment on column t_box_cntrct_rent.upd_date is '�X�V����	 �X�V��������';
comment on column t_box_cntrct_rent.del_flg is '�폜�t���O	 "1"�ɂȂ�Ƙ_���폜';
comment on column t_box_cntrct_rent.rec_id is '���R�[�hID	 ���R�[�h�ҏW�pID';

comment on table t_pointsettlement is '�|�C���g���x�����	 �|�C���g���ϗ������i�[����B';
comment on column t_pointsettlement.setle_id is '����ID';
comment on column t_pointsettlement.trade_id is '���ID';
comment on column t_pointsettlement.acc_id_pay is '�A�J�E���gID�i�x�����j';
comment on column t_pointsettlement.acc_id_income is '�A�J�E���gID�i��摤�j';
comment on column t_pointsettlement.point_kind is '�|�C���g���	 �L���b�V���|�C���g/�g���[�h�|�C���g';
comment on column t_pointsettlement.trade_date is '�����	 ���݂��Ȃ��ꍇ�i�V�X�e���A�J�E���g���j�́u00000000�v�Œ�';
comment on column t_pointsettlement.trade_amount is '����z';
comment on column t_pointsettlement.default_locale is '�W�����P�[��ID	 ����R�[�h��ݒ�i���ʂ́A���{�Œ�j';
comment on column t_pointsettlement.ex_cnt is '�r������J�E���^	 �o�^����邲�ƂɁ{�P����B';
comment on column t_pointsettlement.ins_acc is '�o�^�A�J�E���g	 �o�^���̃A�J�E���g';
comment on column t_pointsettlement.ins_date is '�o�^����	 �o�^��������';
comment on column t_pointsettlement.upd_acc is '�X�V�A�J�E���g	 �X�V���̃A�J�E���g';
comment on column t_pointsettlement.upd_date is '�X�V����	 �X�V��������';
comment on column t_pointsettlement.del_flg is '�폜�t���O	 "1"�ɂȂ�Ƙ_���폜';
comment on column t_pointsettlement.rec_id is '���R�[�hID	 ���R�[�h�ҏW�pID';

comment on table t_box_cntrct_move is '�{�b�N�X�_�������i���P�[�V�����Ԉړ��j	 �{�b�N�X�̃��P�[�V�����Ԉړ��_���������i�[����B';
comment on column t_box_cntrct_move.trade_id is '���ID';
comment on column t_box_cntrct_move.cntrct_id is '�_��ID';
comment on column t_box_cntrct_move.contrct_stat is '�_����	 ���_��/�_��/�_��I��';
comment on column t_box_cntrct_move.move_fee_stat is '�x����-�ړ���	 ��/��';
comment on column t_box_cntrct_move.default_locale is '�W�����P�[��ID	 ����R�[�h��ݒ�i���ʂ́A���{�Œ�j';
comment on column t_box_cntrct_move.ex_cnt is '�r������J�E���^	 �o�^����邲�ƂɁ{�P����B';
comment on column t_box_cntrct_move.ins_acc is '�o�^�A�J�E���g	 �o�^���̃A�J�E���g';
comment on column t_box_cntrct_move.ins_date is '�o�^����	 �o�^��������';
comment on column t_box_cntrct_move.upd_acc is '�X�V�A�J�E���g	 �X�V���̃A�J�E���g';
comment on column t_box_cntrct_move.upd_date is '�X�V����	 �X�V��������';
comment on column t_box_cntrct_move.del_flg is '�폜�t���O	 "1"�ɂȂ�Ƙ_���폜';
comment on column t_box_cntrct_move.rec_id is '���R�[�hID	 ���R�[�h�ҏW�pID';

