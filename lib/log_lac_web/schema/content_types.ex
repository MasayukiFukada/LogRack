defmodule LogLacWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation
  import_types(Absinthe.Type.Custom)

  object :device do
    @desc "デバイスコード"
    field :code, :string

    @desc "デバイス名"
    field :name, :string

    @desc "備考"
    field :remarks, :string

    @desc "デバイス種別"
    field :device_type, :device_type
  end

  object :device_type do
    @desc "デバイス種別コード"
    field :code, :string

    @desc "デバイス種別名"
    field :name, :string
  end

  object :sensor do
    @desc "センサーコード"
    field :code, :string

    @desc "センサー名"
    field :name, :string

    @desc "備考"
    field :remarks, :string
  end

  object :device_status do
    @desc "CPU の使用率"
    field :cpu_use_rate, :integer

    @desc "メモリーの使用率"
    field :memory_use_rate, :integer

    @desc "ストレージの残り容量(MByte)"
    field :storage, :integer

    @desc "温度(℃)"
    field :temperature, :float

    @desc "起動日時"
    field :wake_on_at, :datetime

    @desc "デバイス"
    field :device, :device
  end

  object :temperature do
    @desc "測定日"
    field :date, :datetime

    @desc "温度"
    field :value, :float

    @desc "デバイス"
    field :device, :device

    @desc "センサー"
    field :sensor, :sensor
  end

  object :atmospheric_pressure do
    @desc "測定日"
    field :date, :datetime

    @desc "気圧"
    field :value, :float

    @desc "デバイス"
    field :device, :device

    @desc "センサー"
    field :sensor, :sensor
  end

  object :humidity do
    @desc "測定日"
    field :date, :datetime

    @desc "湿度"
    field :value, :float

    @desc "デバイス"
    field :device, :device

    @desc "センサー"
    field :sensor, :sensor
  end

  object :illuminance do
    @desc "測定日"
    field :date, :datetime

    @desc "照度"
    field :value, :float

    @desc "デバイス"
    field :device, :device

    @desc "センサー"
    field :sensor, :sensor
  end
end
