def factorial(num)
  result = 1
  (1..num).each do |i|
    result *= i
  end
  result
end

puts factorial(2)
puts factorial(3)
puts factorial(6)

