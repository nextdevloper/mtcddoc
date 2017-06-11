-- Project Name : MTCLOUD
-- Date/Time    : 2014/05/24 19:14:28
-- Author       : minakada
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- メッセージ送信履歴
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

-- アカウントマスタ（送信先）
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

-- アカウントマスタ（ブロック）
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

-- コックピット情報（提供側）
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

-- コックピット情報（利用側）
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

comment on table t_msg_send is 'メッセージ送信履歴	 メッセージ送信の履歴';
comment on column t_msg_send.acc_id is 'アカウントID';
comment on column t_msg_send.acc_id_send is 'アカウントID（送信先）	 アカウントIDを指定';
comment on column t_msg_send.msg_code is 'メッセージコード';
comment on column t_msg_send.default_locale is '標準ロケールID	 言語コードを設定（当面は、日本（ja）固定）';
comment on column t_msg_send.ex_cnt is '排他制御カウンタ	 登録されるごとに＋１する。';
comment on column t_msg_send.ins_acc is '登録アカウント	 登録時のアカウント';
comment on column t_msg_send.ins_date is '登録日時	 登録した日時';
comment on column t_msg_send.upd_acc is '更新アカウント	 更新時のアカウント（初回は登録時と同じ）';
comment on column t_msg_send.upd_date is '更新日時	 更新した日時（初回は登録時と同じ）';
comment on column t_msg_send.del_flg is '削除フラグ	 1になると論理削除';
comment on column t_msg_send.rec_id is 'レコードID	 レコード編集用ID';

comment on table m_account_block_send is 'アカウントマスタ（送信先）	 現在の状態が確認できる分析用の情報';
comment on column m_account_block_send.acc_id is 'アカウントID';
comment on column m_account_block_send.acc_id_send is 'アカウントID（送信先）	 アカウントIDを指定';
comment on column m_account_block_send.default_locale is '標準ロケールID	 言語コードを設定（当面は、日本固定）';
comment on column m_account_block_send.ex_cnt is '排他制御カウンタ	 登録されるごとに＋１する。';
comment on column m_account_block_send.ins_acc is '登録アカウント	 登録時のアカウント';
comment on column m_account_block_send.ins_date is '登録日時	 登録した日時';
comment on column m_account_block_send.upd_acc is '更新アカウント	 更新時のアカウント';
comment on column m_account_block_send.upd_date is '更新日時	 更新した日時';
comment on column m_account_block_send.del_flg is '削除フラグ	 "1"になると論理削除';
comment on column m_account_block_send.rec_id is 'レコードID	 レコード編集用ID';

comment on table m_account_block is 'アカウントマスタ（ブロック）	 アカウントブロック';
comment on column m_account_block.acc_id is 'アカウントID';
comment on column m_account_block.acc_id_block is 'アカウントID（ブロック）	 アカウントIDを指定';
comment on column m_account_block.default_locale is '標準ロケールID	 言語コードを設定（当面は、日本固定）';
comment on column m_account_block.ex_cnt is '排他制御カウンタ	 登録されるごとに＋１する。';
comment on column m_account_block.ins_acc is '登録アカウント	 登録時のアカウント';
comment on column m_account_block.ins_date is '登録日時	 登録した日時';
comment on column m_account_block.upd_acc is '更新アカウント	 更新時のアカウント';
comment on column m_account_block.upd_date is '更新日時	 更新した日時';
comment on column m_account_block.del_flg is '削除フラグ	 "1"になると論理削除';
comment on column m_account_block.rec_id is 'レコードID	 レコード編集用ID';

