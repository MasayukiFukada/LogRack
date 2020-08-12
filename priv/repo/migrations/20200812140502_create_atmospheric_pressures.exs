defmodule LogLac.Repo.Migrations.CreateAtmosphericPressures do
  use Ecto.Migration

  def change do
    create table(:atmospheric_pressures) do
      add :date, :utc_datetime, null: false
      add :value, :integer, null: false

      add :device_code, references(:devices, column: :code, type: :string, on_delete: :nothing),
        null: false

      add :sensor_code, references(:sensors, column: :code, type: :string, on_delete: :nothing),
        null: false

      timestamps()
    end

    create index(:atmospheric_pressures, [:device_code])
    create index(:atmospheric_pressures, [:sensor_code])
  end
end
