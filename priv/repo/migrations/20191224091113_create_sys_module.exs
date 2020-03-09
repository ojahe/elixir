defmodule Hello.Repo.Migrations.CreateSysModule do
  use Ecto.Migration

  def change do
    create table(:sys_module) do
      add :code, :string
      add :name, :integer
      add :description, :string
      add :main_class_name, :string
      add :current_version, :string
      add :upgrade_info, :string
      add :status, :integer
      add :inserted_by, :string
      add :updated_by, :string
      add :remark, :string

      timestamps()
    end

  end
end
