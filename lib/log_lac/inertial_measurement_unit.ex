defmodule LogLac.InertialMeasurementUnit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "inertial_measurement_units" do
    field :date, :utc_datetime
    field :pich, :integer
    field :roll, :integer
    field :x_acceleration, :integer
    field :y_acceleration, :integer
    field :yaw, :integer
    field :z_acceleration, :integer
    field :device_code, :string
    field :sensor_code, :string

    timestamps()
  end

  @doc false
  def changeset(inertial_measurement_unit, attrs) do
    inertial_measurement_unit
    |> cast(attrs, [:date, :pich, :roll, :yaw, :x_acceleration, :y_acceleration, :z_acceleration])
    |> validate_required([
      :date,
      :pich,
      :roll,
      :yaw,
      :x_acceleration,
      :y_acceleration,
      :z_acceleration
    ])
  end
end
