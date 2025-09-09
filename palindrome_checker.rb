def palindrome_checker(word)
  word = word.to_s
  #word.reverse == word
  n = word.length
  left = 0
  right = n - 1
  while (left < right)
    if(word[left] == word[right])
      left += 1
      right -= 1
    else
      return false
    end
  end
  true
end

puts palindrome_checker("Bizzar")
puts palindrome_checker("madam")
puts palindrome_checker(11211)
puts palindrome_checker(112112)