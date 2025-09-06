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