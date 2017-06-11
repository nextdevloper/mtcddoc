-- Project Name : MTCLOUD
-- Date/Time    : 2014/05/24 19:08:04
-- Author       : minakada
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- ���P�[�V�����}�X�^
drop table if exists m_location cascade;

create table m_location (
  loc_id character varying(20) not null
  , loc_kind character varying(4) not null
  , loc_nm character varying(20) not null
  , loc_onr_id character varying(20) not null
  , postcd character varying(8)
  , address character varying(250)
  , recipient character varying(20)
  , tel1 character varying(20)
  , note character varying(250)
  , default_locale character varying(20) default 'ja' not null
  , ex_cnt numeric(10) default 1 not null
  , ins_acc character varying(20) not null
  , ins_date timestamp not null
  , upd_acc character varying(20) not null
  , upd_date timestamp not null
  , del_flg character varying(1) default '0' not null
  , rec_id bigserial not null
  , constraint m_location_PKC primary key (loc_id)
) ;

-- �{�b�N�X�}�X�^
drop table if exists m_box cascade;

create table m_box (
  box_id character varying(20) not null
  , box_kind character varying(4) not null
  , box_onr_id character varying(20) not null
  , capa_ind character varying(4) not null
  , box_nm character varying(20) not null
  , note character varying(250) not null
  , default_locale character varying(20) default 'ja' not null
  , ex_cnt numeric(10) default 1 not null
  , ins_acc character varying(20) not null
  , ins_date timestamp not null
  , upd_acc character varying(20) not null
  , upd_date timestamp not null
  , del_flg character varying(1) default '0' not null
  , rec_id bigserial not null
  , constraint m_box_PKC primary key (box_id)
) ;

-- �}�e���A���}�X�^
drop table if exists m_material cascade;

create table m_material (
  mt_id character varying(20) not null
  , mt_kind1 character varying(4) not null
  , mt_kind2 character varying(4) not null
  , mt_nm character varying(20) not null
  , tag_a character varying(256) not null
  , tag_b character varying(256)
  , default_locale character varying(20) default 'ja' not null
  , ex_cnt numeric(10) default 1 not null
  , ins_acc character varying(20) not null
  , ins_date timestamp not null
  , upd_acc character varying(20) not null
  , upd_date timestamp not null
  , del_flg character varying(1) default '0' not null
  , rec_id bigserial not null
  , constraint m_material_PKC primary key (mt_id)
) ;

