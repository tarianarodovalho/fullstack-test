defmodule InsideTrading.Workers.InsideTradesWorker do
  @moduledoc """
  Worker for orchestrating the fetching of latest inside trades from EDGAR, the fetching of outstanding shares from Finnhub API, and saving the data to the database.
  """
  use GenServer

  require Logger

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    schedule_work()
    {:ok, nil}
  end

  def handle_info(:work, _state) do
    fetch_and_save_data()
    schedule_work()
    {:noreply, nil}
  end

  defp schedule_work do
    :timer.send_after(3600 * 1000, self(), :work)
  end

  def fetch_and_save_data do
    with {:ok, latest_filings} <- fetch_latest_filings(),
         {:ok, enhanced_filings} <-
           fetch_outstanding_shares(latest_filings),
         {:ok, _} <- securities().create_securities(enhanced_filings) do
      :ok
    else
      {:error, reason} ->
        Logger.error("Error fetching latest inside trades: #{inspect(reason)}")
        {:error, reason}
    end
  end

  defp fetch_latest_filings, do: edgar_scraper().fetch_and_parse_latest_filings()

  defp fetch_outstanding_shares(filings) do
    enhanced_filings =
      filings
      |> Enum.map(&add_percentage_of_outstanding_shares/1)
      |> Enum.filter(fn filing -> ignore_failed_outstanding_share(filing) end)

    {:ok, enhanced_filings}
  end

  defp add_percentage_of_outstanding_shares(filing) do
    case finnhub_api().get_outstanding_shares(filing.ticker) do
      {:ok, outstanding_shares} ->
        Map.put(filing, :outstanding_shares, outstanding_shares)

      {:error, reason} ->
        Logger.error("Failed to fetch outstanding shares for #{filing.ticker}, reason: #{inspect(reason)}")
        {:error, reason}
    end
  end

  defp ignore_failed_outstanding_share({:error, _reason}), do: false
  defp ignore_failed_outstanding_share(_), do: true

  defp finnhub_api() do
    Application.get_env(:inside_trading, :finnhub_api_module)
  end

  defp edgar_scraper() do
    Application.get_env(:inside_trading, :edgar_scraper_module)
  end

  defp securities() do
    Application.get_env(:inside_trading, :securities_module)
  end
end
