defmodule LogLac.Repo.Migrations.CreateSounds do
  use Ecto.Migration

  def change do
    create table(:sounds) do
      add :value, :integer, null: false
      add :device_code, references(:devices, on_delete: :nothing), null: false
      add :sensor_code, references(:sensors, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:sounds, [:device_code])
    create index(:sounds, [:sensor_code])
  end
end
