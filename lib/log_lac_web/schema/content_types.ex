defmodule LogLacWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation
  import_types Absinthe.Type.Custom

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
end
