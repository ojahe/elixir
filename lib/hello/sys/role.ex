defmodule Hello.Sys.Role do
  use Ecto.Schema
  import Ecto.Changeset
  import HelloWeb.Gettext

  schema "sys_role" do
 field :role_code, :string
 field :role_name, :string
 field :role_sort, :integer


       field :remark, :string
       field :status, :integer
       belongs_to :inserted_by, Hello.Sys.User, foreign_key: :inserted_by_id,references: :id
       belongs_to :updated_by, Hello.Sys.User
       field :beginTime, :naive_datetime, virtual: true
       field :endTime, :naive_datetime, virtual: true

       timestamps()
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [:role_name, :role_code, :role_sort, :status,  :remark])
   # |>Ecto.Changeset.put_change( :status,  0)

    |>validate_required([:role_code], message: "#{gettext("Please inpput")}#{dgettext("sys_role","Role code")}")
    |>validate_length( :role_code, max: 255,message: "#{dgettext("sys_role","Role code")} #{gettext("max length is")} 255")

    |>validate_required([:role_name], message: "#{gettext("Please inpput")}#{dgettext("sys_role","Role name")}")
    |>validate_length( :role_name, max: 255,message: "#{dgettext("sys_role","Role name")} #{gettext("max length is")} 255")

    |>validate_required([:role_sort], message: "#{gettext("Please inpput")}#{dgettext("sys_role","Role sort")}")
    #|>validate_length( :role_sort, max: 255,message: "#{dgettext("sys_role","Role sort")} #{gettext("max length is")} 255")

    #|>validate_required([:remark], message: "#{gettext("Please inpput")}#{gettext("Remark")}")
    |>validate_length( :remark, max: 255,message: "#{gettext("Remark")} #{gettext("max length is")} 255")
    |>validate_required([:status], message: "#{gettext("Please inpput")}#{gettext("Status")}")
   #|>validate_required([:inserted_by], message: "#{gettext("Please inpput")}#{gettext("Inserted by")}")
    |>validate_length( :inserted_by, max: 255,message: "#{gettext("Inserted by")} #{gettext("max length is")} 255")
  # |>validate_required([:updated_by], message: "#{gettext("Please inpput")}#{gettext("Updated by")}")
    |>validate_length( :updated_by, max: 255,message: "#{gettext("Updated by")} #{gettext("max length is")} 255")
   #|> validate_required([:role_name, :role_code, :role_sort])

  end
end
