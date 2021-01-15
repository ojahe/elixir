defmodule Hello.Sys.Dept do
  use Ecto.Schema
  import Ecto.Changeset
  import HelloWeb.Gettext

  schema "sys_dept" do
 field :ancestors, :string
 field :dept_name, :string
 field :email, :string

 field :leader, :string
 field :order_num, :integer
 #field :parent_id, :integer
 belongs_to :parent, Hello.Sys.Dept
 field :phone, :string
 field :remark, :string
 field :status, :integer
 belongs_to :inserted_by, Hello.Sys.User
 belongs_to :updated_by, Hello.Sys.User
  #,on_replace: :nilify
 field :beginTime, :naive_datetime, virtual: true
 field :endTime, :naive_datetime, virtual: true
    timestamps()
  end

  @doc false
  def changeset(dept, attrs) do
    dept
    |> cast(attrs, [:dept_name, :parent_id, :order_num, :ancestors, :leader, :phone, :email, :status,  :remark])
   # |>Ecto.Changeset.cast_assoc( :parent)
    #|>Ecto.Changeset.put_change( :status,  0)
      #|>validate_required([:ancestors], message: "#{gettext("Please inpput")}#{dgettext("sys_dept","Ancestors")}")
    |>validate_length( :ancestors, max: 255,message: "#{dgettext("sys_dept","Ancestors")} #{gettext("max length is")} 255")

    |>validate_required([:dept_name], message: "#{gettext("Please inpput")}#{dgettext("sys_dept","Dept name")}")
    |>validate_length( :dept_name, max: 255,message: "#{dgettext("sys_dept","Dept name")} #{gettext("max length is")} 255")

      #|>validate_required([:email], message: "#{gettext("Please inpput")}#{dgettext("sys_dept","Email")}")
    |>validate_length( :email, max: 255,message: "#{dgettext("sys_dept","Email")} #{gettext("max length is")} 255")


    |>validate_required([:leader], message: "#{gettext("Please inpput")}#{dgettext("sys_dept","Leader")}")
    |>validate_length( :leader, max: 255,message: "#{dgettext("sys_dept","Leader")} #{gettext("max length is")} 255")

      #|>validate_required([:order_num], message: "#{gettext("Please inpput")}#{dgettext("sys_dept","Order num")}")

      #|>validate_required([:parent_id], message: "#{gettext("Please inpput")}#{dgettext("sys_dept","Parent")}")

    |>validate_required([:phone], message: "#{gettext("Please inpput")}#{dgettext("sys_dept","Phone")}")
    |>validate_length( :phone, max: 255,message: "#{dgettext("sys_dept","Phone")} #{gettext("max length is")} 255")

      # |>validate_required([:remark], message: "#{gettext("Please inpput")}#{dgettext("sys_dept","Remark")}")
    |>validate_length( :remark, max: 255,message: "#{gettext( "Remark")} #{gettext("max length is")} 255")

    |>validate_required([:status], message: "#{gettext("Please inpput")}#{gettext( "Status")}")
    #|>validate_required([:inserted_by], message: "#{gettext("Please inpput")}#{dgettext("sys_dept","Inserted by")}")
    |>validate_length( :inserted_by, max: 255,message: "#{gettext( "Inserted by")} #{gettext("max length is")} 255")
      # |>validate_required([:updated_by], message: "#{gettext("Please inpput")}#{gettext("sys_dept","Updated by")}")
    |>validate_length( :updated_by, max: 255,message: "#{gettext( "Updated by")} #{gettext("max length is")} 255")

    #|> validate_required([:dept_name, :parent_id, :order_num, :ancestors, :leader, :phone, :email, :status, :inserted_by, :updated_by, :remark])

  end
end
