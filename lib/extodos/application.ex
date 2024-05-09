defmodule Extodos.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ExtodosWeb.Telemetry,
      Extodos.Repo,
      {DNSCluster, query: Application.get_env(:extodos, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Extodos.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Extodos.Finch},
      # Start a worker by calling: Extodos.Worker.start_link(arg)
      # {Extodos.Worker, arg},
      # Start to serve requests, typically the last entry
      ExtodosWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Extodos.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ExtodosWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
