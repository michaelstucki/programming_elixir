person = %{
  first_name: "Izzy",
  last_name: "Bell",
  birthday: ~D[1987-12-04],
}
IO.inspect person
# ~ is a sigil, a shortcut for creating

full_name = fn (person) -> "#{person.first_name} #{person.last_name}" end
full_name.(person) |> IO.puts

age = fn (person) ->
  days = Date.diff(Date.utc_today, person.birthday)
  days / 365.25
end
age.(person) |> IO.puts
