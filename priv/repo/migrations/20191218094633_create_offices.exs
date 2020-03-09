defmodule Hello.Repo.Migrations.CreateOffices do
  use Ecto.Migration

  def change do
    create table(:sys_office) do
      add :code, :string
      add :parent_code, :string
      add :parent_codes, :string
      add :tree_sort, :integer
      add :tree_sorts, :string
      add :tree_leaf, :string
      add :tree_level, :integer
      add :tree_names, :string
      add :view_code, :string
      add :office_name, :string
      add :full_name, :string
      add :office_type, :string
      add :leader, :string
      add :phone, :string
      add :address, :string
      add :zip_code, :string
      add :email, :string
      add :status, :string
      add :remarks, :string
      add :updated_by, :integer
      add :inserted_by, :integer
      add :corp_code, :string
      add :corp_name, :string

      timestamps()
    end

  end
end
