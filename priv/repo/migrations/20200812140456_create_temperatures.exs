defmodule LogLac.Repo.Migrations.CreateTemperatures do
  use Ecto.Migration

  def change do
    create table(:temperatures) do
      add :date, :utc_datetime, null: false
      add :value, :float, null: false

      add :device_code, references(:devices, column: :code, type: :string, on_delete: :nothing),
        null: false

      add :sensor_code, references(:sensors, column: :code, type: :string, on_delete: :nothing),
        null: false

      timestamps()
    end

    create index(:temperatures, [:device_code])
    create index(:temperatures, [:sensor_code])
  end
end
