defmodule PalindromeChecker do
  def palindrome() do
    IO.puts("--PALINDROME CHECKER--")
    a = IO.gets("ENTER WORD: ") |> String.trim()
    a == check_palindrome(a)
  end
  def check_palindrome(string) do
    string
    |> String.trim()
    |> String.downcase()
    |> String.reverse()
  end
end
