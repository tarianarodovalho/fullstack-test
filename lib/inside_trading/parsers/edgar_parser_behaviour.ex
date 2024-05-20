defmodule InsideTrading.Parsers.EDGARParserBehaviour do
  @callback find_filing_details_urls(String.t() | any()) ::
              {:ok, list(String.t())} | {:error, any()} | {:error, String.t()}
  @callback find_ownership_document_url({:ok, String.t()} | {:ok, any()}) ::
              String.t() | {:error, any()} | {:error, String.t()}
  @callback find_ownership_relevant_data({:ok, String.t()} | {:ok, any()}) ::
              map | {:error, any()} | {:error, String.t()}
end
