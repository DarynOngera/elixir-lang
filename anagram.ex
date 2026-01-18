defmodule Anagram do
  def anagram() do
  a = IO.gets("First word: ") 
  b = IO.gets("Second word: ")
  sort_string(a) == sort_string(b)
  end

  def sort_string(string) do
    string
    |> String.trim()
    |> String.downcase()
    |> String.graphemes()
    |> Enum.sort()
  end 
end
