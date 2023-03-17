defmodule Queue do
  defstruct elements: []

  def empty(%Queue{elements: [_head | _tail]}), do: false
  def empty(%Queue{elements: []}), do: true

  def push(%Queue{elements: elements} = queue, element),
    do: %Queue{queue | elements: [element | elements]}

  def pop(%Queue{elements: []}), do: {:error, nil, %Queue{}}

  def pop(%Queue{elements: elements}),
    do: {:ok, last_element(elements), %Queue{elements: except_last(elements)}}

  defp last_element([x]), do: x
  defp last_element([_head | tail]), do: last_element(tail)

  defp except_last([]), do: []
  defp except_last([_last]), do: []
  defp except_last([head | tail]), do: [head | except_last(tail)]
end
