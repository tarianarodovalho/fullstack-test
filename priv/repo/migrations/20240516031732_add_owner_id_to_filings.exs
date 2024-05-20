defmodule InsideTrading.Repo.Migrations.AddOwnerIdToFilings do
  use Ecto.Migration

  def change do
    alter table(:filings) do
      add :owner_id, references(:owners, on_delete: :nothing)
    end
  end
end
