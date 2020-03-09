defmodule Hello.StudentsControllerTest do
  use Hello.ConnCase

  alias Hello.Students
  @valid_attrs %{address: "some address", birth: "some birth", from_school: "some from_school", front_money: 42, front_money_time: ~N[2010-04-17 14:00:00.000000], info_source: "some info_source", name: "some name", regist_time: ~N[2010-04-17 14:00:00.000000], remark: "some remark", scholarship: 42, sex: "some sex", tel: "some tel", tuition: 120.5}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, students_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing students"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, students_path(conn, :new)
    assert html_response(conn, 200) =~ "New students"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, students_path(conn, :create), students: @valid_attrs
    students = Repo.get_by!(Students, @valid_attrs)
    assert redirected_to(conn) == students_path(conn, :show, students.id)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, students_path(conn, :create), students: @invalid_attrs
    assert html_response(conn, 200) =~ "New students"
  end

  test "shows chosen resource", %{conn: conn} do
    students = Repo.insert! %Students{}
    conn = get conn, students_path(conn, :show, students)
    assert html_response(conn, 200) =~ "Show students"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, students_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    students = Repo.insert! %Students{}
    conn = get conn, students_path(conn, :edit, students)
    assert html_response(conn, 200) =~ "Edit students"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    students = Repo.insert! %Students{}
    conn = put conn, students_path(conn, :update, students), students: @valid_attrs
    assert redirected_to(conn) == students_path(conn, :show, students)
    assert Repo.get_by(Students, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    students = Repo.insert! %Students{}
    conn = put conn, students_path(conn, :update, students), students: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit students"
  end

  test "deletes chosen resource", %{conn: conn} do
    students = Repo.insert! %Students{}
    conn = delete conn, students_path(conn, :delete, students)
    assert redirected_to(conn) == students_path(conn, :index)
    refute Repo.get(Students, students.id)
  end
end
