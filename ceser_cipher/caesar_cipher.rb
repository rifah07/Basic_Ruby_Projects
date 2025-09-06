def caesar_cipher(text, shift)
  text.each_char do |char|
    if char =~ /[A-Za-z]/
      base = char.ord < 91 ? 65 : 97
      encrypted_char = ((char.ord-base+shift)%26 + base).chr
      print encrypted_char
    else
      print char
    end
  end
  puts ""
end

caesar_cipher("What a string!", 5)
caesar_cipher("Khoor, Zruog!", -3)