defmodule Openheroes.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Openheroes.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Openheroes.PubSub}
      # Start a worker by calling: Openheroes.Worker.start_link(arg)
      # {Openheroes.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Openheroes.Supervisor)
  end
end
