defmodule HelloWeb.Sys.PostController do
   use HelloWeb, :controller
   alias Hello.Sys
   alias Hello.Sys.Post
   alias Hello.Sys.Dept
   require Elixlsx
   import HelloWeb.Gettext

  def index(conn, params) do
    render(conn, "index.html", dataGrid: "1")
  end


  def list_data(conn, params) do
    result = Sys.list_posts(params)
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
    changeset = Sys.change_post(%Post{})
    render(conn, "new.html", changeset: changeset,dept: Sys.get_dept!(params["deptId"] || 100), validate: "1", title:  gettext("New"))
  end

  def create(conn, %{"post" => params}) do
    case Sys.create_post(get_session(conn, :user_id), params) do
      {:ok, _posts} ->
        conn
        |> json(%{ msg: ~s(#{gettext("New")}#{dgettext("sys_post","Post")}#{gettext("success")}), code: 0})
      {:error, %Ecto.Changeset{} = changeset} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("New")}#{dgettext("sys_post","Post")}#{gettext("fail")}),
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
    posts =Sys.get_post!(id)
    changeset =Sys.change_post( posts)
    render(conn, "edit.html", changeset: changeset,dept: Sys.get_dept!(posts.dept_id || 100), validate: "1", title:  gettext("Update"))
  end

  def update(conn, %{"post" => %{"id" => id} = params}) do
    post =Sys.get_post!(id)
    case Sys.update_post(get_session(conn, :user_id),post, params) do
      {:ok, post} ->
        conn
        |> json(%{ msg: ~s(#{gettext("Update")}#{dgettext("sys_post","Post")}#{gettext("success")}), code: 0})
      {:error, %Ecto.Changeset{} = changeset} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("Update")}#{dgettext("sys_post","Post")}#{gettext("fail")}),
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
   def update_status(conn, %{"post" => %{"id" => id} = params}) do
     post =Sys.get_post!(id)
     case Sys.update_post_status(get_session(conn, :user_id),post, params) do
       {:ok, post} ->
         conn
         |> json(%{ msg: ~s(#{gettext("Update")}#{dgettext("sys_post","Post")}#{gettext("success")}), code: 0})
       {:error, %Ecto.Changeset{} = changeset} ->
         json(
           conn,
           %{
             code: 500,
             msg: ~s(#{gettext("Update")}#{dgettext("sys_post","Post")}#{gettext("fail")}),
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
    case Sys.delete_post(ids) do
      {c, ids} ->
        conn
        |> json(%{msg: ~s(#{gettext("Delete")}#{dgettext("sys_post","Post")}#{gettext("success")}), code: 0})
      {0, _s} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("Delete")}#{dgettext("sys_post","Post")}#{gettext("fail")})

          }
        )
    end
  end

   def  postDeptsTreeData(conn, %{"id" => id} = params) do
     post = Sys.get_post!(id)

     posts = Enum.map(
       post.depts,
       fn (%Dept{} = d)
       -> {
            d.id,
            d.dept_name
          }
       end
     )
     result = Sys.list_depts_all(%{})
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
              "checked" => if List.keyfind(posts, d.id, 0, nil) == nil do
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