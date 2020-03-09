defmodule HelloWeb.OfficeControllerTest do
  use HelloWeb.ConnCase

  alias Hello.Sys

  @create_attrs %{address: "some address", code: "some code", corp_code: "some corp_code", corp_name: "some corp_name", email: "some email", full_name: "some full_name", inserted_by: 42, leader: "some leader", office_name: "some office_name", office_type: "some office_type", parent_code: "some parent_code", parent_codes: "some parent_codes", phone: "some phone", remarks: "some remarks", status: "some status", tree_leaf: "some tree_leaf", tree_level: 42, tree_names: "some tree_names", tree_sort: 42, tree_sorts: "some tree_sorts", updated_by: 42, view_code: "some view_code", zip_code: "some zip_code"}
  @update_attrs %{address: "some updated address", code: "some updated code", corp_code: "some updated corp_code", corp_name: "some updated corp_name", email: "some updated email", full_name: "some updated full_name", inserted_by: 43, leader: "some updated leader", office_name: "some updated office_name", office_type: "some updated office_type", parent_code: "some updated parent_code", parent_codes: "some updated parent_codes", phone: "some updated phone", remarks: "some updated remarks", status: "some updated status", tree_leaf: "some updated tree_leaf", tree_level: 43, tree_names: "some updated tree_names", tree_sort: 43, tree_sorts: "some updated tree_sorts", updated_by: 43, view_code: "some updated view_code", zip_code: "some updated zip_code"}
  @invalid_attrs %{address: nil, code: nil, corp_code: nil, corp_name: nil, email: nil, full_name: nil, inserted_by: nil, leader: nil, office_name: nil, office_type: nil, parent_code: nil, parent_codes: nil, phone: nil, remarks: nil, status: nil, tree_leaf: nil, tree_level: nil, tree_names: nil, tree_sort: nil, tree_sorts: nil, updated_by: nil, view_code: nil, zip_code: nil}

  def fixture(:office) do
    {:ok, office} = Sys.create_office(@create_attrs)
    office
  end

  describe "index" do
    test "lists all offices", %{conn: conn} do
      conn = get(conn, Routes.office_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Offices"
    end
  end

  describe "new office" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.office_path(conn, :new))
      assert html_response(conn, 200) =~ "New Office"
    end
  end

  describe "create office" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.office_path(conn, :create), office: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.office_path(conn, :show, id)

      conn = get(conn, Routes.office_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Office"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.office_path(conn, :create), office: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Office"
    end
  end

  describe "edit office" do
    setup [:create_office]

    test "renders form for editing chosen office", %{conn: conn, office: office} do
      conn = get(conn, Routes.office_path(conn, :edit, office))
      assert html_response(conn, 200) =~ "Edit Office"
    end
  end

  describe "update office" do
    setup [:create_office]

    test "redirects when data is valid", %{conn: conn, office: office} do
      conn = put(conn, Routes.office_path(conn, :update, office), office: @update_attrs)
      assert redirected_to(conn) == Routes.office_path(conn, :show, office)

      conn = get(conn, Routes.office_path(conn, :show, office))
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, office: office} do
      conn = put(conn, Routes.office_path(conn, :update, office), office: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Office"
    end
  end

  describe "delete office" do
    setup [:create_office]

    test "deletes chosen office", %{conn: conn, office: office} do
      conn = delete(conn, Routes.office_path(conn, :delete, office))
      assert redirected_to(conn) == Routes.office_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.office_path(conn, :show, office))
      end
    end
  end

  defp create_office(_) do
    office = fixture(:office)
    {:ok, office: office}
  end
end
