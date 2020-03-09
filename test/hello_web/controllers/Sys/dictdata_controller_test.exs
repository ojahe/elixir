defmodule HelloWeb.DictdataControllerTest do
  use HelloWeb.ConnCase

  alias Hello.Sys

  @create_attrs %{css_class: "some css_class", dict_label: "some dict_label", dict_sort: "some dict_sort", dict_type: "some dict_type", dict_value: "some dict_value", inserted_by: "some inserted_by", is_default: "some is_default", list_class: "some list_class", remark: "some remark", status: 42, updated_by: "some updated_by"}
  @update_attrs %{css_class: "some updated css_class", dict_label: "some updated dict_label", dict_sort: "some updated dict_sort", dict_type: "some updated dict_type", dict_value: "some updated dict_value", inserted_by: "some updated inserted_by", is_default: "some updated is_default", list_class: "some updated list_class", remark: "some updated remark", status: 43, updated_by: "some updated updated_by"}
  @invalid_attrs %{css_class: nil, dict_label: nil, dict_sort: nil, dict_type: nil, dict_value: nil, inserted_by: nil, is_default: nil, list_class: nil, remark: nil, status: nil, updated_by: nil}

  def fixture(:dictdata) do
    {:ok, dictdata} = Sys.create_dictdata(@create_attrs)
    dictdata
  end

  describe "index" do
    test "lists all dictdatas", %{conn: conn} do
      conn = get(conn, Routes.dictdata_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Dictdatas"
    end
  end

  describe "new dictdata" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.dictdata_path(conn, :new))
      assert html_response(conn, 200) =~ "New Dictdata"
    end
  end

  describe "create dictdata" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.dictdata_path(conn, :create), dictdata: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.dictdata_path(conn, :show, id)

      conn = get(conn, Routes.dictdata_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Dictdata"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.dictdata_path(conn, :create), dictdata: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Dictdata"
    end
  end

  describe "edit dictdata" do
    setup [:create_dictdata]

    test "renders form for editing chosen dictdata", %{conn: conn, dictdata: dictdata} do
      conn = get(conn, Routes.dictdata_path(conn, :edit, dictdata))
      assert html_response(conn, 200) =~ "Edit Dictdata"
    end
  end

  describe "update dictdata" do
    setup [:create_dictdata]

    test "redirects when data is valid", %{conn: conn, dictdata: dictdata} do
      conn = put(conn, Routes.dictdata_path(conn, :update, dictdata), dictdata: @update_attrs)
      assert redirected_to(conn) == Routes.dictdata_path(conn, :show, dictdata)

      conn = get(conn, Routes.dictdata_path(conn, :show, dictdata))
      assert html_response(conn, 200) =~ "some updated css_class"
    end

    test "renders errors when data is invalid", %{conn: conn, dictdata: dictdata} do
      conn = put(conn, Routes.dictdata_path(conn, :update, dictdata), dictdata: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Dictdata"
    end
  end

  describe "delete dictdata" do
    setup [:create_dictdata]

    test "deletes chosen dictdata", %{conn: conn, dictdata: dictdata} do
      conn = delete(conn, Routes.dictdata_path(conn, :delete, dictdata))
      assert redirected_to(conn) == Routes.dictdata_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.dictdata_path(conn, :show, dictdata))
      end
    end
  end

  defp create_dictdata(_) do
    dictdata = fixture(:dictdata)
    {:ok, dictdata: dictdata}
  end
end
