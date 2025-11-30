# frozen_string_literal: true

def is_palindrome(s)
  #   s.downcase!
  #   s= s.gsub(/[^a-zA-Z0-9]/,"")
  #   s == s.reverse

  s = s.downcase.delete('^a-zA-Z0-9/')
  s == s.reverse
end

p is_palindrome('A man, a plan, a canal: Panama')
p is_palindrome('race a car')
p is_palindrome(' ')
