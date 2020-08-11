defmodule LogLac.Repo.Migrations.CreateIlluminances do
  use Ecto.Migration

  def change do
    create table(:illuminances) do
      add :date, :utc_datetime, null: false
      add :value, :integer, null: false
      add :device_code, references(:devices, on_delete: :nothing), null: false
      add :sensor_code, references(:sensors, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:illuminances, [:device_code])
    create index(:illuminances, [:sensor_code])
  end
end
