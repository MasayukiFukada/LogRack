defmodule LogLac.Measurement.AtmosphericPressure do
  use Ecto.Schema
  import Ecto.Changeset

  schema "atmospheric_pressures" do
    field :date, :utc_datetime
    field :value, :integer
    field :device_code, :string
    field :sensor_code, :string

    timestamps()
  end

  @doc false
  def changeset(atmospheric_pressure, attrs) do
    atmospheric_pressure
    |> cast(attrs, [:date, :value, :device_code, :sensor_code])
    |> validate_required([:date, :value, :device_code, :sensor_code])
  end
end
