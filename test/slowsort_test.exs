defmodule SlowsortTest do
  use ExUnit.Case
  @moduletag timeout: 1000
  doctest Slowsort

  test "the empty array" do
    sorted  = Slowsort.sort []
    assert sorted === []
  end

  test "the simple array of two elements" do
    sorted  = Slowsort.sort [1, 0]
    assert sorted === [0, 1]
  end

  test "the array of many elements" do
    sorted  = Slowsort.sort [3, 11,  1, 0, 22, 2]
    assert sorted === [0, 1, 2, 3, 11, 22]
  end
end
