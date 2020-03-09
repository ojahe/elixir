defmodule Hello.SchoolTest do
  use Hello.DataCase

  alias Hello.School

  describe "students" do
    alias Hello.School.Student

    @valid_attrs %{address: "some address", birth: "some birth", from_school: "some from_school", front_money: 42, front_money_time: ~N[2010-04-17 14:00:00.000000], info_source: "some info_source", name: "some name", regist_time: ~N[2010-04-17 14:00:00.000000], remark: "some remark", scholarship: 42, sex: "some sex", tel: "some tel", tuition: 120.5}
    @update_attrs %{address: "some updated address", birth: "some updated birth", from_school: "some updated from_school", front_money: 43, front_money_time: ~N[2011-05-18 15:01:01.000000], info_source: "some updated info_source", name: "some updated name", regist_time: ~N[2011-05-18 15:01:01.000000], remark: "some updated remark", scholarship: 43, sex: "some updated sex", tel: "some updated tel", tuition: 456.7}
    @invalid_attrs %{address: nil, birth: nil, from_school: nil, front_money: nil, front_money_time: nil, info_source: nil, name: nil, regist_time: nil, remark: nil, scholarship: nil, sex: nil, tel: nil, tuition: nil}

    def student_fixture(attrs \\ %{}) do
      {:ok, student} =
        attrs
        |> Enum.into(@valid_attrs)
        |> School.create_student()

      student
    end

    test "list_students/0 returns all students" do
      student = student_fixture()
      assert School.list_students() == [student]
    end

    test "get_student!/1 returns the student with given id" do
      student = student_fixture()
      assert School.get_student!(student.id) == student
    end

    test "create_student/1 with valid data creates a student" do
      assert {:ok, %Student{} = student} = School.create_student(@valid_attrs)
      assert student.address == "some address"
      assert student.birth == "some birth"
      assert student.from_school == "some from_school"
      assert student.front_money == 42
      assert student.front_money_time == ~N[2010-04-17 14:00:00.000000]
      assert student.info_source == "some info_source"
      assert student.name == "some name"
      assert student.regist_time == ~N[2010-04-17 14:00:00.000000]
      assert student.remark == "some remark"
      assert student.scholarship == 42
      assert student.sex == "some sex"
      assert student.tel == "some tel"
      assert student.tuition == 120.5
    end

    test "create_student/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = School.create_student(@invalid_attrs)
    end

    test "update_student/2 with valid data updates the student" do
      student = student_fixture()
      assert {:ok, student} = School.update_student(student, @update_attrs)
      assert %Student{} = student
      assert student.address == "some updated address"
      assert student.birth == "some updated birth"
      assert student.from_school == "some updated from_school"
      assert student.front_money == 43
      assert student.front_money_time == ~N[2011-05-18 15:01:01.000000]
      assert student.info_source == "some updated info_source"
      assert student.name == "some updated name"
      assert student.regist_time == ~N[2011-05-18 15:01:01.000000]
      assert student.remark == "some updated remark"
      assert student.scholarship == 43
      assert student.sex == "some updated sex"
      assert student.tel == "some updated tel"
      assert student.tuition == 456.7
    end

    test "update_student/2 with invalid data returns error changeset" do
      student = student_fixture()
      assert {:error, %Ecto.Changeset{}} = School.update_student(student, @invalid_attrs)
      assert student == School.get_student!(student.id)
    end

    test "delete_student/1 deletes the student" do
      student = student_fixture()
      assert {:ok, %Student{}} = School.delete_student(student)
      assert_raise Ecto.NoResultsError, fn -> School.get_student!(student.id) end
    end

    test "change_student/1 returns a student changeset" do
      student = student_fixture()
      assert %Ecto.Changeset{} = School.change_student(student)
    end
  end
end
