import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :inside_trading, InsideTrading.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "inside_trading_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :inside_trading, InsideTradingWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Yf4T0jTR1KZbtpDX6bGdcZlz2tm8ysR5ldNKDnpvarOGZM7AybXmdCjZK4Ty4zDW",
  server: false

# In test we don't send emails.
config :inside_trading, InsideTrading.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :inside_trading,
  edgar_parser_module: EDGARParserMock,
  edgar_scraper_module: EDGARScraperMock,
  finnhub_api_module: FinnhubAPIMock,
  http_client: HTTPClientMock,
  securities_module: SecuritiesMock
