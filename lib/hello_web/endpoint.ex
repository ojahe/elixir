defmodule HelloWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :hello

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  @session_options [
    store: :cookie,
    key: "_hello_key",
    signing_salt: "nEzzAeQmefwrwe"
  ]


  socket "/socket", HelloWeb.UserSocket,
    websocket: true,
    longpoll: false
  #socket "/admin-socket", HelloWeb.AdminSocket
  socket "/live", Phoenix.LiveView.Socket, websocket: [connect_info: [session: @session_options]]

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phoenix.digest
  # when deploying your static files in production.
  #plug Plug.Static, at: "/uploads", from: "/media"
  plug Plug.Static,at: "/", from: :hello, gzip: false,
  only: ~w(css ajax file i18n img ruoyi jquery-validation media fonts images js  favicon.ico favicon.png robots.txt admin-lte fonts)
  plug Plug.Static,
       at: "users", from: Path.expand('./users'), gzip: false
    #
    #  plug Plug.Static, at: "/uploads", from: {:hello,"/media"}


  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
    plug Phoenix.Ecto.CheckRepoStatus, otp_app: :hello
  end

  plug Phoenix.LiveDashboard.RequestLogger,
       param_key: "request_logger",
       cookie_key: "request_logger"

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    #json_decoder: Poison,
    #json_decoder: Phoenix.json_library(),
    json_decoder: Jason,
    length: 100_000_000

  plug Plug.MethodOverride
  plug Plug.Head

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session,  @session_options


  plug HelloWeb.Router

  @doc """
  Callback invoked for dynamically configuring the endpoint.

  It receives the endpoint configuration and checks if
  configuration should be loaded from the system environment.
  """
  def init(_key, config) do
    if config[:load_from_system_env] do
      port = System.get_env("PORT") || raise "expected the PORT environment variable to be set"
      {:ok, Keyword.put(config, :http, [:inet6, port: port])}
    else
      {:ok, config}
    end
  end
end
