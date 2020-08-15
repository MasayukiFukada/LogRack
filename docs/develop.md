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
- absinthe, absinthe_plug, poison のモジュールを追加
  - GraphQL 関連
  - [資料](https://qiita.com/piacerex/items/b4f57b55663403f9ec8e)
- プロジェクト\_web/ の下に schema と resolvers ディレクトリを作成する
  - schema/schema.ex に query などを定義
  - schema/content_types.ex に返り値の型を定義
  - resolvers/content.ex にリゾルバを設定
