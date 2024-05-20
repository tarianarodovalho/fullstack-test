defmodule InsideTrading.Securities.Owner do
  use Ecto.Schema
  import Ecto.Changeset

  schema "owners" do
    field :name, :string
    field :job_title, :string

    many_to_many :filings, InsideTrading.Securities.Filing,
      join_through: InsideTrading.Securities.OwnersFiling

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(owner, attrs) do
    owner
    |> cast(attrs, [:name, :job_title])
    |> validate_required([:name, :job_title])
  end
end
