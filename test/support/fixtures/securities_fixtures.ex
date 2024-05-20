defmodule InsideTrading.SecuritiesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `InsideTrading.Securities` context.
  """

  @doc """
  Generate a security, which is a filing with its owners.
  """
  def security_fixture(_attrs \\ %{}) do
    params = %{
      amount_of_shares: 42,
      company: "some company",
      owners: [
        %{name: "some owner_name", job_title: "some owner_job_title"}
      ],
      shares_amount: 345.0873,
      outstanding_shares: 120.5,
      report_date: ~D[2024-05-15],
      ticker: "some ticker"
    }

    {:ok, security} = InsideTrading.Securities.create_securities([params])

    security
  end
end
