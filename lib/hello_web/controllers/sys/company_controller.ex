defmodule HelloWeb.Sys.CompanyController do
   use HelloWeb, :controller
   alias Hello.Sys
   alias Hello.Sys.Company
   require Elixlsx
   import HelloWeb.Gettext

  def index(conn, params) do
    render(conn, "index.html", dataGrid: "1")
  end


  def list_data(conn, params) do
    result = Sys.list_companys(params)
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
    changeset = Sys.change_company_new(%Company{area_id: 1})
    render(conn, "new.html", changeset: changeset, validate: "1", title:  gettext("New"))
  end

  def create(conn, %{"company" => params}) do
    case Sys.create_company(get_session(conn, :user_id), params) do
      {:ok, _companys} ->
        conn
        |> json(%{ msg: ~s(#{gettext("New")}#{dgettext("sys_company","Company")}#{gettext("success")}), code: 0})
      {:error, %Ecto.Changeset{} = changeset} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("New")}#{dgettext("sys_company","Company")}#{gettext("fail")}),
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
    companys =Sys.get_company!(id)
    changeset =Sys.change_company( companys)
    render(conn, "edit.html", changeset: changeset, validate: "1", title:  gettext("Update"))
  end

  def update(conn, %{"company" => %{"id" => id} = params}) do
    company =Sys.get_company!(id)
    case Sys.update_company(get_session(conn, :user_id),company, params) do
      {:ok, company} ->
        conn
        |> json(%{ msg: ~s(#{gettext("Update")}#{dgettext("sys_company","Company")}#{gettext("success")}), code: 0})
      {:error, %Ecto.Changeset{} = changeset} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("Update")}#{dgettext("sys_company","Company")}#{gettext("fail")}),
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
    case Sys.delete_company(ids) do
      {c, ids} ->
        conn
        |> json(%{msg: ~s(#{gettext("Delete")}#{dgettext("sys_company","Company")}#{gettext("success")}), code: 0})
      {0, _s} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("Delete")}#{dgettext("sys_company","Company")}#{gettext("fail")})

          }
        )
    end
  end

end