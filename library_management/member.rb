# frozen_string_literal: true

# Member class should have:
  # - Attributes: name, member_id, list of checked out books
  # - Methods: can_checkout? (check if member can borrow more books)
  # - Consider adding: checkout_limit (e.g., max 3 books), checkout_history
#
# This is member class for each member
class Member
  attr_reader :name, :member_id, :checked_books

  CHECKOUT_LIMIT = 3

  def initialize(name, member_id)
    @name = name
    @member_id = member_id
    @checked_books = []
  end

  def checkout_book(book)
    @checked_books << book
  end

  def return_book(book)
    @checked_books.delete(book)
  end

  def can_checkout?
    @checked_books.length < CHECKOUT_LIMIT
  end
end
