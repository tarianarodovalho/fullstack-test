defmodule InsideTrading.Repo.Migrations.UpdateAmountOfSharesToFloat do
  use Ecto.Migration

  def change do
    alter table(:filings) do
      modify :amount_of_shares, :float
    end
  end
end
