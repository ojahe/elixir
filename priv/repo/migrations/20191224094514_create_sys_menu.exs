defmodule Hello.Repo.Migrations.CreateSysMenu do
  use Ecto.Migration

  def change do
    create table(:sys_menu) do
      add :menu_name, :string
      add :parent_id, :string
      add :order_num, :integer
      add :url, :string
      add :target, :string
      add :menu_type, :string
      add :visible, :string
      add :perms, :string
      add :icon, :string
      add :status, :integer
      add :inserted_by, :string
      add :updated_by, :string
      add :remark, :string

      timestamps()
    end

  end
end
