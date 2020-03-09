defmodule HelloWeb.Router do
  use HelloWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end



  scope "/", HelloWeb.Sys do
    pipe_through  [:browser,:curren_user]
    get "/", AccountController, :new
    scope "/account"  do
    get "/index", AccountController, :index
    post "/create", AccountController, :create
    get "/delete", AccountController, :delete
    end
  end

  scope "/regist" , HelloWeb.Sys do
    pipe_through [:browser]
    get "/new", RegistController, :new
    post "/create", RegistController, :create
    get "/edit", RegistController, :edit
    post "/update", RegistController, :update
    get "/show/:id", RegistController, :show
  end
  scope "/hello" , HelloWeb do
    pipe_through [:browser]
    get "/index", HelloController, :index
  end

  scope "/sys", HelloWeb.Sys, as: :sys do
    pipe_through [:browser,:authenticate_user]

    scope "/user"  do
      get "/index", UserController, :index
      post "/list_data",  UserController, :list_data
      get "/new", UserController, :new
      post "/create", UserController, :create
      get "/edit/:id/edit", UserController, :edit
      post "/update", UserController, :update
      get "/update", UserController, :update
      get "/delete/:ids", UserController, :delete
      get "/show/:id", UserController, :show
      get "/print/:id", UserController, :print
    end
    scope "/module"  do
      get "/index", ModuleController, :index
      post "/list_data",  ModuleController, :list_data
      get "/new", ModuleController, :new
      post "/create", ModuleController, :create
      get "/edit/:id/edit", ModuleController, :edit
      put "/update", ModuleController, :update
      get "/delete/:ids", ModuleController, :delete
      get "/show/:id", ModuleController, :show
      get "/print/:id", ModuleController, :print
    end

    scope "/config"  do
      get "/index", ConfigController, :index
      post "/list_data",  ConfigController, :list_data
      get "/new", ConfigController, :new
      post "/create", ConfigController, :create
      get "/edit/:id/edit", ConfigController, :edit
      put "/update", ConfigController, :update
      get "/delete/:ids", ConfigController, :delete
      get "/show/:id", ConfigController, :show
      get "/print/:id", ConfigController, :print
    end
    scope "/dicttype"  do
      get "/index", DicttypeController, :index
      post "/list_data",  DicttypeController, :list_data
      get "/new", DicttypeController, :new
      post "/create", DicttypeController, :create
      get "/edit/:id/edit", DicttypeController, :edit
      put "/update", DicttypeController, :update
      get "/delete/:ids", DicttypeController, :delete
      get "/show/:id", DicttypeController, :show
      get "/print/:id", DicttypeController, :print
      get "/treeData", DicttypeController, :treeData
    end
    scope "/dictdata"  do
      get "/index", DictdataController, :index
      post "/list_data",  DictdataController, :list_data
      get "/new", DictdataController, :new
      post "/create", DictdataController, :create
      get "/edit/:id/edit", DictdataController, :edit
      put "/update", DictdataController, :update
      get "/delete/:ids", DictdataController, :delete
      get "/show/:id", DictdataController, :show
      get "/print/:id", DictdataController, :print
    end
    scope "/menu"  do
      get "/index", MenuController, :index
      post "/list_data",  MenuController, :list_data
      get "/new", MenuController, :new
      post "/create", MenuController, :create
      get "/edit/:id/edit", MenuController, :edit
      put "/update", MenuController, :update
      get "/update", MenuController, :update
      get "/delete/:ids", MenuController, :delete
      get "/show/:id", MenuController, :show
      get "/print/:id", MenuController, :print
      get "/selectMenuTree", MenuController, :selectMenuTree
      get "/treeData", MenuController, :treeData
      get "/icon", MenuController, :icon
    end
    scope "/dept"  do
      get "/index", DeptController, :index
      post "/list_data",  DeptController, :list_data
      get "/new", DeptController, :new
      post "/create", DeptController, :create
      get "/edit/:id/edit", DeptController, :edit
      put "/update", DeptController, :update
      get "/update", DeptController, :update
      get "/delete/:ids", DeptController, :delete
      get "/show/:id", DeptController, :show
      get "/print/:id", DeptController, :print
      get "/selectDeptTree", DeptController, :selectDeptTree
      get "/treeData", DeptController, :treeData
    end
    scope "/post"  do
      get "/index", PostController, :index
      post "/list_data",  PostController, :list_data
      get "/new", PostController, :new
      post "/create", PostController, :create
      get "/edit/:id/edit", PostController, :edit
      put "/update", PostController, :update
      get "/update", PostController, :update
      get "/delete/:ids", PostController, :delete
      get "/show/:id", PostController, :show
      get "/print/:id", PostController, :print
    end
    scope "/role"  do
      get "/index", RoleController, :index
      post "/list_data",  RoleController, :list_data
      get "/new", RoleController, :new
      post "/create", RoleController, :create
      get "/edit/:id/edit", RoleController, :edit
      put "/update", RoleController, :update
      get "/update", RoleController, :update
      get "/delete/:ids", RoleController, :delete
      get "/show/:id", RoleController, :show
      get "/print/:id", RoleController, :print
    end
    scope "/area"  do
      get "/index", AreaController, :index
      post "/list_data",  AreaController, :list_data
      get "/new", AreaController, :new
      post "/create", AreaController, :create
      get "/edit/:id/edit", AreaController, :edit
      put "/update", AreaController, :update
      get "/update", AreaController, :update
      get "/delete/:ids", AreaController, :delete
      get "/show/:id", AreaController, :show
      get "/print/:id", AreaController, :print
      get "/selectTree", AreaController, :selectTree
      get "/treeData", AreaController, :treeData
    end
    scope "/company"  do
      get "/index", CompanyController, :index
      post "/list_data",  CompanyController, :list_data
      get "/new", CompanyController, :new
      post "/create", CompanyController, :create
      get "/edit/:id/edit", CompanyController, :edit
      put "/update", CompanyController, :update
      get "/update", CompanyController, :update
      get "/delete/:ids", CompanyController, :delete
      get "/show/:id", CompanyController, :show
      get "/print/:id", CompanyController, :print
      get "/selectTree", CompanyController, :selectTree
      get "/treeData", CompanyController, :treeData
    end
  end


#
#  defp authenticate_user(
#         %Plug.Conn{
#           private: %{
#             phoenix_action: action
#           }
#         } = conn,
#         _
#       ) do
#    IO.puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
#    IO.puts  conn.request_path
#    IO.puts  action
#    IO.puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA2"
#    case get_session(conn, :user_id) do
#      nil ->
#        conn
#        |> Phoenix.Controller.put_flash(:error, "您还没有登录！")
#        |> Phoenix.Controller.redirect(to: "/account/new")
#        |> halt()
#      user_id ->
#        assign(conn, :current_user, Hello.Sys.get_user!(user_id))
#    end
#  end
  defp authenticate_user(conn, _) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> Phoenix.Controller.put_flash(:error, "您还没有登录！")
        |> Phoenix.Controller.redirect(to: "/")
        |> halt()
      user_id ->
        assign(conn, :current_user, Hello.Sys.get_user2!(user_id))
    end
  end

  defp curren_user(conn, _) do
    case get_session(conn, :user_id) do
      nil -> conn
      user_id ->
        assign(conn, :current_user, Hello.Sys.get_user2!(user_id))
    end
  end
end
