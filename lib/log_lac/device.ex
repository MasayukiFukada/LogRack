defmodule LogLac.Device do
  use Ecto.Schema
  import Ecto.Changeset

  schema "devices" do
    field :code, :string
    field :name, :string
    field :remarks, :string
    field :type_code, :string

    timestamps()
  end

  @doc false
  def changeset(device, attrs) do
    device
    |> cast(attrs, [:code, :name, :remarks, :type_code])
    |> validate_required([:code, :name, :remarks, :type_code])
  end
end
