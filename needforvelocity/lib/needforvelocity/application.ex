defmodule Needforvelocity.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      NeedforvelocityWeb.Telemetry,
      Needforvelocity.Repo,
      {DNSCluster, query: Application.get_env(:needforvelocity, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Needforvelocity.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Needforvelocity.Finch},
      # Start a worker by calling: Needforvelocity.Worker.start_link(arg)
      # {Needforvelocity.Worker, arg},
      # Start to serve requests, typically the last entry
      NeedforvelocityWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Needforvelocity.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NeedforvelocityWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
