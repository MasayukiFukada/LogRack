defmodule LogLac.Repo.Migrations.CreateHumidities do
  use Ecto.Migration

  def change do
    create table(:humidities) do
      add :date, :utc_datetime, null: false
      add :value, :integer, null: false
      add :device_code, references(:devices, on_delete: :nothing), null: false
      add :sensor_code, references(:sensors, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:humidities, [:device_code])
    create index(:humidities, [:sensor_code])
  end
end
