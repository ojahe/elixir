defmodule HelloWeb.DicttypeControllerTest do
  use HelloWeb.ConnCase

  alias Hello.Sys

  @create_attrs %{dict_name: "some dict_name", dict_type: "some dict_type", inserted_by: "some inserted_by", remark: "some remark", status: 42, updated_by: "some updated_by"}
  @update_attrs %{dict_name: "some updated dict_name", dict_type: "some updated dict_type", inserted_by: "some updated inserted_by", remark: "some updated remark", status: 43, updated_by: "some updated updated_by"}
  @invalid_attrs %{dict_name: nil, dict_type: nil, inserted_by: nil, remark: nil, status: nil, updated_by: nil}

  def fixture(:dicttype) do
    {:ok, dicttype} = Sys.create_dicttype(@create_attrs)
    dicttype
  end

  describe "index" do
    test "lists all dicttypes", %{conn: conn} do
      conn = get(conn, Routes.dicttype_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Dicttypes"
    end
  end

  describe "new dicttype" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.dicttype_path(conn, :new))
      assert html_response(conn, 200) =~ "New Dicttype"
    end
  end

  describe "create dicttype" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.dicttype_path(conn, :create), dicttype: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.dicttype_path(conn, :show, id)

      conn = get(conn, Routes.dicttype_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Dicttype"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.dicttype_path(conn, :create), dicttype: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Dicttype"
    end
  end

  describe "edit dicttype" do
    setup [:create_dicttype]

    test "renders form for editing chosen dicttype", %{conn: conn, dicttype: dicttype} do
      conn = get(conn, Routes.dicttype_path(conn, :edit, dicttype))
      assert html_response(conn, 200) =~ "Edit Dicttype"
    end
  end

  describe "update dicttype" do
    setup [:create_dicttype]

    test "redirects when data is valid", %{conn: conn, dicttype: dicttype} do
      conn = put(conn, Routes.dicttype_path(conn, :update, dicttype), dicttype: @update_attrs)
      assert redirected_to(conn) == Routes.dicttype_path(conn, :show, dicttype)

      conn = get(conn, Routes.dicttype_path(conn, :show, dicttype))
      assert html_response(conn, 200) =~ "some updated dict_name"
    end

    test "renders errors when data is invalid", %{conn: conn, dicttype: dicttype} do
      conn = put(conn, Routes.dicttype_path(conn, :update, dicttype), dicttype: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Dicttype"
    end
  end

  describe "delete dicttype" do
    setup [:create_dicttype]

    test "deletes chosen dicttype", %{conn: conn, dicttype: dicttype} do
      conn = delete(conn, Routes.dicttype_path(conn, :delete, dicttype))
      assert redirected_to(conn) == Routes.dicttype_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.dicttype_path(conn, :show, dicttype))
      end
    end
  end

  defp create_dicttype(_) do
    dicttype = fixture(:dicttype)
    {:ok, dicttype: dicttype}
  end
end
