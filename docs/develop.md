# 開発記録

## アウトライン

- mix phx.new にてプロジェクトを作成
- docker-compose と Dockerfile を作成して仮想環境を用意
  - docker-compose up で Phoenix の初期ページを確認
  - DBM の接続が大事
- mix ecto.create で DB を作成
- mix phx.gen.schema モデル名 テーブル名 カラム定義
  - 例) mix phx.gen.schema DeviceType device_types code:string name:string
  - 例) mix phx.gen.schema Device devices code:string device_type:references:device_types
    - 外部キーも設定出来る
- mix ecto.migrate
