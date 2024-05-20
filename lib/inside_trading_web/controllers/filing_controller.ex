defmodule InsideTradingWeb.Controllers.FilingController do
  use InsideTradingWeb, :controller

  alias InsideTrading.Securities
  alias InsideTradingWeb.Views.FilingView

  action_fallback InsideTradingWeb.FallbackController

  def index(conn, _params) do
    filings = Securities.list_filings()
    conn
    |> put_view(FilingView)
    |> render("index.json", filings: filings)
  end
end
