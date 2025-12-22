# returns a tuples {status atom, "...file contents..."}
# atom: its name is its value
# tuple: a fixed-length list
#  used to link a bunch of information together
#  in a particular order
File.read("haiku.txt") |> IO.inspect

File.read("bad.txt") |> IO.inspect
# {:error, :enoent} == {failed, couldn't find the file}

# use pattern matching to proceed only if successful
{:ok, contents} = File.read("haiku.txt")
contents
|> String.split("\n", trim: true)
|> Enum.map(&String.reverse/1)
|> Enum.join("\n")
|> IO.puts
# use multi-line pipe operator

# Streams
# reads file one line at a time
stream = File.stream!("haiku.txt")
IO.inspect(stream)
# File.read is eager
# File.stream! is lazy
# Streaming -> think a streaming video from the internet
#   it provides a bit at a time rather than downloading the entire episode

# returns a struct: a map that follow a particular set of rules
# it is named
# and structs with the same name always have the same keys
# %File.Stream{
#   path: "haiku.txt",
#   modes: [:raw, :read_ahead, :binary],
#   line_or_bytes: :line,
#   raw: true,
#   node: :nonode@nohost
# }

# hasn't yet read the file
#  must pipe this stream into an Enum method
fixed_contents = stream
|> Enum.map(&String.trim/1)
|> Enum.map(&String.reverse/1)
|> Enum.join("/n")
IO.puts(fixed_contents)

File.write("fixed-haiku.txt", fixed_contents)

File.rename("haiku.txt", "reverse-haiku.txt")
File.rename("fixed-haiku.txt", "haiku.txt")

File.write("delete-me.txt", "delete me")
File.rm("delete-me.txt")
