defmodule HelloWeb.Sys.AccountController do
  use HelloWeb, :controller
  alias Hello.Sys.Accounts

  def index(conn, _params) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> Phoenix.Controller.put_flash(:error, "您还没有登录！")
        |> Phoenix.Controller.redirect(to: "/auth/identity")
        |> halt()
      user_id ->conn
                |>assign( :current_user, Hello.Sys.get_user2!(user_id))
                |> put_status(202)
                |> render "index.html"
    end


  end

  def new(conn, _) do
    render(conn, "new.html", validate: "1")
  end
  #|>token = Phoenix.Token.sign(conn, "user socket", user.id)
  #|> assign(:user_token, token)
  def create(conn, %{"user" => %{"login_name" => email, "password" => password}}) do
    case Accounts.authenticate_by_email_password(email, password) do
      {:ok, user} ->
     conn
        |> configure_session(renew: true)
        |> put_session(:user_id, user.id)
        |>json(
          %{
            code: 0,
            msg: ~s(登录成功),
            errors: []
          }
        )
      {:error, :unauthorized} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(用户名或者密码错误，请重试。),
            errors: []
          }
        )
    end
  end

  def delete(conn, _) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: "/account/new")
  end
end