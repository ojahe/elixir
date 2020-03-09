defmodule Hello.Repo.Migrations.CreateSysPost do
  use Ecto.Migration

  def change do
    create table(:sys_post) do
      add :user_code, :string
      add :user_name, :string
      add :login_name, :string
      add :user_type, :string
      add :title, :string
      add :email, :string
      add :phone, :string
      add :sex, :string
      add :avatar, :string
      add :password, :string
      add :salt, :string
      add :login_ip, :string
      add :login_date, :utc_datetime
      add :status, :integer
      add :inserted_by, :string
      add :updated_by, :string
      add :remark, :string

      timestamps()
    end

  end
end
