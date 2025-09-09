=begin 
Print numbers 1 to 100 with multiples of 3 replaced by "Fizz",
multiples of 5 replaced by "Buzz", and multiples of both replaced by "FizzBuzz".
=end

(1..100).each do |n|
  if((n % 3 == 0) && (n % 5 == 0))
    p "FizzBuzz"
  elsif(n % 3 == 0)
    p "Fizz"
  elsif(n % 5 == 0)
    p "Buzz"
  else
    p n
  end
end