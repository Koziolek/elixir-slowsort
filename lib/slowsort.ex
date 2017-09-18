defmodule Slowsort do
  @moduledoc """
  Documentation for Slowsort.
  """

  @doc """
  Example implementation of Slowsort algorithm.

  ## Examples

      iex> Slowsort.sort([0])
      [0]

      iex> Slowsort.sort([1,0])
      [0, 1]

      iex> Slowsort.sort([3, 11,  1, 0, 22, 2])
      [0, 1, 2, 3, 11, 22]
  """
  def sort(numbers) do
    l = length numbers
    slowsort(numbers, 0, l - 1) # we need maximum index that is length - 1
  end

  defp slowsort(numbers, i, j) when i>=j, do: numbers

  defp slowsort(numbers, i, j) do
    m = Integer.floor_div((i + j), 2)
    slowsort(numbers, i, m)
              |> slowsort(m + 1, j)
              |> swap(j, m)
              |> slowsort(i, j - 1)
  end

  defp swap(numbers, j, m) do
       max_left = Swap.nth(numbers, m);
       max_rigth = Swap.nth(numbers, j);
       swap(numbers, j, m, max_rigth, max_left)
   end

   defp swap(numbers, j, m, mr, ml) when mr < ml, do: Swap.of(numbers, j, m)
   defp swap(numbers, _, _, mr, ml) when mr >= ml, do: numbers
end
