defmodule LogLac.DeviceStatus do
  use Ecto.Schema
  import Ecto.Changeset

  schema "device_statuses" do
    field :cpu_use_rate, :integer
    field :memory_use_rate, :integer
    field :storage, :integer
    field :temperature, :float
    field :wake_on_at, :utc_datetime
    field :device_code, :id

    timestamps()
  end

  @doc false
  def changeset(device_status, attrs) do
    device_status
    |> cast(attrs, [:wake_on_at, :cpu_use_rate, :memory_use_rate, :temperature, :storage])
    |> validate_required([:wake_on_at, :cpu_use_rate, :memory_use_rate, :temperature, :storage])
  end
end
