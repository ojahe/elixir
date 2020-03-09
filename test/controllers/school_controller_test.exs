defmodule Hello.SchoolControllerTest do
  use Hello.ConnCase

  alias Hello.School
  @valid_attrs %{address: "some address", birth: "some birth", from_school: "some from_school", front_money: 42, front_money_time: ~N[2010-04-17 14:00:00.000000], info_source: "some info_source", name: "some name", regist_time: ~N[2010-04-17 14:00:00.000000], remark: "some remark", scholarship: 42, sex: "some sex", student: "some student", tel: "some tel", tuition: 120.5}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, school_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing students"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, school_path(conn, :new)
    assert html_response(conn, 200) =~ "New school"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, school_path(conn, :create), school: @valid_attrs
    school = Repo.get_by!(School, @valid_attrs)
    assert redirected_to(conn) == school_path(conn, :show, school.id)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, school_path(conn, :create), school: @invalid_attrs
    assert html_response(conn, 200) =~ "New school"
  end

  test "shows chosen resource", %{conn: conn} do
    school = Repo.insert! %School{}
    conn = get conn, school_path(conn, :show, school)
    assert html_response(conn, 200) =~ "Show school"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, school_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    school = Repo.insert! %School{}
    conn = get conn, school_path(conn, :edit, school)
    assert html_response(conn, 200) =~ "Edit school"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    school = Repo.insert! %School{}
    conn = put conn, school_path(conn, :update, school), school: @valid_attrs
    assert redirected_to(conn) == school_path(conn, :show, school)
    assert Repo.get_by(School, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    school = Repo.insert! %School{}
    conn = put conn, school_path(conn, :update, school), school: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit school"
  end

  test "deletes chosen resource", %{conn: conn} do
    school = Repo.insert! %School{}
    conn = delete conn, school_path(conn, :delete, school)
    assert redirected_to(conn) == school_path(conn, :index)
    refute Repo.get(School, school.id)
  end
end
