defmodule Hello.Sys.Post do
  use Ecto.Schema
  import Ecto.Changeset
  import HelloWeb.Gettext

  schema "sys_post" do
 field :data_scope, :string
 field :post_code, :string
 field :post_name, :string
 field :post_sort, :integer
 field :remark, :string
 field :status, :integer
 belongs_to :inserted_by, Hello.Sys.User
 belongs_to :updated_by, Hello.Sys.User
 belongs_to :dept, Hello.Sys.Dept
 field :beginTime, :naive_datetime, virtual: true
 field :endTime, :naive_datetime, virtual: true

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:post_name, :post_code,:dept_id, :post_sort, :data_scope, :status, :remark])
    #|>Ecto.Changeset.put_change( :status,  0)

    |>validate_required([:data_scope], message: "#{gettext("Please inpput")}#{dgettext("sys_post","Data scope")}")
    |>validate_length( :data_scope, max: 255,message: "#{dgettext("sys_post","Data scope")} #{gettext("max length is")} 255")

    #|>validate_required([:inserted_by], message: "#{gettext("Please inpput")}#{dgettext("sys_post","Inserted by")}")
    |>validate_length( :inserted_by, max: 255,message: "#{dgettext("sys_post","Inserted by")} #{gettext("max length is")} 255")

    |>validate_required([:post_code], message: "#{gettext("Please inpput")}#{dgettext("sys_post","Post code")}")
    |>validate_length( :post_code, max: 255,message: "#{dgettext("sys_post","Post code")} #{gettext("max length is")} 255")

    |>validate_required([:post_name], message: "#{gettext("Please inpput")}#{dgettext("sys_post","Post name")}")
    |>validate_length( :post_name, max: 255,message: "#{dgettext("sys_post","Post name")} #{gettext("max length is")} 255")

    |>validate_required([:post_sort], message: "#{gettext("Please inpput")}#{dgettext("sys_post","Post sort")}")

    #|>validate_required([:remark], message: "#{gettext("Please inpput")}#{dgettext("sys_post","Remark")}")
    |>validate_length( :remark, max: 255,message: "#{dgettext("sys_post","Remark")} #{gettext("max length is")} 255")

    |>validate_required([:status], message: "#{gettext("Please inpput")}#{dgettext("sys_post","Status")}")

    #|>validate_required([:updated_by], message: "#{gettext("Please inpput")}#{dgettext("sys_post","Updated by")}")
    |>validate_length( :updated_by, max: 255,message: "#{dgettext("sys_post","Updated by")} #{gettext("max length is")} 255")

    #|> validate_required([:post_name, :post_code, :post_sort, :data_scope, :status, :inserted_by, :updated_by, :remark])


  end
end
