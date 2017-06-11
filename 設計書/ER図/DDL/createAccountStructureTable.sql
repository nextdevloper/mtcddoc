-- Project Name : MTCLOUD
-- Date/Time    : 2014/05/24 18:46:18
-- Author       : minakada
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- ポイント残高情報
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

-- 組織所属マスタ
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

-- 組織情報マスタ
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

-- アカウントマスタ
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

comment on table b_pointbalance is 'ポイント残高情報	 ポイント情報を定義する。';
comment on column b_pointbalance.acc_id is 'アカウントID';
comment on column b_pointbalance.point_kind is 'ポイント種別	 キャッシュポイント/トレードポイント';
comment on column b_pointbalance.point_balance is 'ポイント残高';
comment on column b_pointbalance.default_locale is '標準ロケールID	 言語コードを設定（当面は、日本固定）';
comment on column b_pointbalance.ex_cnt is '排他制御カウンタ	 登録されるごとに＋１する。';
comment on column b_pointbalance.ins_acc is '登録アカウント	 登録時のアカウント';
comment on column b_pointbalance.ins_date is '登録日時	 登録した日時';
comment on column b_pointbalance.upd_acc is '更新アカウント	 更新時のアカウント';
comment on column b_pointbalance.upd_date is '更新日時	 更新した日時';
comment on column b_pointbalance.del_flg is '削除フラグ	 "1"になると論理削除';
comment on column b_pointbalance.rec_id is 'レコードID	 レコード編集用ID';

comment on table m_r_strctacc is '組織所属マスタ	 組織情報に所属するアカウントを定義する。';
comment on column m_r_strctacc.strct_id is '組織ID';
comment on column m_r_strctacc.acc_id is 'アカウントID';
comment on column m_r_strctacc.admin_flg is '管理者フラグ	 1:管理者';
comment on column m_r_strctacc.note is '備考';
comment on column m_r_strctacc.default_locale is '標準ロケールID	 言語コードを設定（当面は、日本固定）';
comment on column m_r_strctacc.ex_cnt is '排他制御カウンタ	 登録されるごとに＋１する。';
comment on column m_r_strctacc.ins_acc is '登録アカウント	 登録時のアカウント';
comment on column m_r_strctacc.ins_date is '登録日時	 登録した日時';
comment on column m_r_strctacc.upd_acc is '更新アカウント	 更新時のアカウント';
comment on column m_r_strctacc.upd_date is '更新日時	 更新した日時';
comment on column m_r_strctacc.del_flg is '削除フラグ	 "1"になると論理削除';
comment on column m_r_strctacc.rec_id is 'レコードID	 レコード編集用ID';

comment on table m_structure is '組織情報マスタ	 組織情報を定義する。';
comment on column m_structure.strct_id is '組織ID';
comment on column m_structure.struct_kind is '組織種別	 個人/法人/倉庫業者/運送業者/連携システム';
comment on column m_structure.struct_stat is '組織ステータス	 パブリック、プライベート';
comment on column m_structure.struct_nm is '組織名（名称）	 姓、ミドルネーム、名の間は、半角スペースを入れる。';
comment on column m_structure.struct_nm_kana is '組織名（かな）	 姓、ミドルネーム、名の間は、半角スペースを入れる。';
comment on column m_structure.struct_nm_nick is '組織名（通称）	 姓、ミドルネーム、名の間は、半角スペースを入れる。';
comment on column m_structure.mailaddress is 'メールアドレス	 存在しない場合（システムアカウント等）は「none」固定';
comment on column m_structure.password is 'パスワード';
comment on column m_structure.tel1 is '電話番号（固定）	 XXX-XXXX-XXXX';
comment on column m_structure.tel2 is '電話番号（携帯）	 XXX-XXXX-XXXX';
comment on column m_structure.note is '備考';
comment on column m_structure.default_locale is '標準ロケールID	 言語コードを設定（当面は、日本固定）';
comment on column m_structure.ex_cnt is '排他制御カウンタ	 登録されるごとに＋１する。';
comment on column m_structure.ins_acc is '登録アカウント	 登録時のアカウント';
comment on column m_structure.ins_date is '登録日時	 登録した日時';
comment on column m_structure.upd_acc is '更新アカウント	 更新時のアカウント';
comment on column m_structure.upd_date is '更新日時	 更新した日時';
comment on column m_structure.del_flg is '削除フラグ	 "1"になると論理削除';
comment on column m_structure.rec_id is 'レコードID	 レコード編集用ID';

comment on table m_account is 'アカウントマスタ	 アカウント情報を定義する。尚、アカウントには、運営アカウントを含む。';
comment on column m_account.acc_id is 'アカウントID';
comment on column m_account.acc_kind is 'アカウント種別	 個人/法人/倉庫業者/運送業者/連携システム';
comment on column m_account.acc_stat is 'アカウントステータス	 パブリック、プライベート';
comment on column m_account.acc_nm is 'アカウント名（名称）	 姓、ミドルネーム、名の間は、半角スペースを入れる。';
comment on column m_account.acc_nm_kana is 'アカウント名（かな）	 姓、ミドルネーム、名の間は、半角スペースを入れる。';
comment on column m_account.acc_nm_nick is 'アカウント名（ニックネーム）	 姓、ミドルネーム、名の間は、半角スペースを入れる。';
comment on column m_account.mailaddress is 'メールアドレス	 存在しない場合（システムアカウント等）は「none」固定';
comment on column m_account.password is 'パスワード';
comment on column m_account.gender is '性別	 男性、女性、その他';
comment on column m_account.birthdate is '生年月日	 存在しない場合（システムアカウント等）は「00000000」固定';
comment on column m_account.tel1 is '電話番号（固定）	 XXX-XXXX-XXXX';
comment on column m_account.tel2 is '電話番号（携帯）	 XXX-XXXX-XXXX';
comment on column m_account.note is '備考';
comment on column m_account.default_locale is '標準ロケールID	 言語コードを設定（当面は、日本固定）';
comment on column m_account.ex_cnt is '排他制御カウンタ	 登録されるごとに＋１する。';
comment on column m_account.ins_acc is '登録アカウント	 登録時のアカウント';
comment on column m_account.ins_date is '登録日時	 登録した日時';
comment on column m_account.upd_acc is '更新アカウント	 更新時のアカウント';
comment on column m_account.upd_date is '更新日時	 更新した日時';
comment on column m_account.del_flg is '削除フラグ	 "1"になると論理削除';
comment on column m_account.rec_id is 'レコードID	 レコード編集用ID';

