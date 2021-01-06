defmodule Hello.Chat.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hello.Repo

  schema "messages" do
    field :device_id, :integer
    field :todo, :integer
    field :result, :integer
    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:device_id, :todo, :result])
    |> validate_required([:device_id] ,message: "设备id不能为空")
    |> validate_required([:todo] ,message: "操作不能为空")
  end

  def get_messages(limit \\ 20) do
    Repo.all(Hello.Chat.Message, limit: limit)
  end
end
