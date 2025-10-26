# frozen_string_literal: true

require 'date'
require_relative 'book'
require_relative 'library'
require_relative 'member'

# Member class test
member = Member.new('Rifah', 101)
puts member
puts ""

# Book class test
book = Book.new('1984', 'George Orwell', '978-0451524935', 'Dystopian', 1949)
puts book
puts "Available? #{book.available?}"
puts "Checked out? #{book.checked_out?}"
puts "Checked out by: #{book.checked_out_by.inspect}"  # nil
puts ""

# Simulate checkout (manually, until Library class is ready)
book.availability_status = :checked_out
book.checked_out_by = member  # ← Member object, not string!
book.due_date = Date.today + 14

puts "After checkout:"
puts "Available? #{book.available?}"
puts "Checked out? #{book.checked_out?}"
puts "Checked out by: #{book.checked_out_by.name}"  # Now you can access .name
puts ""

# Member checkout test
puts "Member has book? #{member.has_book?(book)}"
member.checkout_book(book)
puts "After adding to member: #{member.has_book?(book)}"
puts "Can checkout more? #{member.can_checkout?}"
puts ""

# Member return test
member.return_book(book)
puts "After return: #{member.has_book?(book)}"
puts "Can checkout more? #{member.can_checkout?}"