# frozen_string_literal: true

#
# Given an integer n, return a string array answer (1-indexed) where:
# answer[i] == "FizzBuzz" if i is divisible by 3 and 5.
# answer[i] == "Fizz" if i is divisible by 3.
# answer[i] == "Buzz" if i is divisible by 5.
# answer[i] == i (as a string) if none of the above conditions are true.

# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
  answer = []

  (1..n).each do |i|
    answer[i] = if (i % 3).zero? && (i % 5).zero?
                  'FizzBuzz'
                elsif (i % 3).zero?
                  'Fizz'
                elsif (i % 5).zero?
                  'Buzz'
                else
                  i.to_s
                end
  end
  answer[1..]
end
