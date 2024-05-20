defmodule InsideTrading.Integrations.FinnhubAPI do
  @moduledoc """
  A module to fetch market capitalization data from Finnhub.
  """
  @behaviour InsideTrading.Integrations.FinnhubAPIBehaviour

  require HTTPoison.Base
  require Logger

  @finnhub_base "https://finnhub.io/api/v1/stock/profile2"

  @doc """
  Fetches the amount of outstanding shares for a given ticker from Finnhub.
  """
  @impl InsideTrading.Integrations.FinnhubAPIBehaviour
  def get_outstanding_shares(ticker) do
    request = http_client().get(@finnhub_base, headers(), params: params(ticker))
    Logger.debug("Request: #{inspect(request)}")
    case request do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Jason.decode()
        |> parse_outstanding_shares_data()

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, :ticker_not_found}

      {:ok, %HTTPoison.Response{status_code: 429}} ->
        {:error, :rate_limit_exceeded}

      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        {:error, "Error status code: #{status_code}"}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, "Failed to fetch market cap data: #{reason}"}
    end
  end

  defp http_client() do
    Application.get_env(:inside_trading, :http_client)
  end

  defp params(ticker) do
    [
      {"symbol", ticker},
      {"token", api_key()}
    ]
  end

  defp api_key() do
    Application.get_env(:inside_trading, :finnhub_api_key)
  end

  defp headers do
    [{"Content-Type", "application/json"}]
  end

  defp parse_outstanding_shares_data({:ok, %{"shareOutstanding" => shares}}),
    do: {:ok, shares}

  defp parse_outstanding_shares_data(_), do: {:error, :outstanding_shares_not_found}
end
