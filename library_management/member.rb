# frozen_string_literal: true

# Member class should have:
  # - Attributes: name, member_id, list of checked out books
  # - Methods: can_checkout? (check if member can borrow more books)
  # - Consider adding: checkout_limit (e.g., max 3 books), checkout_history

# This is member class for each member
class Member
  attr_reader :name, :member_id, :checked_books, :checkout_history

  CHECKOUT_LIMIT = 3

  def initialize(name, member_id)
    @name = name
    @member_id = member_id
    @checked_books = []
    @checkout_history = []
  end

  def to_s
    "Member: #{@name} (ID: #{@member_id}) - Books: #{@checked_books.length}/#{CHECKOUT_LIMIT}"
  end

  def has_book?(book)
    @checked_books.include?(book)
  end

  def checkout_book(book)
    @checked_books << book

    # Add to history with checkout date
    @checkout_history << {
      book: book,
      checkout_date: Date.today,
      return_date: nil # not returned yet
    }
  end

  def return_book(book)
    @checked_books.delete(book)

    # Find the checkout record in history and update return_date
    history_record = @checkout_history.find {|h| h[:book] == book && h[:return_date].nil?}
    history_record[:return_date] = Date.today if history_record
  end

  def can_checkout?
    @checked_books.length < CHECKOUT_LIMIT
  end

end
