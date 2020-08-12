defmodule LogLac.Member.DeviceType do
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
    |> unique_constraint(:code)
  end
end
