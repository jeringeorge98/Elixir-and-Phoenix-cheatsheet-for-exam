import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :example_project, ExampleProject.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "example_project_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :example_project, ExampleProjectWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4001],
  secret_key_base: "qsfBtiFiJPlZdNx7G8uywv5u1vBMA8YvMjqZCnjcROt9BnG2N5o30opVNkq9iIl6",
  server: true

# In test we don't send emails.
config :example_project, ExampleProject.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
config :hound, driver: "chrome_driver"
config :example_project, sql_sandbox: true
