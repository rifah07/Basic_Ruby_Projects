def palindrome_checker(word)
  word = word.to_s
  word.reverse == word
end

puts palindrome_checker("Bizzare")
puts palindrome_checker("madam")
puts palindrome_checker(11211)
puts palindrome_checker(112112)