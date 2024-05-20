defmodule InsideTrading.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      InsideTradingWeb.Telemetry,
      InsideTrading.Repo,
      {DNSCluster, query: Application.get_env(:inside_trading, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: InsideTrading.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: InsideTrading.Finch},
      # Start a worker by calling: InsideTrading.Worker.start_link(arg)
      # {InsideTrading.Worker, arg},
      # Start to serve requests, typically the last entry
      InsideTradingWeb.Endpoint,
      {Task, fn -> InsideTrading.Workers.InsideTradesWorker.fetch_and_save_data() end}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: InsideTrading.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    InsideTradingWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
