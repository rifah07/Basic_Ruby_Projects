def substrings (str, dictionary)
  str_ar = str.downcase.scan(/\w+/) # string to array coverted
  #puts str_ar
  str_ar.each_with_object(Hash.new(0)) do |word, counts|
    counts[word] += 1 if dictionary.include?(word)
  end
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
