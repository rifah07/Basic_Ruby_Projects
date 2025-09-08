def palindrome_checker(word)
  if(word.reverse == word)
    return true
  else
    return false
  end

end

puts palindrome_checker("Bizzare")
puts palindrome_checker("madam")