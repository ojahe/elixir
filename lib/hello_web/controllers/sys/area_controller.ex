defmodule HelloWeb.Sys.AreaController do
   use HelloWeb, :controller
   alias Hello.Sys
   alias Hello.Sys.Area
   require Elixlsx
   import HelloWeb.Gettext

  def index(conn, params) do
    render(conn, "index.html", dataGrid: "1")
  end


  def list_data(conn, params) do
    result = Sys.list_areas(params)
    json(
      conn,
      result
    )
  end

  def new(conn, params) do
    changeset = Sys.change_area_new(%Area{parent_id: 1})
    render(conn, "new.html", changeset: changeset, validate: "1", title:  gettext("New"))
  end

  def create(conn, %{"area" => params}) do
    case Sys.create_area(get_session(conn, :user_id), params) do
      {:ok, _areas} ->
        conn
        |> json(%{ msg: ~s(#{gettext("New")}#{dgettext("sys_area","Area")}#{gettext("success")}), code: 0})
      {:error, %Ecto.Changeset{} = changeset} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("New")}#{dgettext("sys_area","Area")}#{gettext("fail")}),
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
    areas =Sys.get_area!(id)
    changeset =Sys.change_area( areas)
    render(conn, "edit.html", changeset: changeset, validate: "1", title:  gettext("Update"))
  end

  def update(conn, %{"area" => %{"id" => id} = params}) do
    area =Sys.get_area!(id)
    case Sys.update_area(get_session(conn, :user_id),area, params) do
      {:ok, area} ->
        conn
        |> json(%{ msg: ~s(#{gettext("Update")}#{dgettext("sys_area","Area")}#{gettext("success")}), code: 0})
      {:error, %Ecto.Changeset{} = changeset} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("Update")}#{dgettext("sys_area","Area")}#{gettext("fail")}),
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
    case Sys.delete_area(ids) do
      {c, ids} ->
        conn
        |> json(%{msg: ~s(#{gettext("Delete")}#{dgettext("sys_area","Area")}#{gettext("success")}), code: 0})
      {0, _s} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("Delete")}#{dgettext("sys_area","Area")}#{gettext("fail")})
          })
    end
  end
   def selectTree(conn, %{"id" => id}) do
     areas = Sys.get_area!(id)
     changeset = Sys.change_area(areas)
     render(conn, "tree.html", changeset: changeset, title: gettext("sys_area"))
   end

   def treeData(conn, params) do
     result = Sys.list_areas_all(params)
     json(
       conn,
       Enum.map(
         result,
         fn (%Area{} = d)
         -> %{
              "id" => d.id,
              "pId" => if d.parent do
                d.parent.id
              else
                ""
              end,
              "name" => d.name,
              "title" => d.name,
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