# first-in-first-out queue
defmodule QueueTest do
  use ExUnit.Case
  doctest Queue

  test "get empty list" do
    queue = %Queue{}
    assert queue.elements == []
  end

  test "check empty list" do
    queue = %Queue{}
    assert Queue.empty(queue) == true
  end

  test "check not empty list" do
    queue = %Queue{}
    queue = Queue.push(queue, 1)

    assert Queue.empty(queue) == false
  end

  test "push an element" do
    queue = %Queue{}
    queue = Queue.push(queue, 1)
    assert queue.elements == [1]
  end

  test "push two elements" do
    queue = %Queue{}
    queue = Queue.push(queue, 1)
    queue = Queue.push(queue, 2)

    assert queue.elements == [2, 1]
  end

  test "pop an element" do
    queue = %Queue{}
    queue = Queue.push(queue, 1)
    queue = Queue.push(queue, 2)

    {status, pop_element, queue} = Queue.pop(queue)
    assert status == :ok
    assert pop_element == 1
    assert queue.elements == [2]
  end

  test "pop Empty list" do
    queue = %Queue{}
    {status, _, _} = Queue.pop(queue)

    assert status == :error
  end

  test "pop multiple elements" do
    queue = %Queue{}
    queue = Queue.push(queue, 1)
    queue = Queue.push(queue, 2)
    queue = Queue.push(queue, 3)

    {status, _, _} = Queue.pop(queue)

    {status, pop_element, queue} = Queue.pop(queue)
    assert status == :ok
    assert pop_element == 1
    assert queue.elements == [3, 2]

    {status, pop_element, queue} = Queue.pop(queue)
    assert status == :ok
    assert pop_element == 2
    assert queue.elements == [3]

    {status, pop_element, queue} = Queue.pop(queue)
    assert status == :ok
    assert pop_element == 3
    assert Queue.empty(queue) == true
  end
end