comment on table dw_cockpit_lender is 'コックピット情報（提供側）	 現在の状態が確認できる分析用の情報';
comment on column dw_cockpit_lender.acc_id is 'アカウントID';
comment on column dw_cockpit_lender.cocpit_id is 'コックピットID';
comment on column dw_cockpit_lender.loc_id is 'ロケーションID';
comment on column dw_cockpit_lender.box_id is 'ボックスID';
comment on column dw_cockpit_lender.rent_fee_init_amount is '場所提供料（初回）	 1回目';
comment on column dw_cockpit_lender.rent_fee_daily_amount is '場所提供料（日額）';
comment on column dw_cockpit_lender.deposit_usage_amount is '利用側保証料';
comment on column dw_cockpit_lender.deposit_lender_amount is '提供側保証料';
comment on column dw_cockpit_lender.rent_day is '預かり開始日';
comment on column dw_cockpit_lender.rent_term is '預かり期間	 日数を指定';
comment on column dw_cockpit_lender.tag_a is '追加タグA';
comment on column dw_cockpit_lender.tag_b is '追加タグB';
comment on column dw_cockpit_lender.default_locale is '標準ロケールID	 言語コードを設定（当面は、日本（ja）固定）';
comment on column dw_cockpit_lender.ex_cnt is '排他制御カウンタ	 登録されるごとに＋１する。';
comment on column dw_cockpit_lender.ins_acc is '登録アカウント	 登録時のアカウント';
comment on column dw_cockpit_lender.ins_date is '登録日時	 登録した日時															
更新時のアカウント（初回は登録時と同じ）';
comment on column dw_cockpit_lender.upd_acc is '更新アカウント	 更新時のアカウント（初回は登録時と同じ）';
comment on column dw_cockpit_lender.upd_date is '更新日時	 更新した日時（初回は登録時と同じ）';
comment on column dw_cockpit_lender.del_flg is '削除フラグ	 1になると論理削除';
comment on column dw_cockpit_lender.rec_id is 'レコードID	 レコード編集用ID';

comment on table dw_cockpit_usage is 'コックピット情報（利用側）	 現在の状態が確認できる分析用の情報';
comment on column dw_cockpit_usage.acc_id is 'アカウントID';
comment on column dw_cockpit_usage.cocpit_id is 'コックピットID';
comment on column dw_cockpit_usage.loc_id is 'ロケーションID';
comment on column dw_cockpit_usage.box_id is 'ボックスID';
comment on column dw_cockpit_usage.mt_id is 'マテリアルID';
comment on column dw_cockpit_usage.mt_kind1 is 'マテリアル種別１	 パブリック/プライベート';
comment on column dw_cockpit_usage.mt_kind2 is 'マテリアル種別２	 本/CD/DVD/その他';
comment on column dw_cockpit_usage.rent_fee_init_amount is '場所提供料（初回）	 1回目';
comment on column dw_cockpit_usage.rent_fee_daily_amount is '場所提供料（日額）';
comment on column dw_cockpit_usage.deposit_usage_amount is '利用側保証料';
comment on column dw_cockpit_usage.deposit_lender_amount is '提供側保証料';
comment on column dw_cockpit_usage.rent_day is '預かり開始日';
comment on column dw_cockpit_usage.rent_term is '預かり期間	 日数を指定';
comment on column dw_cockpit_usage.tag_a is '追加タグA';
comment on column dw_cockpit_usage.tag_b is '追加タグB';
comment on column dw_cockpit_usage.default_locale is '標準ロケールID	 言語コードを設定（当面は、日本（ja）固定）';
comment on column dw_cockpit_usage.ex_cnt is '排他制御カウンタ	 登録されるごとに＋１する。';
comment on column dw_cockpit_usage.ins_acc is '登録アカウント	 登録時のアカウント';
comment on column dw_cockpit_usage.ins_date is '登録日時	 登録した日時															
更新時のアカウント（初回は登録時と同じ）';
comment on column dw_cockpit_usage.upd_acc is '更新アカウント	 更新時のアカウント（初回は登録時と同じ）';
comment on column dw_cockpit_usage.upd_date is '更新日時	 更新した日時（初回は登録時と同じ）';
comment on column dw_cockpit_usage.del_flg is '削除フラグ	 1になると論理削除';
comment on column dw_cockpit_usage.rec_id is 'レコードID	 レコード編集用ID';

