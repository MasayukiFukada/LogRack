defmodule LogLac.Repo.Migrations.CreateDeviceTypes do
  use Ecto.Migration

  def change do
    create table(:device_types) do
      add :code, :string, null: false
      add :name, :string, null: false

      timestamps()
    end

    create unique_index(:device_types, [:code])
  end
end
