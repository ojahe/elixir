defmodule Hello.Sys.Config do
  use Ecto.Schema
  import Ecto.Changeset
  import HelloWeb.Gettext

  schema "sys_config" do
 field :config_key, :string
 field :config_name, :string
 field :config_type, :string
 field :config_value, :string
 field :remark, :string
 field :status, :integer
 belongs_to :inserted_by, Hello.Sys.User
 belongs_to :updated_by, Hello.Sys.User
 field :beginTime, :naive_datetime, virtual: true
 field :endTime, :naive_datetime, virtual: true

    timestamps()
  end

  @doc false
  def changeset(config, attrs) do
    config
    |> cast(attrs, [:config_name, :config_key, :config_value, :config_type, :status,  :remark])
   # |>Ecto.Changeset.put_change( :status,  0)

    |>validate_required([:config_key], message: "#{gettext("Please inpput")} #{dgettext("sys_config","Config key")}")
    |>validate_length( :config_key, max: 255,message: "#{dgettext("sys_config","Config key")} #{gettext("max length is")} 255")

    |>validate_required([:config_name], message: "#{gettext("Please inpput")} #{dgettext("sys_config","Config name")}")
    |>validate_length( :config_name, max: 255,message: "#{dgettext("sys_config","Config name")} #{gettext("max length is")} 255")

    |>validate_required([:config_type], message: "#{gettext("Please inpput")} #{dgettext("sys_config","Config type")}")
    |>validate_length( :config_type, max: 255,message: "#{dgettext("sys_config","Config type")} #{gettext("max length is")} 255")

    |>validate_required([:config_value], message: "#{gettext("Please inpput")} #{dgettext("sys_config","Config value")}")
    |>validate_length( :config_value, max: 255,message: "#{dgettext("sys_config","Config value")} #{gettext("max length is")} 255")

    #|>validate_required([:inserted_by], message: "#{gettext("Please inpput")} #{dgettext("sys_config","Inserted by")}")
    #|>validate_length( :inserted_by, max: 255,message: "#{dgettext("sys_config","Inserted by")} #{gettext("max length is")} 255")

    #|>validate_required([:remark], message: "#{gettext("Please inpput")} #{dgettext("sys_config","Remark")}")
    #|>validate_length( :remark, max: 255,message: "#{dgettext("sys_config","Remark")} #{gettext("max length is")} 255")

    |>validate_required([:status], message: "#{gettext("Please inpput")} #{dgettext("sys_config","Status")}")

    #|>validate_required([:updated_by], message: "#{gettext("Please inpput")} #{dgettext("sys_config","Updated by")}")
    #|>validate_length( :updated_by, max: 255,message: "#{dgettext("sys_config","Updated by")} #{gettext("max length is")} 255")

    #|> validate_required([:config_name, :config_key, :config_value, :config_type, :status, :inserted_by, :updated_by, :remark])


  end
end
