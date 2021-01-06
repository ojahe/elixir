defmodule Hello.Sys.Company do
  use Ecto.Schema
  import Ecto.Changeset
  import HelloWeb.Gettext

  schema "sys_company" do
    field :ancestors, :string
    #field :area_id, :integer
    belongs_to :area, Hello.Sys.Area
    field :code, :string
    field :corp_code, :string
    field :corp_name, :string
    field :name, :string
    field :order_num, :integer
    field :parent_id, :integer
    field :short_name, :string
    field :remark, :string
    field :status, :integer
    belongs_to :inserted_by, Hello.Sys.User
    belongs_to :updated_by, Hello.Sys.User
    field :beginTime, :naive_datetime, virtual: true
    field :endTime, :naive_datetime, virtual: true
    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(
         attrs,
         [
           :parent_id,
           :ancestors,
           :order_num,
           :code,
           :name,
           :short_name,
           :area_id,
           :corp_code,
           :corp_name,
           :status,
           :remark
         ]
       )
      #|>Ecto.Changeset.put_change( :status,  0)

      #|>validate_required([:ancestors], message: "#{gettext("Please inpput")}#{dgettext("sys_company","Ancestors")}")
    |> validate_length(
         :ancestors,
         max: 255,
         message: "#{dgettext("sys_company", "Ancestors")} #{gettext("max length is")} 255"
       )

    |> validate_required([:area_id], message: "#{gettext("Please inpput")}#{dgettext("sys_company", "Area")}")
      #|>validate_length( :area_id, max: 255,message: "#{dgettext("sys_company","Area")} #{gettext("max length is")} 255")

    |> validate_required([:code], message: "#{gettext("Please inpput")}#{dgettext("sys_company", "Code")}")
    |> validate_length(:code, max: 255, message: "#{dgettext("sys_company", "Code")} #{gettext("max length is")} 255")

      # |>validate_required([:corp_code], message: "#{gettext("Please inpput")}#{dgettext("sys_company","Corp code")}")
    |> validate_length(
         :corp_code,
         max: 255,
         message: "#{dgettext("sys_company", "Corp code")} #{gettext("max length is")} 255"
       )

      # |>validate_required([:corp_name], message: "#{gettext("Please inpput")}#{dgettext("sys_company","Corp name")}")
    |> validate_length(
         :corp_name,
         max: 255,
         message: "#{dgettext("sys_company", "Corp name")} #{gettext("max length is")} 255"
       )

    |> validate_required([:name], message: "#{gettext("Please inpput")}#{dgettext("sys_company", "Name")}")
    |> validate_length(:name, max: 255, message: "#{dgettext("sys_company", "Name")} #{gettext("max length is")} 255")

      #|>validate_required([:order_num], message: "#{gettext("Please inpput")}#{dgettext("sys_company","Order num")}")
      #|>validate_length( :order_num, max: 255,message: "#{dgettext("sys_company","Order num")} #{gettext("max length is")} 255")

      #|>validate_required([:parent_id], message: "#{gettext("Please inpput")}#{dgettext("sys_company","Parent")}")
      #|>validate_length( :parent_id, max: 255,message: "#{dgettext("sys_company","Parent")} #{gettext("max length is")} 255")

      #|>validate_required([:short_name], message: "#{gettext("Please inpput")}#{dgettext("sys_company","Short name")}")
    |> validate_length(
         :short_name,
         max: 255,
         message: "#{dgettext("sys_company", "Short name")} #{gettext("max length is")} 255"
       )

      #|>validate_required([:remark], message: "#{gettext("Please inpput")}#{gettext("Remark")}")
    |> validate_length(:remark, max: 255, message: "#{gettext("Remark")} #{gettext("max length is")} 255")

    |> validate_required([:status], message: "#{gettext("Please inpput")}#{gettext("Status")}")
      #|>validate_required([:inserted_by], message: "#{gettext("Please inpput")}#{gettext("Inserted by")}")
    |> validate_length(:inserted_by, max: 255, message: "#{gettext("Inserted by")} #{gettext("max length is")} 255")
      # |>validate_required([:updated_by], message: "#{gettext("Please inpput")}#{gettext("Updated by")}")
    |> validate_length(:updated_by, max: 255, message: "#{gettext("Updated by")} #{gettext("max length is")} 255")
    #|> validate_required([:parent_id, :ancestors, :order_num, :code, :name, :short_name, :area_id, :corp_code, :corp_name])

  end
end
