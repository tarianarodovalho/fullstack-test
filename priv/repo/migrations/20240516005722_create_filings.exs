defmodule InsideTrading.Repo.Migrations.CreateFilings do
  use Ecto.Migration

  def change do
    create table(:filings) do
      add :ticker, :string
      add :company, :string
      add :owner_name, :string
      add :owner_job_title, :string
      add :report_date, :date
      add :amount_of_shares, :integer
      add :percentage_of_shares, :float

      timestamps(type: :utc_datetime)
    end
  end
end
