defmodule HelloWeb.Router do
  use HelloWeb, :router
  require Ueberauth

  pipeline :browser do
   # plug Ueberauth
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end



  # This plug will look for a Guardian token in the session in the default location
  # Then it will attempt to load the resource found in the JWT.
  # If it doesn't find a JWT in the default location it doesn't do anything
  pipeline :browser_auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  # This pipeline is created for use within the admin namespace.
  # It looks for a valid token in the session - but in the 'admin' location of guardian
  # This keeps the session credentials seperate for the main site, and the admin site
  # It's very possible that a user is logged into the main site but not the admin
  # or it could be that you're logged into both.
  # This does not conflict with the browser_auth pipeline.
  # If it doesn't find a JWT in the location it doesn't do anything
  pipeline :admin_browser_auth do
    plug Guardian.Plug.VerifySession, key: :admin
    plug Guardian.Plug.LoadResource, key: :admin
  end

  # We need this pipeline to load the token when we're impersonating.
  # We don't want to load the resource though, just verify the token
  pipeline :impersonation_browser_auth do
    plug Guardian.Plug.VerifySession, key: :admin
  end

  pipeline :api do
    plug :accepts, ["json"]
  end
  # This pipeline if intended for API requests and looks for the JWT in the "Authorization" header
  # In this case, it should be prefixed with "Bearer" so that it's looking for
  # Authorization: Bearer <jwt>
  pipeline :api_auth do
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/auth", HelloWeb.Sys do
    pipe_through :browser

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    post "/identity/callback", AuthController, :identity_callback
  end
  scope "/", HelloWeb.Sys do
    pipe_through  [:browser, :authenticate_user]
    get "/", AccountController, :index
  end
  scope "/hello", HelloWeb do
    pipe_through [:browser, :authenticate_user]
    get "/index", HelloController, :index
  end

  scope "/regist", HelloWeb.Sys do
    pipe_through [:browser]
    get "/new", RegistController, :new
    post "/create", RegistController, :create
    get "/edit", RegistController, :edit
    post "/update", RegistController, :update
    get "/show/:id", RegistController, :show
  end

  scope "/account", HelloWeb.Sys  do
    pipe_through  [:browser]
    get "/new", AccountController, :new
    post "/create", AccountController, :create
    get "/delete", AccountController, :delete
  end

  scope "/sys", HelloWeb.Sys, as: :sys do
    pipe_through [:browser, :authenticate_user]

    scope "/user"  do
      get "/index", UserController, :index
      post "/list_data", UserController, :list_data
      get "/new", UserController, :new
      post "/create", UserController, :create
      get "/edit/:id/edit", UserController, :edit
      post "/update", UserController, :update
      get "/update_status", UserController, :update_status
      get "/delete/:ids", UserController, :delete
      get "/show/:id", UserController, :show
      get "/print/:id", UserController, :print
    end
    scope "/module"  do
      get "/index", ModuleController, :index
      post "/list_data", ModuleController, :list_data
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
      post "/list_data", ConfigController, :list_data
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
      post "/list_data", DicttypeController, :list_data
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
      post "/list_data", DictdataController, :list_data
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
      post "/list_data", MenuController, :list_data
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
      post "/list_data", DeptController, :list_data
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
      post "/list_data", PostController, :list_data
      get "/new", PostController, :new
      post "/create", PostController, :create
      get "/edit/:id/edit", PostController, :edit
      put "/update", PostController, :update
      get "/update_status", PostController, :update_status
      get "/delete/:ids", PostController, :delete
      get "/show/:id", PostController, :show
      get "/print/:id", PostController, :print
      get "/postDeptsTreeData", PostController, :postDeptsTreeData
    end
    scope "/role"  do
      get "/index", RoleController, :index
      post "/list_data", RoleController, :list_data
      get "/new", RoleController, :new
      post "/create", RoleController, :create
      get "/edit/:id/edit", RoleController, :edit
      put "/update", RoleController, :update
      get "/update_status", RoleController, :update_status
      get "/delete/:ids", RoleController, :delete
      get "/show/:id", RoleController, :show
      get "/print/:id", RoleController, :print
      get "/roleMenuTreeData", RoleController, :roleMenuTreeData
    end
    scope "/area"  do
      get "/index", AreaController, :index
      post "/list_data", AreaController, :list_data
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
      post "/list_data", CompanyController, :list_data
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
        |> Phoenix.Controller.redirect(to: "/auth/identity")
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
