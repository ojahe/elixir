defmodule Hello.Repo.Migrations.CreateSysRole do
  use Ecto.Migration

  def change do
    create table(:sys_role) do
      add :role_name, :string
      add :role_code, :string
      add :role_sort, :integer
      add :status, :integer
      add :inserted_by_id, :integer
      add :updated_by_id, :integer
      add :remark, :string
      timestamps()
    end

  end
end
