defmodule Hello.Sys.Dictdata do
  use Ecto.Schema
  import Ecto.Changeset
  import HelloWeb.Gettext

  schema "sys_dict_data" do
 field :css_class, :string
 field :dict_label, :string
 field :dict_sort, :integer
 field :dict_type, :string
 #belongs_to :dict_type, Hello.Sys.Dicttype
 field :dict_value, :string
 field :is_default, :string
 field :list_class, :string
 field :remark, :string
 field :status, :integer
 belongs_to :inserted_by, Hello.Sys.User
 belongs_to :updated_by, Hello.Sys.User
 field :beginTime, :naive_datetime, virtual: true
 field :endTime, :naive_datetime, virtual: true
    timestamps()
  end

  @doc false
  def changeset(dictdata, attrs) do
    dictdata
    |> cast(attrs, [:dict_label, :dict_sort, :dict_value, :dict_type, :css_class, :list_class, :is_default, :status,  :remark])
    #|>Ecto.Changeset.put_change( :status,  0)

    #|>validate_required([:css_class], message: "#{gettext("Please inpput")}#{dgettext("sys_dictdata","Css class")}")
    |>validate_length( :css_class, max: 255,message: "#{dgettext("sys_dictdata","Css class")} #{gettext("max length is")} 255")

    |>validate_required([:dict_label], message: "#{gettext("Please inpput")}#{dgettext("sys_dictdata","Dict label")}")
    |>validate_length( :dict_label, max: 255,message: "#{dgettext("sys_dictdata","Dict label")} #{gettext("max length is")} 255")

    |>validate_required([:dict_sort], message: "#{gettext("Please inpput")}#{dgettext("sys_dictdata","Dict sort")}")

    |>validate_required([:dict_type], message: "#{gettext("Please inpput")}#{dgettext("sys_dictdata","Dict type")}")
    |>validate_length( :dict_type, max: 255,message: "#{dgettext("sys_dictdata","Dict type")} #{gettext("max length is")} 255")

    |>validate_required([:dict_value], message: "#{gettext("Please inpput")}#{dgettext("sys_dictdata","Dict value")}")
    |>validate_length( :dict_value, max: 100,message: "#{dgettext("sys_dictdata","Dict value")} #{gettext("max length is")} 1")

    #|>validate_required([:inserted_by], message: "#{gettext("Please inpput")}#{dgettext("sys_dictdata","Inserted by")}")
    |>validate_length( :inserted_by, max: 255,message: "#{dgettext("sys_dictdata","Inserted by")} #{gettext("max length is")} 255")

   # |>validate_required([:is_default], message: "#{gettext("Please inpput")}#{dgettext("sys_dictdata","Is default")}")
    |>validate_length( :is_default, max: 255,message: "#{dgettext("sys_dictdata","Is default")} #{gettext("max length is")} 255")

    #|>validate_required([:list_class], message: "#{gettext("Please inpput")}#{dgettext("sys_dictdata","List class")}")
    |>validate_length( :list_class, max: 255,message: "#{dgettext("sys_dictdata","List class")} #{gettext("max length is")} 255")

    #|>validate_required([:remark], message: "#{gettext("Please inpput")}#{dgettext("sys_dictdata","Remark")}")
    |>validate_length( :remark, max: 255,message: "#{dgettext("sys_dictdata","Remark")} #{gettext("max length is")} 255")

    |>validate_required([:status], message: "#{gettext("Please inpput")}#{dgettext("sys_dictdata","Status")}")

    #|>validate_required([:updated_by], message: "#{gettext("Please inpput")}#{dgettext("sys_dictdata","Updated by")}")
    |>validate_length( :updated_by, max: 255,message: "#{dgettext("sys_dictdata","Updated by")} #{gettext("max length is")} 255")

    #|> validate_required([:dict_label, :dict_sort, :dict_value, :dict_type, :css_class, :list_class, :is_default, :status, :inserted_by, :updated_by, :remark])


  end
end
