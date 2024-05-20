defmodule InsideTrading.Integrations.FinnhubAPITest do
  use InsideTrading.DataCase, async: true

  import Hammox

  alias InsideTrading.Integrations.FinnhubAPI

  setup :verify_on_exit!

  @http_client HTTPClientMock
  @base_url "https://finnhub.io/api/v1/stock/profile2"
  @valid_params [%{ticker: "AAPL", token: "APITOKEN"}]
  @invalid_params [%{ticker: "INVALID_TICKER", token: "APITOKEN"}]
  @success_response %{
    "shareOutstanding" => 100_000_000
  }
  @error_response %{
    "error" => "any error"
  }

  describe "get_outstanding_shares/1" do
    test "returns amount of outstanding shares" do
      expect(@http_client, :get, fn _, _, _ ->
        {:ok,
         %HTTPoison.Response{
           status_code: 200,
           body: @success_response |> Jason.encode!(),
           request: %HTTPoison.Request{
             method: :get,
             url: @base_url,
             params: @valid_params
           }
         }}
      end)

      assert {:ok, 100_000_000} = FinnhubAPI.get_outstanding_shares("AAPL")
    end

    test "returns 404 error when ticker code is invalid" do
      expect(@http_client, :get, fn _, _, _ ->
        {:ok,
         %HTTPoison.Response{
           status_code: 404,
           request: %HTTPoison.Request{
             method: :get,
             url: @base_url,
             params: @invalid_params
           }
         }}
      end)

      assert {:error, :ticker_not_found} = FinnhubAPI.get_outstanding_shares("INVALID_TICKER")
    end

    test "returns 429 error when rate limit exceeded" do
      expect(@http_client, :get, fn _, _, _ ->
        {:ok,
         %HTTPoison.Response{
           status_code: 429,
           request: %HTTPoison.Request{
             method: :get,
             url: @base_url,
             params: @valid_params
           }
         }}
      end)

      assert {:error, :rate_limit_exceeded} = FinnhubAPI.get_outstanding_shares("AAPL")
    end

    test "returns an error when any unexpected status_code is returned" do
      expect(@http_client, :get, fn _, _, _ ->
        {:ok,
         %HTTPoison.Response{
           status_code: 500,
           request: %HTTPoison.Request{
             method: :get,
             url: @base_url,
             params: @valid_params
           }
         }}
      end)

      assert {:error, "Error status code: 500"} =
               FinnhubAPI.get_outstanding_shares("AAPL")
    end

    test "returns an error when outstanding shares is not found while parsing" do
      expect(@http_client, :get, fn _, _, _ ->
        {:ok,
         %HTTPoison.Response{
           status_code: 200,
           body: @error_response |> Jason.encode!(),
           request: %HTTPoison.Request{
             method: :get,
             url: @base_url,
             params: @valid_params
           }
         }}
      end)

      assert {:error, :outstanding_shares_not_found} =
               FinnhubAPI.get_outstanding_shares("AAPL")
    end
  end
end
