defmodule LogLac.DeviceType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "device_types" do
    field :code, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(device_type, attrs) do
    device_type
    |> cast(attrs, [:code, :name])
    |> validate_required([:code, :name])
  end
end
