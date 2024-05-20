defmodule InsideTrading.SecuritiesTest do
  use InsideTrading.DataCase

  import InsideTrading.SecuritiesFixtures

  alias InsideTrading.Securities

  @invalid_attrs [
    %{
      ticker: nil,
      company: nil,
      report_date: nil,
      amount_of_shares: 10,
      outstanding_shares: 32.2
    }
  ]

  @invalid_attrs_missing_shares [
    %{
      ticker: nil,
      company: nil,
      report_date: nil,
      amount_of_shares: nil,
      outstanding_shares: nil
    }
  ]

  describe "list_filings/0" do
    test "returns all filings" do
      [{:ok, filing}] = security_fixture()
      assert Securities.list_filings() == [filing]
    end
  end

  describe "create_securities/1" do
    test "creates filings and its owners" do
      valid_attrs = [
        %{
          ticker: "some ticker",
          company: "some company",
          report_date: ~D[2024-05-15],
          amount_of_shares: 42,
          outstanding_shares: 120.5,
          owners: [%{name: "owner1", job_title: "relationship1"}]
        }
      ]

      assert {:ok, [{:ok, security}]} = Securities.create_securities(valid_attrs)

      assert security.ticker == "some ticker"
      assert security.company == "some company"
      assert security.report_date == ~D[2024-05-15]
      assert security.amount_of_shares == 42
      assert security.percentage_of_shares == 34.85
      owner = List.first(security.owners)
      assert owner.name == "owner1"
      assert owner.job_title == "relationship1"
    end

    test "create_filing/1 with invalid data returns error changeset" do
      assert {:ok, [error: %Ecto.Changeset{}]} = Securities.create_securities(@invalid_attrs)
    end

    test "create_filing/1 with missing shares amount returns error" do
      assert {:error, :invalid_amount_of_shares} =
               Securities.create_securities(@invalid_attrs_missing_shares)
    end
  end
end
