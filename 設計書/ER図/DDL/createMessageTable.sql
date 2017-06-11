-- Project Name : MTCLOUD
-- Date/Time    : 2014/07/26 21:19:39
-- Author       : reve
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- メッセージ送信履歴（お知らせ）
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

-- メッセージ送信履歴（結果報告）
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

-- メッセージ送信履歴（通常メッセージ）
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

comment on table t_msg_send_news is 'メッセージ送信履歴（お知らせ）	 お知らせメッセージの送信履歴';
comment on column t_msg_send_news.acc_id is 'アカウントID';
comment on column t_msg_send_news.acc_id_send is 'アカウントID（送信先）	 アカウントIDを指定';
comment on column t_msg_send_news.msg_no is 'メッセージ番号	 連番';
comment on column t_msg_send_news.msg_title is 'メッセージタイトル';
comment on column t_msg_send_news.msg_note is 'メッセージ内容';
comment on column t_msg_send_news.default_locale is '標準ロケールID	 言語コードを設定（当面は、日本（ja）固定）';
comment on column t_msg_send_news.ex_cnt is '排他制御カウンタ	 登録されるごとに＋１する。';
comment on column t_msg_send_news.ins_acc is '登録アカウント	 登録時のアカウント';
comment on column t_msg_send_news.ins_date is '登録日時	 登録した日時';
comment on column t_msg_send_news.upd_acc is '更新アカウント	 更新時のアカウント（初回は登録時と同じ）';
comment on column t_msg_send_news.upd_date is '更新日時	 更新した日時（初回は登録時と同じ）';
comment on column t_msg_send_news.del_flg is '削除フラグ	 1になると論理削除';
comment on column t_msg_send_news.rec_id is 'レコードID	 レコード編集用ID';

comment on table t_msg_send_result is 'メッセージ送信履歴（結果報告）	 結果報告メッセージの送信履歴';
comment on column t_msg_send_result.acc_id is 'アカウントID';
comment on column t_msg_send_result.acc_id_send is 'アカウントID（送信先）	 アカウントIDを指定';
comment on column t_msg_send_result.msg_no is 'メッセージ番号	 連番';
comment on column t_msg_send_result.msg_title is 'メッセージタイトル';
comment on column t_msg_send_result.msg_note is 'メッセージ内容';
comment on column t_msg_send_result.default_locale is '標準ロケールID	 言語コードを設定（当面は、日本（ja）固定）';
comment on column t_msg_send_result.ex_cnt is '排他制御カウンタ	 登録されるごとに＋１する。';
comment on column t_msg_send_result.ins_acc is '登録アカウント	 登録時のアカウント';
comment on column t_msg_send_result.ins_date is '登録日時	 登録した日時';
comment on column t_msg_send_result.upd_acc is '更新アカウント	 更新時のアカウント（初回は登録時と同じ）';
comment on column t_msg_send_result.upd_date is '更新日時	 更新した日時（初回は登録時と同じ）';
comment on column t_msg_send_result.del_flg is '削除フラグ	 1になると論理削除';
comment on column t_msg_send_result.rec_id is 'レコードID	 レコード編集用ID';

comment on table t_msg_send_normal is 'メッセージ送信履歴（通常メッセージ）	 通常メッセージの送信履歴';
comment on column t_msg_send_normal.acc_id is 'アカウントID';
comment on column t_msg_send_normal.acc_id_send is 'アカウントID（送信先）	 アカウントIDを指定';
comment on column t_msg_send_normal.msg_no is 'メッセージ番号	 連番';
comment on column t_msg_send_normal.msg_title is 'メッセージタイトル';
comment on column t_msg_send_normal.msg_note is 'メッセージ内容';
comment on column t_msg_send_normal.default_locale is '標準ロケールID	 言語コードを設定（当面は、日本（ja）固定）';
comment on column t_msg_send_normal.ex_cnt is '排他制御カウンタ	 登録されるごとに＋１する。';
comment on column t_msg_send_normal.ins_acc is '登録アカウント	 登録時のアカウント';
comment on column t_msg_send_normal.ins_date is '登録日時	 登録した日時';
comment on column t_msg_send_normal.upd_acc is '更新アカウント	 更新時のアカウント（初回は登録時と同じ）';
comment on column t_msg_send_normal.upd_date is '更新日時	 更新した日時（初回は登録時と同じ）';
comment on column t_msg_send_normal.del_flg is '削除フラグ	 1になると論理削除';
comment on column t_msg_send_normal.rec_id is 'レコードID	 レコード編集用ID';

