defmodule Hello.Application do
  use Application

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # List all child processes to be supervised
    #children = [
    #MyApp.Repo
    #]
    #Elixir 1.5 introduced child specifications, which simplified declaring the list
    #of child processes. If you’re using an older version of Elixir, you’ll need to
    #write this slightly differently:
    ## for Elixir 1.4
    #import Supervisor.Spec, warn: false
    #children = [
    #supervisor(MyApp.Repo, [])
    #]
    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      #supervisor(Hello.Repo, []),
      Hello.Repo,
      # Start the PubSub system
      # {Phoenix.PubSub, [name: Hello.PubSub, adapter: Phoenix.PubSub.PG2]},
      {Phoenix.PubSub, name: Hello.PubSub},
      # Start the endpoint when the application starts
      # Start the Endpoint (http/https)
      #supervisor(HelloWeb.Endpoint, []),
      HelloWeb.Endpoint,
      # Start your own worker by calling: Hello.Worker.start_link(arg1, arg2, arg3)
      # worker(Hello.Worker, [arg1, arg2, arg3]),
      HelloWeb.Presence
      #supervisor(HelloWeb.Presence, []),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Hello.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    HelloWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
