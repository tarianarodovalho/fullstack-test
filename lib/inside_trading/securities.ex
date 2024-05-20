defmodule InsideTrading.Securities do
  @moduledoc """
  The Securities context.
  """
  @behaviour InsideTrading.SecuritiesBehaviour

  import Ecto.Query, warn: false

  require Logger

  alias InsideTrading.Repo
  alias InsideTrading.Securities.Filing
  alias InsideTrading.Securities.Owner
  alias InsideTrading.Utils.SharesCalculator

  @doc """
  Returns the list of filings.

  ## Examples

      iex> list_filings()
      [%Filing{}, ...]

  """
  def list_filings do
   Repo.all(Filing) |> Repo.preload(:owners)
  end

  @doc """
  Creates filings with their associated owners.

  ## Examples

      iex> create_securities(%{field: value})
      :ok

      iex> create_securities(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  @impl InsideTrading.SecuritiesBehaviour
  def create_securities(securities) do
    Repo.transaction(fn ->
      Enum.map(securities, fn security ->
        create_filing(security)
      end)
    end)
  end

  defp create_filing(params) do
    with {:ok, percentage} <- add_percentage_of_shares(params),
         enhanced_params = Map.put(params, :percentage_of_shares, percentage) do
      %Filing{}
      |> Filing.changeset(enhanced_params)
      |> Ecto.Changeset.cast_assoc(:owners, with: &Owner.changeset/2, required: true)
      |> Repo.insert()
      |> case do
        {:ok, filing} ->
          filing = Repo.preload(filing, :owners)
          {:ok, filing}

        {:error, changeset} ->
          {:error, changeset}
      end
    else
      {:error, error} ->
        Logger.error("Error saving securities: #{inspect(error)}")
        Repo.rollback(error)
    end
  end

  defp add_percentage_of_shares(filing) do
    shares_owned = Map.get(filing, :amount_of_shares)
    outstanding_shares = Map.get(filing, :outstanding_shares)

    SharesCalculator.calculate_percentage_of_shares(shares_owned, outstanding_shares)
  end
end
