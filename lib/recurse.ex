defmodule Recurse do
  def loopy([head | tail]) do
    IO.puts "Head: #{head} Tail: #{inspect(tail)}"
    loopy(tail)
  end

  def loopy([]), do: IO.puts "Done!"

  def sum([head | tail], total) do
    sum(tail, total + head)
  end

  def sum([], total), do: IO.puts total

  def triple([ head | tail]) do
    [head * 3 | triple(tail)]
  end

  def triple([]), do: []

  def my_map([head | tail], func) do
    [func.(head) | my_map(tail, func)]
  end

  def my_map([], _func), do: []
end

Recurse.loopy([1, 2, 3, 4, 5])
Recurse.sum([1, 2, 3, 4, 5], 0)
IO.inspect Recurse.triple([1, 2, 3, 4, 5])

nums = [1, 2, 3, 4, 5]
IO.inspect Recurse.my_map(nums, &(&1 * 2))
IO.inspect Recurse.my_map(nums, &(&1 * 4))
IO.inspect Recurse.my_map(nums, &(&1 * 5))
