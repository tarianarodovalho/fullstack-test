defmodule InsideTrading.Scrapers.EDGARScraper do
  @moduledoc """
  A module to fetch latest inside trades from EDGAR.
  """
  @behaviour InsideTrading.Scrapers.EDGARScraperBehaviour

  require HTTPoison.Base
  require Logger

  @latest_filings_url "/cgi-bin/browse-edgar?action=getcurrent&CIK=&type=4&company=&dateb=&owner=only&start=0&count=1&output=atom"
  @batch_size 50

  @doc """
  Fetches the latest inside trades from EDGAR.
  """
  @impl InsideTrading.Scrapers.EDGARScraperBehaviour
  def fetch_and_parse_latest_filings() do
    with {:ok, filings} <- fetch_latest_filings(),
         {:ok, filing_details_urls} <- edgar_parser().find_filing_details_urls(filings),
         ownership_document_urls <- fetch_listing_details(filing_details_urls),
         latest_filings <- fetch_ownership_documents(ownership_document_urls) do
      {:ok, latest_filings}
    else
      error -> error
    end
  end

  defp fetch_latest_filings() do
    build_edgar_url()
    |> fetch_page()
  end

  defp build_edgar_url() do
    base_url =
      Application.get_env(:inside_trading, InsideTrading.Crawlers.EDGARScraper)[:base_url]

    base_url <> @latest_filings_url
  end

  defp process_request_headers() do
    user_agent =
      Application.get_env(:inside_trading, InsideTrading.Crawlers.EDGARScraper)[:user_agent]

    [{"User-Agent", user_agent}]
  end

  defp edgar_parser(), do: Application.get_env(:inside_trading, :edgar_parser_module)

  defp fetch_listing_details(urls) do
    urls
    |> Enum.chunk_every(@batch_size)
    |> Enum.map(&process_details_pages/1)
    |> List.flatten()
  end

  defp process_details_pages(urls) do
    urls
    |> Enum.map(&fetch_page/1)
    |> Enum.map(&Task.async(fn -> edgar_parser().find_ownership_document_url(&1) end))
    |> Enum.map(&Task.await(&1, 5000))
  end

  defp fetch_ownership_documents(urls) do
    urls
    |> Enum.chunk_every(@batch_size)
    |> Enum.map(&process_ownership_documents/1)
    |> List.flatten()
  end

  defp process_ownership_documents(urls) do
    Logger.info("Processing batch of #{length(urls)} ownership document URLs")

    urls
    |> Enum.map(&fetch_page/1)
    |> Enum.map(&Task.async(fn -> edgar_parser().find_ownership_relevant_data(&1) end))
    |> Enum.map(&Task.await(&1))
  end

  defp fetch_page(url) do
    headers = process_request_headers()
    http_client = Application.get_env(:inside_trading, :http_client)

    case http_client.get(url, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body}

      {:ok, %HTTPoison.Response{status_code: 429}} ->
        Logger.error("Failed to fetch latest filings: rate limit exceeded")
        {:error, :rate_limit_exceeded}

      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        Logger.error("Error status code: #{status_code}")
        {:error, %{status_code: status_code}}

      {:error, %HTTPoison.Error{reason: reason}} ->
        Logger.error("Failed to fetch: #{inspect(reason)}")
        {:error, reason}
    end
  end
end
