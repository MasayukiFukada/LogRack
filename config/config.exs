# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :log_lac,
  ecto_repos: [LogLac.Repo]

# Configures the endpoint
config :log_lac, LogLacWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "R6n9ShLBWRJPJInp9xFWhetL9btjtMMOe/+zbWqV96vZUAV9s4DsE1qZCz0fRIjY",
  render_errors: [view: LogLacWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LogLac.PubSub,
  live_view: [signing_salt: "HQJz3mHt"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
