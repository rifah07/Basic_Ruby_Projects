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

=begin 

Previous solution :
  word = word.to_s
  #word.reverse == word
  - Time complexity: O(n)
  - Space complexity: O(n) [as it creates a new reversed string]
  
  Current solution is given above
  - Time complexity: O(n) [actually O(n/2) but we drop the constant factor so /2 is removed]
  - Space complexity: O(1)

=end