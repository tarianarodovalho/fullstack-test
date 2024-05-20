defmodule InsideTrading.Utils.SharesCalculator do
  @moduledoc """
  A module to perform calculus regarding shares.
  """

  @doc """
  Calculates the percentage of shares owned by a an inside trader.
  """
  def calculate_percentage_of_shares(nil, _total_outstanding_shares),
    do: {:error, :invalid_amount_of_shares}

  def calculate_percentage_of_shares(_total_shares_owned, nil),
    do: {:error, :invalid_outstanding_shares}

  def calculate_percentage_of_shares(total_shares_owned, total_outstanding_shares) do
    percentage = (total_shares_owned / total_outstanding_shares * 100) |> Float.round(2)
    {:ok, percentage}
  end
end
