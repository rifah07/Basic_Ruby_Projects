=begin 
Given an integer n, return a string array answer (1-indexed) where:
answer[i] == "FizzBuzz" if i is divisible by 3 and 5.
answer[i] == "Fizz" if i is divisible by 3.
answer[i] == "Buzz" if i is divisible by 5.
answer[i] == i (as a string) if none of the above conditions are true.
=end

# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
    answer = []

    (1..n).each do |i|
        if ((i % 3 == 0) && (i % 5 == 0))
         answer[i] = "FizzBuzz"
        elsif (i % 3 == 0)
         answer[i] = "Fizz"
        elsif (i % 5 == 0)
         answer[i] = "Buzz"
        else
         answer[i] = i.to_s
        end
    end
    answer[1..-1]  
end