defmodule LogLac.Measurement.Humidity do
  use Ecto.Schema
  import Ecto.Changeset

  schema "humidities" do
    field :date, :utc_datetime
    field :value, :integer
    field :device_code, :id
    field :sensor_code, :id

    timestamps()
  end

  @doc false
  def changeset(humidity, attrs) do
    humidity
    |> cast(attrs, [:date, :value])
    |> validate_required([:date, :value])
  end
end
