defmodule HelloWeb.Sys.ModuleController do
   use HelloWeb, :controller
   alias Hello.Sys
   alias Hello.Sys.Module
   require Elixlsx
   import HelloWeb.Gettext

  def index(conn, params) do
    render(conn, "index.html", dataGrid: "1")
  end


  def list_data(conn, params) do
    result = Sys.list_modules(params)
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
    changeset = Sys.change_module(%Module{})
    render(conn, "new.html", changeset: changeset, validate: "1", title:  gettext("New"))
  end

  def create(conn, %{"module" => params}) do
    case Sys.create_module(get_session(conn, :user_id), params) do
      {:ok, _modules} ->
        conn
        |> json(%{ msg: ~s(#{gettext("New")}#{dgettext("sys_module","Module")}#{gettext("success")}), code: 0})
      {:error, %Ecto.Changeset{} = changeset} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("New")}#{dgettext("sys_module","Module")}#{gettext("fail")}),
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
    modules =Sys.get_module!(id)
    changeset =Sys.change_module( modules)
    render(conn, "edit.html", changeset: changeset, validate: "1", title:  gettext("Update"))
  end

  def update(conn, %{"module" => %{"id" => id} = params}) do
    module =Sys.get_module!(id)
    case Sys.update_module(get_session(conn, :user_id),module, params) do
      {:ok, module} ->
        conn
        |> json(%{ msg: ~s(#{gettext("Update")}#{dgettext("sys_module","Module")}#{gettext("success")}), code: 0})
      {:error, %Ecto.Changeset{} = changeset} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("Update")}#{dgettext("sys_module","Module")}#{gettext("fail")}),
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

   def delete(conn, %{"id" => id}) do
     modules =Sys.get_module!(id)
#     {:ok, student} = Sys.delete_module(modules)
#     conn
#     |> put_flash(:info, "删除成功.")
#     |> redirect(to: student_path(conn, :index1))
   end

  def delete(conn, %{"ids" => ids}) do
    case Sys.delete_module(ids) do
      {c, ids} ->
        conn
        |> json(%{msg: ~s(#{gettext("Delete")}#{dgettext("sys_module","Module")}#{gettext("success")}), code: 0})
      {0, _s} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("Delete")}#{dgettext("sys_module","Module")}#{gettext("fail")})

          }
        )
    end
  end

end