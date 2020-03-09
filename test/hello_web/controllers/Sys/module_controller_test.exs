defmodule HelloWeb.ModuleControllerTest do
  use HelloWeb.ConnCase

  alias Hello.Sys

  @create_attrs %{code: "some code", current_version: "some current_version", description: "some description", inserted_by: "some inserted_by", main_class_name: "some main_class_name", name: 42, remark: "some remark", status: 42, updated_by: "some updated_by", upgrade_info: "some upgrade_info"}
  @update_attrs %{code: "some updated code", current_version: "some updated current_version", description: "some updated description", inserted_by: "some updated inserted_by", main_class_name: "some updated main_class_name", name: 43, remark: "some updated remark", status: 43, updated_by: "some updated updated_by", upgrade_info: "some updated upgrade_info"}
  @invalid_attrs %{code: nil, current_version: nil, description: nil, inserted_by: nil, main_class_name: nil, name: nil, remark: nil, status: nil, updated_by: nil, upgrade_info: nil}

  def fixture(:module) do
    {:ok, module} = Sys.create_module(@create_attrs)
    module
  end

  describe "index" do
    test "lists all modules", %{conn: conn} do
      conn = get(conn, Routes.module_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Modules"
    end
  end

  describe "new module" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.module_path(conn, :new))
      assert html_response(conn, 200) =~ "New Module"
    end
  end

  describe "create module" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.module_path(conn, :create), module: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.module_path(conn, :show, id)

      conn = get(conn, Routes.module_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Module"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.module_path(conn, :create), module: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Module"
    end
  end

  describe "edit module" do
    setup [:create_module]

    test "renders form for editing chosen module", %{conn: conn, module: module} do
      conn = get(conn, Routes.module_path(conn, :edit, module))
      assert html_response(conn, 200) =~ "Edit Module"
    end
  end

  describe "update module" do
    setup [:create_module]

    test "redirects when data is valid", %{conn: conn, module: module} do
      conn = put(conn, Routes.module_path(conn, :update, module), module: @update_attrs)
      assert redirected_to(conn) == Routes.module_path(conn, :show, module)

      conn = get(conn, Routes.module_path(conn, :show, module))
      assert html_response(conn, 200) =~ "some updated code"
    end

    test "renders errors when data is invalid", %{conn: conn, module: module} do
      conn = put(conn, Routes.module_path(conn, :update, module), module: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Module"
    end
  end

  describe "delete module" do
    setup [:create_module]

    test "deletes chosen module", %{conn: conn, module: module} do
      conn = delete(conn, Routes.module_path(conn, :delete, module))
      assert redirected_to(conn) == Routes.module_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.module_path(conn, :show, module))
      end
    end
  end

  defp create_module(_) do
    module = fixture(:module)
    {:ok, module: module}
  end
end
