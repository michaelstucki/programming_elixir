defmodule Person do
  defstruct [
    first_name: nil,
    last_name: nil,
    birthday: nil,
    location: "home"
  ]

  # def full_name(person) do
  # def full_name(%Person{} = person) do
  # pattern match to get needed values
  def full_name(%Person{first_name: first_name, last_name: last_name} = person) do
    "#{first_name} #{last_name}"
  end

  # def age(person) do
  # def age(%Person{} = person) do
  def age(%Person{birthday: birthday} = person) do
    days = Date.diff(Date.utc_today, birthday)
    days / 365.25
  end

  # # def home(person) do
  # # match on the struct type
  # def home(%Person{} = person) do
  #   %{person | location: "home"}
  # end

  # # def away(person) do
  # # match on the struct type
  # def away(%Person{} = person) do
  #   %{person | location: "away"}
  # end

  def toggle_location(%Person{location: "away"} = person) do
    person |> set_location("home")
  end

  def toggle_location(%Person{location: "home"} = person) do
    person |> set_location("away")
  end

  # private function
  #  centralized code and hides internal details
  defp set_location(%Person{} = person, location) do
    %{person | location: location}
  end

  # define an implementation for Inspect protocol for Person module
  # gives a condensed form of a Person struct to the iex console
  defimpl Inspect do
    def inspect(%Person{
      first_name: first_name,
      last_name: last_name,
      location: location,
    }, _) do
      "Person[#{first_name} #{last_name}, #{location}]"
    end
  end
end

# c "person.exs", "."
# creates Elixir.Person.beam in "." (directory where above was run)
# Elixir automatically loads Elixir.Person.beam when iex is run.

# struct is a kind of map
# each map of the same kind has (shares) the same structure
# its keys are limited to a certain set
# creates a Person struct
# structs can have default values (maps cannot)

person = %Person{
  first_name: "Izzy",
  last_name: "Bell",
  birthday: ~D[1987-12-04]
}
person |> Person.toggle_location |> IO.inspect

# Three things that make Elixir functions unique:
# 1. The function's name
# 2. How many arguments that function takes, and;
# 3. The pattern of those arguments

# structs can be passed an an argument to a Map function
%Person{} |> Map.get(:location) |> IO.puts
%Person{} |> Map.keys |> IO.inspect
%Person{}.__struct__ |> IO.puts # Person (module name of the struct)
# structs are maps with an extra key, :__struct__

# this is a struct
~D[1987-12-04] |> Map.keys |> IO.inspect
