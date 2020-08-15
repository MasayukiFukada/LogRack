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

  mutation do
    @desc "デバイスの状態を登録する"
    field :create_device_status, :device_status do
      @desc "CPU の使用率"
      arg :cpu_use_rate, non_null(:integer)

      @desc "メモリの使用率"
      arg :memory_use_rate, non_null(:integer)

      @desc "ストレージの残り容量(MByte)"
      arg :storage, non_null(:integer)

      @desc "温度(℃)"
      arg :temperature, non_null(:float)

      @desc "起動日時"
      arg :wake_on_at, non_null(:datetime)

      @desc "デバイスコード"
      arg :device_code, non_null(:string)

      resolve &Resolvers.DeviceStatusResolvers.create_device_status/3
    end

    @desc "気温を登録する"
    field :create_temperature, :temperature do
      @desc "測定日時"
      arg :date, non_null(:datetime)

      @desc "温度"
      arg :value, non_null(:float)

      @desc "デバイスコード"
      arg :device_code, non_null(:string)

      @desc "センサーコード"
      arg :sensor_code, non_null(:string)

      resolve &Resolvers.TemperatureResolvers.create_temperature/3
    end
  end
end
