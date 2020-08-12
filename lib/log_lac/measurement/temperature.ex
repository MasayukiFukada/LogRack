defmodule LogLac.Measurement.Temperature do
  use Ecto.Schema
  import Ecto.Changeset

  schema "temperatures" do
    field :date, :utc_datetime
    field :value, :float
    field :device_code, :id
    field :sensor_code, :id

    timestamps()
  end

  @doc false
  def changeset(temperature, attrs) do
    temperature
    |> cast(attrs, [:date, :value])
    |> validate_required([:date, :value])
  end
end
