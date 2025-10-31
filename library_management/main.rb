# frozen_string_literal: true

require 'date'
require_relative 'Book'
require_relative 'Member'
require_relative 'Library'

# Create library
library = Library.new('City Public Library')

# Create and add books
book1 = Book.new('1984', 'George Orwell', '978-0451524935', 'Dystopian', 1949)
book2 = Book.new('To Kill a Mockingbird', 'Harper Lee', '978-0061120084', 'Fiction', 1960)
book3 = Book.new('The Great Gatsby', 'F. Scott Fitzgerald', '978-0743273565', 'Classic', 1925)

library.add_book(book1)
library.add_book(book2)
library.add_book(book3)

# Create and add members
member1 = Member.new('Alice Johnson', 101)
member2 = Member.new('Bob Smith', 102)

library.add_member(member1)
library.add_member(member2)

# Display all books
library.display_books

# Search tests
puts "\n=== Search for 'kill' ==="
puts library.search_books_by_title('kill')

puts "\n=== Search for 'Orwell' ==="
puts library.search_books_by_author('Orwell')

# Checkout test
puts "\n=== Checking out 1984 ==="
puts library.check_out('978-0451524935', 101)

library.display_books

# Try to check out when not available
puts "\n=== Try to checkout 1984 again ==="
puts library.check_out('978-0451524935', 102)

# Return test
puts "\n=== Returning 1984 ==="
puts library.return_book('978-0451524935', 101)

library.display_books

# Overdue test (simulate overdue)
puts "\n=== Testing overdue books ==="
library.check_out('978-0061120084', 101)
book2.due_date = Date.today - 1 # Make it overdue
puts 'Overdue books:'
p library.overdue_books
