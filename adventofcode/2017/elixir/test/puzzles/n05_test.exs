defmodule AOCTest.Puzzles.N05Test do
  use ExUnit.Case

  import AOC.Puzzles.N05

  # Read the puzzle input from a file and parse it
  setup_all do
    {:ok, raw} = File.read("test/puzzles/inputs/05.txt")

    input = raw
    # Trim extra whitespace
    |> String.trim

    # Split by lines
    |> String.split("\n")

    # Parse to integer
    |> Enum.map(&String.to_integer(&1))

    {:ok, input: input}
  end

  describe "Part 1" do
    test "0, 3, 0, 1, -3" do
      assert first_half([0, 3, 0, 1, -3]) == 5
    end

    @tag :slow
    test "solution", %{:input => input} do
      assert first_half(input) == 343364
    end
  end

  describe "Part 2" do
    test "0, 3, 0, 1, -3" do
      assert second_half([0, 3, 0, 1, -3]) == 10
    end

    @tag :slow
    test "solution", %{:input => input} do
      assert second_half(input) == 25071947
    end
  end
end
