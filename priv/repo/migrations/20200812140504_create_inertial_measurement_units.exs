defmodule LogLac.Repo.Migrations.CreateInertialMeasurementUnits do
  use Ecto.Migration

  def change do
    create table(:inertial_measurement_units) do
      add :date, :utc_datetime, null: false
      add :pich, :integer, null: false
      add :roll, :integer, null: false
      add :yaw, :integer, null: false
      add :x_acceleration, :integer, null: false
      add :y_acceleration, :integer, null: false
      add :z_acceleration, :integer, null: false

      add :device_code, references(:devices, column: :code, type: :string, on_delete: :nothing),
        null: false

      add :sensor_code, references(:sensors, column: :code, type: :string, on_delete: :nothing),
        null: false

      timestamps()
    end

    create index(:inertial_measurement_units, [:device_code])
    create index(:inertial_measurement_units, [:sensor_code])
  end
end
