# frozen_string_literal: true

require 'date'
require_relative 'Book'
require_relative 'Member'
require_relative 'Library'

puts '=' * 60
puts 'LIBRARY MANAGEMENT SYSTEM - TESTING'
puts '=' * 60

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
puts "\n=== Test 1: Display All Books ==="
library.display_books

# Search tests
puts "\n=== Test 2: Search for 'kill' ==="
results = library.search_books_by_title('kill')
if results.is_a?(Array)
  results.each { |book| puts "  - #{book}"}
else
  puts results # Error message
end

puts "\n=== Test 3: Search for 'Orwell' ==="
results = library.search_books_by_author('Orwell')
if results.is_a?(Array)
  results.each { |book| puts "  - #{book}"}
else
  puts results # Error message
end


# Checkout test with exception handling
puts "\n=== Test 4: Successful Checkout ==="
begin
  result = library.check_out('978-0451524935', 101)
  puts "✓ SUCCESS: #{result}"
rescue LibraryError => e
  puts "✗ ERROR: #{e.message}"
end

puts "\n=== After Checkout ==="
library.display_books

# Try to check out when not available
puts "\n=== Test 5: Try to Checkout Already Checked Out Book ==="
begin
  result = library.check_out('978-0451524935', 102)
  puts "✓ SUCCESS: #{result}"
rescue BookUnavailableError => e
  puts "✗ ERROR (Expected): #{e.message}"
rescue LibraryError => e
  puts "✗ ERROR (Expected): #{e.message}"
end
puts

# Try to checkout with invalid member
# Pendin form here

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
