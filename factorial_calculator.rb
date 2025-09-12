def factorial(num)
  result = 1
  (1..num).each do |i|
    result *= i
  end
  result
end
puts "Factorial results using Iteartion"
puts factorial(2)
puts factorial(3)
puts factorial(6)

# The above approach is done using Iteration.
# Next one is with Recursion

def factorial_recursion(num)
  return 1 if num <= 1
  num * factorial_recursion(num-1)
end
puts "Factorial results using Recursion"
puts factorial_recursion(2)
puts factorial_recursion(3)
puts factorial_recursion(6)

=begin
Complexity Comparison:
Iteration: Time Complexity : O(n); Space Complexity: O(1)
Recursion: Time Complexity : O(n); Space Complexity: O(n)
So, Time complexity is same for both while in Iteartion approach is more space-effitient
=end

