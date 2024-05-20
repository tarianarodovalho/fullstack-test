# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :inside_trading,
  ecto_repos: [InsideTrading.Repo],
  finnhub_api_key: System.get_env("FINNHUB_API_KEY"),
  generators: [timestamp_type: :utc_datetime]

config :inside_trading, InsideTrading.Crawlers.EDGARScraper,
  base_url: "https://www.sec.gov",
  user_agent: System.get_env("EDGAR_USER_AGENT")

# Configures the endpoint
config :inside_trading, InsideTradingWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: InsideTradingWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: InsideTrading.PubSub,
  live_view: [signing_salt: "xGe47nMP"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :inside_trading, InsideTrading.Mailer, adapter: Swoosh.Adapters.Local

# Configures Elixir's Logger
config :logger, :console,
level: :debug,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :inside_trading,
  edgar_parser_module: InsideTrading.Parsers.EDGARParser,
  edgar_scraper_module: InsideTrading.Scrapers.EDGARScraper,
  finnhub_api_module: InsideTrading.Integrations.FinnhubAPI,
  http_client: HTTPoison,
  securities_module: InsideTrading.Securities

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
