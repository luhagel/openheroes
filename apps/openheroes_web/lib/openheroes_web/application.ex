defmodule OpenheroesWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      OpenheroesWeb.Telemetry,
      # Start the Endpoint (http/https)
      OpenheroesWeb.Endpoint
      # Start a worker by calling: OpenheroesWeb.Worker.start_link(arg)
      # {OpenheroesWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: OpenheroesWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    OpenheroesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
