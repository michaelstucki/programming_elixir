# 9. Lists
IO.puts List.first([1, 2, 3, 4])
IO.puts List.last([1, 2, 3, 4])

l = ["In", "the", "beginning"]
IO.puts l
l = Enum.reverse(l)
IO.puts l

letters = ["a", "b", "c"]
# & captures functions from modules so we can use them
Enum.each(letters, &IO.puts/1)

cap = &String.capitalize/1
IO.puts cap.("melbourne")

l = Enum.map(letters, &String.capitalize/1)
IO.puts l

numbers = [1, 2, 3, 4]
Enum.each(numbers, &IO.puts/1)
n = Enum.map(numbers, fn (number) -> number * 2 end)
Enum.each(n, &IO.puts/1)

scores = [31, 78, 94]
s = Enum.reduce(scores, fn(score, sum) ->
  IO.puts(sum)
  IO.puts(score)
  IO.puts("---")
  sum + score
end)
IO.puts s

IO.puts Enum.sum(scores)

#  Ex. 1 replace all e's
words = ["a", "very", "fine", "collection", "of", "words", "enunciated"]
w = Enum.map(words, fn (word) -> String.replace(word, "e", "a") end)
Enum.each(w, &IO.puts/1)

# Ex. 2 multiply these numbers together
numbers = [5, 12, 9, 24, 9, 18]
IO.puts Enum.reduce(numbers, fn (number, product) -> number * product end)
