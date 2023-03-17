# first-in-last-out Stack
defmodule StackTest do
  use ExUnit.Case
  doctest Stack

  test "get empty list" do
    stack = %Stack{}
    assert stack.elements == []
  end

  test "is empty list" do
    stack = %Stack{}
    assert Stack.empty(stack) == true
  end

  test "is not empty list" do
    stack = %Stack{}
    stack = Stack.push(stack, 1)
    assert Stack.empty(stack) == false
  end

  test "push an element" do
    stack = %Stack{}
    stack = Stack.push(stack, 1)
    assert stack.elements == [1]
  end

  test "push two elements" do
    stack = %Stack{}
    stack = Stack.push(stack, 1)
    stack = Stack.push(stack, 2)
    assert stack.elements == [1, 2]
  end

  test "push multiple elements" do
    stack = %Stack{}
    stack = Stack.push(stack, 1)
    stack = Stack.push(stack, 2)
    stack = Stack.push(stack, 3)
    stack = Stack.push(stack, 4)
    stack = Stack.push(stack, 5)
    stack = Stack.push(stack, 6)

    assert stack.elements == [1, 2, 3, 4, 5, 6]
  end

  test "pop an element" do
    stack = %Stack{}
    stack = Stack.push(stack, 1)
    stack = Stack.push(stack, 2)
    stack = Stack.push(stack, 3)

    {status, pop_element, stack} = Stack.pop(stack)

    assert status == :ok
    assert pop_element == 3
    assert stack.elements == [1, 2]
  end

  test "pop multiple elements" do
    stack = %Stack{}
    stack = Stack.push(stack, 1)
    stack = Stack.push(stack, 2)
    stack = Stack.push(stack, 3)

    {status, pop_element, stack} = Stack.pop(stack)

    assert status == :ok
    assert pop_element == 3
    assert stack.elements == [1, 2]

    {status, pop_element, stack} = Stack.pop(stack)

    assert status == :ok
    assert pop_element == 2
    assert stack.elements == [1]

    {status, pop_element, stack} = Stack.pop(stack)

    assert status == :ok
    assert pop_element == 1
    assert Stack.empty(stack) == true
  end

  test "pop empty list" do
    stack = %Stack{}

    {status, _, _} = Stack.pop(stack)
    assert status == :error
  end

  # https://stackoverflow.com/questions/1583363/how-to-unit-test-private-methods-in-bdd-tdd
  # test "get last_element" do
  #   assert Stack.last_element([1, 2, 3]) == 3
  # end
end
