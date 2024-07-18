defmodule Leven do
  @moduledoc """
  Compute the Levenshtein distance between two strings.

  The Levenshtein distance, also known as edit distance, measures the difference
  between two strings in terms of the minimum number of single-character edits
  (insertions, deletions, or substitutions) required to change one string into
  the other.
  """

  @doc """
  Returns the Levenshtein distance between two strings.
  """
  @spec distance(String.t(), String.t()) :: integer()
  def distance(source, target) when source == target, do: 0

  def distance("", target), do: String.length(target)

  def distance(source, ""), do: String.length(source)

  def distance(source, target) do
    source = String.graphemes(source)
    target = String.graphemes(target)

    source_len = length(source)
    target_len = length(target)

    matrix = build_matrix(source_len, target_len, source, target)
    get_distance(matrix, source_len, target_len)
  end

  defp build_matrix(source_len, target_len, source, target) do
    for j <- 1..target_len, i <- 1..source_len, reduce: %{{0, 0} => 0} do
      acc ->
        source_char = Enum.at(source, i - 1)
        target_char = Enum.at(target, j - 1)

        acc
        |> Map.put({i, 0}, i)
        |> Map.put({0, j}, j)
        |> calculate_new_cell(i, j, source_char, target_char)
    end
  end

  defp calculate_new_cell(acc, i, j, source_char, target_char) do
    sub_cost =
      case source_char == target_char do
        true -> 0
        false -> 1
      end

    delete = Map.get(acc, {i - 1, j}) |> Kernel.+(1)
    insert = Map.get(acc, {i, j - 1}) |> Kernel.+(1)
    sub = Map.get(acc, {i - 1, j - 1}) |> Kernel.+(sub_cost)
    min = Enum.min([delete, insert, sub])

    Map.put(acc, {i, j}, min)
  end

  defp get_distance(matrix, source_len, target_len) do
    Map.get(matrix, {source_len, target_len})
  end
end
