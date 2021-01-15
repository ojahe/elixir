defmodule HelloWeb.Sys.MenuController do
   use HelloWeb, :controller
   alias Hello.Sys
   alias Hello.Sys.Menu
   require Elixlsx
   import HelloWeb.Gettext

  def index(conn, params) do
    render(conn, "index.html", dataGrid: "1")
  end


  def list_data(conn, params) do
    result = Sys.list_menus(params)
    json(
      conn,
      result

    )
#    json(
#      conn,
#      %{
#        pageNo: result.page_number,
#        total: result.total_entries,
#        rows: result.entries,
#        code: 0,
#        msg: 0
#      }
#    )
  end

  def new(conn, params) do
    changeset = Sys.change_menu(%Menu{})
    render(conn, "new.html", changeset: changeset,parent: %Menu{}, validate: "1", title:  gettext("New"))
  end

  def create(conn, %{"menu" => params}) do
    case Sys.create_menu(get_session(conn, :user_id), params) do
      {:ok, _menus} ->
        conn
        |> json(%{ msg: ~s(#{gettext("New")}#{dgettext("sys_menu","Menu")}#{gettext("success")}), code: 0})
      {:error, %Ecto.Changeset{} = changeset} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("New")}#{dgettext("sys_menu","Menu")}#{gettext("fail")}),
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
    menus =Sys.get_menu!(id)
    changeset =Sys.change_menu( menus)
    render(conn, "edit.html", changeset: changeset,parent: Sys.get_menu!(menus.parent_id), validate: "1", title:  gettext("Update"))
  end

  def update(conn, %{"menu" => %{"id" => id} = params}) do
    menu =Sys.get_menu!(id)
    case Sys.update_menu(get_session(conn, :user_id),menu, params) do
      {:ok, menu} ->
        conn
        |> json(%{ msg: ~s(#{gettext("Update")}#{dgettext("sys_menu","Menu")}#{gettext("success")}), code: 0})
      {:error, %Ecto.Changeset{} = changeset} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("Update")}#{dgettext("sys_menu","Menu")}#{gettext("fail")}),
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
    case Sys.delete_menu(ids) do
      {c, ids} ->
        conn
        |> json(%{msg: ~s(#{gettext("Delete")}#{dgettext("sys_menu","Menu")}#{gettext("success")}), code: 0})
      {0, _s} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("Delete")}#{dgettext("sys_menu","Menu")}#{gettext("fail")})

          }
        )
    end
  end

   def selectMenuTree(conn, %{"id" => id}) do
     menus = Sys.get_menu!(id)
     changeset = Sys.change_menu(menus)
     render(conn, "tree.html", changeset: changeset, title: gettext("sys_menu"))
   end

   def treeData(conn, params) do
     result = Sys.list_menus(params)
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
              "checked" => if params["id"] && d.id == params["id"] do
                true
              else
                false
              end
            }
         end
       )
     )
   end

   def icon(conn,_param ) do
     render(conn, "icon.html")
   end



end