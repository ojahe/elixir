defmodule Hello.Repo.Migrations.CreateSysRole2 do
  use Ecto.Migration

  def change do
    create table(:sys_role2) do
      add :role_name, :string
      add :role_code, :string
      add :role_sort, :integer

      timestamps()
    end

  end
end
