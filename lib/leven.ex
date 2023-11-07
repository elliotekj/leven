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
    Enum.reduce(1..source_len, %{}, fn y, acc ->
      Enum.reduce(1..target_len, acc, fn x, acc ->
        source_char = Enum.at(source, y - 1)
        target_char = Enum.at(target, x - 1)

        calculate_new_cell(x, y, acc, source_char, target_char)
      end)
    end)
  end

  defp calculate_new_cell(x, y, acc, char, char) do
    diag = Map.get(acc, {x - 1, y - 1}, 0)
    Map.put(acc, {x, y}, diag)
  end

  defp calculate_new_cell(x, y, acc, _source_char, _target_char) do
    delete = Map.get(acc, {x, y - 1}, 0) |> Kernel.+(1)
    insert = Map.get(acc, {x - 1, y}, 0) |> Kernel.+(1)
    sub = Map.get(acc, {x - 1, y - 1}, 0) |> Kernel.+(1)
    min = Enum.min([delete, insert, sub])
    Map.put(acc, {x, y}, min)
  end

  defp get_distance(matrix, source_len, target_len) do
    Map.get(matrix, {target_len, source_len})
  end
end
