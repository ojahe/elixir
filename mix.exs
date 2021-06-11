defmodule Hello.Mixfile do
  use Mix.Project

  def project do
    [
      app: :hello,
      version: "0.0.1",
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      preferred_cli_env: [release: :prod],
      deps: deps(),
      releases: [
                 hello: [
                 version: "0.0.1",
                          applications: [hello: :permanent]
                 ]
           ]
    ]

  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Hello.Application, []},
      env: [],
      extra_applications: [:logger, :runtime_tools,:pbkdf2_elixir,:xlsxir,:ueberauth_github,:ueberauth_identity]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.5.9"},


      #{:phoenix_ecto, "~> 4.0.0"},
      {:phoenix_ecto, "~> 4.1"},
      #{:ecto_sql, "~> 3.1.6"},
      {:ecto_sql, "~> 3.4"},
      {:phoenix_html, "~> 2.14.3"},
      {:scrivener_ecto, "~> 2.0"},
      # {:scrivener_html, "~> 1.8"},
      #{:phoenix, "~> 1.3.0"},
      #{:phoenix_ecto, "~> 3.0"},
      {:phoenix_pubsub, "~> 2.0"},
      #{:phoenix_pubsub, "~> 1.0"},

      {:postgrex, ">= 0.0.0"},

      #{:phoenix_live_reload, "~> 1.0", only: :dev},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:gettext, "~> 0.11"},
      {:cors_plug, "~> 2.0"},
      {:cowboy, "~> 2.8.0", override: true},
      {:plug_cowboy, "~> 2.1"},
      {:turbo_ecto, "~> 0.4.2"},
      {:turbo_html, "~> 0.2.0"},
     #{:pbkdf2_elixir, path: "./deps/pbkdf2",app: false,override: true},
      {:pbkdf2_elixir, "~> 0.12", override: true},
      {:mariaex, ">= 0.0.0"},
      {:csv, "~> 1.2.3"},
      {:elixlsx, "~> 0.4.2"},
      #{:myxql, ">= 0.0.0"},
      {:myxql, "~> 0.4.0", override: true},
       {:geo, "~> 3.3"},
      {:distillery, "~> 2.0"},
      {:poison, "~> 3.0", override: true},
      #  {:ecto, "~> 3.1.7"},
     # {:uuid, "~> 1.1.8"},
      {:jason, "~> 1.2"},
      {:xlsxir, "~> 1.6.4"},
      {:arc, "~> 0.11.0"},
      {:poolboy, "~> 1.5.1"},
      {:arc_ecto, "~> 0.11.3"},
      # Add the dependency
      {:ueberauth, "~> 0.6"},
      {:ueberauth_github, "~> 0.7"},
       {:ueberauth_identity, "~> 0.2"},
      {:guardian, "~> 2.0"},
     # {:guardian_db, "~> 0.7", override: true}
      #{:argon2_elixir, "~> 2.0"}
      #https://elixir.markhoo.com/di-wu-bu-fen-cheng-xu-ku/poolboy
      #{:paginator, "~> 0.6"}
      #{:sorted_set_nif, "~> 1.0.0"}
      #{:comeonin, "~> 4.1"},
      #{:bcrypt_elixir, "~> 1.0"}
      {:phoenix_live_view, "~> 0.15.1"},
      #{:floki, ">= 0.30.0", only: :test},
      #{:phoenix_html, "~> 2.11"},

      {:phoenix_live_dashboard, "~> 0.4"},
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},
      {:number, "~> 1.0"}

    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
