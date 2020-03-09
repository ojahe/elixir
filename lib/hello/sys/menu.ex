defmodule Hello.Sys.Menu do
  use Ecto.Schema
  import Ecto.Changeset
  import HelloWeb.Gettext

  schema "sys_menu" do
 field :icon, :string
 field :menu_name, :string
 field :menu_type, :string
 field :order_num, :integer
 belongs_to :parent, Hello.Sys.Menu
 #field :parent_id, :integer
 field :perms, :string
 field :remark, :string
 field :status, :integer
 field :target, :string
 belongs_to :inserted_by, Hello.Sys.User
 belongs_to :updated_by, Hello.Sys.User
 field :url, :string
 field :visible, :string
 field :beginTime, :naive_datetime, virtual: true
 field :endTime, :naive_datetime, virtual: true


    timestamps()
  end

  @doc false
  def changeset(menu, attrs) do
    menu
    |> cast(attrs, [:menu_name, :parent_id, :order_num, :url, :target, :menu_type, :visible, :perms, :icon, :status,  :remark,:updated_by_id])
    #|>Ecto.Changeset.put_change( :status,  0)

    #|>validate_required([:icon], message: "#{gettext("Please inpput")}#{dgettext("sys_menu","Icon")}")
    |>validate_length( :icon, max: 255,message: "#{dgettext("sys_menu","Icon")} #{gettext("max length is")} 255")

    #|>validate_required([:inserted_by], message: "#{gettext("Please inpput")}#{dgettext("sys_menu","Inserted by")}")
    |>validate_length( :inserted_by, max: 255,message: "#{dgettext("sys_menu","Inserted by")} #{gettext("max length is")} 255")

    |>validate_required([:menu_name], message: "#{gettext("Please inpput")}#{dgettext("sys_menu","Menu name")}")
    |>validate_length( :menu_name, max: 255,message: "#{dgettext("sys_menu","Menu name")} #{gettext("max length is")} 255")

   # |>validate_required([:menu_type], message: "#{gettext("Please inpput")}#{dgettext("sys_menu","Menu type")}")
    |>validate_length( :menu_type, max: 255,message: "#{dgettext("sys_menu","Menu type")} #{gettext("max length is")} 255")

    #|>validate_required([:order_num], message: "#{gettext("Please inpput")}#{dgettext("sys_menu","Order num")}")
   # |>validate_length( :order_num, max: 255,message: "#{dgettext("sys_menu","Order num")} #{gettext("max length is")} 255")

    #|>validate_required([:parent_id], message: "#{gettext("Please inpput")}#{dgettext("sys_menu","Parent")}")

   # |>validate_required([:perms], message: "#{gettext("Please inpput")}#{dgettext("sys_menu","Perms")}")
    |>validate_length( :perms, max: 255,message: "#{dgettext("sys_menu","Perms")} #{gettext("max length is")} 255")

    #|>validate_required([:remark], message: "#{gettext("Please inpput")}#{dgettext("sys_menu","Remark")}")
    |>validate_length( :remark, max: 255,message: "#{dgettext("sys_menu","Remark")} #{gettext("max length is")} 255")

    |>validate_required([:status], message: "#{gettext("Please inpput")}#{dgettext("sys_menu","Status")}")

    #|>validate_required([:target], message: "#{gettext("Please inpput")}#{dgettext("sys_menu","Target")}")
    |>validate_length( :target, max: 255,message: "#{dgettext("sys_menu","Target")} #{gettext("max length is")} 255")

    #|>validate_required([:updated_by], message: "#{gettext("Please inpput")}#{dgettext("sys_menu","Updated by")}")
    |>validate_length( :updated_by, max: 255,message: "#{dgettext("sys_menu","Updated by")} #{gettext("max length is")} 255")

    #|>validate_required([:url], message: "#{gettext("Please inpput")}#{dgettext("sys_menu","Url")}")
    |>validate_length( :url, max: 255,message: "#{dgettext("sys_menu","Url")} #{gettext("max length is")} 255")

    |>validate_required([:visible], message: "#{gettext("Please inpput")}#{dgettext("sys_menu","Visible")}")
    |>validate_length( :visible, max: 255,message: "#{dgettext("sys_menu","Visible")} #{gettext("max length is")} 255")

    #|> validate_required([:menu_name, :parent_id, :order_num, :url, :target, :menu_type, :visible, :perms, :icon, :status, :inserted_by, :updated_by, :remark])


  end
end
