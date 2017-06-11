-- Project Name : MTCLOUD
-- Date/Time    : 2014/05/24 19:08:04
-- Author       : minakada
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- ロケーションマスタ
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

-- ボックスマスタ
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

-- マテリアルマスタ
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

-- ボックス契約マスタ（ロケーション提供）
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

-- ボックス契約マスタ（ロケーション間移動）
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

-- ロケーションボックス関連マスタ
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

-- ボックスマテリアル関連マスタ
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

comment on table m_location is 'ロケーションマスタ	 ロケーション情報を定義する。';
comment on column m_location.loc_id is 'ロケーションID';
comment on column m_location.loc_kind is 'ロケーション種別	 プライベート/パブリック';
comment on column m_location.loc_nm is 'ロケーション名';
comment on column m_location.loc_onr_id is 'ロケーションオーナーID	 カウントIDを指定';
comment on column m_location.postcd is '郵便番号	 XXX-XXXX';
comment on column m_location.address is '住所';
comment on column m_location.recipient is '送付先名';
comment on column m_location.tel1 is '電話番号（固定）	 XXX-XXXX-XXXX';
comment on column m_location.note is '備考';
comment on column m_location.default_locale is '標準ロケールID	 言語コードを設定（当面は、日本固定）';
comment on column m_location.ex_cnt is '排他制御カウンタ	 登録されるごとに＋１する。';
comment on column m_location.ins_acc is '登録アカウント	 登録時のアカウント';
comment on column m_location.ins_date is '登録日時	 登録した日時';
comment on column m_location.upd_acc is '更新アカウント	 更新時のアカウント';
comment on column m_location.upd_date is '更新日時	 更新した日時';
comment on column m_location.del_flg is '削除フラグ	 "1"になると論理削除';
comment on column m_location.rec_id is 'レコードID	 レコード編集用ID';

comment on table m_box is 'ボックスマスタ	 ボックス情報を定義する。';
comment on column m_box.box_id is 'ボックスID';
comment on column m_box.box_kind is 'ボックス種別';
comment on column m_box.box_onr_id is 'ボックスオーナーID';
comment on column m_box.capa_ind is '容量種別';
comment on column m_box.box_nm is 'ボックス名';
comment on column m_box.note is '備考';
comment on column m_box.default_locale is '標準ロケールID';
comment on column m_box.ex_cnt is '排他制御カウンタ';
comment on column m_box.ins_acc is '登録アカウント';
comment on column m_box.ins_date is '登録日時';
comment on column m_box.upd_acc is '更新アカウント';
comment on column m_box.upd_date is '更新日時';
comment on column m_box.del_flg is '削除フラグ';
comment on column m_box.rec_id is 'レコードID	 レコード編集用ID';

comment on table m_material is 'マテリアルマスタ	 マテリアル情報を定義する。';
comment on column m_material.mt_id is 'マテリアルID';
comment on column m_material.mt_kind1 is 'マテリアル種別１	 パブリック/プライベート';
comment on column m_material.mt_kind2 is 'マテリアル種別２	 本/CD/DVD/その他';
comment on column m_material.mt_nm is 'マテリアル名';
comment on column m_material.tag_a is '追加タグA';
comment on column m_material.tag_b is '追加タグB';
comment on column m_material.default_locale is '標準ロケールID	 言語コードを設定（当面は、日本固定）';
comment on column m_material.ex_cnt is '排他制御カウンタ	 登録されるごとに＋１する。';
comment on column m_material.ins_acc is '登録アカウント	 登録時のアカウント';
comment on column m_material.ins_date is '登録日時	 登録した日時';
comment on column m_material.upd_acc is '更新アカウント	 更新時のアカウント';
comment on column m_material.upd_date is '更新日時	 更新した日時';
comment on column m_material.del_flg is '削除フラグ	 "1"になると論理削除';
comment on column m_material.rec_id is 'レコードID	 レコード編集用ID';

comment on table m_boxcntrct_rent is 'ボックス契約マスタ（ロケーション提供）	 ボックス向けロケーション提供契約条件を定義する。';
comment on column m_boxcntrct_rent.cntrct_id is '契約ID';
comment on column m_boxcntrct_rent.loc_id is 'ロケーションID';
comment on column m_boxcntrct_rent.box_id is 'ボックスID';
comment on column m_boxcntrct_rent.capa_kind is '容量種別	 キャパシティの種類（サイズ等）';
comment on column m_boxcntrct_rent.mt_stat2 is 'マテリアル状態２	 未使用/通常/不良品/その他';
comment on column m_boxcntrct_rent.point_kind is 'ポイント種別	 キャッシュポイント/トレードポイント';
comment on column m_boxcntrct_rent.rent_fee_init_amount is '場所提供料（初回）	 1回目';
comment on column m_boxcntrct_rent.rent_fee_daily_amount is '場所提供料（日額）';
comment on column m_boxcntrct_rent.deposit_usage_amount is '利用側保証料';
comment on column m_boxcntrct_rent.deposit_lender_amount is '提供側保証料';
comment on column m_boxcntrct_rent.rent_term is '預かり期間	 日数を指定';
comment on column m_boxcntrct_rent.rent_kind is '預かり種別	 延長無（破棄）/延長有（自動延長）/その他';
comment on column m_boxcntrct_rent.default_locale is '標準ロケールID	 言語コードを設定（当面は、日本固定）';
comment on column m_boxcntrct_rent.ex_cnt is '排他制御カウンタ	 登録されるごとに＋１する。';
comment on column m_boxcntrct_rent.ins_acc is '登録アカウント	 登録時のアカウント';
comment on column m_boxcntrct_rent.ins_date is '登録日時	 登録した日時';
comment on column m_boxcntrct_rent.upd_acc is '更新アカウント	 更新時のアカウント';
comment on column m_boxcntrct_rent.upd_date is '更新日時	 更新した日時';
comment on column m_boxcntrct_rent.del_flg is '削除フラグ	 "1"になると論理削除';
comment on column m_boxcntrct_rent.rec_id is 'レコードID	 レコード編集用ID';

