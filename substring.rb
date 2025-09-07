def substrings (str, dictionary)
  #puts str
  #puts dictionary
  str_ar = str.downcase.split # string to array coverted
  #puts str_ar
  count = Hash.new(0)
  str_ar.each do |word|
    if dictionary.include?(word)
        count[word] += 1
    end
  end

  count
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)