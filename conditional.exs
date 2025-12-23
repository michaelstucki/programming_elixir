case File.read("haiku.txt") do
  {:ok, contents} ->
    contents
    |> String.split("\n", trim: true)
    |> Enum.map(&String.reverse/1)
    |> Enum.join("\n")
  {:error, :enoent} ->
    IO.puts "Could not find haiku.txt"
  {:error, _} ->
    IO.puts "Something unexpected happened, please try again."
end

# do...end is a block, an argument
# two (2) clauses or paths
# use pattern matching inside the case

num = 50
cond do
  num < 50 -> IO.puts "Number is less than 50"
  num > 50 -> IO.puts "Number is greater than 50"
  num == 50 -> IO.puts "Number is equal to 50"
end
# cond requires at least one of its conditions to evaluate to true

num = 10
if num == 50 do
  IO.puts "Number is equal to 50"
end
# return nil

num = 10
unless num == 50 do
  IO.puts "Number is not 50"
end
# unless == if not

num = 10
if num == 50 do
  IO.puts "Number is 50"
else
  IO.puts "Number is not 50"
end

# with
# chain together multiple operations,
# and only continue if each of those operations is successful
file_data = %{name: "haiku.txt"}

with {:ok, name} <- Map.fetch(file_data, :name),
     {:ok, contents} <- File.read(name) do
  contents
  |> String.split("\n", trim: true)
  |> Enum.map(&String.reverse/1)
  |> Enum.join("\n")
  |> IO.puts
else
  :error -> ":name key missing in file_data"
  {:error, :enoent} -> "Couldn't read file"
end
