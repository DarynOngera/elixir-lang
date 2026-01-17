defmodule Calc do 
  def add() do 
    a = IO.gets("num:1 ") |> String.trim() |> String.to_integer()
    b = IO.gets("num:2 ") |> String.trim() |> String.to_integer()
    sum = a + b 
    IO.puts("#{sum}")
  end

  def sub do
    a = IO.gets("num:1 ") |> String.trim() |> String.to_integer()
    b = IO.gets("num:2 ") |> String.trim() |> String.to_integer()
    if a > b do
      sub = a - b
      IO.puts("#{sub}")
    else
      sub = b - a
      IO.puts("#{sub}")
    end
  
  end 
  
  def div do
    a = IO.gets("num:1 ") |> String.trim() |> String.to_integer()
    b = IO.gets("num:2 ") |> String.trim() |> String.to_integer()
    div = a / b
    IO.puts("#{div}")
  end

  def mult do
    a = IO.gets("num:1 ") |> String.trim() |> String.to_integer()
    b = IO.gets("num:2 ") |> String.trim() |> String.to_integer()

    product = a * b
    IO.puts("#{product}")
  end
end
