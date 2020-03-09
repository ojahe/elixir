defmodule HelloWeb.Plug.Permission do
  @moduledoc false

  import Plug.Conn
  import Phoenix.Controller

  alias HelloWeb.Router.Helpers

  def init(opts), do: opts

  def call(conn, opts) do
    user = conn.assigns[:current_user]

    if user && (String.starts_with?(user.rolename,opts) ||
                                    ( String.starts_with?(user.rolename,"招办") && opts != "财务")
                                                         ) do
      conn
    else
      conn
      |> put_flash(:error, "对不起！您没有权限操作此功能，请联系管理员授权。")
      |> redirect(to: Helpers.session_path(conn, :index))
      |> halt()
    end
  end
end
