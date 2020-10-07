# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :openheroes,
  ecto_repos: [Openheroes.Repo]

config :openheroes_web,
  ecto_repos: [Openheroes.Repo],
  generators: [context_app: :openheroes]

# Configures the endpoint
config :openheroes_web, OpenheroesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZkkByyY/SIeAJHbO1P0xuArP7CyHxBOfXxHwLY8lQeqkoqjoIkPNOPtVoPYpXIpl",
  render_errors: [view: OpenheroesWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Openheroes.PubSub,
  live_view: [signing_salt: "jWYZfXrP"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Pow
config :openheroes_web, :pow,
  user: Openheroes.Users.User,
  repo: Openheroes.Repo,
  web_module: OpenheroesWeb

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
