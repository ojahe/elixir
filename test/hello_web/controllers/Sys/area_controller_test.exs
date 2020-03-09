defmodule HelloWeb.AreaControllerTest do
  use HelloWeb.ConnCase

  alias Hello.Sys

  @create_attrs %{ancestors: "some ancestors", code: "some code", name: "some name", type: "some type"}
  @update_attrs %{ancestors: "some updated ancestors", code: "some updated code", name: "some updated name", type: "some updated type"}
  @invalid_attrs %{ancestors: nil, code: nil, name: nil, type: nil}

  def fixture(:area) do
    {:ok, area} = Sys.create_area(@create_attrs)
    area
  end

  describe "index" do
    test "lists all areas", %{conn: conn} do
      conn = get(conn, Routes.area_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Areas"
    end
  end

  describe "new area" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.area_path(conn, :new))
      assert html_response(conn, 200) =~ "New Area"
    end
  end

  describe "create area" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.area_path(conn, :create), area: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.area_path(conn, :show, id)

      conn = get(conn, Routes.area_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Area"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.area_path(conn, :create), area: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Area"
    end
  end

  describe "edit area" do
    setup [:create_area]

    test "renders form for editing chosen area", %{conn: conn, area: area} do
      conn = get(conn, Routes.area_path(conn, :edit, area))
      assert html_response(conn, 200) =~ "Edit Area"
    end
  end

  describe "update area" do
    setup [:create_area]

    test "redirects when data is valid", %{conn: conn, area: area} do
      conn = put(conn, Routes.area_path(conn, :update, area), area: @update_attrs)
      assert redirected_to(conn) == Routes.area_path(conn, :show, area)

      conn = get(conn, Routes.area_path(conn, :show, area))
      assert html_response(conn, 200) =~ "some updated ancestors"
    end

    test "renders errors when data is invalid", %{conn: conn, area: area} do
      conn = put(conn, Routes.area_path(conn, :update, area), area: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Area"
    end
  end

  describe "delete area" do
    setup [:create_area]

    test "deletes chosen area", %{conn: conn, area: area} do
      conn = delete(conn, Routes.area_path(conn, :delete, area))
      assert redirected_to(conn) == Routes.area_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.area_path(conn, :show, area))
      end
    end
  end

  defp create_area(_) do
    area = fixture(:area)
    {:ok, area: area}
  end
end
