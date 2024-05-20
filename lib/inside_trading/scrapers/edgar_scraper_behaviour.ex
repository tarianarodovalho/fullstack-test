defmodule InsideTrading.Scrapers.EDGARScraperBehaviour do
  @callback fetch_and_parse_latest_filings() ::
              {:ok, [map()]} | {:error, any()}
end
