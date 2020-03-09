defmodule Hello.Sys.Module do
  use Ecto.Schema
  import Ecto.Changeset
  import HelloWeb.Gettext

 schema "sys_module" do
 field :code, :string
 field :current_version, :string
 field :description, :string
 field :main_class_name, :string
 field :name, :string
 field :remark, :string
 field :status, :integer
 belongs_to :inserted_by, Hello.Sys.User
 belongs_to :updated_by, Hello.Sys.User
 field :upgrade_info, :string
 field :beginTime, :naive_datetime, virtual: true
 field :endTime, :naive_datetime, virtual: true


    timestamps()
  end

  @doc false
  def changeset(module, attrs) do
    module
    |> cast(attrs, [:code, :name, :description, :main_class_name, :current_version, :upgrade_info, :status, :remark])
    #|>Ecto.Changeset.put_change( :status,  0)

    |>validate_required([:code], message: "#{gettext("Please inpput")}#{dgettext("sys_module","Code")}")
    |>validate_length( :code, max: 255,message: "#{dgettext("sys_module","Code")} #{gettext("max length is")} 255")

    |>validate_required([:current_version], message: "#{gettext("Please inpput")}#{dgettext("sys_module","Current version")}")
    |>validate_length( :current_version, max: 255,message: "#{dgettext("sys_module","Current version")} #{gettext("max length is")} 255")

    #|>validate_required([:description], message: "#{gettext("Please inpput")}#{dgettext("sys_module","Description")}")
    |>validate_length( :description, max: 255,message: "#{dgettext("sys_module","Description")} #{gettext("max length is")} 255")

    #|>validate_required([:inserted_by], message: "#{gettext("Please inpput")}#{dgettext("sys_module","Inserted by")}")
    |>validate_length( :inserted_by, max: 255,message: "#{dgettext("sys_module","Inserted by")} #{gettext("max length is")} 255")

    |>validate_required([:name], message: "#{gettext("Please inpput")}#{dgettext("sys_module","Name")}")

   # |>validate_required([:remark], message: "#{gettext("Please inpput")}#{dgettext("sys_module","Remark")}")
    |>validate_length( :remark, max: 255,message: "#{dgettext("sys_module","Remark")} #{gettext("max length is")} 255")

  #  |>validate_required([:upgrade_info], message: "#{gettext("Please inpput")}#{dgettext("sys_module","Upgrade info")}")
    |>validate_length( :upgrade_info, max: 255,message: "#{dgettext("sys_module","Upgrade info")} #{gettext("max length is")} 255")

    #|> validate_required([:code, :name, :description, :main_class_name, :current_version, :upgrade_info, :status, :inserted_by, :updated_by, :remark])
  end
end
