defmodule InsideTrading.Scrapers.EDGARScraperTest do
  use InsideTrading.DataCase, async: true

  import Hammox

  alias InsideTrading.Scrapers.EDGARScraper

  setup :verify_on_exit!

  @http_client HTTPClientMock
  @base_url "https://www.sec.gov/cgi-bin/browse-edgar?action=getcurrent&CIK=&type=4&company=&dateb=&owner=only&start=0&count=50&output=atom"
  @filing_details_url "https://www.sec.gov/Archives/edgar/data/1324069/000106299324010733/0001062993-24-010733-index.htm"
  @ownership_url "https://www.sec.gov/Archives/edgar/data/1289419/000106299324010733/form4.xml"
  @ownership_data %{
    report_date: "2024-06-30",
    ticker: "AAPL",
    company: "Apple Inc",
    owners: [
      %{
        name: "Tim Cook",
        job_title: "CEO"
      }
    ],
    amount_of_shares: "10000.0000"
  }

  describe "fetch_and_parse_latest_filings/0" do
    test "fetches and parses latest filings from EDGAR" do
      expect(@http_client, :get, fn _, _ ->
        {:ok,
         %HTTPoison.Response{
           status_code: 200,
           headers: [{"Content-Type", "atom/xml"}],
           request: %HTTPoison.Request{
             method: :get,
             url: @base_url
           }
         }}
      end)

      expect(EDGARParserMock, :find_filing_details_urls, fn _ -> {:ok, [@filing_details_url]} end)

      expect(@http_client, :get, fn _, _ ->
        {:ok,
         %HTTPoison.Response{
           status_code: 200,
           headers: [{"Content-Type", "text/html"}],
           request: %HTTPoison.Request{
             method: :get,
             url: @filing_details_url
           }
         }}
      end)

      expect(EDGARParserMock, :find_ownership_document_url, fn _ -> @ownership_url end)

      expect(@http_client, :get, fn _, _ ->
        {:ok,
         %HTTPoison.Response{
           status_code: 200,
           headers: [{"Content-Type", "text/xml"}],
           request: %HTTPoison.Request{
             method: :get,
             url: @ownership_url,
             params: []
           }
         }}
      end)

      expect(EDGARParserMock, :find_ownership_relevant_data, fn _ -> @ownership_data end)

      assert {:ok, _} = EDGARScraper.fetch_and_parse_latest_filings()
    end

    test "returns an error when rate limit is exceeded" do
      expect(@http_client, :get, fn _, _ ->
        {:ok,
         %HTTPoison.Response{
           status_code: 429,
           request: %HTTPoison.Request{
             method: :get,
             url: @base_url
           }
         }}
      end)

      assert {:error, :rate_limit_exceeded} = EDGARScraper.fetch_and_parse_latest_filings()
    end

    test "returns an error when any unexpected status_code is returned" do
      expect(@http_client, :get, fn _, _ ->
        {:ok,
         %HTTPoison.Response{
           status_code: 500,
           request: %HTTPoison.Request{
             method: :get,
             url: @base_url
           }
         }}
      end)

      assert {:error, %{status_code: 500}} =
               EDGARScraper.fetch_and_parse_latest_filings()
    end
  end
end
