# 10. Maps
person = %{name: "A", age: 14, sex: "male"}
# interate a map (an enumerable)
# use underscore (_), since the map's key is not used
Enum.each(person, fn({_, value}) -> IO.puts value end)

forcast = %{
  "Monday"    => 28,
  "Tuesday"   => 29,
  "Wednesday" => 29,
  "Thursday"  => 24,
  "Friday"    => 16,
  "Saturday"  => 16,
  "Sunday"    => 20
}

forcast_f = Enum.map(forcast, fn({day, temp}) -> {day, temp * 1.8 + 32} end)
Enum.into(forcast_f, %{})
IO.inspect(forcast)
IO.inspect(forcast_f)

# pipe operator (|>)
IO.puts "hello pipe operator" |> String.upcase() |> String.reverse()

%{
  "Monday"    => 28,
  "Tuesday"   => 29,
  "Wednesday" => 29,
  "Thursday"  => 24,
  "Friday"    => 16,
  "Saturday"  => 16,
  "Sunday"    => 20
}
|> Enum.map(fn ({day, temp}) -> {day, temp * 1.8 + 32} end)
|> Enum.into(%{})
|> IO.inspect

person = %{"gender" => "Female", "age" => "30ish", "name" => "Izzy"}
IO.inspect(person)
IO.puts(Map.get(person, "name"))

%{
  "people" => ["Izzy", "The Author"],
  "robots" => ["Roboto", "TARS"]
}
|> Map.get("people") |> List.first
|> IO.puts()

izzy = %{"name" => "Izzy", "age" => "30ish", "gender" => "Female"}
Map.put(izzy, "age", "40ish") |> IO.inspect

izzy |> Map.put("age", "40ish") |> Map.put("country", "Australia") |> IO.inspect

Map.merge(izzy, %{"age" => "40ish", "country" => "Australia"}) |> IO.inspect

# pipe merging (keys must exist)
%{izzy | "age" => "40ish", "name" => "Isidore"} |> IO.inspect

Map.delete(izzy, "gender") |> IO.inspect

# Ex. 8.1 using pipe operator
# Make a program that generates a very short story.
# Get it to take some input of a person, a place and an object
# -- using IO.gets/1 and combine all
# three into a little sentence, output with IO.puts/1.
