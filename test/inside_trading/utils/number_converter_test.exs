defmodule InsideTrading.Utils.NumberConverterTest do
  use InsideTrading.DataCase

  alias InsideTrading.Utils.NumberConverter

  describe "to_float/1" do
    test "converts a string that represents a float to a float" do
      assert 1.0 = NumberConverter.to_float("1")
    end

    test "converts a string that represents an integer to a float" do
      assert 1.0 = NumberConverter.to_float("1.0")
    end

    test "converts an integer to a float" do
      assert 1.0 = NumberConverter.to_float(1)
    end
  end
end
