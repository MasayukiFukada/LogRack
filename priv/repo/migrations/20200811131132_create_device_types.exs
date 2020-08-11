defmodule LogLac.Repo.Migrations.CreateDeviceTypes do
  use Ecto.Migration

  def change do
    create table(:device_types) do
      add :code, :string, null: false, unique: true
      add :name, :string, null: false

      timestamps()
    end
  end
end
