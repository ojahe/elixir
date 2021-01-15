# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hello,
  ecto_repos: [Hello.Repo]

# Configures the endpoint
config :hello, HelloWeb.Endpoint,
  url: [host: "127.0.0.1"],
  secret_key_base: "Hr4JA3BA2m9Ji5DlmYUcVsj6pR2Ijb02iiPclPXOQoU1hPhj3sKqtI8VwtV+QRFK",
  render_errors: [view: HelloWeb.ErrorView, accepts: ~w(html json)],
  #pubsub: [name: Hello.PubSub,adapter: Phoenix.PubSub.PG2],
  pubsub_server: Hello.PubSub
config :turbo_ecto, Turbo.Ecto,
       repo: Hello.Repo,
       per_page: 10
config :turbo_html, Turbo.HTML,
  view_style: :bootstrap    # default bootstrap. semantic
# Configure bcrypt for passwords
#config :comeonin, :bcrypt_log_rounds, 4
#config :pbkdf2_elixir, :rounds, 1
# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]
config :gettext, :default_locale, "zh"
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.

#config :phoenix, :json_library, Jason
config :hello, :generators,
       migration: true,
       binary_id: false,
       sample_binary_id: "11111111-1111-1111-1111-111111111111"
config :arc,
       storage: Arc.Storage.Local
config :ueberauth, Ueberauth,
       json_library: Poison,# default is Jason
       base_path: "/auth", # default is "/auth"
       providers: [
         identity: {Ueberauth.Strategies.Identity,[callback_methods: ["POST"],request_path: "/identity",callback_path: "/identity/callback"]},
         github: {Ueberauth.Strategy.Github, [request_path: "/identity",callback_path: "/identity/callback",default_scope: "user,public_repo,notifications",allow_private_emails: true]}
       ]
config :ueberauth, Ueberauth.Strategy.Github.OAuth,
       client_id: System.get_env("GITHUB_CLIENT_ID"),
       client_secret: System.get_env("GITHUB_CLIENT_SECRET")
import_config "#{Mix.env}.exs"
