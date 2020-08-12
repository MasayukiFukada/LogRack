defmodule LogLac.Measurement.Sound do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sounds" do
    field :date, :utc_datetime
    field :value, :integer
    field :device_code, :id
    field :sensor_code, :id

    timestamps()
  end

  @doc false
  def changeset(sound, attrs) do
    sound
    |> cast(attrs, [:date, :value])
    |> validate_required([:date, :value])
  end
end
