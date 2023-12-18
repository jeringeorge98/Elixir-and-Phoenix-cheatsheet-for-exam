defmodule RoadFighter.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RoadFighterWeb.Telemetry,
      RoadFighter.Repo,
      {DNSCluster, query: Application.get_env(:road_fighter, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: RoadFighter.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: RoadFighter.Finch},
      # Start a worker by calling: RoadFighter.Worker.start_link(arg)
      # {RoadFighter.Worker, arg},
      # Start to serve requests, typically the last entry
      RoadFighterWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RoadFighter.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RoadFighterWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
