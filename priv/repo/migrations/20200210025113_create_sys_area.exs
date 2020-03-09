defmodule Hello.Repo.Migrations.CreateSysArea do
  use Ecto.Migration

  def change do
    create table(:sys_area) do
      add :ancestors, :string
      add :code, :string
      add :name, :string
      add :type, :string

       add :status, :integer
       add :inserted_by_id, :integer
       add :updated_by_id, :integer
       add :remark, :string
      timestamps()
    end

  end
end