-- �{�b�N�X�_��}�X�^�i���P�[�V�����񋟁j
drop table if exists m_boxcntrct_rent cascade;

create table m_boxcntrct_rent (
  cntrct_id character varying(20) not null
  , loc_id character varying(20) not null
  , box_id character varying(20) not null
  , capa_kind character varying(4) not null
  , mt_stat2 character varying(20) not null
  , point_kind character varying(4) not null
  , rent_fee_init_amount numeric(20) not null
  , rent_fee_daily_amount numeric(20) not null
  , deposit_usage_amount numeric(20) not null
  , deposit_lender_amount numeric(20) not null
  , rent_term numeric(20) not null
  , rent_kind character varying(4) not null
  , default_locale character varying(20) default 'ja' not null
  , ex_cnt numeric(10) default 1 not null
  , ins_acc character varying(20) not null
  , ins_date timestamp not null
  , upd_acc character varying(20) not null
  , upd_date timestamp not null
  , del_flg character varying(1) default '0' not null
  , rec_id bigserial not null
  , constraint m_boxcntrct_rent_PKC primary key (cntrct_id)
) ;

-- �{�b�N�X�_��}�X�^�i���P�[�V�����Ԉړ��j
drop table if exists m_boxcntrct_move cascade;

create table m_boxcntrct_move (
  cntrct_id character varying(20)
  , loc_id character varying(20) not null
  , loc_id_after character varying(20) not null
  , box_id character varying(20) not null
  , cntrct_carier_id character varying(20) not null
  , capa_kind character varying(4) not null
  , point_kind character varying(4) not null
  , move_fee_amount numeric(20) not null
  , default_locale character varying(20) default 'ja' not null
  , ex_cnt numeric(10) default 1 not null
  , ins_acc character varying(20) not null
  , ins_date timestamp not null
  , upd_acc character varying(20) not null
  , upd_date timestamp not null
  , del_flg character varying(1) default '0' not null
  , rec_id bigserial not null
  , constraint m_boxcntrct_move_PKC primary key (cntrct_id)
) ;

-- ���P�[�V�����{�b�N�X�֘A�}�X�^
drop table if exists m_r_locbox cascade;

create table m_r_locbox (
  loc_id character varying(20) not null
  , box_id character varying(20) not null
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
  , constraint m_r_locbox_PKC primary key (loc_id,box_id)
) ;

-- �{�b�N�X�}�e���A���֘A�}�X�^
drop table if exists m_r_boxmaterial cascade;

create table m_r_boxmaterial (
  box_id character varying(20) not null
  , mt_id character varying(20) not null
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
  , constraint m_r_boxmaterial_PKC primary key (box_id,mt_id)
) ;

comment on table m_location is '���P�[�V�����}�X�^	 ���P�[�V���������`����B';
comment on column m_location.loc_id is '���P�[�V����ID';
comment on column m_location.loc_kind is '���P�[�V�������	 �v���C�x�[�g/�p�u���b�N';
comment on column m_location.loc_nm is '���P�[�V������';
comment on column m_location.loc_onr_id is '���P�[�V�����I�[�i�[ID	 �J�E���gID���w��';
comment on column m_location.postcd is '�X�֔ԍ�	 XXX-XXXX';
comment on column m_location.address is '�Z��';
comment on column m_location.recipient is '���t�於';
comment on column m_location.tel1 is '�d�b�ԍ��i�Œ�j	 XXX-XXXX-XXXX';
comment on column m_location.note is '���l';
comment on column m_location.default_locale is '�W�����P�[��ID	 ����R�[�h��ݒ�i���ʂ́A���{�Œ�j';
comment on column m_location.ex_cnt is '�r������J�E���^	 �o�^����邲�ƂɁ{�P����B';
comment on column m_location.ins_acc is '�o�^�A�J�E���g	 �o�^���̃A�J�E���g';
comment on column m_location.ins_date is '�o�^����	 �o�^��������';
comment on column m_location.upd_acc is '�X�V�A�J�E���g	 �X�V���̃A�J�E���g';
comment on column m_location.upd_date is '�X�V����	 �X�V��������';
comment on column m_location.del_flg is '�폜�t���O	 "1"�ɂȂ�Ƙ_���폜';
comment on column m_location.rec_id is '���R�[�hID	 ���R�[�h�ҏW�pID';

comment on table m_box is '�{�b�N�X�}�X�^	 �{�b�N�X�����`����B';
comment on column m_box.box_id is '�{�b�N�XID';
comment on column m_box.box_kind is '�{�b�N�X���';
comment on column m_box.box_onr_id is '�{�b�N�X�I�[�i�[ID';
comment on column m_box.capa_ind is '�e�ʎ��';
comment on column m_box.box_nm is '�{�b�N�X��';
comment on column m_box.note is '���l';
comment on column m_box.default_locale is '�W�����P�[��ID';
comment on column m_box.ex_cnt is '�r������J�E���^';
comment on column m_box.ins_acc is '�o�^�A�J�E���g';
comment on column m_box.ins_date is '�o�^����';
comment on column m_box.upd_acc is '�X�V�A�J�E���g';
comment on column m_box.upd_date is '�X�V����';
comment on column m_box.del_flg is '�폜�t���O';
comment on column m_box.rec_id is '���R�[�hID	 ���R�[�h�ҏW�pID';

comment on table m_material is '�}�e���A���}�X�^	 �}�e���A�������`����B';
comment on column m_material.mt_id is '�}�e���A��ID';
comment on column m_material.mt_kind1 is '�}�e���A����ʂP	 �p�u���b�N/�v���C�x�[�g';
comment on column m_material.mt_kind2 is '�}�e���A����ʂQ	 �{/CD/DVD/���̑�';
comment on column m_material.mt_nm is '�}�e���A����';
comment on column m_material.tag_a is '�ǉ��^�OA';
comment on column m_material.tag_b is '�ǉ��^�OB';
comment on column m_material.default_locale is '�W�����P�[��ID	 ����R�[�h��ݒ�i���ʂ́A���{�Œ�j';
comment on column m_material.ex_cnt is '�r������J�E���^	 �o�^����邲�ƂɁ{�P����B';
comment on column m_material.ins_acc is '�o�^�A�J�E���g	 �o�^���̃A�J�E���g';
comment on column m_material.ins_date is '�o�^����	 �o�^��������';
comment on column m_material.upd_acc is '�X�V�A�J�E���g	 �X�V���̃A�J�E���g';
comment on column m_material.upd_date is '�X�V����	 �X�V��������';
comment on column m_material.del_flg is '�폜�t���O	 "1"�ɂȂ�Ƙ_���폜';
comment on column m_material.rec_id is '���R�[�hID	 ���R�[�h�ҏW�pID';

comment on table m_boxcntrct_rent is '�{�b�N�X�_��}�X�^�i���P�[�V�����񋟁j	 �{�b�N�X�������P�[�V�����񋟌_��������`����B';
comment on column m_boxcntrct_rent.cntrct_id is '�_��ID';
comment on column m_boxcntrct_rent.loc_id is '���P�[�V����ID';
comment on column m_boxcntrct_rent.box_id is '�{�b�N�XID';
comment on column m_boxcntrct_rent.capa_kind is '�e�ʎ��	 �L���p�V�e�B�̎�ށi�T�C�Y���j';
comment on column m_boxcntrct_rent.mt_stat2 is '�}�e���A����ԂQ	 ���g�p/�ʏ�/�s�Ǖi/���̑�';
comment on column m_boxcntrct_rent.point_kind is '�|�C���g���	 �L���b�V���|�C���g/�g���[�h�|�C���g';
comment on column m_boxcntrct_rent.rent_fee_init_amount is '�ꏊ�񋟗��i����j	 1���';
comment on column m_boxcntrct_rent.rent_fee_daily_amount is '�ꏊ�񋟗��i���z�j';
comment on column m_boxcntrct_rent.deposit_usage_amount is '���p���ۏؗ�';
comment on column m_boxcntrct_rent.deposit_lender_amount is '�񋟑��ۏؗ�';
comment on column m_boxcntrct_rent.rent_term is '�a�������	 �������w��';
comment on column m_boxcntrct_rent.rent_kind is '�a������	 �������i�j���j/�����L�i���������j/���̑�';
comment on column m_boxcntrct_rent.default_locale is '�W�����P�[��ID	 ����R�[�h��ݒ�i���ʂ́A���{�Œ�j';
comment on column m_boxcntrct_rent.ex_cnt is '�r������J�E���^	 �o�^����邲�ƂɁ{�P����B';
comment on column m_boxcntrct_rent.ins_acc is '�o�^�A�J�E���g	 �o�^���̃A�J�E���g';
comment on column m_boxcntrct_rent.ins_date is '�o�^����	 �o�^��������';
comment on column m_boxcntrct_rent.upd_acc is '�X�V�A�J�E���g	 �X�V���̃A�J�E���g';
comment on column m_boxcntrct_rent.upd_date is '�X�V����	 �X�V��������';
comment on column m_boxcntrct_rent.del_flg is '�폜�t���O	 "1"�ɂȂ�Ƙ_���폜';
comment on column m_boxcntrct_rent.rec_id is '���R�[�hID	 ���R�[�h�ҏW�pID';

comment on table m_boxcntrct_move is '�{�b�N�X�_��}�X�^�i���P�[�V�����Ԉړ��j	 �{�b�N�X�̃��P�[�V�����Ԉړ��������`����B';
comment on column m_boxcntrct_move.cntrct_id is '�_��ID';
comment on column m_boxcntrct_move.loc_id is '���P�[�V����ID';
comment on column m_boxcntrct_move.loc_id_after is '���P�[�V����ID�i�ړ���j	 �ړ���';
comment on column m_boxcntrct_move.box_id is '�{�b�N�XID';
comment on column m_boxcntrct_move.cntrct_carier_id is '�_��Ǝ�ID(�g�D)	 �A�J�E���gID���w��';
comment on column m_boxcntrct_move.capa_kind is '�e�ʎ��	 �L���p�V�e�B�̎�ށi�T�C�Y���j';
comment on column m_boxcntrct_move.point_kind is '�|�C���g���	 �L���b�V���|�C���g/�g���[�h�|�C���g';
comment on column m_boxcntrct_move.move_fee_amount is '�ړ���';
comment on column m_boxcntrct_move.default_locale is '�W�����P�[��ID	 ����R�[�h��ݒ�i���ʂ́A���{�Œ�j';
comment on column m_boxcntrct_move.ex_cnt is '�r������J�E���^	 �o�^����邲�ƂɁ{�P����B';
comment on column m_boxcntrct_move.ins_acc is '�o�^�A�J�E���g	 �o�^���̃A�J�E���g';
comment on column m_boxcntrct_move.ins_date is '�o�^����	 �o�^��������';
comment on column m_boxcntrct_move.upd_acc is '�X�V�A�J�E���g	 �X�V���̃A�J�E���g';
comment on column m_boxcntrct_move.upd_date is '�X�V����	 �X�V��������';
comment on column m_boxcntrct_move.del_flg is '�폜�t���O	 "1"�ɂȂ�Ƙ_���폜';
comment on column m_boxcntrct_move.rec_id is '���R�[�hID	 ���R�[�h�ҏW�pID';

comment on table m_r_locbox is '���P�[�V�����{�b�N�X�֘A�}�X�^	 �{�b�N�X�����݂ǂ̃��P�[�V�����Ɋ֘A���Ă��邩�̏����`����B';
comment on column m_r_locbox.loc_id is '���P�[�V����ID';
comment on column m_r_locbox.box_id is '�{�b�N�XID';
comment on column m_r_locbox.tag_a is '�ǉ��^�OA';
comment on column m_r_locbox.tag_b is '�ǉ��^�OB';
comment on column m_r_locbox.default_locale is '�W�����P�[��ID	 ����R�[�h��ݒ�i���ʂ́A���{�Œ�j';
comment on column m_r_locbox.ex_cnt is '�r������J�E���^	 �o�^����邲�ƂɁ{�P����B';
comment on column m_r_locbox.ins_acc is '�o�^�A�J�E���g	 �o�^���̃A�J�E���g';
comment on column m_r_locbox.ins_date is '�o�^����	 �o�^��������';
comment on column m_r_locbox.upd_acc is '�X�V�A�J�E���g	 �X�V���̃A�J�E���g';
comment on column m_r_locbox.upd_date is '�X�V����	 �X�V��������';
comment on column m_r_locbox.del_flg is '�폜�t���O	 "1"�ɂȂ�Ƙ_���폜';
comment on column m_r_locbox.rec_id is '���R�[�hID	 ���R�[�h�ҏW�pID';

comment on table m_r_boxmaterial is '�{�b�N�X�}�e���A���֘A�}�X�^	 �}�e���A�������݂ǂ̃{�b�N�X�Ɋ֘A���Ă��邩�̏����`����B';
comment on column m_r_boxmaterial.box_id is '�{�b�N�XID';
comment on column m_r_boxmaterial.mt_id is '�}�e���A��ID';
comment on column m_r_boxmaterial.tag_a is '�ǉ��^�OA';
comment on column m_r_boxmaterial.tag_b is '�ǉ��^�OB';
comment on column m_r_boxmaterial.default_locale is '�W�����P�[��ID	 ����R�[�h��ݒ�i���ʂ́A���{�Œ�j';
comment on column m_r_boxmaterial.ex_cnt is '�r������J�E���^	 �o�^����邲�ƂɁ{�P����B';
comment on column m_r_boxmaterial.ins_acc is '�o�^�A�J�E���g	 �o�^���̃A�J�E���g';
comment on column m_r_boxmaterial.ins_date is '�o�^����	 �o�^��������';
comment on column m_r_boxmaterial.upd_acc is '�X�V�A�J�E���g	 �X�V���̃A�J�E���g';
comment on column m_r_boxmaterial.upd_date is '�X�V����	 �X�V��������';
comment on column m_r_boxmaterial.del_flg is '�폜�t���O	 "1"�ɂȂ�Ƙ_���폜';
comment on column m_r_boxmaterial.rec_id is '���R�[�hID	 ���R�[�h�ҏW�pID';

