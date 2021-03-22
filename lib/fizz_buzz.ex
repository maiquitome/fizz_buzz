defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read
  end

  defp handle_file_read({:ok, ""}), do: {:error, "empty file"}

  defp handle_file_read({:ok, result}) do
    result =
      String.trim(result)
      |> String.split(",")
      |> Enum.map(&convert_and_evaluate_numbers/1)

    {:ok, result}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  defp convert_and_evaluate_numbers(elem) do
    elem
    |> String.to_integer()
    |> evaluate_numbers
  end

  # defp evaluate_numbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  # defp evaluate_numbers(number) when rem(number, 3) == 0, do: :fizz
  # defp evaluate_numbers(number) when rem(number, 5) == 0, do: :buzz
  # defp evaluate_numbers(number), do: number

  defp evaluate_numbers(number) do
    case {rem(number, 3) == 0, rem(number, 5) == 0} do
      {true, true} -> :fizzbuzz
      {false, true} -> :buzz
      {true, false} -> :fizz
      {false, false} -> number
    end
  end
end
