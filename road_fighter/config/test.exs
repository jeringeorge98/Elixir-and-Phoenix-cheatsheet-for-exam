import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :road_fighter, RoadFighter.Repo,
  username: "postgres",
  password: "1001",
  hostname: "localhost",
  database: "road_fighter_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :road_fighter, RoadFighterWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "HeFlCpzaI9qgh2TMQMClyTdlumQq0kRCP40x/r+sNlP+ZaJumytxs+vJnisKsuBL",
  server: false

# In test we don't send emails.
config :road_fighter, RoadFighter.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
