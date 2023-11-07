defmodule LevenTest do
  use ExUnit.Case

  describe "distance/2" do
    test "returns 0 when both strings are empty" do
      assert Leven.distance("", "") == 0
    end

    test "returns the length of the populated string when the other string is empty" do
      assert Leven.distance("abc", "") == 3
      assert Leven.distance("", "abc") == 3
    end

    test "returns 0 when both strings are equal" do
      assert Leven.distance("abc", "abc") == 0
    end

    test "returns the correct distance for strings with the same length" do
      assert Leven.distance("abc", "abd") == 1
      assert Leven.distance("abc", "cba") == 2
    end

    test "returns the correct distance for strings with different lengths" do
      assert Leven.distance("abc", "ab") == 1
      assert Leven.distance("abc", "abcd") == 1
    end

    test "returns the correct distance for strings with special characters" do
      assert Leven.distance("abç", "abc") == 1
      assert Leven.distance("abç", "abç") == 0
    end

    test "returns the correct distance for strings with non-latin characters" do
      assert Leven.distance("abc", "абв") == 3
      assert Leven.distance("你好", "你好世界") == 2
    end

    test "returns the correct distance for strings with spaces" do
      assert Leven.distance("abc def", "abc defg") == 1
      assert Leven.distance("abc def", "abc  def") == 1
      assert Leven.distance("abc def", "abcdef") == 1
    end

    test "returns the correct distance for long strings" do
      long_string1 = String.duplicate("a", 100)
      long_string2 = String.duplicate("a", 99) <> "b"

      assert Leven.distance(long_string1, long_string2) == 1
    end
  end
end
