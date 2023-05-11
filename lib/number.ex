defmodule Number do
  @spec new(binary) :: integer
  def new(string), do: Integer.parse(string) |> elem(0)

  @spec add(number, number) :: number
  def add(number, addend), do: number + addend

  @spec to_string(integer) :: binary
  def to_string(number), do: Integer.to_string(number)
end
