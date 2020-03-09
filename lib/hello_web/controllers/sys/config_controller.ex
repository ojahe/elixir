defmodule HelloWeb.Sys.ConfigController do
   use HelloWeb, :controller
   alias Hello.Sys
   alias Hello.Sys.Config
   require Elixlsx
   import HelloWeb.Gettext

  def index(conn, params) do
    render(conn, "index.html", dataGrid: "1")
  end


  def list_data(conn, params) do
    result = Sys.list_configs(params)
    json(
      conn,
      %{
        pageNo: result.page_number,
        total: result.total_entries,
        rows: result.entries,
        code: 0,
        msg: 0
      }
    )
  end

  def new(conn, params) do
    changeset = Sys.change_config(%Config{})
    render(conn, "new.html", changeset: changeset, validate: "1", title:  gettext("New"))
  end

  def create(conn, %{"config" => params}) do
    case Sys.create_config(get_session(conn, :user_id), params) do
      {:ok, _configs} ->
        conn
        |> json(%{ msg: ~s(#{gettext("New")}#{dgettext("sys_config","Config")}#{gettext("success")}), code: 0})
      {:error, %Ecto.Changeset{} = changeset} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("New")}#{dgettext("sys_config","Config")}#{gettext("fail")}),
            errors: Enum.map(
              changeset.errors,
              fn ({propName, {errorMsg, _other}})
              -> %{"propName" => to_string(propName), "errorMsg" => errorMsg}
              end
            )
          }
        )
    end
  end

  def edit(conn, %{"id" => id}) do
    configs =Sys.get_config!(id)
    changeset =Sys.change_config( configs)
    render(conn, "edit.html", changeset: changeset, validate: "1", title:  gettext("Update"))
  end

  def update(conn, %{"config" => %{"id" => id} = params}) do
    config =Sys.get_config!(id)
    case Sys.update_config(get_session(conn, :user_id),config, params) do
      {:ok, config} ->
        conn
        |> json(%{ msg: ~s(#{gettext("Update")}#{dgettext("sys_config","Config")}#{gettext("success")}), code: 0})
      {:error, %Ecto.Changeset{} = changeset} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("Update")}#{dgettext("sys_config","Config")}#{gettext("fail")}),
            errors: Enum.map(
              changeset.errors,
              fn ({propName, {errorMsg, _other}})
              -> %{"propName" => to_string(propName), "errorMsg" => errorMsg}
              end
            )
          }
        )
    end
  end



  def delete(conn, %{"ids" => ids}) do
    case Sys.delete_config(ids) do
      {c, ids} ->
        conn
        |> json(%{msg: ~s(#{gettext("Delete")}#{dgettext("sys_config","Config")}#{gettext("success")}), code: 0})
      {0, _s} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("Delete")}#{dgettext("sys_config","Config")}#{gettext("fail")})

          }
        )
    end
  end

end