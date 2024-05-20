defmodule InsideTrading.Parsers.EDGARParser do
  @moduledoc """
  A module to parse EDGAR data returned from the different fetch calls:
  - the list of latest filings, which returns an atom/xml
  - the filing details page, which returns a text/html
  - the ownership document, which returns a text/xml
  """
  @behaviour InsideTrading.Parsers.EDGARParserBehaviour

  require Logger

  alias InsideTrading.Utils.NumberConverter

  @impl InsideTrading.Parsers.EDGARParserBehaviour
  def find_filing_details_urls(body) do
    case FeederEx.parse(body) do
      {:ok, %{entries: []}, _} ->
        Logger.warning("No entries field found in EDGAR RSS Feed.")
        {:error, :filing_feed_parse_error}

      {:ok, %{entries: entries}, _} ->
        {:ok, Enum.map(entries, fn entry -> entry.link end)}

      {:fatal_error, _, reason, _, _} ->
        Logger.error("FeederEx failed to parse filings, reason: #{reason}")
        {:fatal_error, reason}
    end
  end

  @impl InsideTrading.Parsers.EDGARParserBehaviour
  def find_ownership_document_url({:ok, body}) do
    {:ok, document} = Floki.parse_document(body)

    document
    |> Floki.find("table.tableFile")
    |> Floki.find("a")
    |> Enum.map(fn link ->
      %{
        text: Floki.text(link),
        href: Floki.attribute(link, "href") |> List.first()
      }
    end)
    |> Enum.filter(fn url ->
      String.contains?(url.text, ".xml")
    end)
    |> build_url()
  end

  @impl InsideTrading.Parsers.EDGARParserBehaviour
  def find_ownership_relevant_data({:ok, xml_content}) do
    {:ok, parsed} = Floki.parse_document(xml_content)
    parse_ownership_document(parsed)
  end

  defp build_url([]) do
    {:error, :url_not_found_error}
  end

  defp build_url([%{href: url} | _]) do
    base_url =
      Application.get_env(:inside_trading, InsideTrading.Crawlers.EDGARScraper)[:base_url]

    base_url <> url
  end

  defp parse_ownership_document(parsed_xml) do
    owners =
      parsed_xml
      |> Floki.find("reportingowner")
      |> Enum.map(&parse_owner_info/1)

    %{
      report_date: find_content(parsed_xml, "periodofreport"),
      ticker: find_content(parsed_xml, "issuer issuertradingsymbol"),
      company: find_content(parsed_xml, "issuer issuername"),
      owners: owners,
      amount_of_shares: parse_transactions_table(parsed_xml)
    }
  end

  defp parse_owner_info(owner) do
    owner_name = find_content(owner, "reportingowner reportingownerid rptownername")

    owner_title =
      owner
      |> find_job_titles()
      |> define_job_title()

    %{name: owner_name, job_title: owner_title}
  end

  defp find_job_titles(owner) do
    %{
      is_director: find_content(owner, "reportingowner reportingownerrelationship isdirector"),
      is_officer: find_content(owner, "reportingowner reportingownerrelationship isofficer"),
      is_ten_percent_owner:
        find_content(
          owner,
          "reportingowner reportingownerrelationship istenpercentowner"
        ),
      officer_title: find_content(owner, "reportingowner reportingownerrelationship officertitle")
    }
  end

  defp define_job_title(%{officer_title: officer_title})
       when officer_title != "" and not is_nil(officer_title),
       do: officer_title

  defp define_job_title(%{is_director: is_director})
       when is_director == "true" or is_director == "1",
       do: "Director"

  defp define_job_title(%{is_officer: is_officer}) when is_officer == "true" or is_officer == "1",
    do: "Officer"

  defp define_job_title(%{is_ten_percent_owner: is_ten_percent_owner})
       when is_ten_percent_owner == "true" or is_ten_percent_owner == "1",
       do: "Ten Percent Owner"

  defp parse_transactions_table(parsed_xml) do
    derivative_transactions =
      parsed_xml
      |> Floki.find("derivativetable")
      |> Enum.map(&extract_transaction_share_amount/1)
      |> Enum.filter(fn transaction -> Map.get(transaction, :post_transaction_amounts) != nil end)

    non_derivative_transactions =
      parsed_xml
      |> Floki.find("nonderivativetable")
      |> Enum.map(&extract_transaction_share_amount/1)
      |> Enum.filter(fn transaction -> Map.get(transaction, :post_transaction_amounts) != nil end)

    (derivative_transactions ++ non_derivative_transactions)
    |> Enum.reduce(0, fn transaction, acc ->
      transaction_amount =
        Map.get(transaction, :post_transaction_amounts, "0") |> NumberConverter.to_float()

      transaction_amount + acc
    end)
  end

  defp extract_transaction_share_amount(transaction) do
    %{
      post_transaction_amounts:
        find_content(transaction, "posttransactionamounts sharesownedfollowingtransaction value")
    }
  end

  defp find_content(node, selector) do
    case Floki.find(node, selector) do
      [] -> nil
      [h | _] -> Floki.text(h)
    end
  end
end
