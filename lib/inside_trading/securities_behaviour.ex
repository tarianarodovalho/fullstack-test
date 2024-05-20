defmodule InsideTrading.SecuritiesBehaviour do
  @callback create_securities(list(map())) ::
              {:ok, list(map())} | {:error, Ecto.Changeset.t()}
end
