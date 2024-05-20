defmodule InsideTrading.Workers.InsideTradesWorkerTest do
  use InsideTrading.DataCase, async: true

  import Hammox

  alias InsideTrading.Workers.InsideTradesWorker

  setup :verify_on_exit!

  @edgar_response [
    %{
      ticker: "some ticker",
      company: "some company",
      report_date: ~D[2024-05-15],
      amount_of_shares: 42,
      outstanding_shares: 120.5,
      owners: [%{name: "owner1", job_title: "relationship1"}]
    }
  ]

  @repo_response [
    %{
      ticker: "some ticker",
      company: "some company",
      report_date: ~D[2024-05-15],
      amount_of_shares: 42,
      percentage_of_shares: 34.85,
      owners: [%{name: "owner1", job_title: "relationship1"}]
    }
  ]

  describe "fetch_and_save_data/0" do
    test "fetches and saves data" do
      expect(EDGARScraperMock, :fetch_and_parse_latest_filings, fn -> {:ok, @edgar_response} end)
      expect(FinnhubAPIMock, :get_outstanding_shares, fn _ -> {:ok, 100.000} end)
      expect(SecuritiesMock, :create_securities, fn _ -> {:ok, @repo_response} end)

      :ok = InsideTradesWorker.fetch_and_save_data()
    end
  end
end
