def caesar_cipher(text, shift)
  shift %= 26
  result = text.each_char.map do |char|
    if char =~ /[A-Za-z]/
      base = char.ord < 91 ? 65 : 97
      ((char.ord-base+shift)%26 + base).chr
    else
      char
    end
  end
  result.join
end

puts caesar_cipher("What a string!", 5)
puts caesar_cipher("Khoor, Zruog!", -3)

print "Enter the message you want to encrypt: "
user_message = gets.chomp
print "Enter the amount of shifts: "
shift_amount = gets.chomp.to_i
puts caesar_cipher(user_message, shift_amount) # ruby caesar_cipher.rb in terminal