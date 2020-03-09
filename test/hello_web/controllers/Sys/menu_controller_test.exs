defmodule HelloWeb.MenuControllerTest do
  use HelloWeb.ConnCase

  alias Hello.Sys

  @create_attrs %{icon: "some icon", inserted_by: "some inserted_by", menu_name: "some menu_name", menu_type: "some menu_type", order_num: 42, parent_id: "some parent_id", perms: "some perms", remark: "some remark", status: 42, target: "some target", updated_by: "some updated_by", url: "some url", visible: "some visible"}
  @update_attrs %{icon: "some updated icon", inserted_by: "some updated inserted_by", menu_name: "some updated menu_name", menu_type: "some updated menu_type", order_num: 43, parent_id: "some updated parent_id", perms: "some updated perms", remark: "some updated remark", status: 43, target: "some updated target", updated_by: "some updated updated_by", url: "some updated url", visible: "some updated visible"}
  @invalid_attrs %{icon: nil, inserted_by: nil, menu_name: nil, menu_type: nil, order_num: nil, parent_id: nil, perms: nil, remark: nil, status: nil, target: nil, updated_by: nil, url: nil, visible: nil}

  def fixture(:menu) do
    {:ok, menu} = Sys.create_menu(@create_attrs)
    menu
  end

  describe "index" do
    test "lists all menus", %{conn: conn} do
      conn = get(conn, Routes.menu_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Menus"
    end
  end

  describe "new menu" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.menu_path(conn, :new))
      assert html_response(conn, 200) =~ "New Menu"
    end
  end

  describe "create menu" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.menu_path(conn, :create), menu: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.menu_path(conn, :show, id)

      conn = get(conn, Routes.menu_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Menu"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.menu_path(conn, :create), menu: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Menu"
    end
  end

  describe "edit menu" do
    setup [:create_menu]

    test "renders form for editing chosen menu", %{conn: conn, menu: menu} do
      conn = get(conn, Routes.menu_path(conn, :edit, menu))
      assert html_response(conn, 200) =~ "Edit Menu"
    end
  end

  describe "update menu" do
    setup [:create_menu]

    test "redirects when data is valid", %{conn: conn, menu: menu} do
      conn = put(conn, Routes.menu_path(conn, :update, menu), menu: @update_attrs)
      assert redirected_to(conn) == Routes.menu_path(conn, :show, menu)

      conn = get(conn, Routes.menu_path(conn, :show, menu))
      assert html_response(conn, 200) =~ "some updated icon"
    end

    test "renders errors when data is invalid", %{conn: conn, menu: menu} do
      conn = put(conn, Routes.menu_path(conn, :update, menu), menu: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Menu"
    end
  end

  describe "delete menu" do
    setup [:create_menu]

    test "deletes chosen menu", %{conn: conn, menu: menu} do
      conn = delete(conn, Routes.menu_path(conn, :delete, menu))
      assert redirected_to(conn) == Routes.menu_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.menu_path(conn, :show, menu))
      end
    end
  end

  defp create_menu(_) do
    menu = fixture(:menu)
    {:ok, menu: menu}
  end
end
