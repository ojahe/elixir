defmodule HelloWeb.LayoutView do
  use HelloWeb, :view

  alias Hello.Accounts
  alias Plug.Conn

  def title do
    "川师实外学生入学登记管理系统"
  end
  def current_user(%{assigns: %{current_user: u}}), do: u

  def current_user(conn) do
    case get_current_user(conn) do
      nil -> nil
      id -> Accounts.get_user(id)
    end
  end

  def user_logged_in?(conn), do: current_user(conn)

  def user_token(conn) do
    case get_current_user(conn) do
      nil -> nil
      id -> Phoenix.Token.sign(conn, "user socket", id)
    end
  end

  def admin?(conn) do
    case conn.assigns[:current_user]  do
      nil -> false
      u ->  String.ends_with?(u.rolename, "负责人") || String.ends_with?(u.rolename, "校长")  || String.ends_with?(u.rolename, "主任")
    end
  end

  defp get_current_user(conn) do
    if get_session_from_cookies() do
      case conn.cookies["current_user"] do
        nil -> Conn.get_session(conn, :current_user)
        u -> u
      end
    else
      Conn.get_session(conn, :current_user)
    end
  end

  defp get_session_from_cookies do
    Application.get_env(:mipha_web, :get_session_from_cookies, false)
  end
end
