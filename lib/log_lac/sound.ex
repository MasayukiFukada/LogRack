defmodule LogLac.Sound do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sounds" do
    field :value, :integer
    field :device_code, :id
    field :sensor_code, :id

    timestamps()
  end

  @doc false
  def changeset(sound, attrs) do
    sound
    |> cast(attrs, [:value])
    |> validate_required([:value])
  end
end
