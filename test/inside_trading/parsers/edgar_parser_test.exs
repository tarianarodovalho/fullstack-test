defmodule InsideTrading.Parsers.EDGARParserTest do
  use InsideTrading.DataCase, async: true

  alias InsideTrading.Parsers.EDGARParser
  alias InsideTrading.EDGARParserFixtures

  @expected_details_urls [
    "https://www.sec.gov/Archives/edgar/data/1828490/000130449224000054/0001304492-24-000054-index.htm",
    "https://www.sec.gov/Archives/edgar/data/1304492/000130449224000054/0001304492-24-000054-index.htm",
    "https://www.sec.gov/Archives/edgar/data/1821509/000130449224000053/0001304492-24-000053-index.htm",
    "https://www.sec.gov/Archives/edgar/data/1304492/000130449224000053/0001304492-24-000053-index.htm",
    "https://www.sec.gov/Archives/edgar/data/1669943/000130449224000051/0001304492-24-000051-index.htm",
    "https://www.sec.gov/Archives/edgar/data/1304492/000130449224000051/0001304492-24-000051-index.htm",
    "https://www.sec.gov/Archives/edgar/data/1656634/000141588924013657/0001415889-24-013657-index.htm",
    "https://www.sec.gov/Archives/edgar/data/1374539/000141588924013657/0001415889-24-013657-index.htm",
    "https://www.sec.gov/Archives/edgar/data/1629762/000130449224000050/0001304492-24-000050-index.htm",
    "https://www.sec.gov/Archives/edgar/data/1304492/000130449224000050/0001304492-24-000050-index.htm"
  ]

  @expected_ownership_data %{
    ticker: "MORN",
    owners: [
      %{name: "Mansueto Joseph D", job_title: "Executive Chairman"},
      %{name: "Houston Andrew", job_title: "Director"},
      %{name: "von Moltke Lisa", job_title: "See Remarks"},
      %{name: "DUBINSKY JASON", job_title: "Chief Financial Officer"},
      %{name: "Arnold John Douglas", job_title: "Director"}
    ],
    amount_of_shares: 10_783_275.0,
    company: "Morningstar, Inc.",
    report_date: "2024-05-15"
  }

  describe "find_filing_details_urls/1" do
    test "finds filing details urls" do
      assert {:ok, @expected_details_urls} =
               EDGARParser.find_filing_details_urls(
                 EDGARParserFixtures.successful_latest_filings_fixture()
               )
    end

    test "fails to find entries for filing details urls" do
      assert {:error, :filing_feed_parse_error} =
               EDGARParser.find_filing_details_urls(
                 EDGARParserFixtures.failure_to_find_entries_fixture()
               )
    end

    test "fatal error when format is not supported by FeederEx" do
      assert {:fatal_error, _reason} =
               EDGARParser.find_filing_details_urls(
                 EDGARParserFixtures.fatal_error_latest_filings_fixture()
               )
    end
  end

  describe "find_ownership_document_url/1" do
    test "finds ownership document url" do
      assert "https://www.sec.gov/Archives/edgar/data/1289419/000106299324010733/form4.xml" =
               EDGARParser.find_ownership_document_url(
                 {:ok, EDGARParserFixtures.successful_details_page_fixture()}
               )
    end

    test "fails to find ownership document url" do
      assert {:error, :url_not_found_error} =
               EDGARParser.find_ownership_document_url(
                 {:ok, EDGARParserFixtures.url_not_found_details_page_fixture()}
               )
    end
  end

  describe "find_ownership_relevant_data/1" do
    test "parses ownership document for relevant data" do
      assert @expected_ownership_data =
               EDGARParser.find_ownership_relevant_data(
                 {:ok, EDGARParserFixtures.ownership_document_fixture()}
               )
    end
  end
end
