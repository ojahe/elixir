defmodule HelloWeb.Sys.UserController do
   use HelloWeb, :controller
   alias Hello.Sys
   alias Hello.Sys.User
   require Elixlsx
   import HelloWeb.Gettext
  # import Hello.Avatar

  def index(conn, params) do
    render(conn, "index.html", dataGrid: "1")
  end


  def list_data(conn, params) do
    result = Sys.list_users(params)
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
    changeset = Sys.change_user_new(%User{})
    render(conn, "new.html", changeset: changeset,
      dept: Sys.get_dept!(params["deptId"] || 100),allRoles: Sys.list_role_all(),
      allPosts: Sys.list_post_all(), validate: "1",
      title:  gettext("New"))
  end

  def create(conn, %{"user" => params}=p) do
     uuid=  Ecto.UUID.generate()
     params=  if upload = params["avatar"] do
       extension = Path.extname(upload.filename)
       File.cp(upload.path, "priv/static/media/#{uuid}#{extension}")
       Map.put(params, "avatar", "#{uuid}#{extension}")
     else
       params
     end
    case Sys.create_user(get_session(conn, :user_id), params) do
      {:ok, _users} ->
        conn
        |> json(%{ msg: ~s(#{gettext("New")}#{dgettext("sys_user","User")}#{gettext("success")}), code: 0})
      {:error, %Ecto.Changeset{} = changeset} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("New")}#{dgettext("sys_user","User")}#{gettext("fail")}),
            errors:
              Enum.map(
              changeset.errors,
              fn ({propName, {errorMsg, _other}})
              -> if propName == :password_hash do
                   %{"propName" => "password", "errorMsg" => errorMsg}
                 else
                   %{"propName" => to_string(propName), "errorMsg" => errorMsg}
                 end
              end
            )
          }
        )
    end
  end

  def edit(conn, %{"id" => id}) do
    users =Sys.get_user!(id)
    changeset =Sys.change_user( users)
    render(conn, "edit.html", changeset: changeset,dept: Sys.get_dept!(users.dept_id || 100),
      allRoles: Sys.list_role_all(),allPosts: Sys.list_post_all(), validate: "1", title:  gettext("Update"))
  end

  def update(conn, %{"user" => %{"id" => id} = params} =p) do
     uuid=  Ecto.UUID.generate()
     params=  if upload = params["avatar"] do
       extension = Path.extname(upload.filename)
       File.cp(upload.path, "priv/static/media/#{uuid}#{extension}")
       Map.put(params, "avatar", "#{uuid}#{extension}")
       else
         params
      end
     #{:ok, fileName}=   Avatar.store({%Plug.Upload{}, params}) #=> {:ok, "selfie.png"}
    # Map.put(params, "avatar", fileName)
    user =Sys.get_user!(id)
    case Sys.update_user(get_session(conn, :user_id),user, params) do
      {:ok, user} ->
        conn
        |> json(%{ msg: ~s(#{gettext("Update")}#{dgettext("sys_user","User")}#{gettext("success")}), code: 0})
      {:error, %Ecto.Changeset{} = changeset} ->
      IO.inspect(changeset)
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("Update")}#{dgettext("sys_user","User")}#{gettext("fail")}),
            errors: Enum.map(
              changeset.errors,
              fn ({propName, {errorMsg, _other}})
              -> if propName == :password_hash do
                %{"propName" => "password", "errorMsg" => errorMsg}
                else
                %{"propName" => to_string(propName), "errorMsg" => errorMsg}
                end
              end
            )
          }
        )
    end
  end

   def update_status(conn, %{"user" => %{"id" => id} = params} =p) do
     uuid=  Ecto.UUID.generate()
     params=  if upload = params["avatar"] do
       extension = Path.extname(upload.filename)
       File.cp(upload.path, "priv/static/media/#{uuid}#{extension}")
       Map.put(params, "avatar", "#{uuid}#{extension}")
     else
       params
     end
     #{:ok, fileName}=   Avatar.store({%Plug.Upload{}, params}) #=> {:ok, "selfie.png"}
     # Map.put(params, "avatar", fileName)
     user =Sys.get_user!(id)
     case Sys.update_user_status(get_session(conn, :user_id),user, params) do
       {:ok, user} ->
         conn
         |> json(%{ msg: ~s(#{gettext("Update")}#{dgettext("sys_user","User")}#{gettext("success")}), code: 0})
       {:error, %Ecto.Changeset{} = changeset} ->
         IO.inspect(changeset)
         json(
           conn,
           %{
             code: 500,
             msg: ~s(#{gettext("Update")}#{dgettext("sys_user","User")}#{gettext("fail")}),
             errors: Enum.map(
               changeset.errors,
               fn ({propName, {errorMsg, _other}})
               -> if propName == :password_hash do
                    %{"propName" => "password", "errorMsg" => errorMsg}
                  else
                    %{"propName" => to_string(propName), "errorMsg" => errorMsg}
                  end
               end
             )
           }
         )
     end
   end

  def delete(conn, %{"ids" => ids}) do
    case Sys.delete_user(ids) do
      {c, ids} ->
        conn
        |> json(%{msg: ~s(#{gettext("Delete")}#{dgettext("sys_user","User")}#{gettext("success")}), code: 0})
      {0, _s} ->
        json(
          conn,
          %{
            code: 500,
            msg: ~s(#{gettext("Delete")}#{dgettext("sys_user","User")}#{gettext("fail")})

          }
        )
    end
  end

end