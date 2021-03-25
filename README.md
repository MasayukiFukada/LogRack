# LogRack

## デプロイ

### まずは最新にしておく

```sh
sudo apt update
sudo apt upgrade
```

### PostgreSQL をインストール

```sh
$ sudo su
# apt -y install postgresql
# vi /etc/postgresql/11/main/postgresql.conf
# systemctl restart postgresql

" postgres ユーザーのパスワード設定(実際のアプリ環境に合わせる)

# su - postgres
$ psql -c "alter user postgres with password 'postgres'"

" PostgreSQL の接続確認
" postgres ユーザーをオーナーとしてテスト DB を作成
$ createdb testdb -O postgres
" 接続を確認する。環境によっては SSH トンネルも設定する( dbeaver だと SSH のタブで設定)。
" 確認出来たら DB を削除
$ dropdb testdb
```

### 単純なインストール

```bash
# まずは最新版にする
sudo apt update
sudo apt upgrade

# Elixir をインストール( Raspbian )
# [資料](https://qiita.com/takasehideki/items/210f8a7172807d0c9e5b#raspbian%E3%81%AE%E5%A0%B4%E5%90%88)
$ echo "deb https://packages.erlang-solutions.com/debian stretch contrib" | sudo tee /etc/apt/sources.list.d/erlang-solutions.list
$ wget https://packages.erlang-solutions.com/debian/erlang_solutions.asc
$ sudo apt-key add erlang_solutions.asc
$ sudo apt update
$ sudo apt install elixir
# ↓これ大事かも。上のだけだとエラーが起きた
$ sudo apt install erlang-inets
$ sudo apt install erlang-dev
$ sudo apt install erlang-parsetools
```

プロジェクト関連のインストール。
失敗するようなら上の見直しも要るかも。

```bash
# 依存関連のインストール
mix deps.get
# マイグレーション
mix ecto.migrate
```

