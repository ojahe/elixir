defmodule Hello.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hello.Accounts.Credential
  alias Hello.School.Student

  schema "users" do
    field :name, :string
    field :username, :string
    field :rolename, :string
    has_one :credential, Credential
    has_many :students, Student
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username, :rolename])
    |> validate_required([:name, :rolename])
    |> unique_constraint(:username)
  end
end
