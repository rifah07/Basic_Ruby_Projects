require 'Date'

require_relative 'book'
require_relative 'library'
require_relative 'member'

book = Book.new("1984", "George Orwell", "978-0451524935", "Dystopian", 1949)
puts book                    # 1984 by George Orwell (1949) - ISBN: 978-0451524935
puts book.available?         # true
puts book.checked_out?       # false
puts book.checked_out_by     # nil

# When library checks it out:
book.availability_status = :checked_out
book.checked_out_by = "Rifah"
book.due_date = Date.today + 14

puts book.available?         # false
puts book.checked_out?       # true

