defmodule HelloWeb.UserControllerTest do
  use HelloWeb.ConnCase

  alias Hello.Sys

  @create_attrs %{avatar: "some avatar", email: "some email", inserted_by: "some inserted_by", login_date: "2010-04-17T14:00:00Z", login_ip: "some login_ip", login_name: "some login_name", password: "some password", phone: "some phone", remark: "some remark", salt: "some salt", sex: "some sex", status: 42, title: "some title", updated_by: "some updated_by", user_code: "some user_code", user_name: "some user_name", user_type: "some user_type"}
  @update_attrs %{avatar: "some updated avatar", email: "some updated email", inserted_by: "some updated inserted_by", login_date: "2011-05-18T15:01:01Z", login_ip: "some updated login_ip", login_name: "some updated login_name", password: "some updated password", phone: "some updated phone", remark: "some updated remark", salt: "some updated salt", sex: "some updated sex", status: 43, title: "some updated title", updated_by: "some updated updated_by", user_code: "some updated user_code", user_name: "some updated user_name", user_type: "some updated user_type"}
  @invalid_attrs %{avatar: nil, email: nil, inserted_by: nil, login_date: nil, login_ip: nil, login_name: nil, password: nil, phone: nil, remark: nil, salt: nil, sex: nil, status: nil, title: nil, updated_by: nil, user_code: nil, user_name: nil, user_type: nil}

  def fixture(:user) do
    {:ok, user} = Sys.create_user(@create_attrs)
    user
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Users"
    end
  end

  describe "new user" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :new))
      assert html_response(conn, 200) =~ "New User"
    end
  end

  describe "create user" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.user_path(conn, :show, id)

      conn = get(conn, Routes.user_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show User"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @invalid_attrs)
      assert html_response(conn, 200) =~ "New User"
    end
  end

  describe "edit user" do
    setup [:create_user]

    test "renders form for editing chosen user", %{conn: conn, user: user} do
      conn = get(conn, Routes.user_path(conn, :edit, user))
      assert html_response(conn, 200) =~ "Edit User"
    end
  end

  describe "update user" do
    setup [:create_user]

    test "redirects when data is valid", %{conn: conn, user: user} do
      conn = put(conn, Routes.user_path(conn, :update, user), user: @update_attrs)
      assert redirected_to(conn) == Routes.user_path(conn, :show, user)

      conn = get(conn, Routes.user_path(conn, :show, user))
      assert html_response(conn, 200) =~ "some updated avatar"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn = put(conn, Routes.user_path(conn, :update, user), user: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit User"
    end
  end

  describe "delete user" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn = delete(conn, Routes.user_path(conn, :delete, user))
      assert redirected_to(conn) == Routes.user_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.user_path(conn, :show, user))
      end
    end
  end

  defp create_user(_) do
    user = fixture(:user)
    {:ok, user: user}
  end
end
