defmodule LogLac.Measurement.Temperature do
  use Ecto.Schema
  import Ecto.Changeset

  schema "temperatures" do
    field :date, :utc_datetime
    field :value, :float
    field :device_code, :string
    field :sensor_code, :string

    timestamps()
  end

  @doc false
  def changeset(temperature, attrs) do
    temperature
    |> cast(attrs, [:date, :value, :device_code, :sensor_code])
    |> validate_required([:date, :value, :device_code, :sensor_code])
  end
end
