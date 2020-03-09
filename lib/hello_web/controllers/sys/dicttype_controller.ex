defmodule HelloWeb.Sys.DicttypeController do
   use HelloWeb, :controller
   alias Hello.Sys
   alias Hello.Sys.Dicttype
   require Elixlsx
   import HelloWeb.Gettext

  def index(conn, params) do
    render(conn, "index.html", dataGrid: "1")
  end


  def list_data(conn, params) do
    result = Sys.list_dicttypes(params)
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
    changeset = Sys.change_dicttype(%Dicttype{})
    render(conn, "new.html", changeset: changeset, validate: "1", title:  gettext("New"))
  end

  def create(conn, %{"dicttype" => params}) do
    case Sys.create_dicttype(get_session(conn, :user_id), params) do
      {:ok, _dicttypes} ->
        conn
        |> json(%{ msg: ~s(#{gettext("New")}#{dgettext("sys_dicttype","Dicttype")}#{gettext("success")}), code: 0})
      {:error, %Ecto.Changeset{} = changeset} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("New")}#{dgettext("sys_dicttype","Dicttype")}#{gettext("fail")}),
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
    dicttypes =Sys.get_dicttype!(id)
    changeset =Sys.change_dicttype( dicttypes)
    render(conn, "edit.html", changeset: changeset, validate: "1", title:  gettext("Update"))
  end

  def update(conn, %{"dicttype" => %{"id" => id} = params}) do
    dicttype =Sys.get_dicttype!(id)
    case Sys.update_dicttype(get_session(conn, :user_id),dicttype, params) do
      {:ok, dicttype} ->
        conn
        |> json(%{ msg: ~s(#{gettext("Update")}#{dgettext("sys_dicttype","Dicttype")}#{gettext("success")}), code: 0})
      {:error, %Ecto.Changeset{} = changeset} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("Update")}#{dgettext("sys_dicttype","Dicttype")}#{gettext("fail")}),
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
    case Sys.delete_dicttype(ids) do
      {c, ids} ->
        conn
        |> json(%{msg: ~s(#{gettext("Delete")}#{dgettext("sys_dicttype","Dicttype")}#{gettext("success")}), code: 0})
      {0, _s} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("Delete")}#{dgettext("sys_dicttype","Dicttype")}#{gettext("fail")})

          }
        )
    end
  end
   def treeData(conn, params) do
     result = Sys.list_dicttypes_all(params)
     json(
       conn,
       Enum.map(
         result,
         fn (%Dicttype{} = d)
         -> %{
              "id" => d.id,
              "pId" => "",
              "name" => d.dict_name,
              "title" => d.dict_type,
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