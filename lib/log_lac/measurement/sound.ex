defmodule LogLac.Measurement.Sound do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sounds" do
    field :date, :utc_datetime
    field :value, :integer
    field :device_code, :string
    field :sensor_code, :string

    timestamps()
  end

  @doc false
  def changeset(sound, attrs) do
    sound
    |> cast(attrs, [:date, :value, :device_code, :sensor_code])
    |> validate_required([:date, :value, :device_code, :sensor_code])
  end
end
