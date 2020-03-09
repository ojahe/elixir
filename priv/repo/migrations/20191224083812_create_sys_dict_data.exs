defmodule Hello.Repo.Migrations.CreateSysDictData do
  use Ecto.Migration

  def change do
    create table(:sys_dict_data) do
      add :dict_label, :string
      add :dict_sort, :string
      add :dict_value, :string
      add :dict_type, :string
      add :css_class, :string
      add :list_class, :string
      add :is_default, :string
      add :status, :integer
      add :inserted_by, :string
      add :updated_by, :string
      add :remark, :string

      timestamps()
    end

  end
end
