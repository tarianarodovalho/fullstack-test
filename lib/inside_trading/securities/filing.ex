defmodule InsideTrading.Securities.Filing do
  use Ecto.Schema
  import Ecto.Changeset

  schema "filings" do
    field :ticker, :string
    field :company, :string
    field :report_date, :date
    field :amount_of_shares, :float
    field :percentage_of_shares, :float

    many_to_many :owners, InsideTrading.Securities.Owner,
      join_through: InsideTrading.Securities.OwnersFiling

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(filing, attrs) do
    filing
    |> cast(attrs, [
      :ticker,
      :company,
      :report_date,
      :amount_of_shares,
      :percentage_of_shares
    ])
    |> validate_required([
      :ticker,
      :company,
      :report_date,
      :amount_of_shares
    ])
    |> validate_owners_presence()
  end

  defp validate_owners_presence(changeset) do
    case Ecto.Changeset.get_field(changeset, :owners) do
      nil -> add_error(changeset, :owners, "can't be blank")
      _ -> changeset
    end
  end
end
