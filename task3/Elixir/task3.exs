defmodule Palindrome do
  def is_palindrome(number) do
    reversed =
      number
      |> Integer.digits()
      |> Enum.reverse()
      |> Integer.undigits()

    reversed == number
  end

  def palindromes_in_array(numbers) do
    Enum.map(numbers, fn num ->
      cond do
        num > 99 and num < 1000 ->
          if is_palindrome(num), do: "Yes", else: "No"

        true ->
          "-"
      end
    end)
  end

  def display(list) do
    Enum.each(list, fn item ->
      IO.write("#{item} ")
    end)
  end
end

defmodule Main do
  def run do
    n =
      IO.gets("Enter N: ")
      |> String.trim()
      |> String.to_integer()

    if n < 0 do
      IO.puts("N should be positive!!!")
    else
      numbers =
        Enum.map(1..n, fn i ->
          input =
            IO.gets("#{i} - ")
            |> String.trim()
            |> String.to_integer()

          if input < 0 do
            IO.puts("Number should be positive!!!")
            System.halt(0)
          end

          input
        end)

      numbers
      |> Palindrome.palindromes_in_array()
      |> Palindrome.display()
    end
  end
end

Main.run()
