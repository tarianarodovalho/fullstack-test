defmodule InsideTradingWeb.Controllers.FilingControllerTest do
  use InsideTradingWeb.ConnCase

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all filings", %{conn: conn} do
      conn = get(conn, ~p"/api/filings")
      assert json_response(conn, 200)["data"] == []
    end
  end
end
