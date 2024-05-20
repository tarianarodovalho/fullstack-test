defmodule InsideTrading.Utils.SharesCalculatorTest do
  use InsideTrading.DataCase

  alias InsideTrading.Utils.SharesCalculator

  describe "calculate_percentage_of_shares/2" do
    test "calculates the percentage of shares owned by an inside trader" do
      assert SharesCalculator.calculate_percentage_of_shares(42, 100) == {:ok, 42.0}
    end
  end
end
