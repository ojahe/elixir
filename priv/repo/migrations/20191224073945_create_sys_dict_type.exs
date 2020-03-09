defmodule Hello.Repo.Migrations.CreateSysDictType do
  use Ecto.Migration

  def change do
    create table(:sys_dict_type) do
      add :dict_name, :string
      add :dict_type, :string
      add :status, :integer
      add :inserted_by, :string
      add :updated_by, :string
      add :remark, :string

      timestamps()
    end

  end
end
