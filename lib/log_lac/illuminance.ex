defmodule LogLac.Illuminance do
  use Ecto.Schema
  import Ecto.Changeset

  schema "illuminances" do
    field :date, :utc_datetime
    field :value, :integer
    field :device_code, :id
    field :sensor_code, :id

    timestamps()
  end

  @doc false
  def changeset(illuminance, attrs) do
    illuminance
    |> cast(attrs, [:date, :value])
    |> validate_required([:date, :value])
  end
end
