defmodule Hello.Repo.Migrations.CreateSysPost do
  use Ecto.Migration

  def change do
    create table(:sys_post) do
      add :post_name, :string
      add :post_code, :string
      add :post_sort, :integer
      add :data_scope, :string
      add :status, :integer
      add :inserted_by, :string
      add :updated_by, :string
      add :remark, :string

      timestamps()
    end

  end
end
