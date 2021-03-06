# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :dei_app,
  ecto_repos: [DeiApp.Repo]

config :dei_app, DeiApp.Repo,
  migration_primary_key: [
    name: :id,
    type: :binary_id,
    autogenerate: false,
    read_after_writes: true,
    default: {:fragment, "gen_random_uuid()"}
  ]

# Configures the endpoint
config :dei_app, DeiAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ktHYJvWOGlke5PJapQ+kY0xPjoxtp6sWlhoAL1Tu+AJfPmFYs+UrQzPMY6QvBxiC",
  render_errors: [view: DeiAppWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: DeiApp.PubSub,
  live_view: [signing_salt: "CWBBl2KA"]

# Guardian config
config :dei_app, DeiApp.UserManager.Guardian,
  issuer: "dei_app",
  secret_key: "lI4+hXYJ4yA2l0L3YHHl6zBr3bvoUTG4Z+tF7Uk9b/UgC5meFnge4BplHxYgb0fR"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
