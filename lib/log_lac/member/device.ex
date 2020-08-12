defmodule LogLac.Member.Device do
  use Ecto.Schema
  import Ecto.Changeset

  schema "devices" do
    field :code, :string
    field :name, :string
    field :remarks, :string
    field :type_code, :id

    timestamps()
  end

  @doc false
  def changeset(device, attrs) do
    device
    |> cast(attrs, [:code, :name, :remarks])
    |> validate_required([:code, :name, :remarks])
    |> unique_constraint(:code)
  end
end
