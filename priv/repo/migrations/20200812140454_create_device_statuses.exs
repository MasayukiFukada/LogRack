defmodule LogLac.Repo.Migrations.CreateDeviceStatuses do
  use Ecto.Migration

  def change do
    create table(:device_statuses) do
      add :wake_on_at, :utc_datetime, null: false
      add :cpu_use_rate, :integer, null: false
      add :memory_use_rate, :integer, null: false
      add :temperature, :float, null: false
      add :storage, :integer, null: false

      add :device_code, references(:devices, column: :code, type: :string, on_delete: :nothing),
        null: false

      timestamps()
    end

    create index(:device_statuses, [:device_code])
  end
end
