defmodule HelloWeb.Sys.DictdataController do
   use HelloWeb, :controller
   alias Hello.Sys
   alias Hello.Sys.Dictdata
   require Elixlsx
   import HelloWeb.Gettext
   import Ecto.Changeset

  def index(conn, params) do
    render(conn, "index.html", dataGrid: "1")
  end


  def list_data(conn, params) do
    result = Sys.list_dictdatas(params)
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
    changeset = Sys.change_dictdata(%Dictdata{})
    |>Ecto.Changeset.put_change( :dict_type,  params["dictType"])
    render(conn, "new.html", changeset: changeset, validate: "1", title:  gettext("New"))
  end

  def create(conn, %{"dictdata" => params}) do
    case Sys.create_dictdata(get_session(conn, :user_id), params) do
      {:ok, _dictdatas} ->
        conn
        |> json(%{ msg: ~s(#{gettext("New")}#{dgettext("sys_dictdata","Dictdata")}#{gettext("success")}), code: 0})
      {:error, %Ecto.Changeset{} = changeset} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("New")}#{dgettext("sys_dictdata","Dictdata")}#{gettext("fail")}),
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
    dictdatas =Sys.get_dictdata!(id)
    changeset =Sys.change_dictdata( dictdatas)
    render(conn, "edit.html", changeset: changeset, validate: "1", title:  gettext("Update"))
  end

  def update(conn, %{"dictdata" => %{"id" => id} = params}) do
    dictdata =Sys.get_dictdata!(id)
    case Sys.update_dictdata(get_session(conn, :user_id),dictdata, params) do
      {:ok, dictdata} ->
        conn
        |> json(%{ msg: ~s(#{gettext("Update")}#{dgettext("sys_dictdata","Dictdata")}#{gettext("success")}), code: 0})
      {:error, %Ecto.Changeset{} = changeset} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("Update")}#{dgettext("sys_dictdata","Dictdata")}#{gettext("fail")}),
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
    case Sys.delete_dictdata(ids) do
      {c, ids} ->
        conn
        |> json(%{msg: ~s(#{gettext("Delete")}#{dgettext("sys_dictdata","Dictdata")}#{gettext("success")}), code: 0})
      {0, _s} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("Delete")}#{dgettext("sys_dictdata","Dictdata")}#{gettext("fail")})

          }
        )
    end
  end

end