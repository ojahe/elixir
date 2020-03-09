defmodule HelloWeb.DeptControllerTest do
  use HelloWeb.ConnCase

  alias Hello.Sys

  @create_attrs %{ancestors: "some ancestors", dept_name: "some dept_name", email: "some email", inserted_by: "some inserted_by", leader: "some leader", order_num: 42, parent_id: "some parent_id", phone: "some phone", remark: "some remark", status: 42, updated_by: "some updated_by"}
  @update_attrs %{ancestors: "some updated ancestors", dept_name: "some updated dept_name", email: "some updated email", inserted_by: "some updated inserted_by", leader: "some updated leader", order_num: 43, parent_id: "some updated parent_id", phone: "some updated phone", remark: "some updated remark", status: 43, updated_by: "some updated updated_by"}
  @invalid_attrs %{ancestors: nil, dept_name: nil, email: nil, inserted_by: nil, leader: nil, order_num: nil, parent_id: nil, phone: nil, remark: nil, status: nil, updated_by: nil}

  def fixture(:dept) do
    {:ok, dept} = Sys.create_dept(@create_attrs)
    dept
  end

  describe "index" do
    test "lists all depts", %{conn: conn} do
      conn = get(conn, Routes.dept_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Depts"
    end
  end

  describe "new dept" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.dept_path(conn, :new))
      assert html_response(conn, 200) =~ "New Dept"
    end
  end

  describe "create dept" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.dept_path(conn, :create), dept: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.dept_path(conn, :show, id)

      conn = get(conn, Routes.dept_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Dept"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.dept_path(conn, :create), dept: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Dept"
    end
  end

  describe "edit dept" do
    setup [:create_dept]

    test "renders form for editing chosen dept", %{conn: conn, dept: dept} do
      conn = get(conn, Routes.dept_path(conn, :edit, dept))
      assert html_response(conn, 200) =~ "Edit Dept"
    end
  end

  describe "update dept" do
    setup [:create_dept]

    test "redirects when data is valid", %{conn: conn, dept: dept} do
      conn = put(conn, Routes.dept_path(conn, :update, dept), dept: @update_attrs)
      assert redirected_to(conn) == Routes.dept_path(conn, :show, dept)

      conn = get(conn, Routes.dept_path(conn, :show, dept))
      assert html_response(conn, 200) =~ "some updated ancestors"
    end

    test "renders errors when data is invalid", %{conn: conn, dept: dept} do
      conn = put(conn, Routes.dept_path(conn, :update, dept), dept: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Dept"
    end
  end

  describe "delete dept" do
    setup [:create_dept]

    test "deletes chosen dept", %{conn: conn, dept: dept} do
      conn = delete(conn, Routes.dept_path(conn, :delete, dept))
      assert redirected_to(conn) == Routes.dept_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.dept_path(conn, :show, dept))
      end
    end
  end

  defp create_dept(_) do
    dept = fixture(:dept)
    {:ok, dept: dept}
  end
end
