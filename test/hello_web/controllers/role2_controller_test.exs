defmodule HelloWeb.Role2ControllerTest do
  use HelloWeb.ConnCase

  alias Hello.Sys2

  @create_attrs %{role_code: "some role_code", role_name: "some role_name", role_sort: 42}
  @update_attrs %{role_code: "some updated role_code", role_name: "some updated role_name", role_sort: 43}
  @invalid_attrs %{role_code: nil, role_name: nil, role_sort: nil}

  def fixture(:role2) do
    {:ok, role2} = Sys2.create_role2(@create_attrs)
    role2
  end

  describe "index" do
    test "lists all roles2", %{conn: conn} do
      conn = get(conn, Routes.role2_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Roles2"
    end
  end

  describe "new role2" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.role2_path(conn, :new))
      assert html_response(conn, 200) =~ "New Role2"
    end
  end

  describe "create role2" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.role2_path(conn, :create), role2: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.role2_path(conn, :show, id)

      conn = get(conn, Routes.role2_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Role2"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.role2_path(conn, :create), role2: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Role2"
    end
  end

  describe "edit role2" do
    setup [:create_role2]

    test "renders form for editing chosen role2", %{conn: conn, role2: role2} do
      conn = get(conn, Routes.role2_path(conn, :edit, role2))
      assert html_response(conn, 200) =~ "Edit Role2"
    end
  end

  describe "update role2" do
    setup [:create_role2]

    test "redirects when data is valid", %{conn: conn, role2: role2} do
      conn = put(conn, Routes.role2_path(conn, :update, role2), role2: @update_attrs)
      assert redirected_to(conn) == Routes.role2_path(conn, :show, role2)

      conn = get(conn, Routes.role2_path(conn, :show, role2))
      assert html_response(conn, 200) =~ "some updated role_code"
    end

    test "renders errors when data is invalid", %{conn: conn, role2: role2} do
      conn = put(conn, Routes.role2_path(conn, :update, role2), role2: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Role2"
    end
  end

  describe "delete role2" do
    setup [:create_role2]

    test "deletes chosen role2", %{conn: conn, role2: role2} do
      conn = delete(conn, Routes.role2_path(conn, :delete, role2))
      assert redirected_to(conn) == Routes.role2_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.role2_path(conn, :show, role2))
      end
    end
  end

  defp create_role2(_) do
    role2 = fixture(:role2)
    %{role2: role2}
  end
end
