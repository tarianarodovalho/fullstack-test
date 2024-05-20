defmodule InsideTrading.Utils.NumberConverter do
  @moduledoc """
  A module to convert numbers in different formats.
  Converts numbers from EDGAR when shares_amount is returned as a string that can represent a float or integer number.
  """

  def to_float(value) when is_binary(value) do
    case String.contains?(value, ".") do
      true ->
        parse_float(value)

      false ->
        parse_int_to_float(value)
    end
  end

  def to_float(value) do
    value + 0.0
  end

  defp parse_float(value) do
    case Float.parse(value) do
      {num, ""} -> num
      _ -> {:error, :not_a_float}
    end
  end

  defp parse_int_to_float(value) do
    case Integer.parse(value) do
      {num, ""} -> num + 0.0
      _ -> {:error, :not_an_integer}
    end
  end
end
