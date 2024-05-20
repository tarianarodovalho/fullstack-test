defmodule InsideTrading.Securities.OwnersFiling do
  use Ecto.Schema
  import Ecto.Changeset

  schema "owners_filings" do
    field :owner_id, :id
    field :filing_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(owners_filing, attrs) do
    owners_filing
    |> cast(attrs, [])
    |> validate_required([])
  end
end
