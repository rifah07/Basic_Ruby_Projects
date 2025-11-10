# frozen_string_literal: true

# Library class should have methods to:
#      - Add and remove books from the collection
#      - Add and remove members
#      - Check out a book to a member (with due date tracking)
#      - Return a book from a member
#      - Display all books and their status (available/checked out and by whom)
#      - Search for books by title or author
#      - List overdue books

require 'date'
require_relative 'exceptions'
require_relative 'Member'

# This is Library class
class Library
  attr_reader :name

  CHECKOUT_DAYS = 15

  def initialize(name)
    @name = name
    @books = [] # using array, hash when Large datasets (1000+)
    @members = []
  end

  def add_book(book)
    @books << book
  end

  def remove_book(isbn)
    # book = @books.find {|b| b.isbn == isbn}
    # @books.delete(book) if book

    @books.delete_if { |book| book.isbn == isbn }
  end

  def add_member(member)
    @members << member
  end

  def remove_member(id)
    # member = @members.find {|m| m.id == id}
    # @members.delete(member) if member
    @members.delete_if {|member| member.member_id == id}
  end

  def check_out(isbn, member_id)
    book = @books.find { |b| b.isbn == isbn}
    # return 'Book not found' if book.nil?
    raise BookNotFoundError, "Book with ISBN '#{isbn}' not found" unless book

    member = @members.find { |m| m.member_id == member_id}
    # return 'Member not found' if member.nil?
    raise MemberNotFoundError, "Member with ID #{member_id} not found" unless member

    # return 'Book not available' unless book.available?
    # return 'Member at checkout limit' unless member.can_checkout?
    raise BookUnavailableError, "'#{book.title}' is currently checked out" unless book.available?
    raise CheckoutLimitError.new(member.name, member.class::CHECKOUT_LIMIT) unless member.can_checkout?

    book.availability_status = :checked_out
    book.checked_out_by = member
    book.due_date = Date.today + member.class::CHECKOUT_DAYS

    member.checkout_book(book)
    "#{book.title} checked out to #{member.name}. Due: #{book.due_date}"
  end

  def return_book(isbn, member_id)
    book = @books.find { |b| b.isbn == isbn}
    # return 'Book not found' if book.nil?
    raise BookNotFoundError, "Book with ISBN '#{isbn}' not found" unless book

    member = @members.find { |m| m.member_id == member_id}
    # return 'Member not found' if member.nil?
    raise MemberNotFoundError, "Member with ID #{member_id} not found" unless member

    # return 'Book is not checked out.' unless book.checked_out?
    # return 'Member does not have this book' unless member.has_book?(book)
    raise BookNotCheckedOutError, 'This book is not checked out!' unless book.checked_out?
    raise WrongMemberError, "Member with this id: '#{member_id}' does not have this book" unless member.has_book?(book)

    book.availability_status = :available
    book.checked_out_by = nil
    book.due_date = nil
    member.return_book(book)
    "#{book.title} returned by #{member.name}. Thank you!"
  end

  def display_books
    if @books.empty?
      puts 'No books in the library!'
      return
    end

    puts "\n=== Books in #{@name} ==="
    @books.each_with_index do |book, index|
      puts "#{index + 1}. #{book}"

      if book.available?
        puts '   Status: Available'
      else
        puts "   Status: Checked out by #{book.checked_out_by.name} (Due: #{book.due_date})"
      end
    end
  end

  def overdue_books
    result = @books.select { |b| b.checked_out? && b.due_date < Date.today }

    return 'No books found passing due date' if result.empty?

    result
  end

  def search_books_by_title(title)
    results = @books.select {|b| b.title.downcase.include?(title.downcase)} # find returns single element, select returns array

    return "No books found with title matching '#{title}'" if results.empty?

    results
  end

  def search_books_by_author(author)
    results = @books.select {|b| b.author.downcase.include?(author.downcase)}

    return "No books found with author name matching '#{author}'" if results.empty?

    results
  end

  def search_books_by_genre(genre)
    results = @books.select {|b| b.genre.downcase.include?(genre.downcase)}

    return "No books found with genre matching '#{genre}'" if results.empty?

    results
  end

  def find_member(member_id)
    member = @members.find { |m| m.member_id == member_id }
    raise MemberNotFoundError, "Member with ID '#{member_id}' not found" unless member

    member
  end

end
