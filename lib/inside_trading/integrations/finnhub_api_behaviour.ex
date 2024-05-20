defmodule InsideTrading.Integrations.FinnhubAPIBehaviour do
  @callback get_outstanding_shares(String.t()) ::
              {:ok, float()} | {:error, String.t()}
end
