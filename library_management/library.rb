# frozen_string_literal: true

# Library class should have methods to:
#      - Add and remove books from the collection
#      - Add and remove members
#      - Check out a book to a member (with due date tracking)
#      - Return a book from a member
#      - Display all books and their status (available/checked out and by whom)
#      - Search for books by title or author
#      - List overdue books

class Library
  attr_reader :name

  def initialize(name)
    @name = name
    @books = [] # using array, hash when Large datasets (1000+)
    @members = []
  end

  def add_book(book)
    @books << book
  end

  def remove_book(isbn)
    book = @books.find {|b| b.isbn == isbn}
    @books.delete(book) if book
  end

  def add_member(member)
    @members << member
  end

  def remove_member(id)
    member = @members.find {|m| m.id == id}
    @members.delete(member) if member
  end
end
