defmodule LiveViewStudio.Repo.Migrations.CreateIncidents do
  use Ecto.Migration

  def change do
    create table(:incidents) do
      add :description, :string
      add :lat, :float
      add :lng, :float

      timestamps()
    end

  end
end
