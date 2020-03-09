defmodule HelloWeb.Sys.DeptController do
  use HelloWeb, :controller
  alias Hello.Sys
  alias Hello.Sys.Dept
  alias Hello.Repo
  require Ecto.Repo
  require Elixlsx
  import HelloWeb.Gettext

  def index(conn, params) do
    render(conn, "index.html", dataGrid: "1")
  end


  def list_data(conn, params) do
    result = Sys.list_depts(params)
    json(
      conn,
      result

    )
  end

  def new(conn, %{"id" => id}) do
    #query = from Dept, where: [id: 100]
    #depts = %Dept{}|> Repo.preload(parent: query)
    changeset = Sys.change_dept( %Dept{})

    render(conn, "new.html", changeset: changeset,parent: Sys.get_dept!(id), validate: "1", title: gettext("New"))
  end

  def create(conn, %{"dept" => params}) do
    case Sys.create_dept(get_session(conn, :user_id), params) do
      {:ok, _depts} ->
        conn
        |> json(%{msg: ~s(#{gettext("New")}#{dgettext("sys_dept", "Dept")}#{gettext("success")}), code: 0})
      {:error, %Ecto.Changeset{} = changeset} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("New")}#{dgettext("sys_dept", "Dept")}#{gettext("fail")}),
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
    depts = Sys.get_dept!(id)
    changeset = Sys.change_dept(depts)

    render(conn, "edit.html", changeset: changeset,parent: Sys.get_dept!(depts.parent_id ), validate: "1", title: gettext("Update"))
  end

  def update(conn, %{"dept" => %{"id" => id} = params}) do
    dept = Sys.get_dept!(id)
    case Sys.update_dept(get_session(conn, :user_id),dept, params) do
      {:ok, dept} ->
        conn
        |> json(%{msg: ~s(#{gettext("Update")}#{dgettext("sys_dept", "Dept")}#{gettext("success")}), code: 0})
      {:error, %Ecto.Changeset{} = changeset} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("Update")}#{dgettext("sys_dept", "Dept")}#{gettext("fail")}),
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
    case Sys.delete_dept(ids) do
      {c, ids} ->
        conn
        |> json(%{msg: ~s(#{gettext("Delete")}#{dgettext("sys_dept", "Dept")}#{gettext("success")}), code: 0})
      {0, _s} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("Delete")}#{dgettext("sys_dept", "Dept")}#{gettext("fail")})

          }
        )
    end
  end

  def selectDeptTree(conn, %{"id" => id}) do
    depts = Sys.get_dept!(id)
    changeset = Sys.change_dept(depts)
    render(conn, "tree.html", changeset: changeset, title: gettext("sys_dept"))
  end

  def treeData(conn, params) do
    result = Sys.list_depts_all(params)
    json(
      conn,
      Enum.map(
        result,
        fn (%Dept{} = d)
        -> %{
             "id" => d.id,
             "pId" => if d.parent do
               d.parent.id
             else
               ""
             end,
             "name" => d.dept_name,
             "title" => d.dept_name,
             "checked" => if d.id == params["id"] do
               true
             else
               false
             end
           }
        end
      )
    )
  end

end