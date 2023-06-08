defmodule Leven do
  @moduledoc """
  Documentation for `Leven`.
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

    matrix = get_distance_table(source_len, target_len)
    filled_matrix = process_rows(source_len, target_len, matrix, source, target)
    get_distance(filled_matrix, source_len, target_len)
  end

  defp get_distance_table(source_len, target_len) do
    first_row = Enum.reduce(0..target_len, {}, fn i, acc -> Tuple.append(acc, i) end)
    rest_zeros = List.duplicate(0, target_len)
    rest_rows = Enum.map(1..source_len, fn i -> List.to_tuple([i | rest_zeros]) end)
    List.to_tuple([first_row | rest_rows])
  end

  defp process_rows(rows, columns, matrix, source, target) do
    Enum.reduce(1..rows, matrix, &process_columns(&1, columns, &2, source, target))
  end

  defp process_columns(i, columns, matrix, source, target) do
    Enum.reduce(1..columns, matrix, &process_cell(i, &1, &2, source, target))
  end

  defp process_cell(i, j, matrix, source, target) do
    source_char = Enum.at(source, i - 1)
    target_char = Enum.at(target, j - 1)
    new_cell = calculate_new_value(i, j, matrix, source_char, target_char)
    new_row = put_elem(elem(matrix, i), j, new_cell)
    put_elem(matrix, i, new_row)
  end

  defp calculate_new_value(i, j, matrix, source_char, target_char)
       when source_char == target_char do
    matrix |> elem(i - 1) |> elem(j - 1)
  end

  defp calculate_new_value(i, j, matrix, _source_char, _target_char) do
    delete = (elem(matrix, i - 1) |> elem(j)) + 1
    insert = (elem(matrix, i) |> elem(j - 1)) + 1
    substitute = (elem(matrix, i - 1) |> elem(j - 1)) + 1
    Enum.min([delete, insert, substitute])
  end

  defp get_distance(matrix, source_len, target_len) do
    matrix |> elem(source_len) |> elem(target_len)
  end
end
