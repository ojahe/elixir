defmodule HelloWeb.Sys.RoleController do
  use HelloWeb, :controller
  alias Hello.Sys
  alias Hello.Sys.Role
  alias Hello.Sys.Menu
  require Elixlsx
  import HelloWeb.Gettext

  def index(conn, params) do
    render(conn, "index.html", dataGrid: "1")
  end


  def list_data(conn, params) do
    result = Sys.list_roles(params)
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
    changeset = Sys.change_role(%Role{})
    render(conn, "new.html", changeset: changeset, validate: "1", title: gettext("New"))
  end

  def create(conn, %{"role" => params}) do
    case Sys.create_role(get_session(conn, :user_id), params) do
      {:ok, _roles} ->
        conn
        |> json(%{msg: ~s(#{gettext("New")}#{dgettext("sys_role", "Role")}#{gettext("success")}), code: 0})
      {:error, %Ecto.Changeset{} = changeset} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("New")}#{dgettext("sys_role", "Role")}#{gettext("fail")}),
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
    roles = Sys.get_role!(id)
    changeset = Sys.change_role(roles)
    render(conn, "edit.html", changeset: changeset, validate: "1", title: gettext("Update"))
  end

  def update(conn, %{"role" => %{"id" => id} = params}) do
    role = Sys.get_role!(id)
    case Sys.update_role(get_session(conn, :user_id), role, params) do
      {:ok, role} ->
        conn
        |> json(%{msg: ~s(#{gettext("Update")}#{dgettext("sys_role", "Role")}#{gettext("success")}), code: 0})
      {:error, %Ecto.Changeset{} = changeset} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("Update")}#{dgettext("sys_role", "Role")}#{gettext("fail")}),
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

  def update_status(conn, %{"role" => %{"id" => id} = params}) do
    role = Sys.get_role!(id)
    case Sys.update_role_status(get_session(conn, :user_id), role, params) do
      {:ok, role} ->
        conn
        |> json(%{msg: ~s(#{gettext("Update")}#{dgettext("sys_role", "Role")}#{gettext("success")}), code: 0})
      {:error, %Ecto.Changeset{} = changeset} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("Update")}#{dgettext("sys_role", "Role")}#{gettext("fail")}),
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
    case Sys.delete_role(ids) do
      {c, ids} ->
        conn
        |> json(%{msg: ~s(#{gettext("Delete")}#{dgettext("sys_role", "Role")}#{gettext("success")}), code: 0})
      {0, _s} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("Delete")}#{dgettext("sys_role", "Role")}#{gettext("fail")})

          }
        )
    end
  end

  def  roleMenuTreeData(conn, %{"id" => id} = params) do
    role = Sys.get_role!(id)

    roles = Enum.map(
      role.menus,
      fn (%Menu{} = d)
      -> {
           d.id,
           d.menu_name
         }
      end
    )
    #IO.inspect(roles)
    result = Sys.list_menus(%{})
    json(
      conn,
      Enum.map(
        result,
        fn (%Menu{} = d)
        -> %{
             "id" => d.id,
             "pId" => if d.parent do
               d.parent.id
             else
               ""
             end,
             "name" => d.menu_name,
             "title" => d.menu_name,
             "checked" => if List.keyfind(roles, d.id, 0, nil) == nil do
               false
             else
               true
             end,
             "open" => true,
             "nocheck" => false
           }
        end
      )
    )
  end
end