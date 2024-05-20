defmodule InsideTrading.Mocks do
  Mox.defmock(HTTPClientMock, for: HTTPoison.Base)

  Mox.defmock(EDGARScraperMock, for: InsideTrading.Scrapers.EDGARScraperBehaviour)
  Application.put_env(:inside_trading, :edgar_scraper_module, EDGARScraperMock)

  Mox.defmock(EDGARParserMock, for: InsideTrading.Parsers.EDGARParserBehaviour)
  Application.put_env(:inside_trading, :edgar_parser_module, EDGARParserMock)

  Mox.defmock(FinnhubAPIMock, for: InsideTrading.Integrations.FinnhubAPIBehaviour)
  Application.put_env(:inside_trading, :finnhub_api_module, FinnhubAPIMock)

  Mox.defmock(SecuritiesMock, for: InsideTrading.SecuritiesBehaviour)
  Application.put_env(:inside_trading, :securities_module, SecuritiesMock)
end
