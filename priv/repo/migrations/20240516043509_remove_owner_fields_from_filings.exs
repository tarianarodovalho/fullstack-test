defmodule InsideTrading.Repo.Migrations.RemoveOwnerFieldsFromFilings do
  use Ecto.Migration

  def change do
    alter table(:filings) do
      remove :owner_name
      remove :owner_job_title
    end
  end
end
