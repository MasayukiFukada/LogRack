defmodule LogLac.Repo.Migrations.CreateSensors do
  use Ecto.Migration

  def change do
    create table(:sensors) do
      add :code, :string, null: false
      add :name, :string, null: false
      add :remarks, :string, null: false

      timestamps()
    end

    create unique_index(:sensors, [:code])
  end
end
