-- Project Name : MTCLOUD
-- Date/Time    : 2014/05/24 19:12:04
-- Author       : minakada
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2


-- ボックス契約取引情報（ロケーション提供）
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

-- ポイント受取支払情報
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

-- ボックス契約取引情報（ロケーション間移動）
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

comment on table t_box_cntrct_rent is 'ボックス契約取引情報（ロケーション提供）	 ボックス向けロケーション提供契約取引情報を格納する。';
comment on column t_box_cntrct_rent.trade_id is '取引ID';
comment on column t_box_cntrct_rent.cntrct_id is '契約ID';
comment on column t_box_cntrct_rent.contrct_stat is '契約状態	 未契約/契約中/契約終了';
comment on column t_box_cntrct_rent.rent_fee_init_stat is '支払状況-場所提供料（初回）	 未/済';
comment on column t_box_cntrct_rent.rent_fee_daily_stat is '支払状況-場所提供料（日額）	 未/済';
comment on column t_box_cntrct_rent.deposit_usage_stat is '支払状況-利用側保証料	 未/済';
comment on column t_box_cntrct_rent.deposit_lender_stat is '支払状況-提供側保証料	 未/済';
comment on column t_box_cntrct_rent.default_locale is '標準ロケールID	 言語コードを設定（当面は、日本固定）';
comment on column t_box_cntrct_rent.ex_cnt is '排他制御カウンタ	 登録されるごとに＋１する。';
comment on column t_box_cntrct_rent.ins_acc is '登録アカウント	 登録時のアカウント';
comment on column t_box_cntrct_rent.ins_date is '登録日時	 登録した日時';
comment on column t_box_cntrct_rent.upd_acc is '更新アカウント	 更新時のアカウント';
comment on column t_box_cntrct_rent.upd_date is '更新日時	 更新した日時';
comment on column t_box_cntrct_rent.del_flg is '削除フラグ	 "1"になると論理削除';
comment on column t_box_cntrct_rent.rec_id is 'レコードID	 レコード編集用ID';

comment on table t_pointsettlement is 'ポイント受取支払情報	 ポイント決済履歴を格納する。';
comment on column t_pointsettlement.setle_id is '決済ID';
comment on column t_pointsettlement.trade_id is '取引ID';
comment on column t_pointsettlement.acc_id_pay is 'アカウントID（支払側）';
comment on column t_pointsettlement.acc_id_income is 'アカウントID（受取側）';
comment on column t_pointsettlement.point_kind is 'ポイント種別	 キャッシュポイント/トレードポイント';
comment on column t_pointsettlement.trade_date is '取引日	 存在しない場合（システムアカウント等）は「00000000」固定';
comment on column t_pointsettlement.trade_amount is '取引額';
comment on column t_pointsettlement.default_locale is '標準ロケールID	 言語コードを設定（当面は、日本固定）';
comment on column t_pointsettlement.ex_cnt is '排他制御カウンタ	 登録されるごとに＋１する。';
comment on column t_pointsettlement.ins_acc is '登録アカウント	 登録時のアカウント';
comment on column t_pointsettlement.ins_date is '登録日時	 登録した日時';
comment on column t_pointsettlement.upd_acc is '更新アカウント	 更新時のアカウント';
comment on column t_pointsettlement.upd_date is '更新日時	 更新した日時';
comment on column t_pointsettlement.del_flg is '削除フラグ	 "1"になると論理削除';
comment on column t_pointsettlement.rec_id is 'レコードID	 レコード編集用ID';

comment on table t_box_cntrct_move is 'ボックス契約取引情報（ロケーション間移動）	 ボックスのロケーション間移動契約取引情報を格納する。';
comment on column t_box_cntrct_move.trade_id is '取引ID';
comment on column t_box_cntrct_move.cntrct_id is '契約ID';
comment on column t_box_cntrct_move.contrct_stat is '契約状態	 未契約/契約中/契約終了';
comment on column t_box_cntrct_move.move_fee_stat is '支払状況-移動料	 未/済';
comment on column t_box_cntrct_move.default_locale is '標準ロケールID	 言語コードを設定（当面は、日本固定）';
comment on column t_box_cntrct_move.ex_cnt is '排他制御カウンタ	 登録されるごとに＋１する。';
comment on column t_box_cntrct_move.ins_acc is '登録アカウント	 登録時のアカウント';
comment on column t_box_cntrct_move.ins_date is '登録日時	 登録した日時';
comment on column t_box_cntrct_move.upd_acc is '更新アカウント	 更新時のアカウント';
comment on column t_box_cntrct_move.upd_date is '更新日時	 更新した日時';
comment on column t_box_cntrct_move.del_flg is '削除フラグ	 "1"になると論理削除';
comment on column t_box_cntrct_move.rec_id is 'レコードID	 レコード編集用ID';

