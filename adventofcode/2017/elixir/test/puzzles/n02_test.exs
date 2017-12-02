defmodule AOCTest.Puzzles.N02Test do
  use ExUnit.Case

  # Read the puzzle input from a file and parse it
  setup_all do
    {:ok, raw} = File.read("test/puzzles/inputs/02.txt")

    input = raw
    # Trim extra whitespace
    |> String.trim

    # Split on rows
    |> String.split("\n")

    # Split on tabs
    |> Enum.map(&(String.split(&1, "\t")))

    # Convert strings to integers
    |> Enum.map(fn (row) ->
      Enum.map(row, fn (col) ->
        {num, _} = Integer.parse(col)
        num
      end)
    end)

    # IO.inspect input
    {:ok, input: input}
  end

  describe "evenly_divisible_by/2" do
    test "evenly divisible" do
      assert AOC.Puzzles.N02.evenly_divisible_by(8, 2) == true
    end

    test "not evenly divisible" do
      assert AOC.Puzzles.N02.evenly_divisible_by(9, 2) == false
    end
  end

  describe "Part 1" do
    test "first example" do
      assert AOC.Puzzles.N02.first_half([[5, 1, 9, 5],
                                         [7, 5, 3],
                                         [2, 4, 6, 8]]) == 18
    end

    test "solution", %{:input => input} do
      assert AOC.Puzzles.N02.first_half(input) == 37923
    end
  end

  describe "Part 2" do
    test "first example" do
      assert AOC.Puzzles.N02.second_half([[5, 9, 2, 8],
                                          [9, 4, 7, 3],
                                          [3, 8, 6, 5]]) == 9
    end

    test "solution", %{:input => input} do
      assert AOC.Puzzles.N02.second_half(input) == 263
    end
  end
end
