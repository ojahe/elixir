defmodule Hello.Repo.Migrations.CreateSysConfig do
  use Ecto.Migration

  def change do
    create table(:sys_config) do
      add :config_name, :string
      add :config_key, :string
      add :config_value, :string
      add :config_type, :string
      add :status, :integer
      add :inserted_by, :string
      add :updated_by, :string
      add :remark, :string

      timestamps()
    end

  end
end
