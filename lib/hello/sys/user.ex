defmodule Hello.Sys.User do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset
  import HelloWeb.Gettext

schema "sys_user" do

 field :user_code, :string
 field :user_name, :string

 field :login_name, :string
 field :password, :string , virtual: true

 field :sex, :string
 field :status, :integer
 field :title, :string
 field :avatar, :string
 #field :avatar, Hello.Avatar.Type
 field :phone, :string
 field :remark, :string
 field :email, :string
 field :user_type, :string
 field :login_date, :naive_datetime
 field :login_ip, :string
 belongs_to :inserted_by, Hello.Sys.User
 belongs_to :updated_by, Hello.Sys.User
 belongs_to :dept, Hello.Sys.Dept
 has_one :account, Hello.Sys.Account
 field :beginTime, :naive_datetime, virtual: true
 field :endTime, :naive_datetime, virtual: true
 many_to_many :roles, Hello.Sys.Role, join_through: "sys_user_role",join_keys: [user_id: :id, role_id: :id],on_replace: :delete,on_delete: :delete_all
 many_to_many :posts, Hello.Sys.Post, join_through: "sys_user_post",join_keys: [user_id: :id, post_id: :id],on_replace: :delete,on_delete: :delete_all

 timestamps()
end

  @doc false
  def changeset(user, attrs) do
   u= user
    |> cast(attrs, [:avatar,:user_code, :user_name, :login_name, :user_type, :title, :email, :phone, :sex,  :login_ip, :login_date, :status, :dept_id,  :remark])
     #|> cast_attachments(attrs, [:avatar])
     # |>Ecto.Changeset.put_change( :status,  0)

    #|>validate_required([:avatar], message: "#{gettext("Please inpput")}#{dgettext("sys_user","Avatar")}")
    |>validate_length( :avatar, max: 255,message: "#{dgettext("sys_user","Avatar")} #{gettext("max length is")} 255")

   # |>validate_required([:email], message: "#{gettext("Please inpput")}#{dgettext("sys_user","Email")}")
    |>validate_length( :email, max: 255,message: "#{dgettext("sys_user","Email")} #{gettext("max length is")} 255")


    #|>validate_required([:login_date], message: "#{gettext("Please inpput")}#{dgettext("sys_user","Login date")}")
   # |>validate_length( :login_date, max: 255,message: "#{dgettext("sys_user","Login date")} #{gettext("max length is")} 255")

    #|>validate_required([:login_ip], message: "#{gettext("Please inpput")}#{dgettext("sys_user","Login ip")}")
    |>validate_length( :login_ip, max: 255,message: "#{dgettext("sys_user","Login ip")} #{gettext("max length is")} 255")

    |>validate_required([:login_name], message: "#{gettext("Please inpput")}#{dgettext("sys_user","Login name")}")
    |>validate_length( :login_name, max: 255,message: "#{dgettext("sys_user","Login name")} #{gettext("max length is")} 255")

    |>validate_required([:phone], message: "#{gettext("Please inpput")}#{dgettext("sys_user","Phone")}")
    |>validate_length( :phone, max: 255,message: "#{dgettext("sys_user","Phone")} #{gettext("max length is")} 255")

    #|>validate_required([:remark], message: "#{gettext("Please inpput")}#{dgettext("sys_user","Remark")}")
    |>validate_length( :remark, max: 255,message: "#{dgettext("sys_user","Remark")} #{gettext("max length is")} 255")


   # |>validate_required([:sex], message: "#{gettext("Please inpput")}#{dgettext("sys_user","Sex")}")
    |>validate_length( :sex, max: 255,message: "#{dgettext("sys_user","Sex")} #{gettext("max length is")} 255")

   # |>validate_required([:status], message: "#{gettext("Please inpput")}#{dgettext("sys_user","Status")}")

   # |>validate_required([:title], message: "#{gettext("Please inpput")}#{dgettext("sys_user","Title")}")
    |>validate_length( :title, max: 255,message: "#{dgettext("sys_user","Title")} #{gettext("max length is")} 255")

    |>validate_required([:user_code], message: "#{gettext("Please inpput")}#{dgettext("sys_user","User code")}")
    |>validate_length( :user_code, max: 255,message: "#{dgettext("sys_user","User code")} #{gettext("max length is")} 255")

    |>validate_required([:user_name], message: "#{gettext("Please inpput")}#{dgettext("sys_user","User name")}")
    |>validate_length( :user_name, max: 255,message: "#{dgettext("sys_user","User name")} #{gettext("max length is")} 255")

   # |>validate_required([:user_type], message: "#{gettext("Please inpput")}#{dgettext("sys_user","User type")}")
    |>validate_length( :user_type, max: 255,message: "#{dgettext("sys_user","User type")} #{gettext("max length is")} 255")

    #|> validate_required([:user_code, :user_name, :login_name, :user_type, :title, :email, :phone, :sex, :avatar, :password, :login_ip, :login_date, :status, :inserted_by, :updated_by, :remark])
      |> unique_constraint(:login_name,name: :sys_user_login_name_u)
   if  attrs["password"] && String.length(attrs["password"]) > 0 do
     put_change(u, :password_hash,  Pbkdf2.hash_pwd_salt(attrs["password"]))
   else
     u
   end

  end
end
