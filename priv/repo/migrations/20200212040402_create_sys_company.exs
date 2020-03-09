defmodule Hello.Repo.Migrations.CreateSysCompany do
  use Ecto.Migration

  def change do
    create table(:sys_company) do
      add :parent_id, :integer
      add :ancestors, :string
      add :order_num, :integer
      add :code, :string
      add :name, :string
      add :short_name, :string
      add :area_id, :integer
      add :corp_code, :string
      add :corp_name, :string

       add :status, :integer
       add :inserted_by_id, :integer
       add :updated_by_id, :integer
       add :remark, :string
      timestamps()
    end

  end
end