comment on table m_boxcntrct_move is 'ボックス契約マスタ（ロケーション間移動）	 ボックスのロケーション間移動条件を定義する。';
comment on column m_boxcntrct_move.cntrct_id is '契約ID';
comment on column m_boxcntrct_move.loc_id is 'ロケーションID';
comment on column m_boxcntrct_move.loc_id_after is 'ロケーションID（移動後）	 移動後';
comment on column m_boxcntrct_move.box_id is 'ボックスID';
comment on column m_boxcntrct_move.cntrct_carier_id is '契約業者ID(組織)	 アカウントIDを指定';
comment on column m_boxcntrct_move.capa_kind is '容量種別	 キャパシティの種類（サイズ等）';
comment on column m_boxcntrct_move.point_kind is 'ポイント種別	 キャッシュポイント/トレードポイント';
comment on column m_boxcntrct_move.move_fee_amount is '移動料';
comment on column m_boxcntrct_move.default_locale is '標準ロケールID	 言語コードを設定（当面は、日本固定）';
comment on column m_boxcntrct_move.ex_cnt is '排他制御カウンタ	 登録されるごとに＋１する。';
comment on column m_boxcntrct_move.ins_acc is '登録アカウント	 登録時のアカウント';
comment on column m_boxcntrct_move.ins_date is '登録日時	 登録した日時';
comment on column m_boxcntrct_move.upd_acc is '更新アカウント	 更新時のアカウント';
comment on column m_boxcntrct_move.upd_date is '更新日時	 更新した日時';
comment on column m_boxcntrct_move.del_flg is '削除フラグ	 "1"になると論理削除';
comment on column m_boxcntrct_move.rec_id is 'レコードID	 レコード編集用ID';

comment on table m_r_locbox is 'ロケーションボックス関連マスタ	 ボックスが現在どのロケーションに関連しているかの情報を定義する。';
comment on column m_r_locbox.loc_id is 'ロケーションID';
comment on column m_r_locbox.box_id is 'ボックスID';
comment on column m_r_locbox.tag_a is '追加タグA';
comment on column m_r_locbox.tag_b is '追加タグB';
comment on column m_r_locbox.default_locale is '標準ロケールID	 言語コードを設定（当面は、日本固定）';
comment on column m_r_locbox.ex_cnt is '排他制御カウンタ	 登録されるごとに＋１する。';
comment on column m_r_locbox.ins_acc is '登録アカウント	 登録時のアカウント';
comment on column m_r_locbox.ins_date is '登録日時	 登録した日時';
comment on column m_r_locbox.upd_acc is '更新アカウント	 更新時のアカウント';
comment on column m_r_locbox.upd_date is '更新日時	 更新した日時';
comment on column m_r_locbox.del_flg is '削除フラグ	 "1"になると論理削除';
comment on column m_r_locbox.rec_id is 'レコードID	 レコード編集用ID';

comment on table m_r_boxmaterial is 'ボックスマテリアル関連マスタ	 マテリアルが現在どのボックスに関連しているかの情報を定義する。';
comment on column m_r_boxmaterial.box_id is 'ボックスID';
comment on column m_r_boxmaterial.mt_id is 'マテリアルID';
comment on column m_r_boxmaterial.tag_a is '追加タグA';
comment on column m_r_boxmaterial.tag_b is '追加タグB';
comment on column m_r_boxmaterial.default_locale is '標準ロケールID	 言語コードを設定（当面は、日本固定）';
comment on column m_r_boxmaterial.ex_cnt is '排他制御カウンタ	 登録されるごとに＋１する。';
comment on column m_r_boxmaterial.ins_acc is '登録アカウント	 登録時のアカウント';
comment on column m_r_boxmaterial.ins_date is '登録日時	 登録した日時';
comment on column m_r_boxmaterial.upd_acc is '更新アカウント	 更新時のアカウント';
comment on column m_r_boxmaterial.upd_date is '更新日時	 更新した日時';
comment on column m_r_boxmaterial.del_flg is '削除フラグ	 "1"になると論理削除';
comment on column m_r_boxmaterial.rec_id is 'レコードID	 レコード編集用ID';

