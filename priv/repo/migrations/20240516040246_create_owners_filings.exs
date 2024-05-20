defmodule InsideTrading.Repo.Migrations.CreateOwnersFilings do
  use Ecto.Migration

  def change do
    create table(:owners_filings) do
      add :owner_id, references(:owners, on_delete: :nothing)
      add :filing_id, references(:filings, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:owners_filings, [:owner_id])
    create index(:owners_filings, [:filing_id])
  end
end
