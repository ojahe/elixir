defmodule HelloWeb.CompanyControllerTest do
  use HelloWeb.ConnCase

  alias Hello.Sys

  @create_attrs %{ancestors: "some ancestors", area_id: 42, code: "some code", corp_code: "some corp_code", corp_name: "some corp_name", name: "some name", order_num: 42, parent_id: 42, short_name: "some short_name"}
  @update_attrs %{ancestors: "some updated ancestors", area_id: 43, code: "some updated code", corp_code: "some updated corp_code", corp_name: "some updated corp_name", name: "some updated name", order_num: 43, parent_id: 43, short_name: "some updated short_name"}
  @invalid_attrs %{ancestors: nil, area_id: nil, code: nil, corp_code: nil, corp_name: nil, name: nil, order_num: nil, parent_id: nil, short_name: nil}

  def fixture(:company) do
    {:ok, company} = Sys.create_company(@create_attrs)
    company
  end

  describe "index" do
    test "lists all companys", %{conn: conn} do
      conn = get(conn, Routes.company_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Companys"
    end
  end

  describe "new company" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.company_path(conn, :new))
      assert html_response(conn, 200) =~ "New Company"
    end
  end

  describe "create company" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.company_path(conn, :create), company: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.company_path(conn, :show, id)

      conn = get(conn, Routes.company_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Company"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.company_path(conn, :create), company: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Company"
    end
  end

  describe "edit company" do
    setup [:create_company]

    test "renders form for editing chosen company", %{conn: conn, company: company} do
      conn = get(conn, Routes.company_path(conn, :edit, company))
      assert html_response(conn, 200) =~ "Edit Company"
    end
  end

  describe "update company" do
    setup [:create_company]

    test "redirects when data is valid", %{conn: conn, company: company} do
      conn = put(conn, Routes.company_path(conn, :update, company), company: @update_attrs)
      assert redirected_to(conn) == Routes.company_path(conn, :show, company)

      conn = get(conn, Routes.company_path(conn, :show, company))
      assert html_response(conn, 200) =~ "some updated ancestors"
    end

    test "renders errors when data is invalid", %{conn: conn, company: company} do
      conn = put(conn, Routes.company_path(conn, :update, company), company: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Company"
    end
  end

  describe "delete company" do
    setup [:create_company]

    test "deletes chosen company", %{conn: conn, company: company} do
      conn = delete(conn, Routes.company_path(conn, :delete, company))
      assert redirected_to(conn) == Routes.company_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.company_path(conn, :show, company))
      end
    end
  end

  defp create_company(_) do
    company = fixture(:company)
    {:ok, company: company}
  end
end
