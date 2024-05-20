defmodule InsideTrading.Repo do
  use Ecto.Repo,
    otp_app: :inside_trading,
    adapter: Ecto.Adapters.Postgres
end
