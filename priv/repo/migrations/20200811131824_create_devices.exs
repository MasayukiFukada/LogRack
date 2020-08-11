defmodule LogLac.Repo.Migrations.CreateDevices do
  use Ecto.Migration

  def change do
    create table(:devices) do
      add :code, :string, null: false, unique: true
      add :name, :string, null: false
      add :remarks, :string, null: false
      add :type_code, references(:device_types, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:devices, [:type_code])
  end
end
