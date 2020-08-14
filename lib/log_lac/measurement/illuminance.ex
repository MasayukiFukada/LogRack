defmodule LogLac.Measurement.Illuminance do
  use Ecto.Schema
  import Ecto.Changeset

  schema "illuminances" do
    field :date, :utc_datetime
    field :value, :integer
    field :device_code, :string
    field :sensor_code, :string

    timestamps()
  end

  @doc false
  def changeset(illuminance, attrs) do
    illuminance
    |> cast(attrs, [:date, :value, :device_code, :sensor_code])
    |> validate_required([:date, :value, :device_code, :sensor_code])
  end
end
