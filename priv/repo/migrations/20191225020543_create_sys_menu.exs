defmodule Hello.Repo.Migrations.CreateSysMenu do
  use Ecto.Migration

  def change do
    create table(:sys_menu) do
      add :dept_name, :string
      add :parent_id, :string
      add :order_num, :integer
      add :ancestors, :string
      add :leader, :string
      add :phone, :string
      add :email, :string
      add :status, :integer
      add :inserted_by, :string
      add :updated_by, :string
      add :remark, :string

      timestamps()
    end

  end
end
