defmodule Factor do
  def of(n) when n > 1 do
    ofp(n, 2, [])
  end

  def of(_), do: []

  defp ofp(n, divisor, factors) when rem(n, divisor) != 0 and n > divisor do
    ofp(n, divisor + 1, factors)
  end

  defp ofp(n, divisor, factors) when rem(n, divisor) != 0 and n <= divisor do
    factors
  end

  defp ofp(n, divisor, factors) when rem(n, divisor) == 0 do
    [divisor | ofp(div(n, divisor), divisor, factors)]
  end
end

# defmodule Factor do
#   def of(n) when n > 1 do
#     divide(n, 2)
#   end

#   def of(_), do: []

#   def divide(n, divisor) when rem(n, divisor) != 0 do
#     (n > divisor && [n]) || []
#   end

#   def divide(n, divisor) when rem(n, divisor) == 0 do
#     [divisor | divide(div(n, divisor), divisor)]
#   end
# end
