# first-in-last-out Stack
defmodule Stack do
  defstruct elements: []

  def empty(%Stack{elements: [_head | _tail]}), do: false
  def empty(%Stack{elements: []}), do: true

  def push(%Stack{elements: elements} = stack, element),
    do: %Stack{stack | elements: elements ++ [element]}

  def pop(%Stack{elements: []}), do: {:error, nil, %Stack{}}

  def pop(%Stack{elements: elements}),
    do: {:ok, last_element(elements), %Stack{elements: except_last(elements)}}

  defp last_element([x]), do: x
  defp last_element([_head | tail]), do: last_element(tail)
  # defp last_element(list), do: list |> Enum.reverse() |> hd()

  defp except_last([]), do: []
  defp except_last([_last]), do: []
  defp except_last([head | tail]), do: [head | except_last(tail)]
  # defp except_last(list), do: list > Enum.reverse() |> tl() |> Enum.reverse()
end
