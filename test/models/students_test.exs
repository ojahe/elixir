defmodule Hello.StudentsTest do
  use Hello.ModelCase

  alias Hello.Students

  @valid_attrs %{address: "some address", birth: "some birth", from_school: "some from_school", front_money: 42, front_money_time: ~N[2010-04-17 14:00:00.000000], info_source: "some info_source", name: "some name", regist_time: ~N[2010-04-17 14:00:00.000000], remark: "some remark", scholarship: 42, sex: "some sex", tel: "some tel", tuition: 120.5}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Students.changeset(%Students{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Students.changeset(%Students{}, @invalid_attrs)
    refute changeset.valid?
  end
end
