defmodule Hello.Sys.Dicttype do
  use Ecto.Schema
  import Ecto.Changeset
  import HelloWeb.Gettext
  schema "sys_dict_type" do
 field :dict_name, :string
 field :dict_type, :string
 field :remark, :string
 field :status, :integer
 belongs_to :inserted_by, Hello.Sys.User
 belongs_to :updated_by, Hello.Sys.User
 field :beginTime, :naive_datetime, virtual: true
 field :endTime, :naive_datetime, virtual: true


    timestamps()
  end

  @doc false
  def changeset(dicttype, attrs) do
    dicttype
    |> cast(attrs, [:dict_name, :dict_type, :status, :remark])
    #|>Ecto.Changeset.put_change( :status,  0)

    |>validate_required([:dict_name], message: "#{gettext("Please inpput")}#{dgettext("sys_dicttype","Dict name")}")
    |>validate_length( :dict_name, max: 255,message: "#{dgettext("sys_dicttype","Dict name")} #{gettext("max length is")} 255")

    |>validate_required([:dict_type], message: "#{gettext("Please inpput")}#{dgettext("sys_dicttype","Dict type")}")
    |>validate_length( :dict_type, max: 255,message: "#{dgettext("sys_dicttype","Dict type")} #{gettext("max length is")} 255")

   |>validate_length( :remark, max: 255,message: "#{dgettext("sys_dicttype","Remark")} #{gettext("max length is")} 255")
  end
end
