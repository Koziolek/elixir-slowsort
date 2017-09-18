defmodule Swap do
    @moduledoc """
        Code came from https://gist.github.com/tdantas/417d172ad8c10d5cec7a
    """

  def of([ ], _, _), do: [ ]
  def of(list, left, left), do: list

  def of(list, left, right) do
    list
    |> List.replace_at(left, nth(list, right))
    |> List.replace_at(right, nth(list, left))
  end

  def nth(_, idx) when is_number(idx) and idx < 0 do
    throw 'Index must be positive'
  end

  def nth(list, idx) when idx > length(list) - 1 do
    throw ' index bigger the list size'
  end

  def nth([ element | _ ] , 0), do: element
  def nth([ _ | tail ], idx), do: nth(tail, idx - 1)

end