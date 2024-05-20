defmodule InsideTrading.Repo.Migrations.CreateOwners do
  use Ecto.Migration

  def change do
    create table(:owners) do
      add :name, :string
      add :job_title, :string

      timestamps(type: :utc_datetime)
    end
  end
end
