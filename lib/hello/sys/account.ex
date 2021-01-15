defmodule Hello.Sys.Account do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hello.Sys.User
  #alias Comeonin.Bcrypt

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
