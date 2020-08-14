defmodule LogLacWeb.Schema do
  use Absinthe.Schema
  import_types LogLacWeb.Schema.ContentTypes

  alias LogLacWeb.Resolvers

  query do
    @desc "デバイスを取得"
    field :devices, list_of(:device) do
      resolve &Resolvers.Content.list_devices/3
    end

    # TODO: 日付で絞り込む
    @desc "気温リストを取得"
    field :temperatures, list_of(:temperature) do
      resolve &Resolvers.Content.list_temperatures/3
    end
  end
end
