IO.puts 60 * 60 * 24

place = "World"
IO.puts "Hello, #{place}"

seconds = 86400
IO.puts 30 * seconds / 3600

name = "Michael"
IO.puts "My name is #{name}"

list = ["I", "am", "a", "list"]
# IO.puts list[0]

person = %{"name" => "Robert", "age" => 56, "gender" => "Male"}
IO.puts person["name"]

person = %{name: "X", age: 1, gender: "female"}
# use atoms for keys in maps
person = %{:name => "Y", :age => 2, :gender => "male"}
IO.puts person[:gender]
IO.puts person.gender

greeting = fn (place) -> "Hello, #{place}!" end
IO.puts greeting.("World")

c_to_f = fn (c) -> c * 1.8 + 32 end
IO.puts c_to_f.(0)

greeting = fn (name, age) -> "Hello, #{name}! You are #{age}!" end
IO.puts greeting.("Michael", 64)

# capture operator (refer to parameters by position, not name)
captured_greeting = &("Hello, #{&1}!")
IO.puts captured_greeting.("Michael")

captured_greeting = &("Hello, #{&1}! You are #{&2}!")
IO.puts captured_greeting.("Michael", 64)

f_to_c = fn (f) -> (f - 32) / 1.8 end
IO.puts f_to_c.(32)

seconds_in_days = fn (days) -> days * 60 * 60 * 24 end
IO.puts seconds_in_days.(2)

average_age = fn (m1, m2) -> (m1.age + m2.age) / 2 end
IO.puts average_age.(%{age: 1}, %{age: 2})
