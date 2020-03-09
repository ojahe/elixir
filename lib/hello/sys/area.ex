defmodule Hello.Sys.Area do
  use Ecto.Schema
  import Ecto.Changeset
  import HelloWeb.Gettext

  schema "sys_area" do
 field :ancestors, :string
 field :code, :string
 field :name, :string
 field :type, :integer
 #field :parent_id, :integer
 belongs_to :parent, Hello.Sys.Area
       field :remark, :string
       field :status, :integer
       belongs_to :inserted_by, Hello.Sys.User
       belongs_to :updated_by, Hello.Sys.User
       field :beginTime, :naive_datetime, virtual: true
       field :endTime, :naive_datetime, virtual: true
       timestamps()
  end

  @doc false
  def changeset(area, attrs) do
    area
    |> cast(attrs, [:parent_id,:ancestors, :code, :name, :type, :status,  :remark])
   #|>Ecto.Changeset.put_change( :status,  0)

    #|>validate_required([:ancestors], message: "#{gettext("Please inpput")}#{dgettext("sys_area","Ancestors")}")
    |>validate_length( :ancestors, max: 2000,message: "#{dgettext("sys_area","Ancestors")} #{gettext("max length is")} 255")

    |>validate_required([:code], message: "#{gettext("Please inpput")}#{dgettext("sys_area","Code")}")
    |>validate_length( :code, max: 255,message: "#{dgettext("sys_area","Code")} #{gettext("max length is")} 255")

    |>validate_required([:name], message: "#{gettext("Please inpput")}#{dgettext("sys_area","Name")}")
    |>validate_length( :name, max: 255,message: "#{dgettext("sys_area","Name")} #{gettext("max length is")} 255")

    #|>validate_required([:type], message: "#{gettext("Please inpput")}#{dgettext("sys_area","Type")}")

    #|>validate_required([:remark], message: "#{gettext("Please inpput")}#{gettext("Remark")}")
    |>validate_length( :remark, max: 255,message: "#{gettext("Remark")} #{gettext("max length is")} 255")
    |>validate_required([:status], message: "#{gettext("Please inpput")}#{gettext("Status")}")
   #|>validate_required([:inserted_by], message: "#{gettext("Please inpput")}#{gettext("Inserted by")}")
    |>validate_length( :inserted_by, max: 255,message: "#{gettext("Inserted by")} #{gettext("max length is")} 255")
  # |>validate_required([:updated_by], message: "#{gettext("Please inpput")}#{gettext("Updated by")}")
    |>validate_length( :updated_by, max: 255,message: "#{gettext("Updated by")} #{gettext("max length is")} 255")
   #|> validate_required([:ancestors, :code, :name, :type])

  end
end
