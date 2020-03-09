defmodule Hello.School.Student do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hello.Accounts.User

  schema "students" do
    field :address, :string
    field :birth, :date
    field :age, :integer
    field :citizen_id, :string
    field :height, :integer
    field :body_type, :string
    field :from_school, :string
    field :charge_teacher, :string
    field :board_at_school, :string
    field :nation, :string
    field :receiver,:string
    field :interview_teacher,:string
    field :father, :string
    field :mother, :string
    field :other_relatives, :string
    field :front_money, :string
    field :front_money_amount, :integer
    field :front_money_time, :date
    field :info_source, :string
    field :name, :string
    field :regist_time, :date
    field :remark, :string
    field :scholarship, :string
    field :sex, :string
    field :tel, :string
    field :tel2, :string
    field :tel3, :string
    field :tuition, :integer
    field :learning_section, :string
    field :grade,:string
    field :code,:string
    belongs_to :user, User
    timestamps()
  end

  @doc false
  def changeset(student, attrs) do
    cg=student
    |> cast(attrs, [:name,:father,:mother,:other_relatives, :address, :sex,:age,:citizen_id,:charge_teacher,:board_at_school,:receiver,:nation, :interview_teacher, :birth, :tel,:tel2,:tel3, :from_school, :info_source, :scholarship,
      :tuition, :front_money_amount, :front_money, :front_money_time, :regist_time,:learning_section,:grade, :height, :body_type, :code, :remark])
    cg2=  if  attrs["grade"] && (attrs["learning_section"]==nil || String.length(attrs["learning_section"]) < 1 ) do
             Ecto.Changeset.put_change(cg, :learning_section,   get_section(attrs["grade"]))
          else
            cg
          end
    validate_required(cg2,[:name, :learning_section], message: "aa")
    |>validate_required([:tel ], message: "请输入父亲电话")
    |>validate_required([:sex], message: "请选择性别")
    |>validate_required([:grade], message: "请选择年级")
    |> validate_length( :citizen_id, max: 18)
   end

  defp get_section(section ) do
    cond do
     String.starts_with?(section,"小班") || String.starts_with?(section,"中班") || String.starts_with?(section,"大班") ->
      "幼儿园"
     String.starts_with?(section,"初一") || String.starts_with?(section,"初二") || String.starts_with?(section,"初三")  ->
      "初中"
     String.starts_with?(section,"高一") || String.starts_with?(section,"高二") || String.starts_with?(section,"高三")  ->
     "高中"
    true  ->
      "小学"
    end
  end
end
