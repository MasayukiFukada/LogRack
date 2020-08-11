defmodule LogLac.Sensor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sensors" do
    field :code, :string
    field :name, :string
    field :remarks, :string

    timestamps()
  end

  @doc false
  def changeset(sensor, attrs) do
    sensor
    |> cast(attrs, [:code, :name, :remarks])
    |> validate_required([:code, :name, :remarks])
  end
end
