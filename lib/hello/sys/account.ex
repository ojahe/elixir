defmodule Hello.Sys.Account do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hello.Sys.User
  #alias Comeonin.Bcrypt
#现在MyApp.Repo.all MyApp.Mapping，无论:after_connect回调中为连接配置的值如何，默认情况下现在运行将在“ public”前缀上运行。
#类似会发生insert，update以及类似的操作，@schema_prefix使用，
#除非:prefix明确地通过改变Ecto.put_meta/2或通过传递:prefix选项到存储库操作。


  @schema_prefix "public"
  schema "sys_account" do
    field :password, :string, virtual: true
    field :password_hash, :string
    field :password_confirmation, :string, virtual: true
    field :login, :string, virtual: true
    field :reset_password_token, :string, virtual: true
    belongs_to :user, User
    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
   cg = account
    |> cast(attrs, [:password_hash])
    #|> validate_required([:email])
    #|> assoc_constraint(:user)
     if  attrs["password"] && String.length(attrs["password"]) > 0 do
       put_change(cg, :password_hash,  Pbkdf2.hash_pwd_salt(attrs["password"]))
     else
     cg
      end
end
end
