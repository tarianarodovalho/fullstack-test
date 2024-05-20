defmodule InsideTradingWeb.Views.FilingView do
  use InsideTradingWeb, :view

  alias InsideTrading.Securities.Filing

  def render("index.json", %{filings: filings}) do
    %{data: Enum.map(filings, &render_filing/1)}
  end

  defp render_filing(%Filing{} = filing) do
    %{
      ticker: filing.ticker,
      company: filing.company,
      report_date: filing.report_date,
      amount_of_shares: filing.amount_of_shares,
      percentage_of_shares: filing.percentage_of_shares,
      owners: format_owners(filing.owners)
    }
  end

  defp format_owners(owners) do
    Enum.map(owners, fn owner ->
      %{
        name: owner.name,
        job_title: owner.job_title
      }
    end)
  end
end
