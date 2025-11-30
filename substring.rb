# frozen_string_literal: true

def substrings(str, dictionary)
  str_ar = str.downcase.scan(/\w+/) # to extract words from string
  counts = Hash.new(0)
  str_ar.each do |word|
    dictionary.each do |subs|
      counts[subs] += 1 if word.include?(subs.downcase)
    end
  end
  counts.select { |_, c| c.positive? }
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
